
_threadTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
return 0;
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	83 ec 38             	sub    $0x38,%esp
  10:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  14:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
  18:	89 74 24 30          	mov    %esi,0x30(%esp)
  1c:	89 7c 24 34          	mov    %edi,0x34(%esp)
  20:	8b 41 04             	mov    0x4(%ecx),%eax
void** lol = 0;
if(argc < 2 || argc > 2) {
  23:	83 39 02             	cmpl   $0x2,(%ecx)
  26:	74 20                	je     48 <main+0x48>
  printf(2,"insert argument\n");
  28:	c7 44 24 04 ec 0d 00 	movl   $0xdec,0x4(%esp)
  2f:	00 
  30:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  37:	e8 94 05 00 00       	call   5d0 <printf>
  exit();
  3c:	e8 f7 03 00 00       	call   438 <exit>
  41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
else {
int n = atoi(argv[1]);
  48:	8b 40 04             	mov    0x4(%eax),%eax
  4b:	89 04 24             	mov    %eax,(%esp)
  4e:	e8 bd 02 00 00       	call   310 <atoi>
  53:	89 c6                	mov    %eax,%esi
int i;
void* ustack;
binsem = binary_sem_create();
  55:	e8 a6 04 00 00       	call   500 <binary_sem_create>

if (binsem < 0) {
  5a:	85 c0                	test   %eax,%eax
}
else {
int n = atoi(argv[1]);
int i;
void* ustack;
binsem = binary_sem_create();
  5c:	a3 44 0f 00 00       	mov    %eax,0xf44

if (binsem < 0) {
  61:	0f 88 c9 00 00 00    	js     130 <main+0x130>
printf(2, "no semaphore available\n");
exit();
}

if(n < 0) {
  67:	85 f6                	test   %esi,%esi
  69:	78 75                	js     e0 <main+0xe0>
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
  6b:	8d 04 b5 1e 00 00 00 	lea    0x1e(,%esi,4),%eax
  72:	83 e0 f0             	and    $0xfffffff0,%eax
exit();
}

if(n < 0) {
printf(2,"invalid input\n");
exit();
  75:	89 65 e4             	mov    %esp,-0x1c(%ebp)
}
else {
int tid[n];
  78:	29 c4                	sub    %eax,%esp
  7a:	8d 7c 24 1b          	lea    0x1b(%esp),%edi
  7e:	83 e7 f0             	and    $0xfffffff0,%edi
for(i=0;i<n;i++) {
  81:	85 f6                	test   %esi,%esi
  83:	0f 84 99 00 00 00    	je     122 <main+0x122>
  89:	31 db                	xor    %ebx,%ebx
  8b:	eb 25                	jmp    b2 <main+0xb2>
  8d:	8d 76 00             	lea    0x0(%esi),%esi
if((ustack = malloc(STK_SIZE)) <= 0) {
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
  90:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  97:	00 
  98:	89 44 24 04          	mov    %eax,0x4(%esp)
  9c:	c7 04 24 70 01 00 00 	movl   $0x170,(%esp)
  a3:	e8 30 04 00 00       	call   4d8 <thread_create>
  a8:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
for(i=0;i<n;i++) {
  ab:	83 c3 01             	add    $0x1,%ebx
  ae:	39 de                	cmp    %ebx,%esi
  b0:	7e 4e                	jle    100 <main+0x100>
if((ustack = malloc(STK_SIZE)) <= 0) {
  b2:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  b9:	e8 b2 07 00 00       	call   870 <malloc>
  be:	85 c0                	test   %eax,%eax
  c0:	75 ce                	jne    90 <main+0x90>
printf(2,"cant malloc the stack for the thread\n");
  c2:	c7 44 24 04 24 0e 00 	movl   $0xe24,0x4(%esp)
  c9:	00 
  ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  d1:	e8 fa 04 00 00       	call   5d0 <printf>
exit();
  d6:	e8 5d 03 00 00       	call   438 <exit>
  db:	90                   	nop
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
printf(2, "no semaphore available\n");
exit();
}

if(n < 0) {
printf(2,"invalid input\n");
  e0:	c7 44 24 04 15 0e 00 	movl   $0xe15,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ef:	e8 dc 04 00 00       	call   5d0 <printf>
exit();
  f4:	e8 3f 03 00 00       	call   438 <exit>
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
else {
int tid[n];
for(i=0;i<n;i++) {
 100:	31 db                	xor    %ebx,%ebx
 102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
}
}
for(i=0;i<n;i++) {
thread_join(tid[i],lol);
 108:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 10f:	00 
 110:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
}
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
}
}
for(i=0;i<n;i++) {
 113:	83 c3 01             	add    $0x1,%ebx
thread_join(tid[i],lol);
 116:	89 04 24             	mov    %eax,(%esp)
 119:	e8 da 03 00 00       	call   4f8 <thread_join>
}
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
}
}
for(i=0;i<n;i++) {
 11e:	39 de                	cmp    %ebx,%esi
 120:	7f e6                	jg     108 <main+0x108>
 122:	8b 65 e4             	mov    -0x1c(%ebp),%esp
thread_join(tid[i],lol);
}
}
}
exit();
 125:	e8 0e 03 00 00       	call   438 <exit>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int i;
void* ustack;
binsem = binary_sem_create();

if (binsem < 0) {
printf(2, "no semaphore available\n");
 130:	c7 44 24 04 fd 0d 00 	movl   $0xdfd,0x4(%esp)
 137:	00 
 138:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 13f:	e8 8c 04 00 00       	call   5d0 <printf>
exit();
 144:	e8 ef 02 00 00       	call   438 <exit>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <stub>:
return 0;
}

void*
stub()
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	83 ec 18             	sub    $0x18,%esp
thread_exit(0);
 156:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15d:	e8 8e 03 00 00       	call   4f0 <thread_exit>
return 0;
}
 162:	31 c0                	xor    %eax,%eax
 164:	c9                   	leave  
 165:	c3                   	ret    
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <thread_loop>:

int binsem;

void*
thread_loop()
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	53                   	push   %ebx
 175:	83 ec 10             	sub    $0x10,%esp
int i;
int pid,tid;
pid = thread_getProcId();
 178:	e8 6b 03 00 00       	call   4e8 <thread_getProcId>
 17d:	89 c6                	mov    %eax,%esi
tid = thread_getid();
 17f:	e8 5c 03 00 00       	call   4e0 <thread_getid>
 184:	89 c3                	mov    %eax,%ebx
 186:	66 90                	xchg   %ax,%ax
while(1) {
binary_sem_down(binsem);
 188:	a1 44 0f 00 00       	mov    0xf44,%eax
 18d:	89 04 24             	mov    %eax,(%esp)
 190:	e8 73 03 00 00       	call   508 <binary_sem_down>
for(i=0;i<3;i++)
{
printf(1, "Process %d Thread %d is running.\n", pid, tid);
 195:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 199:	89 74 24 08          	mov    %esi,0x8(%esp)
 19d:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 1a4:	00 
 1a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ac:	e8 1f 04 00 00       	call   5d0 <printf>
 1b1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 1b5:	89 74 24 08          	mov    %esi,0x8(%esp)
 1b9:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 1c0:	00 
 1c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c8:	e8 03 04 00 00       	call   5d0 <printf>
 1cd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 1d1:	89 74 24 08          	mov    %esi,0x8(%esp)
 1d5:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 1dc:	00 
 1dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e4:	e8 e7 03 00 00       	call   5d0 <printf>
}
binary_sem_up(binsem);
 1e9:	a1 44 0f 00 00       	mov    0xf44,%eax
 1ee:	89 04 24             	mov    %eax,(%esp)
 1f1:	e8 1a 03 00 00       	call   510 <binary_sem_up>
sleep(1);
 1f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fd:	e8 c6 02 00 00       	call   4c8 <sleep>
 202:	eb 84                	jmp    188 <thread_loop+0x18>
 204:	90                   	nop
 205:	90                   	nop
 206:	90                   	nop
 207:	90                   	nop
 208:	90                   	nop
 209:	90                   	nop
 20a:	90                   	nop
 20b:	90                   	nop
 20c:	90                   	nop
 20d:	90                   	nop
 20e:	90                   	nop
 20f:	90                   	nop

00000210 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 210:	55                   	push   %ebp
 211:	31 d2                	xor    %edx,%edx
 213:	89 e5                	mov    %esp,%ebp
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	53                   	push   %ebx
 219:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 220:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 224:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 227:	83 c2 01             	add    $0x1,%edx
 22a:	84 c9                	test   %cl,%cl
 22c:	75 f2                	jne    220 <strcpy+0x10>
    ;
  return os;
}
 22e:	5b                   	pop    %ebx
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <strcmp>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
 247:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 24a:	0f b6 01             	movzbl (%ecx),%eax
 24d:	84 c0                	test   %al,%al
 24f:	75 14                	jne    265 <strcmp+0x25>
 251:	eb 25                	jmp    278 <strcmp+0x38>
 253:	90                   	nop
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 258:	83 c1 01             	add    $0x1,%ecx
 25b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 25e:	0f b6 01             	movzbl (%ecx),%eax
 261:	84 c0                	test   %al,%al
 263:	74 13                	je     278 <strcmp+0x38>
 265:	0f b6 1a             	movzbl (%edx),%ebx
 268:	38 d8                	cmp    %bl,%al
 26a:	74 ec                	je     258 <strcmp+0x18>
 26c:	0f b6 db             	movzbl %bl,%ebx
 26f:	0f b6 c0             	movzbl %al,%eax
 272:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 274:	5b                   	pop    %ebx
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 278:	0f b6 1a             	movzbl (%edx),%ebx
 27b:	31 c0                	xor    %eax,%eax
 27d:	0f b6 db             	movzbl %bl,%ebx
 280:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 282:	5b                   	pop    %ebx
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    
 285:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <strlen>:

uint
strlen(char *s)
{
 290:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 291:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 293:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 295:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 297:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 29a:	80 39 00             	cmpb   $0x0,(%ecx)
 29d:	74 0c                	je     2ab <strlen+0x1b>
 29f:	90                   	nop
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2a7:	89 d0                	mov    %edx,%eax
 2a9:	75 f5                	jne    2a0 <strlen+0x10>
    ;
  return n;
}
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 55 08             	mov    0x8(%ebp),%edx
 2b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 d7                	mov    %edx,%edi
 2bf:	fc                   	cld    
 2c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c2:	89 d0                	mov    %edx,%eax
 2c4:	5f                   	pop    %edi
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    
 2c7:	89 f6                	mov    %esi,%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2da:	0f b6 10             	movzbl (%eax),%edx
 2dd:	84 d2                	test   %dl,%dl
 2df:	75 11                	jne    2f2 <strchr+0x22>
 2e1:	eb 15                	jmp    2f8 <strchr+0x28>
 2e3:	90                   	nop
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e8:	83 c0 01             	add    $0x1,%eax
 2eb:	0f b6 10             	movzbl (%eax),%edx
 2ee:	84 d2                	test   %dl,%dl
 2f0:	74 06                	je     2f8 <strchr+0x28>
    if(*s == c)
 2f2:	38 ca                	cmp    %cl,%dl
 2f4:	75 f2                	jne    2e8 <strchr+0x18>
      return (char*) s;
  return 0;
}
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2f8:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 2fa:	5d                   	pop    %ebp
 2fb:	90                   	nop
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 300:	c3                   	ret    
 301:	eb 0d                	jmp    310 <atoi>
 303:	90                   	nop
 304:	90                   	nop
 305:	90                   	nop
 306:	90                   	nop
 307:	90                   	nop
 308:	90                   	nop
 309:	90                   	nop
 30a:	90                   	nop
 30b:	90                   	nop
 30c:	90                   	nop
 30d:	90                   	nop
 30e:	90                   	nop
 30f:	90                   	nop

00000310 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 311:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 313:	89 e5                	mov    %esp,%ebp
 315:	8b 4d 08             	mov    0x8(%ebp),%ecx
 318:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 319:	0f b6 11             	movzbl (%ecx),%edx
 31c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 31f:	80 fb 09             	cmp    $0x9,%bl
 322:	77 1c                	ja     340 <atoi+0x30>
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 328:	0f be d2             	movsbl %dl,%edx
 32b:	83 c1 01             	add    $0x1,%ecx
 32e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 331:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 335:	0f b6 11             	movzbl (%ecx),%edx
 338:	8d 5a d0             	lea    -0x30(%edx),%ebx
 33b:	80 fb 09             	cmp    $0x9,%bl
 33e:	76 e8                	jbe    328 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 340:	5b                   	pop    %ebx
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	53                   	push   %ebx
 358:	8b 5d 10             	mov    0x10(%ebp),%ebx
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 db                	test   %ebx,%ebx
 360:	7e 14                	jle    376 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 362:	31 d2                	xor    %edx,%edx
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 36c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 36f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	39 da                	cmp    %ebx,%edx
 374:	75 f2                	jne    368 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 386:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 389:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 38c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 38f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 394:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 39b:	00 
 39c:	89 04 24             	mov    %eax,(%esp)
 39f:	e8 d4 00 00 00       	call   478 <open>
  if(fd < 0)
 3a4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 3a8:	78 19                	js     3c3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	89 1c 24             	mov    %ebx,(%esp)
 3b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b4:	e8 d7 00 00 00       	call   490 <fstat>
  close(fd);
 3b9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 3bc:	89 c6                	mov    %eax,%esi
  close(fd);
 3be:	e8 9d 00 00 00       	call   460 <close>
  return r;
}
 3c3:	89 f0                	mov    %esi,%eax
 3c5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 3c8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 3cb:	89 ec                	mov    %ebp,%esp
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
 3cf:	90                   	nop

000003d0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	31 f6                	xor    %esi,%esi
 3d7:	53                   	push   %ebx
 3d8:	83 ec 2c             	sub    $0x2c,%esp
 3db:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3de:	eb 06                	jmp    3e6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3e0:	3c 0a                	cmp    $0xa,%al
 3e2:	74 39                	je     41d <gets+0x4d>
 3e4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e6:	8d 5e 01             	lea    0x1(%esi),%ebx
 3e9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ec:	7d 31                	jge    41f <gets+0x4f>
    cc = read(0, &c, 1);
 3ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3f8:	00 
 3f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 3fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 404:	e8 47 00 00 00       	call   450 <read>
    if(cc < 1)
 409:	85 c0                	test   %eax,%eax
 40b:	7e 12                	jle    41f <gets+0x4f>
      break;
    buf[i++] = c;
 40d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 411:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 415:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 419:	3c 0d                	cmp    $0xd,%al
 41b:	75 c3                	jne    3e0 <gets+0x10>
 41d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 41f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 423:	89 f8                	mov    %edi,%eax
 425:	83 c4 2c             	add    $0x2c,%esp
 428:	5b                   	pop    %ebx
 429:	5e                   	pop    %esi
 42a:	5f                   	pop    %edi
 42b:	5d                   	pop    %ebp
 42c:	c3                   	ret    
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 430:	b8 01 00 00 00       	mov    $0x1,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <exit>:
SYSCALL(exit)
 438:	b8 02 00 00 00       	mov    $0x2,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <wait>:
SYSCALL(wait)
 440:	b8 03 00 00 00       	mov    $0x3,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <pipe>:
SYSCALL(pipe)
 448:	b8 04 00 00 00       	mov    $0x4,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <read>:
SYSCALL(read)
 450:	b8 06 00 00 00       	mov    $0x6,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <write>:
SYSCALL(write)
 458:	b8 05 00 00 00       	mov    $0x5,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <close>:
SYSCALL(close)
 460:	b8 07 00 00 00       	mov    $0x7,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <kill>:
SYSCALL(kill)
 468:	b8 08 00 00 00       	mov    $0x8,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <exec>:
SYSCALL(exec)
 470:	b8 09 00 00 00       	mov    $0x9,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <open>:
SYSCALL(open)
 478:	b8 0a 00 00 00       	mov    $0xa,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <mknod>:
SYSCALL(mknod)
 480:	b8 0b 00 00 00       	mov    $0xb,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <unlink>:
SYSCALL(unlink)
 488:	b8 0c 00 00 00       	mov    $0xc,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <fstat>:
SYSCALL(fstat)
 490:	b8 0d 00 00 00       	mov    $0xd,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <link>:
SYSCALL(link)
 498:	b8 0e 00 00 00       	mov    $0xe,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <mkdir>:
SYSCALL(mkdir)
 4a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <chdir>:
SYSCALL(chdir)
 4a8:	b8 10 00 00 00       	mov    $0x10,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <dup>:
SYSCALL(dup)
 4b0:	b8 11 00 00 00       	mov    $0x11,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <getpid>:
SYSCALL(getpid)
 4b8:	b8 12 00 00 00       	mov    $0x12,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <sbrk>:
SYSCALL(sbrk)
 4c0:	b8 13 00 00 00       	mov    $0x13,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <sleep>:
SYSCALL(sleep)
 4c8:	b8 14 00 00 00       	mov    $0x14,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <uptime>:
SYSCALL(uptime)
 4d0:	b8 15 00 00 00       	mov    $0x15,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <thread_create>:
SYSCALL(thread_create)
 4d8:	b8 16 00 00 00       	mov    $0x16,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <thread_getid>:
SYSCALL(thread_getid)
 4e0:	b8 17 00 00 00       	mov    $0x17,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <thread_getProcId>:
SYSCALL(thread_getProcId)
 4e8:	b8 18 00 00 00       	mov    $0x18,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <thread_exit>:
SYSCALL(thread_exit)
 4f0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <thread_join>:
SYSCALL(thread_join)
 4f8:	b8 19 00 00 00       	mov    $0x19,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <binary_sem_create>:
SYSCALL(binary_sem_create)
 500:	b8 1b 00 00 00       	mov    $0x1b,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <binary_sem_down>:
SYSCALL(binary_sem_down)
 508:	b8 1c 00 00 00       	mov    $0x1c,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <binary_sem_up>:
SYSCALL(binary_sem_up)
 510:	b8 1d 00 00 00       	mov    $0x1d,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 518:	b8 1e 00 00 00       	mov    $0x1e,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <exit_all_threads>:
 520:	b8 1f 00 00 00       	mov    $0x1f,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    
 528:	90                   	nop
 529:	90                   	nop
 52a:	90                   	nop
 52b:	90                   	nop
 52c:	90                   	nop
 52d:	90                   	nop
 52e:	90                   	nop
 52f:	90                   	nop

00000530 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	89 cf                	mov    %ecx,%edi
 536:	56                   	push   %esi
 537:	89 c6                	mov    %eax,%esi
 539:	53                   	push   %ebx
 53a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 53d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 540:	85 c9                	test   %ecx,%ecx
 542:	74 04                	je     548 <printint+0x18>
 544:	85 d2                	test   %edx,%edx
 546:	78 70                	js     5b8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 548:	89 d0                	mov    %edx,%eax
 54a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 551:	31 c9                	xor    %ecx,%ecx
 553:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 556:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 558:	31 d2                	xor    %edx,%edx
 55a:	f7 f7                	div    %edi
 55c:	0f b6 92 75 0e 00 00 	movzbl 0xe75(%edx),%edx
 563:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 566:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 569:	85 c0                	test   %eax,%eax
 56b:	75 eb                	jne    558 <printint+0x28>
	if(neg)
 56d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 570:	85 c0                	test   %eax,%eax
 572:	74 08                	je     57c <printint+0x4c>
		buf[i++] = '-';
 574:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 579:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 57c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 57f:	01 fb                	add    %edi,%ebx
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 588:	0f b6 03             	movzbl (%ebx),%eax
 58b:	83 ef 01             	sub    $0x1,%edi
 58e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 591:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 598:	00 
 599:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 59c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 59f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a6:	e8 ad fe ff ff       	call   458 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 5ab:	83 ff ff             	cmp    $0xffffffff,%edi
 5ae:	75 d8                	jne    588 <printint+0x58>
		putc(fd, buf[i]);
}
 5b0:	83 c4 4c             	add    $0x4c,%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 5b8:	89 d0                	mov    %edx,%eax
 5ba:	f7 d8                	neg    %eax
 5bc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5c3:	eb 8c                	jmp    551 <printint+0x21>
 5c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	53                   	push   %ebx
 5d6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5dc:	0f b6 10             	movzbl (%eax),%edx
 5df:	84 d2                	test   %dl,%dl
 5e1:	0f 84 c9 00 00 00    	je     6b0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 5e7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5ea:	31 ff                	xor    %edi,%edi
 5ec:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5ef:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5f1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 5f4:	eb 1e                	jmp    614 <printf+0x44>
 5f6:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 5f8:	83 fa 25             	cmp    $0x25,%edx
 5fb:	0f 85 b7 00 00 00    	jne    6b8 <printf+0xe8>
 601:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 605:	83 c3 01             	add    $0x1,%ebx
 608:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 60c:	84 d2                	test   %dl,%dl
 60e:	0f 84 9c 00 00 00    	je     6b0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 614:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 616:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 619:	74 dd                	je     5f8 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 61b:	83 ff 25             	cmp    $0x25,%edi
 61e:	75 e5                	jne    605 <printf+0x35>
			if(c == 'd'){
 620:	83 fa 64             	cmp    $0x64,%edx
 623:	0f 84 57 01 00 00    	je     780 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 629:	83 fa 70             	cmp    $0x70,%edx
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 630:	0f 84 aa 00 00 00    	je     6e0 <printf+0x110>
 636:	83 fa 78             	cmp    $0x78,%edx
 639:	0f 84 a1 00 00 00    	je     6e0 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 63f:	83 fa 73             	cmp    $0x73,%edx
 642:	0f 84 c0 00 00 00    	je     708 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 648:	83 fa 63             	cmp    $0x63,%edx
 64b:	90                   	nop
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 650:	0f 84 52 01 00 00    	je     7a8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 656:	83 fa 25             	cmp    $0x25,%edx
 659:	0f 84 f9 00 00 00    	je     758 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 65f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 662:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 665:	31 ff                	xor    %edi,%edi
 667:	89 55 cc             	mov    %edx,-0x34(%ebp)
 66a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 66e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 675:	00 
 676:	89 0c 24             	mov    %ecx,(%esp)
 679:	89 74 24 04          	mov    %esi,0x4(%esp)
 67d:	e8 d6 fd ff ff       	call   458 <write>
 682:	8b 55 cc             	mov    -0x34(%ebp),%edx
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 68f:	00 
 690:	89 74 24 04          	mov    %esi,0x4(%esp)
 694:	88 55 e7             	mov    %dl,-0x19(%ebp)
 697:	89 04 24             	mov    %eax,(%esp)
 69a:	e8 b9 fd ff ff       	call   458 <write>
 69f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 6a2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 6a6:	84 d2                	test   %dl,%dl
 6a8:	0f 85 66 ff ff ff    	jne    614 <printf+0x44>
 6ae:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 6b0:	83 c4 3c             	add    $0x3c,%esp
 6b3:	5b                   	pop    %ebx
 6b4:	5e                   	pop    %esi
 6b5:	5f                   	pop    %edi
 6b6:	5d                   	pop    %ebp
 6b7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 6bb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c5:	00 
 6c6:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ca:	89 04 24             	mov    %eax,(%esp)
 6cd:	e8 86 fd ff ff       	call   458 <write>
 6d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d5:	e9 2b ff ff ff       	jmp    605 <printf+0x35>
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 6e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6e3:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 6e8:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 6ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6f1:	8b 10                	mov    (%eax),%edx
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	e8 35 fe ff ff       	call   530 <printint>
 6fb:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 6fe:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 702:	e9 fe fe ff ff       	jmp    605 <printf+0x35>
 707:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 708:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 70b:	8b 3a                	mov    (%edx),%edi
				ap++;
 70d:	83 c2 04             	add    $0x4,%edx
 710:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 713:	85 ff                	test   %edi,%edi
 715:	0f 84 ba 00 00 00    	je     7d5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 71b:	0f b6 17             	movzbl (%edi),%edx
 71e:	84 d2                	test   %dl,%dl
 720:	74 2d                	je     74f <printf+0x17f>
 722:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 725:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 728:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 72b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 72e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 735:	00 
 736:	89 74 24 04          	mov    %esi,0x4(%esp)
 73a:	89 1c 24             	mov    %ebx,(%esp)
 73d:	e8 16 fd ff ff       	call   458 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 742:	0f b6 17             	movzbl (%edi),%edx
 745:	84 d2                	test   %dl,%dl
 747:	75 df                	jne    728 <printf+0x158>
 749:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 74c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 74f:	31 ff                	xor    %edi,%edi
 751:	e9 af fe ff ff       	jmp    605 <printf+0x35>
 756:	66 90                	xchg   %ax,%ax
 758:	8b 55 08             	mov    0x8(%ebp),%edx
 75b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 75d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 761:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 768:	00 
 769:	89 74 24 04          	mov    %esi,0x4(%esp)
 76d:	89 14 24             	mov    %edx,(%esp)
 770:	e8 e3 fc ff ff       	call   458 <write>
 775:	8b 45 0c             	mov    0xc(%ebp),%eax
 778:	e9 88 fe ff ff       	jmp    605 <printf+0x35>
 77d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 780:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 783:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 788:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 78b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 792:	8b 10                	mov    (%eax),%edx
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	e8 94 fd ff ff       	call   530 <printint>
 79c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 79f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7a3:	e9 5d fe ff ff       	jmp    605 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7a8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 7ab:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7ad:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7b6:	00 
 7b7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7bb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7be:	8b 45 08             	mov    0x8(%ebp),%eax
 7c1:	89 04 24             	mov    %eax,(%esp)
 7c4:	e8 8f fc ff ff       	call   458 <write>
 7c9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 7cc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7d0:	e9 30 fe ff ff       	jmp    605 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 7d5:	bf 6e 0e 00 00       	mov    $0xe6e,%edi
 7da:	e9 3c ff ff ff       	jmp    71b <printf+0x14b>
 7df:	90                   	nop

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 40 0f 00 00       	mov    0xf40,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 7ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	39 c8                	cmp    %ecx,%eax
 7f3:	73 1d                	jae    812 <free+0x32>
 7f5:	8d 76 00             	lea    0x0(%esi),%esi
 7f8:	8b 10                	mov    (%eax),%edx
 7fa:	39 d1                	cmp    %edx,%ecx
 7fc:	72 1a                	jb     818 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7fe:	39 d0                	cmp    %edx,%eax
 800:	72 08                	jb     80a <free+0x2a>
 802:	39 c8                	cmp    %ecx,%eax
 804:	72 12                	jb     818 <free+0x38>
 806:	39 d1                	cmp    %edx,%ecx
 808:	72 0e                	jb     818 <free+0x38>
 80a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80c:	39 c8                	cmp    %ecx,%eax
 80e:	66 90                	xchg   %ax,%ax
 810:	72 e6                	jb     7f8 <free+0x18>
 812:	8b 10                	mov    (%eax),%edx
 814:	eb e8                	jmp    7fe <free+0x1e>
 816:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 71 04             	mov    0x4(%ecx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 d7                	cmp    %edx,%edi
 820:	74 19                	je     83b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 822:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 825:	8b 50 04             	mov    0x4(%eax),%edx
 828:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 82b:	39 ce                	cmp    %ecx,%esi
 82d:	74 23                	je     852 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 82f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 831:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 836:	5b                   	pop    %ebx
 837:	5e                   	pop    %esi
 838:	5f                   	pop    %edi
 839:	5d                   	pop    %ebp
 83a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 83b:	03 72 04             	add    0x4(%edx),%esi
 83e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 841:	8b 10                	mov    (%eax),%edx
 843:	8b 12                	mov    (%edx),%edx
 845:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 848:	8b 50 04             	mov    0x4(%eax),%edx
 84b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 84e:	39 ce                	cmp    %ecx,%esi
 850:	75 dd                	jne    82f <free+0x4f>
    p->s.size += bp->s.size;
 852:	03 51 04             	add    0x4(%ecx),%edx
 855:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 858:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 85d:	a3 40 0f 00 00       	mov    %eax,0xf40
}
 862:	5b                   	pop    %ebx
 863:	5e                   	pop    %esi
 864:	5f                   	pop    %edi
 865:	5d                   	pop    %ebp
 866:	c3                   	ret    
 867:	89 f6                	mov    %esi,%esi
 869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 87c:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 882:	83 c3 07             	add    $0x7,%ebx
 885:	c1 eb 03             	shr    $0x3,%ebx
 888:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 88b:	85 c9                	test   %ecx,%ecx
 88d:	0f 84 93 00 00 00    	je     926 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 893:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 895:	8b 50 04             	mov    0x4(%eax),%edx
 898:	39 d3                	cmp    %edx,%ebx
 89a:	76 1f                	jbe    8bb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 89c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8a3:	90                   	nop
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 8a8:	3b 05 40 0f 00 00    	cmp    0xf40,%eax
 8ae:	74 30                	je     8e0 <malloc+0x70>
 8b0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8b4:	8b 50 04             	mov    0x4(%eax),%edx
 8b7:	39 d3                	cmp    %edx,%ebx
 8b9:	77 ed                	ja     8a8 <malloc+0x38>
      if(p->s.size == nunits)
 8bb:	39 d3                	cmp    %edx,%ebx
 8bd:	74 61                	je     920 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8bf:	29 da                	sub    %ebx,%edx
 8c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8c7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8ca:	89 0d 40 0f 00 00    	mov    %ecx,0xf40
      return (void*) (p + 1);
 8d0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8d3:	83 c4 1c             	add    $0x1c,%esp
 8d6:	5b                   	pop    %ebx
 8d7:	5e                   	pop    %esi
 8d8:	5f                   	pop    %edi
 8d9:	5d                   	pop    %ebp
 8da:	c3                   	ret    
 8db:	90                   	nop
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 8e0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 8e6:	b8 00 80 00 00       	mov    $0x8000,%eax
 8eb:	bf 00 10 00 00       	mov    $0x1000,%edi
 8f0:	76 04                	jbe    8f6 <malloc+0x86>
 8f2:	89 f0                	mov    %esi,%eax
 8f4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 c2 fb ff ff       	call   4c0 <sbrk>
  if(p == (char*) -1)
 8fe:	83 f8 ff             	cmp    $0xffffffff,%eax
 901:	74 18                	je     91b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 903:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 906:	83 c0 08             	add    $0x8,%eax
 909:	89 04 24             	mov    %eax,(%esp)
 90c:	e8 cf fe ff ff       	call   7e0 <free>
  return freep;
 911:	8b 0d 40 0f 00 00    	mov    0xf40,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 917:	85 c9                	test   %ecx,%ecx
 919:	75 97                	jne    8b2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 91b:	31 c0                	xor    %eax,%eax
 91d:	eb b4                	jmp    8d3 <malloc+0x63>
 91f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 920:	8b 10                	mov    (%eax),%edx
 922:	89 11                	mov    %edx,(%ecx)
 924:	eb a4                	jmp    8ca <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 926:	c7 05 40 0f 00 00 38 	movl   $0xf38,0xf40
 92d:	0f 00 00 
    base.s.size = 0;
 930:	b9 38 0f 00 00       	mov    $0xf38,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 935:	c7 05 38 0f 00 00 38 	movl   $0xf38,0xf38
 93c:	0f 00 00 
    base.s.size = 0;
 93f:	c7 05 3c 0f 00 00 00 	movl   $0x0,0xf3c
 946:	00 00 00 
 949:	e9 45 ff ff ff       	jmp    893 <malloc+0x23>
 94e:	90                   	nop
 94f:	90                   	nop

00000950 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	53                   	push   %ebx
 954:	83 ec 14             	sub    $0x14,%esp
 957:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 95a:	8b 03                	mov    (%ebx),%eax
 95c:	89 04 24             	mov    %eax,(%esp)
 95f:	e8 b4 fb ff ff       	call   518 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 964:	8b 43 04             	mov    0x4(%ebx),%eax
 967:	89 04 24             	mov    %eax,(%esp)
 96a:	e8 a9 fb ff ff       	call   518 <binary_sem_clear>
	free(sem);
 96f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 972:	83 c4 14             	add    $0x14,%esp
 975:	5b                   	pop    %ebx
 976:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 977:	e9 64 fe ff ff       	jmp    7e0 <free>
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000980 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	83 ec 18             	sub    $0x18,%esp
 986:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 989:	8b 5d 08             	mov    0x8(%ebp),%ebx
 98c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 98f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 992:	8b 43 04             	mov    0x4(%ebx),%eax
 995:	89 04 24             	mov    %eax,(%esp)
 998:	e8 6b fb ff ff       	call   508 <binary_sem_down>
	binary_sem_down(sem->S1);
 99d:	8b 03                	mov    (%ebx),%eax
 99f:	89 04 24             	mov    %eax,(%esp)
 9a2:	e8 61 fb ff ff       	call   508 <binary_sem_down>
	sem->value -= num;
 9a7:	8b 43 08             	mov    0x8(%ebx),%eax
 9aa:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 9ac:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 9ae:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 9b1:	74 0b                	je     9be <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 9b3:	8b 43 04             	mov    0x4(%ebx),%eax
 9b6:	89 04 24             	mov    %eax,(%esp)
 9b9:	e8 52 fb ff ff       	call   510 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 9be:	8b 03                	mov    (%ebx),%eax
}
 9c0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 9c3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9c6:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9c9:	89 ec                	mov    %ebp,%esp
 9cb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9cc:	e9 3f fb ff ff       	jmp    510 <binary_sem_up>
 9d1:	eb 0d                	jmp    9e0 <sem_down>
 9d3:	90                   	nop
 9d4:	90                   	nop
 9d5:	90                   	nop
 9d6:	90                   	nop
 9d7:	90                   	nop
 9d8:	90                   	nop
 9d9:	90                   	nop
 9da:	90                   	nop
 9db:	90                   	nop
 9dc:	90                   	nop
 9dd:	90                   	nop
 9de:	90                   	nop
 9df:	90                   	nop

000009e0 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	53                   	push   %ebx
 9e4:	83 ec 14             	sub    $0x14,%esp
 9e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 9ea:	8b 43 04             	mov    0x4(%ebx),%eax
 9ed:	89 04 24             	mov    %eax,(%esp)
 9f0:	e8 13 fb ff ff       	call   508 <binary_sem_down>
	binary_sem_down(sem->S1);
 9f5:	8b 03                	mov    (%ebx),%eax
 9f7:	89 04 24             	mov    %eax,(%esp)
 9fa:	e8 09 fb ff ff       	call   508 <binary_sem_down>
	sem->value--;
 9ff:	8b 43 08             	mov    0x8(%ebx),%eax
 a02:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 a05:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 a07:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 a0a:	74 0b                	je     a17 <sem_down+0x37>
		binary_sem_up(sem->S2);
 a0c:	8b 43 04             	mov    0x4(%ebx),%eax
 a0f:	89 04 24             	mov    %eax,(%esp)
 a12:	e8 f9 fa ff ff       	call   510 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 a17:	8b 03                	mov    (%ebx),%eax
 a19:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a1c:	83 c4 14             	add    $0x14,%esp
 a1f:	5b                   	pop    %ebx
 a20:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a21:	e9 ea fa ff ff       	jmp    510 <binary_sem_up>
 a26:	8d 76 00             	lea    0x0(%esi),%esi
 a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a30 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	83 ec 18             	sub    $0x18,%esp
 a36:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 a39:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a3c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 a3f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 a42:	8b 03                	mov    (%ebx),%eax
 a44:	89 04 24             	mov    %eax,(%esp)
 a47:	e8 bc fa ff ff       	call   508 <binary_sem_down>
	sem->value+= num;
 a4c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 a4f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 a52:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 a55:	74 19                	je     a70 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a57:	8b 03                	mov    (%ebx),%eax
}
 a59:	8b 75 fc             	mov    -0x4(%ebp),%esi
 a5c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a5f:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a62:	89 ec                	mov    %ebp,%esp
 a64:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a65:	e9 a6 fa ff ff       	jmp    510 <binary_sem_up>
 a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 a70:	8b 43 04             	mov    0x4(%ebx),%eax
 a73:	89 04 24             	mov    %eax,(%esp)
 a76:	e8 95 fa ff ff       	call   510 <binary_sem_up>
 a7b:	eb da                	jmp    a57 <sem_ups+0x27>
 a7d:	8d 76 00             	lea    0x0(%esi),%esi

00000a80 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	53                   	push   %ebx
 a84:	83 ec 14             	sub    $0x14,%esp
 a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 a8a:	8b 03                	mov    (%ebx),%eax
 a8c:	89 04 24             	mov    %eax,(%esp)
 a8f:	e8 74 fa ff ff       	call   508 <binary_sem_down>
	sem->value++;
 a94:	8b 43 08             	mov    0x8(%ebx),%eax
 a97:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 a9a:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 a9d:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 aa0:	74 16                	je     ab8 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 aa2:	8b 03                	mov    (%ebx),%eax
 aa4:	89 45 08             	mov    %eax,0x8(%ebp)
}
 aa7:	83 c4 14             	add    $0x14,%esp
 aaa:	5b                   	pop    %ebx
 aab:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 aac:	e9 5f fa ff ff       	jmp    510 <binary_sem_up>
 ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 ab8:	8b 43 04             	mov    0x4(%ebx),%eax
 abb:	89 04 24             	mov    %eax,(%esp)
 abe:	e8 4d fa ff ff       	call   510 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 ac3:	8b 03                	mov    (%ebx),%eax
 ac5:	89 45 08             	mov    %eax,0x8(%ebp)
}
 ac8:	83 c4 14             	add    $0x14,%esp
 acb:	5b                   	pop    %ebx
 acc:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 acd:	e9 3e fa ff ff       	jmp    510 <binary_sem_up>
 ad2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 ae6:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 aed:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 af0:	89 75 f8             	mov    %esi,-0x8(%ebp)
 af3:	89 7d fc             	mov    %edi,-0x4(%ebp)
 af6:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 af9:	e8 72 fd ff ff       	call   870 <malloc>
	ret->value = initial_semaphore_value;
 afe:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 b01:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 b03:	e8 f8 f9 ff ff       	call   500 <binary_sem_create>
 b08:	89 03                	mov    %eax,(%ebx)
 b0a:	89 c6                	mov    %eax,%esi
 b0c:	e8 ef f9 ff ff       	call   500 <binary_sem_create>
 b11:	01 c6                	add    %eax,%esi
 b13:	89 43 04             	mov    %eax,0x4(%ebx)
 b16:	78 20                	js     b38 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 b18:	85 ff                	test   %edi,%edi
 b1a:	75 08                	jne    b24 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 b1c:	89 04 24             	mov    %eax,(%esp)
 b1f:	e8 e4 f9 ff ff       	call   508 <binary_sem_down>
	}
	return ret;
}
 b24:	89 d8                	mov    %ebx,%eax
 b26:	8b 75 f8             	mov    -0x8(%ebp),%esi
 b29:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 b2c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 b2f:	89 ec                	mov    %ebp,%esp
 b31:	5d                   	pop    %ebp
 b32:	c3                   	ret    
 b33:	90                   	nop
 b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 b38:	c7 44 24 04 88 0e 00 	movl   $0xe88,0x4(%esp)
 b3f:	00 
 b40:	31 db                	xor    %ebx,%ebx
 b42:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b49:	e8 82 fa ff ff       	call   5d0 <printf>
		return 0;
 b4e:	eb d4                	jmp    b24 <semaphore_create+0x44>

00000b50 <semaphore_clear>:
	binary_sem_up(bb->mutex);
	sem_up(bb->empty);
	return element;
}

void semaphore_clear(struct BB* bb) {
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	53                   	push   %ebx
 b54:	83 ec 14             	sub    $0x14,%esp
 b57:	8b 5d 08             	mov    0x8(%ebp),%ebx
	free(bb->buffer);
 b5a:	8b 43 0c             	mov    0xc(%ebx),%eax
 b5d:	89 04 24             	mov    %eax,(%esp)
 b60:	e8 7b fc ff ff       	call   7e0 <free>
	sem_clear(bb->empty);
 b65:	8b 43 04             	mov    0x4(%ebx),%eax
 b68:	89 04 24             	mov    %eax,(%esp)
 b6b:	e8 e0 fd ff ff       	call   950 <sem_clear>
	sem_clear(bb->full);
 b70:	8b 43 08             	mov    0x8(%ebx),%eax
 b73:	89 04 24             	mov    %eax,(%esp)
 b76:	e8 d5 fd ff ff       	call   950 <sem_clear>
	binary_sem_clear(bb->mutex);
 b7b:	8b 03                	mov    (%ebx),%eax
 b7d:	89 04 24             	mov    %eax,(%esp)
 b80:	e8 93 f9 ff ff       	call   518 <binary_sem_clear>
	free(bb);
 b85:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 b88:	83 c4 14             	add    $0x14,%esp
 b8b:	5b                   	pop    %ebx
 b8c:	5d                   	pop    %ebp
void semaphore_clear(struct BB* bb) {
	free(bb->buffer);
	sem_clear(bb->empty);
	sem_clear(bb->full);
	binary_sem_clear(bb->mutex);
	free(bb);
 b8d:	e9 4e fc ff ff       	jmp    7e0 <free>
 b92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ba0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	8b 00                	mov    (%eax),%eax
 bab:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bae:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 baf:	e9 5c f9 ff ff       	jmp    510 <binary_sem_up>
 bb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 bba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bc0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
 bc3:	56                   	push   %esi
 bc4:	53                   	push   %ebx
 bc5:	83 ec 10             	sub    $0x10,%esp
 bc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 bcb:	8b 43 08             	mov    0x8(%ebx),%eax
 bce:	89 04 24             	mov    %eax,(%esp)
 bd1:	e8 0a fe ff ff       	call   9e0 <sem_down>
	binary_sem_down(bb->mutex);
 bd6:	8b 03                	mov    (%ebx),%eax
 bd8:	89 04 24             	mov    %eax,(%esp)
 bdb:	e8 28 f9 ff ff       	call   508 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 be0:	8b 43 14             	mov    0x14(%ebx),%eax
 be3:	c1 e0 02             	shl    $0x2,%eax
 be6:	03 43 0c             	add    0xc(%ebx),%eax
 be9:	8b 30                	mov    (%eax),%esi
 beb:	85 f6                	test   %esi,%esi
 bed:	74 42                	je     c31 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 bef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 bf5:	8b 53 18             	mov    0x18(%ebx),%edx
 bf8:	8b 43 14             	mov    0x14(%ebx),%eax
 bfb:	83 ea 01             	sub    $0x1,%edx
 bfe:	39 d0                	cmp    %edx,%eax
 c00:	74 26                	je     c28 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 c02:	83 c0 01             	add    $0x1,%eax
 c05:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 c08:	8b 03                	mov    (%ebx),%eax
 c0a:	89 04 24             	mov    %eax,(%esp)
 c0d:	e8 fe f8 ff ff       	call   510 <binary_sem_up>
	sem_up(bb->empty);
 c12:	8b 43 04             	mov    0x4(%ebx),%eax
 c15:	89 04 24             	mov    %eax,(%esp)
 c18:	e8 63 fe ff ff       	call   a80 <sem_up>
	return element;
}
 c1d:	83 c4 10             	add    $0x10,%esp
 c20:	89 f0                	mov    %esi,%eax
 c22:	5b                   	pop    %ebx
 c23:	5e                   	pop    %esi
 c24:	5d                   	pop    %ebp
 c25:	c3                   	ret    
 c26:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 c28:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 c2f:	eb d7                	jmp    c08 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 c31:	c7 44 24 04 b0 0e 00 	movl   $0xeb0,0x4(%esp)
 c38:	00 
 c39:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c40:	e8 8b f9 ff ff       	call   5d0 <printf>
 c45:	eb c1                	jmp    c08 <semaphore_pop+0x48>
 c47:	89 f6                	mov    %esi,%esi
 c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c50 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
 c53:	56                   	push   %esi
 c54:	53                   	push   %ebx
 c55:	83 ec 10             	sub    $0x10,%esp
 c58:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c5b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 c5e:	8b 43 04             	mov    0x4(%ebx),%eax
 c61:	89 04 24             	mov    %eax,(%esp)
 c64:	e8 77 fd ff ff       	call   9e0 <sem_down>
	binary_sem_down(bb->mutex);
 c69:	8b 03                	mov    (%ebx),%eax
 c6b:	89 04 24             	mov    %eax,(%esp)
 c6e:	e8 95 f8 ff ff       	call   508 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 c73:	8b 43 10             	mov    0x10(%ebx),%eax
 c76:	c1 e0 02             	shl    $0x2,%eax
 c79:	03 43 0c             	add    0xc(%ebx),%eax
 c7c:	8b 10                	mov    (%eax),%edx
 c7e:	85 d2                	test   %edx,%edx
 c80:	74 26                	je     ca8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c82:	c7 44 24 04 f4 0e 00 	movl   $0xef4,0x4(%esp)
 c89:	00 
 c8a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c91:	e8 3a f9 ff ff       	call   5d0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 c96:	8b 43 08             	mov    0x8(%ebx),%eax
 c99:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c9c:	83 c4 10             	add    $0x10,%esp
 c9f:	5b                   	pop    %ebx
 ca0:	5e                   	pop    %esi
 ca1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 ca2:	e9 d9 fd ff ff       	jmp    a80 <sem_up>
 ca7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 ca8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 caa:	8b 53 18             	mov    0x18(%ebx),%edx
 cad:	8b 43 10             	mov    0x10(%ebx),%eax
 cb0:	83 ea 01             	sub    $0x1,%edx
 cb3:	39 d0                	cmp    %edx,%eax
 cb5:	74 09                	je     cc0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 cb7:	83 c0 01             	add    $0x1,%eax
 cba:	89 43 10             	mov    %eax,0x10(%ebx)
 cbd:	eb d7                	jmp    c96 <semaphore_put_atomic+0x46>
 cbf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 cc0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 cc7:	eb cd                	jmp    c96 <semaphore_put_atomic+0x46>
 cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cd0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 cd0:	55                   	push   %ebp
 cd1:	89 e5                	mov    %esp,%ebp
 cd3:	56                   	push   %esi
 cd4:	53                   	push   %ebx
 cd5:	83 ec 10             	sub    $0x10,%esp
 cd8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 cdb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 cde:	8b 43 04             	mov    0x4(%ebx),%eax
 ce1:	89 04 24             	mov    %eax,(%esp)
 ce4:	e8 f7 fc ff ff       	call   9e0 <sem_down>
	binary_sem_down(bb->mutex);
 ce9:	8b 03                	mov    (%ebx),%eax
 ceb:	89 04 24             	mov    %eax,(%esp)
 cee:	e8 15 f8 ff ff       	call   508 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 cf3:	8b 43 10             	mov    0x10(%ebx),%eax
 cf6:	c1 e0 02             	shl    $0x2,%eax
 cf9:	03 43 0c             	add    0xc(%ebx),%eax
 cfc:	8b 08                	mov    (%eax),%ecx
 cfe:	85 c9                	test   %ecx,%ecx
 d00:	74 36                	je     d38 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 d02:	c7 44 24 04 f4 0e 00 	movl   $0xef4,0x4(%esp)
 d09:	00 
 d0a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d11:	e8 ba f8 ff ff       	call   5d0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 d16:	8b 03                	mov    (%ebx),%eax
 d18:	89 04 24             	mov    %eax,(%esp)
 d1b:	e8 f0 f7 ff ff       	call   510 <binary_sem_up>
	sem_up(bb->full);
 d20:	8b 43 08             	mov    0x8(%ebx),%eax
 d23:	89 45 08             	mov    %eax,0x8(%ebp)
}
 d26:	83 c4 10             	add    $0x10,%esp
 d29:	5b                   	pop    %ebx
 d2a:	5e                   	pop    %esi
 d2b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 d2c:	e9 4f fd ff ff       	jmp    a80 <sem_up>
 d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 d38:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 d3a:	8b 53 18             	mov    0x18(%ebx),%edx
 d3d:	8b 43 10             	mov    0x10(%ebx),%eax
 d40:	83 ea 01             	sub    $0x1,%edx
 d43:	39 d0                	cmp    %edx,%eax
 d45:	74 09                	je     d50 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 d47:	83 c0 01             	add    $0x1,%eax
 d4a:	89 43 10             	mov    %eax,0x10(%ebx)
 d4d:	eb c7                	jmp    d16 <semaphore_put+0x46>
 d4f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 d50:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 d57:	eb bd                	jmp    d16 <semaphore_put+0x46>
 d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d60 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 d60:	55                   	push   %ebp
 d61:	89 e5                	mov    %esp,%ebp
 d63:	83 ec 18             	sub    $0x18,%esp
 d66:	89 75 fc             	mov    %esi,-0x4(%ebp)
 d69:	8b 75 08             	mov    0x8(%ebp),%esi
 d6c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 d6f:	85 f6                	test   %esi,%esi
 d71:	79 15                	jns    d88 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 d73:	31 db                	xor    %ebx,%ebx
}
 d75:	89 d8                	mov    %ebx,%eax
 d77:	8b 75 fc             	mov    -0x4(%ebp),%esi
 d7a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 d7d:	89 ec                	mov    %ebp,%esp
 d7f:	5d                   	pop    %ebp
 d80:	c3                   	ret    
 d81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 d88:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 d8f:	e8 dc fa ff ff       	call   870 <malloc>
 d94:	85 c0                	test   %eax,%eax
 d96:	89 c3                	mov    %eax,%ebx
 d98:	74 db                	je     d75 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 d9a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 da1:	89 04 24             	mov    %eax,(%esp)
 da4:	e8 c7 fa ff ff       	call   870 <malloc>
 da9:	85 c0                	test   %eax,%eax
 dab:	89 43 0c             	mov    %eax,0xc(%ebx)
 dae:	74 c3                	je     d73 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 db0:	89 34 24             	mov    %esi,(%esp)
 db3:	e8 28 fd ff ff       	call   ae0 <semaphore_create>
 db8:	85 c0                	test   %eax,%eax
 dba:	89 43 04             	mov    %eax,0x4(%ebx)
 dbd:	74 b4                	je     d73 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 dbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 dc6:	e8 15 fd ff ff       	call   ae0 <semaphore_create>
 dcb:	85 c0                	test   %eax,%eax
 dcd:	89 43 08             	mov    %eax,0x8(%ebx)
 dd0:	74 a1                	je     d73 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 dd2:	e8 29 f7 ff ff       	call   500 <binary_sem_create>
	ret->produce = 0;
 dd7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 dde:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 de5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 de8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 dea:	eb 89                	jmp    d75 <BB_create+0x15>
