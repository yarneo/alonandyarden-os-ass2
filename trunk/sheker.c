#include "types.h"
#include "stat.h"
#include "user.h"
#define STK_SIZE 4096

void* stub() {
	int i;
	i = 1;
	while(1) {
		i = -i;
		}
}

void* exit_func() {
	exit();
}

int
main(int argc, char *argv[])
{
// void** lol = 0;
if(argc < 2 || argc > 2) {
  printf(2,"insert argument\n");
  exit();
}
else {
int n = atoi(argv[1]);
int i;
void* ustack;

if(n < 0) {
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
for(i=0;i<n;i++) {
if(i != n-1) {
if((ustack = malloc(STK_SIZE)) <= 0) {
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
printf(1, "i'm a normal thread\n");
tid[i] = thread_create(stub ,ustack, STK_SIZE);
}
}
else {
if((ustack = malloc(STK_SIZE)) <= 0) {
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
printf(1, "i'm the exiting thread\n");
tid[i] = thread_create(exit_func ,ustack, STK_SIZE);
}
}

}
}
}
int i;
i = 1;
printf(1, "i'm a process\n");
while(1) {
	i = 1;
}
exit();
} 
