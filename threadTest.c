#include "types.h"
#include "stat.h"
#include "user.h"
#define STK_SIZE 4096

int binsem;

void*
thread_loop()
{
int i;
int pid,tid;
pid = thread_getProcid();
tid = thread_getid();
//while(1) {
binary_sem_down(binsem);
for(i=0;i<3;i++)
{
printf(1, "Process %d Thread %d is running.\n", pid, tid);
}
binary_sem_up(binsem);
sleep(1);
//}
thread_exit(130);
return 0;
}

void*
stub()
{
thread_exit(0);
return 0;
}

int
main(int argc, char *argv[])
{
void** lol = 0;
if(argc < 2 || argc > 2) {
  printf(2,"insert argument\n");
  exit();
}
else {
int n = atoi(argv[1]);
int i;
void* ustack;
binsem = binary_sem_create();

if (binsem < 0) {
printf(2, "no semaphore available\n");
exit();
}

if(n < 0) {
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
for(i=0;i<n;i++) {
if((ustack = malloc(STK_SIZE)) <= 0) {
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
}
}
for(i=0;i<n;i++) {
thread_join(tid[i],lol);
printf(1,"%d",*lol);
}
}
}
exit();
} 
