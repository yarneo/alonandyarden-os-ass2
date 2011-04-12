#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "boundedbuffer.h"
#define STK_SIZE 4096

typedef struct {
	int clean;
} Cup;

typedef struct {
	int id;
} Request;

struct BB* RBB; //request bounded buffer
struct BB* CBB; //cups bounded buffer
int dirtyCups; //number of dirty cups
int binsem_counter_dirty_cups; //lock on the counter of the dirty cups
Cup* cups; //array of cups
int binsem_counter_requests; //lock on the counter of the requests
int requests; //number of requests done
int B,H,R,C,totalRequests;
int binsem_wake_busboy; //lock on the waking and sleeping of the busboy to clean the cups
int binsem_on_cups_array; //lock on the array of cups
int filedes; //file descriptor of the log file

Cup* getCleanCup() {
	return (Cup*)semaphore_pop(CBB);
}

int washCups() {
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
		if(cups[i].clean != 1) {
			cups[i].clean = 1;
			binary_sem_down(binsem_counter_dirty_cups);
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
		}
		binary_sem_up(binsem_on_cups_array);
	}
	if(counter != ((int)(C*0.85))) {
		printf(2,"less or more than 85% cups!! percentage is: %d",((int)(counter*0.85)));
		return -1;
	}
	return 0;
}

void addNewRequest( Request* newReq) {
	semaphore_put(RBB,(void*)newReq);
}

Request* getRequest() {
	return (Request*)semaphore_pop(RBB);
}

void*
bartender() {
	while(1) {
		Request* req = getRequest();

		binary_sem_down(binsem_counter_dirty_cups);
		Cup* cup = getCleanCup();
		dirtyCups++;
		cup->clean = 0;
		if(dirtyCups == ((int)(C*0.85))) {
			binary_sem_up(binsem_wake_busboy);
		}
		binary_sem_up(binsem_counter_dirty_cups);
		printf(filedes,"Bartender %d completed request #%d\n",thread_getid(),req->id);
		if(req->id == totalRequests) {
                    exit_all_threads();//need to leave the main process on so he can do thread_join
		}
		sleep(10);
	}
}

void*
hostess() {
	while(requests < totalRequests) {
		binary_sem_down(binsem_counter_requests);
		Request* req = malloc(sizeof(Request));
		requests++;
		req->id = requests;
		printf(filedes,"Hostess %d added a new request #%d\n",thread_getid(),req->id);
		addNewRequest(req);
		binary_sem_up(binsem_counter_requests);
		sleep(10);
	}
	//printf(1,"exit hostess\n");
	thread_exit(0);
	return 0;
}

void*
busboy() {
	while(1) {
		binary_sem_down(binsem_wake_busboy);
		if(washCups() < 0) {
			printf(2,"problem with the washing of cups");
			exit();
		}
		printf(filedes,"Busboy %d added %d clean cups.\n",thread_getid(),(int)(C*0.85));
	}
}


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
		point++;
	}
	(*point) = c;
	point++;
	(*point) = '\0';
}

void
readFromFile()
{
	int counter = 0;
	int flag = 0;
	char Bstr[11] = "\0";
	char Hstr[11] = "\0";;
	char Rstr[11] = "\0";;
	char Cstr[11] = "\0";;
	char totalRequestsstr[11];
	int fd = open("configuration.conf",O_RDONLY);
	if(fd < 0) {
		printf(2,"problem opening file");
		exit();
	}
	char readbuf;
	while(read(fd,&readbuf,1) > 0)
	{
		if(readbuf == 'B') {
			flag = 1;
			counter++;
		}
		if(readbuf == 'H') {
			flag = 2;
			counter++;
		}
		if(readbuf == 'R') {
			flag = 3;
			counter++;
		}
		if(readbuf == 'C') {
			flag = 4;
			counter++;
		}
		if(readbuf == 't') {
			char teststr[12];
			read(fd,teststr,12);
			if(strcmp(teststr, "otalRequests")==0) {
				flag = 5;
				counter++;
			}
		}
		if(flag > 0) { //if one of the conditions above apply, we need to extract the number
			while((readbuf < '0') || (readbuf > '9')) { //read untill we reach a number
				if(read(fd,&readbuf,1) <= 0)
					break;
			}
			while((readbuf >= '0') && (readbuf <= '9')) { //when we reach an number, we read it and concat it to a string
				if(flag == 1)
					charCat(Bstr,readbuf);
				if(flag == 2)
					charCat(Hstr,readbuf);
				if(flag == 3)
					charCat(Rstr,readbuf);
				if(flag == 4)
					charCat(Cstr,readbuf);
				if(flag == 5)
					charCat(totalRequestsstr,readbuf);

				if(read(fd,&readbuf,1) <= 0)
					break;
			}
			flag = 0;
		}
		if(counter >=5) {//if we read all 5 numbers we stop
			break;
		}
	}
	B = atoi(Bstr);
	H = atoi(Hstr);
	R = atoi(Rstr);
	C = atoi(Cstr);
	totalRequests = atoi(totalRequestsstr);
	close(fd);
}

int main() {
	int i;
	void* ustack;
	readFromFile();
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ss2_log.txt",(O_WRONLY | O_CREATE));
	if(filedes < 0) {
		printf(2,"problem opening file\n");
		exit();
	}

	RBB = BB_create(R);
	CBB = BB_create(C);
	dirtyCups = 0;
	requests = 0;

	binsem_counter_dirty_cups = binary_sem_create();
	binsem_counter_requests = binary_sem_create();
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
	}

	int tid[B+H+1];
	for(i=0;i<(B+H+1);i++) {
		if((ustack = malloc(STK_SIZE)) <= 0) {
			printf(2,"cant malloc the stack for the thread\n");
			exit();
		}
		else {
			if(i<B) {
				tid[i] = thread_create(bartender ,ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
				tid[i] = thread_create(hostess ,ustack, STK_SIZE);
			}
			else {
				tid[i] = thread_create(busboy ,ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+1);i++) {
		thread_join(tid[i],0);
	}
	close(filedes);
	exit();
}