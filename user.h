struct stat;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int write(int, void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(char*, int);
int mknod(char*, short, short);
int unlink(char*);
int fstat(int fd, struct stat*);
int link(char*, char*);
int mkdir(char*);
int chdir(char*);
int dup(int);
int getpid();
char* sbrk(int);
int sleep(int);
int uptime();
int binary_sem_create();
int binary_sem_down(int);
int binary_sem_up(int);
int binary_sem_clear(int);
int thread_create(void*() ,void*, uint);
void thread_exit(int);
int thread_join(int, void*);
int thread_getid(void);
int thread_getProcid(void);
int exit_all_threads(void);

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
void *memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
uint strlen(char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
int atoi(const char*);

// semaphore.c
struct semaphore* semaphore_create(int initial_semaphore_value);
void sem_up(struct semaphore* sem);
void sem_down(struct semaphore* sem);
void sem_clear(struct semaphore* sem);

// boundedbuffer.c
struct BB* BB_create(int max_capacity);
void semaphore_put(struct BB* bb, void* element);
void* semaphore_pop(struct BB* bb);
void semaphore_put_atomic(struct BB* bb, void* element);
void semaphore_release_atomic();