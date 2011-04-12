#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"
#include "binsemaphore.h"

struct {
	struct spinlock lock;
	struct binsemaphore bsem[BSEMCOUNT];
} bstbl;


int binary_sem_create() {
	int i;
	acquire(&bstbl.lock);
	for (i = 0; i < BSEMCOUNT; i++) {
		if(bstbl.bsem[i].used == 0) {
			int j;
			bstbl.bsem[i].value = 1;
			bstbl.bsem[i].used = 1;
			bstbl.bsem[i].insert = 0;
			bstbl.bsem[i].remove = 0;
			for(j=0;j<BQUEUESEMCOUNT;j++) {
				bstbl.bsem[i].queue[j] = 0;
			}
			release(&bstbl.lock);
			//cprintf("returning %d",i);
			return i;
		}
	}

	release(&bstbl.lock);
	return -1;
}

int binary_sem_down(int binary_sem_id) {
	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
		return -1;
	}
	//aquire the lock on the semaphore
	acquire(&bstbl.bsem[binary_sem_id].lock);
	int insert;
	if (xchg(&bstbl.bsem[binary_sem_id].value, 0) != 1) { //was already 0
		insert = bstbl.bsem[binary_sem_id].insert;
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
			panic("semaphore queue is full");
		} else {
			bstbl.bsem[binary_sem_id].queue[insert] = proc;
			if(insert == (BQUEUESEMCOUNT -1)) {
				bstbl.bsem[binary_sem_id].insert = 0;
			}
			else {
				bstbl.bsem[binary_sem_id].insert++;
			}
		}
		sleep(proc, &bstbl.bsem[binary_sem_id].lock);
	}
	release(&bstbl.bsem[binary_sem_id].lock); // release queue mutex
	return 0;
}

int binary_sem_up(int binary_sem_id) {
	int remove;
	struct proc* p;

	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
		return -1;
	}

	acquire(&bstbl.bsem[binary_sem_id].lock);
	remove = bstbl.bsem[binary_sem_id].remove;
	p = bstbl.bsem[binary_sem_id].queue[remove];

	if (p != 0) { //there is a process waiting in the queue
		bstbl.bsem[binary_sem_id].queue[remove] = 0;
		if(remove == (BQUEUESEMCOUNT -1)) {
			bstbl.bsem[binary_sem_id].remove=0;
		}
		else {
			bstbl.bsem[binary_sem_id].remove++;
		}
		wakeup(p);
		release(&bstbl.bsem[binary_sem_id].lock);

	} else {
		bstbl.bsem[binary_sem_id].value = 1;
		release(&bstbl.bsem[binary_sem_id].lock);
	}
	return 0;
}

int binary_sem_clear(int binary_sem_id) {
	int i;
	acquire(&bstbl.lock);

	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0)) {//invalid id
		return -1;
	}
	if(bstbl.bsem[binary_sem_id].used == 0) {//nothing to clear
		return 0;
	}
	bstbl.bsem[i].used = 0;
	release(&bstbl.lock);
	return 0;
}
