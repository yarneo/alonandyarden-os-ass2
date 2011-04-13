#include "types.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"
#include "binsemaphore.h"

struct {
    struct spinlock lock;
    struct proc proc[NPROC];
} ptable;

extern struct {
    struct spinlock lock;
    struct binsemaphore bsem[BSEMCOUNT];
} bstbl;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void) {
    initlock(&ptable.lock, "ptable");
}

// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.

void
procdump(void) {
    static char *states[] = {
        [UNUSED] "unused",
        [EMBRYO] "embryo",
        [SLEEPING] "sleep ",
        [RUNNABLE] "runble",
        [RUNNING] "run   ",
        [ZOMBIE] "zombie"
    };
    int i;
    struct proc *p;
    char *state;
    uint pc[10];

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->state == UNUSED)
            continue;
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
    }
}


// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and return it.
// Otherwise return 0.

static struct proc*
allocproc(void) {
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            goto found;
    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;
    p->pid = nextpid++;
    p->joinedthread = 0;
    p->tid = -1;
    p->ret_val = 0;
    release(&ptable.lock);

    // Allocate kernel stack if possible.
    if ((p->kstack = kalloc()) == 0) {
        p->state = UNUSED;
        return 0;
    }

    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame.
    sp -= sizeof *p->tf;
    p->tf = (struct trapframe*) sp;

    // Set up new context to start executing at forkret,
    // which returns to trapret (see below).
    sp -= 4;
    *(uint*) sp = (uint) trapret;

    sp -= sizeof *p->context;
    p->context = (struct context*) sp;
    memset(p->context, 0, sizeof *p->context);
    p->context->eip = (uint) forkret;
    return p;
}

// Set up first user process.

void
userinit(void) {
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
    initproc = p;
    if (!(p->pgdir = setupkvm()))
        panic("userinit: out of memory?");
    inituvm(p->pgdir, _binary_initcode_start, (int) _binary_initcode_size);
    p->sz = PGSIZE;
    memset(p->tf, 0, sizeof (*p->tf));
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
    p->tf->es = p->tf->ds;
    p->tf->ss = p->tf->ds;
    p->tf->eflags = FL_IF;
    p->tf->esp = PGSIZE;
    p->tf->eip = 0; // beginning of initcode.S

    safestrcpy(p->name, "initcode", sizeof (p->name));
    p->cwd = namei("/");

    p->state = RUNNABLE;
    int i;
    for (i = 0; i < BSEMCOUNT; i++) {
        bstbl.bsem[i].used = 0;
    }
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.

int
growproc(int n) {
    uint sz = proc->sz;
    if (n > 0) {
        if (!(sz = allocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    } else if (n < 0) {
        if (!(sz = deallocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    }
    proc->sz = sz;
    switchuvm(proc);
    return 0;
}

int
thread_create(void*(*start_func)(), void* stack, uint stack_size) {
    struct proc *np;
    int i;

    //cprintf("Entering thread_create\n");

    // Allocate process.
    if ((np = allocproc()) == 0) {
        return -1;
    }

    //cprintf("process allocated\n");

    if (proc->tid == -1) {
        np->parent = proc;
    } else {
        np->parent = proc->parent;
    }


    np->sz = proc->sz;
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
    np->killed = proc->killed;
    np->tid = np->pid;
    np->ret_val = 0;
    *np->tf = *proc->tf;
    np->tf->eax = 0;
    //cprintf("exec called\n");
    safestrcpy(np->name, proc->name, sizeof (proc->name));
    //cprintf("name copied\n");
    np->state = RUNNABLE;
    np->pid = np->parent->pid;


    //	stack	-= 4;
    //	*(uint*)(stack) = 0xffffffff;   // fake return pc

    np->tf->eip = (uint) start_func;
    np->tf->esp = (uint) (stack + stack_size);

    //cprintf("thread_create return value: %d\n", np->tid);
    return np->tid;
}


// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

int
fork(void) {
    int i, pid;
    struct proc *np;

    // Allocate process.
    if ((np = allocproc()) == 0)
        return -1;

    // Copy process state from p.
    if (!(np->pgdir = copyuvm(proc->pgdir, proc->sz))) {
        kfree(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }
    np->sz = proc->sz;
    np->parent = proc;
    *np->tf = *proc->tf;

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;

    for (i = 0; i < NOFILE; i++)
        if (proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);

    pid = np->pid;
    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof (proc->name));
    return pid;
}


void
exit(void)
{
  struct proc *p;
  struct proc *np;
  int fd;

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->parent == proc) && (p->tid != -1)){
		//cprintf("no reason\n");
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
		}
			p->cwd = 0;
			p->state = ZOMBIE;
	}
  	}
	/////////////
	proc->cwd = 0;
	iput(proc->cwd);
	
	acquire(&ptable.lock);
	
	// Parent might be sleeping in wait().
	wakeup1(proc->parent);
	
	// Pass abandoned children to init.
	for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
	if(np->parent == proc){
	np->parent = initproc;
	if(np->state == ZOMBIE)
		wakeup1(initproc);
	}
	}
	////////////


  } else {
	//cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	//kills all the threads of the process not including the thread itself and the process
	if((p->pid == proc->pid) && (p->tid != -1) && (p != proc)){
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;			
			p->state = ZOMBIE;
		}
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->pid == proc->pid) && (p->tid == -1)){
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;
			iput(p->cwd);
			
			acquire(&ptable.lock);
			
			// Parent might be sleeping in wait().
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
			if(np->parent == p){
			np->parent = initproc;
			if(np->state == ZOMBIE)
				wakeup1(initproc);
			}
			}
			p->state = ZOMBIE;
		}
	}
  }
	
	proc->cwd = 0;
  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

void
exit_all_threads(void) {
    struct proc *p;
    int fd;

    if (proc == initproc)
        panic("init exiting");

    iput(proc->cwd);
    proc->cwd = 0;

    acquire(&ptable.lock);

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->parent == proc) {
            p->parent = initproc;
            if (p->state == ZOMBIE)
                wakeup1(initproc);
        }
        if ((p->pid == proc->pid) && (p->tid != -1)) {
            for (fd = 0; fd < NOFILE; fd++) {
                if (p->ofile[fd]) {
                    p->ofile[fd] = 0;
                }
            }
            p->state = ZOMBIE;
        }
    }

    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
    struct proc *p;
    int counter=0;
    if (proc == initproc) {
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
	   for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
		if((p->pid == proc->pid) && (p->state != ZOMBIE)) {
			counter++;	
		}

	   }
	if(counter == 1)
        exit();
    }

    acquire(&ptable.lock);

    iput(proc->cwd);
    proc->state = ZOMBIE;
    proc->cwd = 0;
    proc->ret_val = ret_val;

    wakeup1(proc->joinedthread);

    // Jump into the scheduler, never to return.

    sched();
    panic("thread zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
    struct proc *p, *np;
    int havekids, pid = -1;

    acquire(&ptable.lock);
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
            if (p->parent != proc)
                continue;
	    else
            havekids = 1;
		

	int counter = 0;
	int threads_clean = 0;

	for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
		if((np->pid == proc->pid) && (np->state != ZOMBIE)) {
			counter++;
		}

	}
	if(counter == 1) {
		threads_clean = 1; 
	}
	//cprintf("erwerwerwer");

            if ((p->state == ZOMBIE) && (threads_clean == 1)) {
		//cprintf("here?\n");
                for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
                    if ((np->pid == p->pid) && (p != np)) {
			//cprintf("you suck\n");
                        pid = np->pid;
                        kfree(np->kstack);
			//cprintf("you suck22222\n");
                        np->kstack = 0;
                        np->state = UNUSED;
                        np->pid = 0;
                        np->tid = 0;
                        np->ret_val = 0;
                        np->parent = 0;
                        np->name[0] = 0;
                        np->killed = 0;
                        np->joinedthread = 0;
                    }
                }
                // Found one.
		//cprintf("GET ON THE FLOOR");
                pid = p->pid;
                kfree(p->kstack);
                p->kstack = 0;
                p->state = UNUSED;
                p->pid = 0;
                p->tid = 0;
                p->ret_val = 0;
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                p->joinedthread = 0;
                freevm(p->pgdir);
                release(&ptable.lock);
                return pid;
            } 
        }

        // No point waiting if we don't have any children.
        if (!havekids || proc->killed) {
            release(&ptable.lock);
            return -1;
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock); //DOC: wait-sleep
    }
}

int
thread_join(int thread_id, void** ret_val) {
    struct proc *p;
    int exists;

    acquire(&ptable.lock);
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
            if (p->tid != thread_id) {
		//cprintf("hmmm");
                continue;
            } //else
                //cprintf("nice one\n");

                if (p->joinedthread == 0) {
                p->joinedthread = proc;
            } else {
                if (p->joinedthread != proc) {
                    return -1;
                }
            }

            exists = 1;
	    *(ret_val) = p->ret_val;
            if (p->state == ZOMBIE) { //if thread already exited
                //cprintf("lets see\n");
                kfree(p->kstack);
                p->kstack = 0;
                p->name[0] = 0;
                p->pid = 0;
                p->state = UNUSED;
                p->joinedthread = 0;
                p->parent = 0;
                release(&ptable.lock);
                return 0;
            }
        }
        //if theres no such tid or the process was killed
        if (!exists || proc->parent->killed) {
            release(&ptable.lock);
            return -1;
        }
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
        //cprintf("after sleep\n");
    }

}

// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.

void
scheduler(void) {
    struct proc *p;

    for (;;) {
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
            if (p->state != RUNNABLE)
                continue;

            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
            switchuvm(p);
            p->state = RUNNING;
            swtch(&cpu->scheduler, proc->context);
            switchkvm();

            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
        }
        release(&ptable.lock);

    }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.

void
sched(void) {
    int intena;

    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
        panic("sched locks");
    if (proc->state == RUNNING)
        panic("sched running");
    if (readeflags() & FL_IF)
        panic("sched interruptible");
    intena = cpu->intena;
    swtch(&proc->context, cpu->scheduler);
    cpu->intena = intena;
}

// Give up the CPU for one scheduling round.

void
yield(void) {
    acquire(&ptable.lock); //DOC: yieldlock
    proc->state = RUNNABLE;
    sched();
    release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.

void
forkret(void) {
    // Still holding ptable.lock from scheduler.
    release(&ptable.lock);

    // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.

void
sleep(void *chan, struct spinlock *lk) {
    if (proc == 0)
        panic("sleep");

    if (lk == 0)
        panic("sleep without lk");

    // Must acquire ptable.lock in order to
    // change p->state and then call sched.
    // Once we hold ptable.lock, we can be
    // guaranteed that we won't miss any wakeup
    // (wakeup runs with ptable.lock locked),
    // so it's okay to release lk.
    if (lk != &ptable.lock) { //DOC: sleeplock0
        acquire(&ptable.lock); //DOC: sleeplock1
        release(lk);
    }

    // Go to sleep.
    proc->chan = chan;
    proc->state = SLEEPING;
    sched();

    // Tidy up.
    proc->chan = 0;

    // Reacquire original lock.
    if (lk != &ptable.lock) { //DOC: sleeplock2
        release(&ptable.lock);
        acquire(lk);
    }
}

// Wake up all processes sleeping on chan.
// The ptable lock must be held.

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == SLEEPING && p->chan == chan)
            p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.

void
wakeup(void *chan) {
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).

int
kill(int pid) {
    struct proc *p;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
            p->killed = 1;
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
                p->state = RUNNABLE;
            release(&ptable.lock);
            return 0;
        }
    }
    release(&ptable.lock);
    return -1;
}

