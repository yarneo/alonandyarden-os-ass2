#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_thread_getid(void)
{
    return proc->tid;
}

int
sys_thread_getProcId(void)
{
    return proc->pid;
}

int
sys_thread_create(void)
{   
    void* (*start_func)();
    void* stack;
    int stack_size;
    if(argptr(0, (void*)&start_func, 4) < 0)
        return -1;
    if(argptr(1, (void*)&stack, 4) < 0)
        return -1;
    if(argint(2, &stack_size) < 0)
        return -1;
    return thread_create(start_func, stack, stack_size);
}

int
sys_thread_join(void)
{
    char* ret_val;
    int tid;
    if(argint(0, &tid) < 0)
        return -1;
    if(argptr(1,&ret_val, 4) < 0)
        return -1;
    return thread_join(tid,(void*)ret_val);
}

void
sys_thread_exit(void)
{
int ret_val;
argint(0,&ret_val);
thread_exit((void*)ret_val);
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since boot.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int sys_binary_sem_create(void)
{
return binary_sem_create();
}

int sys_binary_sem_down(void)
{
    int sem_id;
    if(argint(0, &sem_id) < 0)
        return -1;
    return binary_sem_down(sem_id);
}

int sys_binary_sem_up(void)
{
    int sem_id;
    if(argint(0, &sem_id) < 0)
        return -1;
    return binary_sem_up(sem_id);
}

int sys_binary_sem_clear(void)
{
    int sem_id;
    if(argint(0, &sem_id) < 0)
        return -1;
    return binary_sem_clear(sem_id);
}

int
sys_exit_all_threads(void)
{
  exit_all_threads();
  return 0;  // not reached
}
