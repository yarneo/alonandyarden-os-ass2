struct BB {
	int mutex;
	struct semaphore* empty;
	struct semaphore* full;
	void** buffer;
	int produce;
	int consume;
	int capacity;
};

