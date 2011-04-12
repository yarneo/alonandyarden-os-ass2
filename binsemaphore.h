struct binsemaphore {
	uint value; //value of the semaphore
	struct spinlock lock; //locking of the semaphore queue while doing changes on it
	uint used; //if the current semaphore is being used or not
	struct proc *queue[BQUEUESEMCOUNT]; //queue of waiting processes
	int remove; //where i remove the first process to become runnable
	int insert; //where i insert the process to wait in the queue
};
