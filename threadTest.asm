
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
  28:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
  2f:	00 
  30:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  37:	e8 c4 05 00 00       	call   600 <printf>
  exit();
  3c:	e8 27 04 00 00       	call   468 <exit>
  41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
else {
int n = atoi(argv[1]);
  48:	8b 40 04             	mov    0x4(%eax),%eax
  4b:	89 04 24             	mov    %eax,(%esp)
  4e:	e8 ed 02 00 00       	call   340 <atoi>
  53:	89 c6                	mov    %eax,%esi
int i;
void* ustack;
binsem = binary_sem_create();
  55:	e8 d6 04 00 00       	call   530 <binary_sem_create>

if (binsem < 0) {
  5a:	85 c0                	test   %eax,%eax
}
else {
int n = atoi(argv[1]);
int i;
void* ustack;
binsem = binary_sem_create();
  5c:	a3 28 0f 00 00       	mov    %eax,0xf28

if (binsem < 0) {
  61:	0f 88 e1 00 00 00    	js     148 <main+0x148>
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
  83:	0f 84 b6 00 00 00    	je     13f <main+0x13f>
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
  9c:	c7 04 24 90 01 00 00 	movl   $0x190,(%esp)
  a3:	e8 60 04 00 00       	call   508 <thread_create>
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
  b9:	e8 e2 07 00 00       	call   8a0 <malloc>
  be:	85 c0                	test   %eax,%eax
  c0:	75 ce                	jne    90 <main+0x90>
printf(2,"cant malloc the stack for the thread\n");
  c2:	c7 44 24 04 08 0e 00 	movl   $0xe08,0x4(%esp)
  c9:	00 
  ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  d1:	e8 2a 05 00 00       	call   600 <printf>
exit();
  d6:	e8 8d 03 00 00       	call   468 <exit>
  db:	90                   	nop
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
printf(2, "no semaphore available\n");
exit();
}

if(n < 0) {
printf(2,"invalid input\n");
  e0:	c7 44 24 04 f5 0d 00 	movl   $0xdf5,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ef:	e8 0c 05 00 00       	call   600 <printf>
exit();
  f4:	e8 6f 03 00 00       	call   468 <exit>
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
 119:	e8 0a 04 00 00       	call   528 <thread_join>
printf(1,"%d",*lol);
 11e:	a1 00 00 00 00       	mov    0x0,%eax
 123:	c7 44 24 04 04 0e 00 	movl   $0xe04,0x4(%esp)
 12a:	00 
 12b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 132:	89 44 24 08          	mov    %eax,0x8(%esp)
 136:	e8 c5 04 00 00       	call   600 <printf>
}
else {
tid[i] = thread_create(thread_loop ,ustack, STK_SIZE);
}
}
for(i=0;i<n;i++) {
 13b:	39 de                	cmp    %ebx,%esi
 13d:	7f c9                	jg     108 <main+0x108>
 13f:	8b 65 e4             	mov    -0x1c(%ebp),%esp
thread_join(tid[i],lol);
printf(1,"%d",*lol);
}
}
}
exit();
 142:	e8 21 03 00 00       	call   468 <exit>
 147:	90                   	nop
int i;
void* ustack;
binsem = binary_sem_create();

if (binsem < 0) {
printf(2, "no semaphore available\n");
 148:	c7 44 24 04 dd 0d 00 	movl   $0xddd,0x4(%esp)
 14f:	00 
 150:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 157:	e8 a4 04 00 00       	call   600 <printf>
exit();
 15c:	e8 07 03 00 00       	call   468 <exit>
 161:	eb 0d                	jmp    170 <stub>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <stub>:
return 0;
}

void*
stub()
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	83 ec 18             	sub    $0x18,%esp
thread_exit(0);
 176:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17d:	e8 9e 03 00 00       	call   520 <thread_exit>
return 0;
}
 182:	31 c0                	xor    %eax,%eax
 184:	c9                   	leave  
 185:	c3                   	ret    
 186:	8d 76 00             	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <thread_loop>:

int binsem;

void*
thread_loop()
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	83 ec 10             	sub    $0x10,%esp
int i;
int pid,tid;
pid = thread_getProcid();
 198:	e8 7b 03 00 00       	call   518 <thread_getProcid>
 19d:	89 c3                	mov    %eax,%ebx
tid = thread_getid();
 19f:	e8 6c 03 00 00       	call   510 <thread_getid>
 1a4:	89 c6                	mov    %eax,%esi
//while(1) {
binary_sem_down(binsem);
 1a6:	a1 28 0f 00 00       	mov    0xf28,%eax
 1ab:	89 04 24             	mov    %eax,(%esp)
 1ae:	e8 85 03 00 00       	call   538 <binary_sem_down>
for(i=0;i<3;i++)
{
printf(1, "Process %d Thread %d is running.\n", pid, tid);
 1b3:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1b7:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1bb:	c7 44 24 04 30 0e 00 	movl   $0xe30,0x4(%esp)
 1c2:	00 
 1c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ca:	e8 31 04 00 00       	call   600 <printf>
 1cf:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1d3:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1d7:	c7 44 24 04 30 0e 00 	movl   $0xe30,0x4(%esp)
 1de:	00 
 1df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e6:	e8 15 04 00 00       	call   600 <printf>
 1eb:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1ef:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1f3:	c7 44 24 04 30 0e 00 	movl   $0xe30,0x4(%esp)
 1fa:	00 
 1fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 202:	e8 f9 03 00 00       	call   600 <printf>
}
binary_sem_up(binsem);
 207:	a1 28 0f 00 00       	mov    0xf28,%eax
 20c:	89 04 24             	mov    %eax,(%esp)
 20f:	e8 2c 03 00 00       	call   540 <binary_sem_up>
sleep(1);
 214:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21b:	e8 d8 02 00 00       	call   4f8 <sleep>
//}
thread_exit(130);
 220:	c7 04 24 82 00 00 00 	movl   $0x82,(%esp)
 227:	e8 f4 02 00 00       	call   520 <thread_exit>
return 0;
}
 22c:	83 c4 10             	add    $0x10,%esp
 22f:	31 c0                	xor    %eax,%eax
 231:	5b                   	pop    %ebx
 232:	5e                   	pop    %esi
 233:	5d                   	pop    %ebp
 234:	c3                   	ret    
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

00000240 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 240:	55                   	push   %ebp
 241:	31 d2                	xor    %edx,%edx
 243:	89 e5                	mov    %esp,%ebp
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	53                   	push   %ebx
 249:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 250:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 254:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 257:	83 c2 01             	add    $0x1,%edx
 25a:	84 c9                	test   %cl,%cl
 25c:	75 f2                	jne    250 <strcpy+0x10>
    ;
  return os;
}
 25e:	5b                   	pop    %ebx
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	eb 0d                	jmp    270 <strcmp>
 263:	90                   	nop
 264:	90                   	nop
 265:	90                   	nop
 266:	90                   	nop
 267:	90                   	nop
 268:	90                   	nop
 269:	90                   	nop
 26a:	90                   	nop
 26b:	90                   	nop
 26c:	90                   	nop
 26d:	90                   	nop
 26e:	90                   	nop
 26f:	90                   	nop

00000270 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 27a:	0f b6 01             	movzbl (%ecx),%eax
 27d:	84 c0                	test   %al,%al
 27f:	75 14                	jne    295 <strcmp+0x25>
 281:	eb 25                	jmp    2a8 <strcmp+0x38>
 283:	90                   	nop
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 288:	83 c1 01             	add    $0x1,%ecx
 28b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 28e:	0f b6 01             	movzbl (%ecx),%eax
 291:	84 c0                	test   %al,%al
 293:	74 13                	je     2a8 <strcmp+0x38>
 295:	0f b6 1a             	movzbl (%edx),%ebx
 298:	38 d8                	cmp    %bl,%al
 29a:	74 ec                	je     288 <strcmp+0x18>
 29c:	0f b6 db             	movzbl %bl,%ebx
 29f:	0f b6 c0             	movzbl %al,%eax
 2a2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 2a4:	5b                   	pop    %ebx
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    
 2a7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2a8:	0f b6 1a             	movzbl (%edx),%ebx
 2ab:	31 c0                	xor    %eax,%eax
 2ad:	0f b6 db             	movzbl %bl,%ebx
 2b0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 2b2:	5b                   	pop    %ebx
 2b3:	5d                   	pop    %ebp
 2b4:	c3                   	ret    
 2b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strlen>:

uint
strlen(char *s)
{
 2c0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 2c1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 2c3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 2c5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 2c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2ca:	80 39 00             	cmpb   $0x0,(%ecx)
 2cd:	74 0c                	je     2db <strlen+0x1b>
 2cf:	90                   	nop
 2d0:	83 c2 01             	add    $0x1,%edx
 2d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2d7:	89 d0                	mov    %edx,%eax
 2d9:	75 f5                	jne    2d0 <strlen+0x10>
    ;
  return n;
}
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
 2e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ed:	89 d7                	mov    %edx,%edi
 2ef:	fc                   	cld    
 2f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2f2:	89 d0                	mov    %edx,%eax
 2f4:	5f                   	pop    %edi
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <strchr>:

char*
strchr(const char *s, char c)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 30a:	0f b6 10             	movzbl (%eax),%edx
 30d:	84 d2                	test   %dl,%dl
 30f:	75 11                	jne    322 <strchr+0x22>
 311:	eb 15                	jmp    328 <strchr+0x28>
 313:	90                   	nop
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 318:	83 c0 01             	add    $0x1,%eax
 31b:	0f b6 10             	movzbl (%eax),%edx
 31e:	84 d2                	test   %dl,%dl
 320:	74 06                	je     328 <strchr+0x28>
    if(*s == c)
 322:	38 ca                	cmp    %cl,%dl
 324:	75 f2                	jne    318 <strchr+0x18>
      return (char*) s;
  return 0;
}
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 328:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 32a:	5d                   	pop    %ebp
 32b:	90                   	nop
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 330:	c3                   	ret    
 331:	eb 0d                	jmp    340 <atoi>
 333:	90                   	nop
 334:	90                   	nop
 335:	90                   	nop
 336:	90                   	nop
 337:	90                   	nop
 338:	90                   	nop
 339:	90                   	nop
 33a:	90                   	nop
 33b:	90                   	nop
 33c:	90                   	nop
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 341:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 343:	89 e5                	mov    %esp,%ebp
 345:	8b 4d 08             	mov    0x8(%ebp),%ecx
 348:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 349:	0f b6 11             	movzbl (%ecx),%edx
 34c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 34f:	80 fb 09             	cmp    $0x9,%bl
 352:	77 1c                	ja     370 <atoi+0x30>
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 358:	0f be d2             	movsbl %dl,%edx
 35b:	83 c1 01             	add    $0x1,%ecx
 35e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 361:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 365:	0f b6 11             	movzbl (%ecx),%edx
 368:	8d 5a d0             	lea    -0x30(%edx),%ebx
 36b:	80 fb 09             	cmp    $0x9,%bl
 36e:	76 e8                	jbe    358 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 370:	5b                   	pop    %ebx
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	8b 45 08             	mov    0x8(%ebp),%eax
 387:	53                   	push   %ebx
 388:	8b 5d 10             	mov    0x10(%ebp),%ebx
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 db                	test   %ebx,%ebx
 390:	7e 14                	jle    3a6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 392:	31 d2                	xor    %edx,%edx
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 398:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 39c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 39f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a2:	39 da                	cmp    %ebx,%edx
 3a4:	75 f2                	jne    398 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003b0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 3b9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 3bc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 3bf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3cb:	00 
 3cc:	89 04 24             	mov    %eax,(%esp)
 3cf:	e8 d4 00 00 00       	call   4a8 <open>
  if(fd < 0)
 3d4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3d6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 3d8:	78 19                	js     3f3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	89 1c 24             	mov    %ebx,(%esp)
 3e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3e4:	e8 d7 00 00 00       	call   4c0 <fstat>
  close(fd);
 3e9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 3ec:	89 c6                	mov    %eax,%esi
  close(fd);
 3ee:	e8 9d 00 00 00       	call   490 <close>
  return r;
}
 3f3:	89 f0                	mov    %esi,%eax
 3f5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 3f8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 3fb:	89 ec                	mov    %ebp,%esp
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
 3ff:	90                   	nop

00000400 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	31 f6                	xor    %esi,%esi
 407:	53                   	push   %ebx
 408:	83 ec 2c             	sub    $0x2c,%esp
 40b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 40e:	eb 06                	jmp    416 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 410:	3c 0a                	cmp    $0xa,%al
 412:	74 39                	je     44d <gets+0x4d>
 414:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 416:	8d 5e 01             	lea    0x1(%esi),%ebx
 419:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 41c:	7d 31                	jge    44f <gets+0x4f>
    cc = read(0, &c, 1);
 41e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 421:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 428:	00 
 429:	89 44 24 04          	mov    %eax,0x4(%esp)
 42d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 434:	e8 47 00 00 00       	call   480 <read>
    if(cc < 1)
 439:	85 c0                	test   %eax,%eax
 43b:	7e 12                	jle    44f <gets+0x4f>
      break;
    buf[i++] = c;
 43d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 441:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 445:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 449:	3c 0d                	cmp    $0xd,%al
 44b:	75 c3                	jne    410 <gets+0x10>
 44d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 44f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 453:	89 f8                	mov    %edi,%eax
 455:	83 c4 2c             	add    $0x2c,%esp
 458:	5b                   	pop    %ebx
 459:	5e                   	pop    %esi
 45a:	5f                   	pop    %edi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 460:	b8 01 00 00 00       	mov    $0x1,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <exit>:
SYSCALL(exit)
 468:	b8 02 00 00 00       	mov    $0x2,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <wait>:
SYSCALL(wait)
 470:	b8 03 00 00 00       	mov    $0x3,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <pipe>:
SYSCALL(pipe)
 478:	b8 04 00 00 00       	mov    $0x4,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <read>:
SYSCALL(read)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <write>:
SYSCALL(write)
 488:	b8 05 00 00 00       	mov    $0x5,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <close>:
SYSCALL(close)
 490:	b8 07 00 00 00       	mov    $0x7,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <kill>:
SYSCALL(kill)
 498:	b8 08 00 00 00       	mov    $0x8,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <exec>:
SYSCALL(exec)
 4a0:	b8 09 00 00 00       	mov    $0x9,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <open>:
SYSCALL(open)
 4a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <mknod>:
SYSCALL(mknod)
 4b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <unlink>:
SYSCALL(unlink)
 4b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <fstat>:
SYSCALL(fstat)
 4c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <link>:
SYSCALL(link)
 4c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <mkdir>:
SYSCALL(mkdir)
 4d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <chdir>:
SYSCALL(chdir)
 4d8:	b8 10 00 00 00       	mov    $0x10,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <dup>:
SYSCALL(dup)
 4e0:	b8 11 00 00 00       	mov    $0x11,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <getpid>:
SYSCALL(getpid)
 4e8:	b8 12 00 00 00       	mov    $0x12,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <sbrk>:
SYSCALL(sbrk)
 4f0:	b8 13 00 00 00       	mov    $0x13,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <sleep>:
SYSCALL(sleep)
 4f8:	b8 14 00 00 00       	mov    $0x14,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <uptime>:
SYSCALL(uptime)
 500:	b8 15 00 00 00       	mov    $0x15,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <thread_create>:
SYSCALL(thread_create)
 508:	b8 16 00 00 00       	mov    $0x16,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <thread_getid>:
SYSCALL(thread_getid)
 510:	b8 17 00 00 00       	mov    $0x17,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <thread_getProcid>:
SYSCALL(thread_getProcid)
 518:	b8 18 00 00 00       	mov    $0x18,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <thread_exit>:
SYSCALL(thread_exit)
 520:	b8 1a 00 00 00       	mov    $0x1a,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <thread_join>:
SYSCALL(thread_join)
 528:	b8 19 00 00 00       	mov    $0x19,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <binary_sem_create>:
SYSCALL(binary_sem_create)
 530:	b8 1b 00 00 00       	mov    $0x1b,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <binary_sem_down>:
SYSCALL(binary_sem_down)
 538:	b8 1c 00 00 00       	mov    $0x1c,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <binary_sem_up>:
SYSCALL(binary_sem_up)
 540:	b8 1d 00 00 00       	mov    $0x1d,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 548:	b8 1e 00 00 00       	mov    $0x1e,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <exit_all_threads>:
 550:	b8 1f 00 00 00       	mov    $0x1f,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    
 558:	90                   	nop
 559:	90                   	nop
 55a:	90                   	nop
 55b:	90                   	nop
 55c:	90                   	nop
 55d:	90                   	nop
 55e:	90                   	nop
 55f:	90                   	nop

00000560 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	89 cf                	mov    %ecx,%edi
 566:	56                   	push   %esi
 567:	89 c6                	mov    %eax,%esi
 569:	53                   	push   %ebx
 56a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 56d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 570:	85 c9                	test   %ecx,%ecx
 572:	74 04                	je     578 <printint+0x18>
 574:	85 d2                	test   %edx,%edx
 576:	78 70                	js     5e8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 578:	89 d0                	mov    %edx,%eax
 57a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 581:	31 c9                	xor    %ecx,%ecx
 583:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 586:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 588:	31 d2                	xor    %edx,%edx
 58a:	f7 f7                	div    %edi
 58c:	0f b6 92 59 0e 00 00 	movzbl 0xe59(%edx),%edx
 593:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 596:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 599:	85 c0                	test   %eax,%eax
 59b:	75 eb                	jne    588 <printint+0x28>
	if(neg)
 59d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 5a0:	85 c0                	test   %eax,%eax
 5a2:	74 08                	je     5ac <printint+0x4c>
		buf[i++] = '-';
 5a4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 5a9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 5ac:	8d 79 ff             	lea    -0x1(%ecx),%edi
 5af:	01 fb                	add    %edi,%ebx
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	0f b6 03             	movzbl (%ebx),%eax
 5bb:	83 ef 01             	sub    $0x1,%edi
 5be:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c8:	00 
 5c9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 5cc:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5cf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d6:	e8 ad fe ff ff       	call   488 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 5db:	83 ff ff             	cmp    $0xffffffff,%edi
 5de:	75 d8                	jne    5b8 <printint+0x58>
		putc(fd, buf[i]);
}
 5e0:	83 c4 4c             	add    $0x4c,%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	f7 d8                	neg    %eax
 5ec:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5f3:	eb 8c                	jmp    581 <printint+0x21>
 5f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000600 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 609:	8b 45 0c             	mov    0xc(%ebp),%eax
 60c:	0f b6 10             	movzbl (%eax),%edx
 60f:	84 d2                	test   %dl,%dl
 611:	0f 84 c9 00 00 00    	je     6e0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 617:	8d 4d 10             	lea    0x10(%ebp),%ecx
 61a:	31 ff                	xor    %edi,%edi
 61c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 61f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 621:	8d 75 e7             	lea    -0x19(%ebp),%esi
 624:	eb 1e                	jmp    644 <printf+0x44>
 626:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 628:	83 fa 25             	cmp    $0x25,%edx
 62b:	0f 85 b7 00 00 00    	jne    6e8 <printf+0xe8>
 631:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 635:	83 c3 01             	add    $0x1,%ebx
 638:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 63c:	84 d2                	test   %dl,%dl
 63e:	0f 84 9c 00 00 00    	je     6e0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 644:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 646:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 649:	74 dd                	je     628 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 64b:	83 ff 25             	cmp    $0x25,%edi
 64e:	75 e5                	jne    635 <printf+0x35>
			if(c == 'd'){
 650:	83 fa 64             	cmp    $0x64,%edx
 653:	0f 84 57 01 00 00    	je     7b0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 659:	83 fa 70             	cmp    $0x70,%edx
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 660:	0f 84 aa 00 00 00    	je     710 <printf+0x110>
 666:	83 fa 78             	cmp    $0x78,%edx
 669:	0f 84 a1 00 00 00    	je     710 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 66f:	83 fa 73             	cmp    $0x73,%edx
 672:	0f 84 c0 00 00 00    	je     738 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 678:	83 fa 63             	cmp    $0x63,%edx
 67b:	90                   	nop
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 680:	0f 84 52 01 00 00    	je     7d8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 686:	83 fa 25             	cmp    $0x25,%edx
 689:	0f 84 f9 00 00 00    	je     788 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 68f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 692:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 695:	31 ff                	xor    %edi,%edi
 697:	89 55 cc             	mov    %edx,-0x34(%ebp)
 69a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 69e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a5:	00 
 6a6:	89 0c 24             	mov    %ecx,(%esp)
 6a9:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ad:	e8 d6 fd ff ff       	call   488 <write>
 6b2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6bf:	00 
 6c0:	89 74 24 04          	mov    %esi,0x4(%esp)
 6c4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6c7:	89 04 24             	mov    %eax,(%esp)
 6ca:	e8 b9 fd ff ff       	call   488 <write>
 6cf:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 6d2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 6d6:	84 d2                	test   %dl,%dl
 6d8:	0f 85 66 ff ff ff    	jne    644 <printf+0x44>
 6de:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 6e0:	83 c4 3c             	add    $0x3c,%esp
 6e3:	5b                   	pop    %ebx
 6e4:	5e                   	pop    %esi
 6e5:	5f                   	pop    %edi
 6e6:	5d                   	pop    %ebp
 6e7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 6eb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6f5:	00 
 6f6:	89 74 24 04          	mov    %esi,0x4(%esp)
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 86 fd ff ff       	call   488 <write>
 702:	8b 45 0c             	mov    0xc(%ebp),%eax
 705:	e9 2b ff ff ff       	jmp    635 <printf+0x35>
 70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 710:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 718:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 71a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 721:	8b 10                	mov    (%eax),%edx
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	e8 35 fe ff ff       	call   560 <printint>
 72b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 72e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 732:	e9 fe fe ff ff       	jmp    635 <printf+0x35>
 737:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 738:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 73b:	8b 3a                	mov    (%edx),%edi
				ap++;
 73d:	83 c2 04             	add    $0x4,%edx
 740:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 743:	85 ff                	test   %edi,%edi
 745:	0f 84 ba 00 00 00    	je     805 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 74b:	0f b6 17             	movzbl (%edi),%edx
 74e:	84 d2                	test   %dl,%dl
 750:	74 2d                	je     77f <printf+0x17f>
 752:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 755:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 758:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 75b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 75e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 765:	00 
 766:	89 74 24 04          	mov    %esi,0x4(%esp)
 76a:	89 1c 24             	mov    %ebx,(%esp)
 76d:	e8 16 fd ff ff       	call   488 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 772:	0f b6 17             	movzbl (%edi),%edx
 775:	84 d2                	test   %dl,%dl
 777:	75 df                	jne    758 <printf+0x158>
 779:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 77c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 77f:	31 ff                	xor    %edi,%edi
 781:	e9 af fe ff ff       	jmp    635 <printf+0x35>
 786:	66 90                	xchg   %ax,%ax
 788:	8b 55 08             	mov    0x8(%ebp),%edx
 78b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 78d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 791:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 798:	00 
 799:	89 74 24 04          	mov    %esi,0x4(%esp)
 79d:	89 14 24             	mov    %edx,(%esp)
 7a0:	e8 e3 fc ff ff       	call   488 <write>
 7a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7a8:	e9 88 fe ff ff       	jmp    635 <printf+0x35>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 7b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 7b8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 7bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 7c2:	8b 10                	mov    (%eax),%edx
 7c4:	8b 45 08             	mov    0x8(%ebp),%eax
 7c7:	e8 94 fd ff ff       	call   560 <printint>
 7cc:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 7cf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7d3:	e9 5d fe ff ff       	jmp    635 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7d8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 7db:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7dd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7df:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7e6:	00 
 7e7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7eb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7ee:	8b 45 08             	mov    0x8(%ebp),%eax
 7f1:	89 04 24             	mov    %eax,(%esp)
 7f4:	e8 8f fc ff ff       	call   488 <write>
 7f9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 7fc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 800:	e9 30 fe ff ff       	jmp    635 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 805:	bf 52 0e 00 00       	mov    $0xe52,%edi
 80a:	e9 3c ff ff ff       	jmp    74b <printf+0x14b>
 80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 24 0f 00 00       	mov    0xf24,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 81e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	39 c8                	cmp    %ecx,%eax
 823:	73 1d                	jae    842 <free+0x32>
 825:	8d 76 00             	lea    0x0(%esi),%esi
 828:	8b 10                	mov    (%eax),%edx
 82a:	39 d1                	cmp    %edx,%ecx
 82c:	72 1a                	jb     848 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82e:	39 d0                	cmp    %edx,%eax
 830:	72 08                	jb     83a <free+0x2a>
 832:	39 c8                	cmp    %ecx,%eax
 834:	72 12                	jb     848 <free+0x38>
 836:	39 d1                	cmp    %edx,%ecx
 838:	72 0e                	jb     848 <free+0x38>
 83a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83c:	39 c8                	cmp    %ecx,%eax
 83e:	66 90                	xchg   %ax,%ax
 840:	72 e6                	jb     828 <free+0x18>
 842:	8b 10                	mov    (%eax),%edx
 844:	eb e8                	jmp    82e <free+0x1e>
 846:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 71 04             	mov    0x4(%ecx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 d7                	cmp    %edx,%edi
 850:	74 19                	je     86b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 852:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 855:	8b 50 04             	mov    0x4(%eax),%edx
 858:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85b:	39 ce                	cmp    %ecx,%esi
 85d:	74 23                	je     882 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 85f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 861:	a3 24 0f 00 00       	mov    %eax,0xf24
}
 866:	5b                   	pop    %ebx
 867:	5e                   	pop    %esi
 868:	5f                   	pop    %edi
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 86b:	03 72 04             	add    0x4(%edx),%esi
 86e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 871:	8b 10                	mov    (%eax),%edx
 873:	8b 12                	mov    (%edx),%edx
 875:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 878:	8b 50 04             	mov    0x4(%eax),%edx
 87b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 87e:	39 ce                	cmp    %ecx,%esi
 880:	75 dd                	jne    85f <free+0x4f>
    p->s.size += bp->s.size;
 882:	03 51 04             	add    0x4(%ecx),%edx
 885:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 888:	8b 53 f8             	mov    -0x8(%ebx),%edx
 88b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 88d:	a3 24 0f 00 00       	mov    %eax,0xf24
}
 892:	5b                   	pop    %ebx
 893:	5e                   	pop    %esi
 894:	5f                   	pop    %edi
 895:	5d                   	pop    %ebp
 896:	c3                   	ret    
 897:	89 f6                	mov    %esi,%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 8ac:	8b 0d 24 0f 00 00    	mov    0xf24,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	83 c3 07             	add    $0x7,%ebx
 8b5:	c1 eb 03             	shr    $0x3,%ebx
 8b8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8bb:	85 c9                	test   %ecx,%ecx
 8bd:	0f 84 93 00 00 00    	je     956 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8c5:	8b 50 04             	mov    0x4(%eax),%edx
 8c8:	39 d3                	cmp    %edx,%ebx
 8ca:	76 1f                	jbe    8eb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 8cc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8d3:	90                   	nop
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 8d8:	3b 05 24 0f 00 00    	cmp    0xf24,%eax
 8de:	74 30                	je     910 <malloc+0x70>
 8e0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8e4:	8b 50 04             	mov    0x4(%eax),%edx
 8e7:	39 d3                	cmp    %edx,%ebx
 8e9:	77 ed                	ja     8d8 <malloc+0x38>
      if(p->s.size == nunits)
 8eb:	39 d3                	cmp    %edx,%ebx
 8ed:	74 61                	je     950 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ef:	29 da                	sub    %ebx,%edx
 8f1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8f7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8fa:	89 0d 24 0f 00 00    	mov    %ecx,0xf24
      return (void*) (p + 1);
 900:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 903:	83 c4 1c             	add    $0x1c,%esp
 906:	5b                   	pop    %ebx
 907:	5e                   	pop    %esi
 908:	5f                   	pop    %edi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    
 90b:	90                   	nop
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 910:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 916:	b8 00 80 00 00       	mov    $0x8000,%eax
 91b:	bf 00 10 00 00       	mov    $0x1000,%edi
 920:	76 04                	jbe    926 <malloc+0x86>
 922:	89 f0                	mov    %esi,%eax
 924:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 926:	89 04 24             	mov    %eax,(%esp)
 929:	e8 c2 fb ff ff       	call   4f0 <sbrk>
  if(p == (char*) -1)
 92e:	83 f8 ff             	cmp    $0xffffffff,%eax
 931:	74 18                	je     94b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 933:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 936:	83 c0 08             	add    $0x8,%eax
 939:	89 04 24             	mov    %eax,(%esp)
 93c:	e8 cf fe ff ff       	call   810 <free>
  return freep;
 941:	8b 0d 24 0f 00 00    	mov    0xf24,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 947:	85 c9                	test   %ecx,%ecx
 949:	75 97                	jne    8e2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 94b:	31 c0                	xor    %eax,%eax
 94d:	eb b4                	jmp    903 <malloc+0x63>
 94f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 950:	8b 10                	mov    (%eax),%edx
 952:	89 11                	mov    %edx,(%ecx)
 954:	eb a4                	jmp    8fa <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 956:	c7 05 24 0f 00 00 1c 	movl   $0xf1c,0xf24
 95d:	0f 00 00 
    base.s.size = 0;
 960:	b9 1c 0f 00 00       	mov    $0xf1c,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 965:	c7 05 1c 0f 00 00 1c 	movl   $0xf1c,0xf1c
 96c:	0f 00 00 
    base.s.size = 0;
 96f:	c7 05 20 0f 00 00 00 	movl   $0x0,0xf20
 976:	00 00 00 
 979:	e9 45 ff ff ff       	jmp    8c3 <malloc+0x23>
 97e:	90                   	nop
 97f:	90                   	nop

00000980 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	53                   	push   %ebx
 984:	83 ec 14             	sub    $0x14,%esp
 987:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 98a:	8b 03                	mov    (%ebx),%eax
 98c:	89 04 24             	mov    %eax,(%esp)
 98f:	e8 b4 fb ff ff       	call   548 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 994:	8b 43 04             	mov    0x4(%ebx),%eax
 997:	89 04 24             	mov    %eax,(%esp)
 99a:	e8 a9 fb ff ff       	call   548 <binary_sem_clear>
	free(sem);
 99f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 9a2:	83 c4 14             	add    $0x14,%esp
 9a5:	5b                   	pop    %ebx
 9a6:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 9a7:	e9 64 fe ff ff       	jmp    810 <free>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009b0 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	83 ec 18             	sub    $0x18,%esp
 9b6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 9b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9bc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 9bf:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 9c2:	8b 43 04             	mov    0x4(%ebx),%eax
 9c5:	89 04 24             	mov    %eax,(%esp)
 9c8:	e8 6b fb ff ff       	call   538 <binary_sem_down>
	binary_sem_down(sem->S1);
 9cd:	8b 03                	mov    (%ebx),%eax
 9cf:	89 04 24             	mov    %eax,(%esp)
 9d2:	e8 61 fb ff ff       	call   538 <binary_sem_down>
	sem->value -= num;
 9d7:	8b 43 08             	mov    0x8(%ebx),%eax
 9da:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 9dc:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 9de:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 9e1:	74 0b                	je     9ee <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 9e3:	8b 43 04             	mov    0x4(%ebx),%eax
 9e6:	89 04 24             	mov    %eax,(%esp)
 9e9:	e8 52 fb ff ff       	call   540 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 9ee:	8b 03                	mov    (%ebx),%eax
}
 9f0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 9f3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9f6:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9f9:	89 ec                	mov    %ebp,%esp
 9fb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9fc:	e9 3f fb ff ff       	jmp    540 <binary_sem_up>
 a01:	eb 0d                	jmp    a10 <sem_down>
 a03:	90                   	nop
 a04:	90                   	nop
 a05:	90                   	nop
 a06:	90                   	nop
 a07:	90                   	nop
 a08:	90                   	nop
 a09:	90                   	nop
 a0a:	90                   	nop
 a0b:	90                   	nop
 a0c:	90                   	nop
 a0d:	90                   	nop
 a0e:	90                   	nop
 a0f:	90                   	nop

00000a10 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	53                   	push   %ebx
 a14:	83 ec 14             	sub    $0x14,%esp
 a17:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 a1a:	8b 43 04             	mov    0x4(%ebx),%eax
 a1d:	89 04 24             	mov    %eax,(%esp)
 a20:	e8 13 fb ff ff       	call   538 <binary_sem_down>
	binary_sem_down(sem->S1);
 a25:	8b 03                	mov    (%ebx),%eax
 a27:	89 04 24             	mov    %eax,(%esp)
 a2a:	e8 09 fb ff ff       	call   538 <binary_sem_down>
	sem->value--;
 a2f:	8b 43 08             	mov    0x8(%ebx),%eax
 a32:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 a35:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 a37:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 a3a:	74 0b                	je     a47 <sem_down+0x37>
		binary_sem_up(sem->S2);
 a3c:	8b 43 04             	mov    0x4(%ebx),%eax
 a3f:	89 04 24             	mov    %eax,(%esp)
 a42:	e8 f9 fa ff ff       	call   540 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 a47:	8b 03                	mov    (%ebx),%eax
 a49:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a4c:	83 c4 14             	add    $0x14,%esp
 a4f:	5b                   	pop    %ebx
 a50:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a51:	e9 ea fa ff ff       	jmp    540 <binary_sem_up>
 a56:	8d 76 00             	lea    0x0(%esi),%esi
 a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a60 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	83 ec 18             	sub    $0x18,%esp
 a66:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 a69:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a6c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 a6f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 a72:	8b 03                	mov    (%ebx),%eax
 a74:	89 04 24             	mov    %eax,(%esp)
 a77:	e8 bc fa ff ff       	call   538 <binary_sem_down>
	sem->value+= num;
 a7c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 a7f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 a82:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 a85:	74 19                	je     aa0 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a87:	8b 03                	mov    (%ebx),%eax
}
 a89:	8b 75 fc             	mov    -0x4(%ebp),%esi
 a8c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a8f:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a92:	89 ec                	mov    %ebp,%esp
 a94:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a95:	e9 a6 fa ff ff       	jmp    540 <binary_sem_up>
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 aa0:	8b 43 04             	mov    0x4(%ebx),%eax
 aa3:	89 04 24             	mov    %eax,(%esp)
 aa6:	e8 95 fa ff ff       	call   540 <binary_sem_up>
 aab:	eb da                	jmp    a87 <sem_ups+0x27>
 aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	53                   	push   %ebx
 ab4:	83 ec 14             	sub    $0x14,%esp
 ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 aba:	8b 03                	mov    (%ebx),%eax
 abc:	89 04 24             	mov    %eax,(%esp)
 abf:	e8 74 fa ff ff       	call   538 <binary_sem_down>
	sem->value++;
 ac4:	8b 43 08             	mov    0x8(%ebx),%eax
 ac7:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 aca:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 acd:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 ad0:	74 16                	je     ae8 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 ad2:	8b 03                	mov    (%ebx),%eax
 ad4:	89 45 08             	mov    %eax,0x8(%ebp)
}
 ad7:	83 c4 14             	add    $0x14,%esp
 ada:	5b                   	pop    %ebx
 adb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 adc:	e9 5f fa ff ff       	jmp    540 <binary_sem_up>
 ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 ae8:	8b 43 04             	mov    0x4(%ebx),%eax
 aeb:	89 04 24             	mov    %eax,(%esp)
 aee:	e8 4d fa ff ff       	call   540 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 af3:	8b 03                	mov    (%ebx),%eax
 af5:	89 45 08             	mov    %eax,0x8(%ebp)
}
 af8:	83 c4 14             	add    $0x14,%esp
 afb:	5b                   	pop    %ebx
 afc:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 afd:	e9 3e fa ff ff       	jmp    540 <binary_sem_up>
 b02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 b16:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 b1d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 b20:	89 75 f8             	mov    %esi,-0x8(%ebp)
 b23:	89 7d fc             	mov    %edi,-0x4(%ebp)
 b26:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 b29:	e8 72 fd ff ff       	call   8a0 <malloc>
	ret->value = initial_semaphore_value;
 b2e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 b31:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 b33:	e8 f8 f9 ff ff       	call   530 <binary_sem_create>
 b38:	89 03                	mov    %eax,(%ebx)
 b3a:	89 c6                	mov    %eax,%esi
 b3c:	e8 ef f9 ff ff       	call   530 <binary_sem_create>
 b41:	01 c6                	add    %eax,%esi
 b43:	89 43 04             	mov    %eax,0x4(%ebx)
 b46:	78 20                	js     b68 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 b48:	85 ff                	test   %edi,%edi
 b4a:	75 08                	jne    b54 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 b4c:	89 04 24             	mov    %eax,(%esp)
 b4f:	e8 e4 f9 ff ff       	call   538 <binary_sem_down>
	}
	return ret;
}
 b54:	89 d8                	mov    %ebx,%eax
 b56:	8b 75 f8             	mov    -0x8(%ebp),%esi
 b59:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 b5c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 b5f:	89 ec                	mov    %ebp,%esp
 b61:	5d                   	pop    %ebp
 b62:	c3                   	ret    
 b63:	90                   	nop
 b64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 b68:	c7 44 24 04 6c 0e 00 	movl   $0xe6c,0x4(%esp)
 b6f:	00 
 b70:	31 db                	xor    %ebx,%ebx
 b72:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b79:	e8 82 fa ff ff       	call   600 <printf>
		return 0;
 b7e:	eb d4                	jmp    b54 <semaphore_create+0x44>

00000b80 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 b86:	8b 45 08             	mov    0x8(%ebp),%eax
 b89:	8b 00                	mov    (%eax),%eax
 b8b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b8e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 b8f:	e9 ac f9 ff ff       	jmp    540 <binary_sem_up>
 b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ba0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	56                   	push   %esi
 ba4:	53                   	push   %ebx
 ba5:	83 ec 10             	sub    $0x10,%esp
 ba8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 bab:	8b 43 08             	mov    0x8(%ebx),%eax
 bae:	89 04 24             	mov    %eax,(%esp)
 bb1:	e8 5a fe ff ff       	call   a10 <sem_down>
	binary_sem_down(bb->mutex);
 bb6:	8b 03                	mov    (%ebx),%eax
 bb8:	89 04 24             	mov    %eax,(%esp)
 bbb:	e8 78 f9 ff ff       	call   538 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 bc0:	8b 43 14             	mov    0x14(%ebx),%eax
 bc3:	c1 e0 02             	shl    $0x2,%eax
 bc6:	03 43 0c             	add    0xc(%ebx),%eax
 bc9:	8b 30                	mov    (%eax),%esi
 bcb:	85 f6                	test   %esi,%esi
 bcd:	74 42                	je     c11 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 bcf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 bd5:	8b 53 18             	mov    0x18(%ebx),%edx
 bd8:	8b 43 14             	mov    0x14(%ebx),%eax
 bdb:	83 ea 01             	sub    $0x1,%edx
 bde:	39 d0                	cmp    %edx,%eax
 be0:	74 26                	je     c08 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 be2:	83 c0 01             	add    $0x1,%eax
 be5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 be8:	8b 03                	mov    (%ebx),%eax
 bea:	89 04 24             	mov    %eax,(%esp)
 bed:	e8 4e f9 ff ff       	call   540 <binary_sem_up>
	sem_up(bb->empty);
 bf2:	8b 43 04             	mov    0x4(%ebx),%eax
 bf5:	89 04 24             	mov    %eax,(%esp)
 bf8:	e8 b3 fe ff ff       	call   ab0 <sem_up>
	return element;
}
 bfd:	83 c4 10             	add    $0x10,%esp
 c00:	89 f0                	mov    %esi,%eax
 c02:	5b                   	pop    %ebx
 c03:	5e                   	pop    %esi
 c04:	5d                   	pop    %ebp
 c05:	c3                   	ret    
 c06:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 c08:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 c0f:	eb d7                	jmp    be8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 c11:	c7 44 24 04 94 0e 00 	movl   $0xe94,0x4(%esp)
 c18:	00 
 c19:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c20:	e8 db f9 ff ff       	call   600 <printf>
 c25:	eb c1                	jmp    be8 <semaphore_pop+0x48>
 c27:	89 f6                	mov    %esi,%esi
 c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c30 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
 c33:	56                   	push   %esi
 c34:	53                   	push   %ebx
 c35:	83 ec 10             	sub    $0x10,%esp
 c38:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c3b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 c3e:	8b 43 04             	mov    0x4(%ebx),%eax
 c41:	89 04 24             	mov    %eax,(%esp)
 c44:	e8 c7 fd ff ff       	call   a10 <sem_down>
	binary_sem_down(bb->mutex);
 c49:	8b 03                	mov    (%ebx),%eax
 c4b:	89 04 24             	mov    %eax,(%esp)
 c4e:	e8 e5 f8 ff ff       	call   538 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 c53:	8b 43 10             	mov    0x10(%ebx),%eax
 c56:	c1 e0 02             	shl    $0x2,%eax
 c59:	03 43 0c             	add    0xc(%ebx),%eax
 c5c:	8b 10                	mov    (%eax),%edx
 c5e:	85 d2                	test   %edx,%edx
 c60:	74 26                	je     c88 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c62:	c7 44 24 04 d8 0e 00 	movl   $0xed8,0x4(%esp)
 c69:	00 
 c6a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c71:	e8 8a f9 ff ff       	call   600 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 c76:	8b 43 08             	mov    0x8(%ebx),%eax
 c79:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c7c:	83 c4 10             	add    $0x10,%esp
 c7f:	5b                   	pop    %ebx
 c80:	5e                   	pop    %esi
 c81:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 c82:	e9 29 fe ff ff       	jmp    ab0 <sem_up>
 c87:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 c88:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 c8a:	8b 53 18             	mov    0x18(%ebx),%edx
 c8d:	8b 43 10             	mov    0x10(%ebx),%eax
 c90:	83 ea 01             	sub    $0x1,%edx
 c93:	39 d0                	cmp    %edx,%eax
 c95:	74 09                	je     ca0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c97:	83 c0 01             	add    $0x1,%eax
 c9a:	89 43 10             	mov    %eax,0x10(%ebx)
 c9d:	eb d7                	jmp    c76 <semaphore_put_atomic+0x46>
 c9f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 ca0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 ca7:	eb cd                	jmp    c76 <semaphore_put_atomic+0x46>
 ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	56                   	push   %esi
 cb4:	53                   	push   %ebx
 cb5:	83 ec 10             	sub    $0x10,%esp
 cb8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 cbb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 cbe:	8b 43 04             	mov    0x4(%ebx),%eax
 cc1:	89 04 24             	mov    %eax,(%esp)
 cc4:	e8 47 fd ff ff       	call   a10 <sem_down>
	binary_sem_down(bb->mutex);
 cc9:	8b 03                	mov    (%ebx),%eax
 ccb:	89 04 24             	mov    %eax,(%esp)
 cce:	e8 65 f8 ff ff       	call   538 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 cd3:	8b 43 10             	mov    0x10(%ebx),%eax
 cd6:	c1 e0 02             	shl    $0x2,%eax
 cd9:	03 43 0c             	add    0xc(%ebx),%eax
 cdc:	8b 08                	mov    (%eax),%ecx
 cde:	85 c9                	test   %ecx,%ecx
 ce0:	74 36                	je     d18 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 ce2:	c7 44 24 04 d8 0e 00 	movl   $0xed8,0x4(%esp)
 ce9:	00 
 cea:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 cf1:	e8 0a f9 ff ff       	call   600 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 cf6:	8b 03                	mov    (%ebx),%eax
 cf8:	89 04 24             	mov    %eax,(%esp)
 cfb:	e8 40 f8 ff ff       	call   540 <binary_sem_up>
	sem_up(bb->full);
 d00:	8b 43 08             	mov    0x8(%ebx),%eax
 d03:	89 45 08             	mov    %eax,0x8(%ebp)
}
 d06:	83 c4 10             	add    $0x10,%esp
 d09:	5b                   	pop    %ebx
 d0a:	5e                   	pop    %esi
 d0b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 d0c:	e9 9f fd ff ff       	jmp    ab0 <sem_up>
 d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 d18:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 d1a:	8b 53 18             	mov    0x18(%ebx),%edx
 d1d:	8b 43 10             	mov    0x10(%ebx),%eax
 d20:	83 ea 01             	sub    $0x1,%edx
 d23:	39 d0                	cmp    %edx,%eax
 d25:	74 09                	je     d30 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 d27:	83 c0 01             	add    $0x1,%eax
 d2a:	89 43 10             	mov    %eax,0x10(%ebx)
 d2d:	eb c7                	jmp    cf6 <semaphore_put+0x46>
 d2f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 d30:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 d37:	eb bd                	jmp    cf6 <semaphore_put+0x46>
 d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d40 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 d40:	55                   	push   %ebp
 d41:	89 e5                	mov    %esp,%ebp
 d43:	83 ec 18             	sub    $0x18,%esp
 d46:	89 75 fc             	mov    %esi,-0x4(%ebp)
 d49:	8b 75 08             	mov    0x8(%ebp),%esi
 d4c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 d4f:	85 f6                	test   %esi,%esi
 d51:	79 15                	jns    d68 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 d53:	31 db                	xor    %ebx,%ebx
}
 d55:	89 d8                	mov    %ebx,%eax
 d57:	8b 75 fc             	mov    -0x4(%ebp),%esi
 d5a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 d5d:	89 ec                	mov    %ebp,%esp
 d5f:	5d                   	pop    %ebp
 d60:	c3                   	ret    
 d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 d68:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 d6f:	e8 2c fb ff ff       	call   8a0 <malloc>
 d74:	85 c0                	test   %eax,%eax
 d76:	89 c3                	mov    %eax,%ebx
 d78:	74 db                	je     d55 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 d7a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 d81:	89 04 24             	mov    %eax,(%esp)
 d84:	e8 17 fb ff ff       	call   8a0 <malloc>
 d89:	85 c0                	test   %eax,%eax
 d8b:	89 43 0c             	mov    %eax,0xc(%ebx)
 d8e:	74 c3                	je     d53 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 d90:	89 34 24             	mov    %esi,(%esp)
 d93:	e8 78 fd ff ff       	call   b10 <semaphore_create>
 d98:	85 c0                	test   %eax,%eax
 d9a:	89 43 04             	mov    %eax,0x4(%ebx)
 d9d:	74 b4                	je     d53 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 d9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 da6:	e8 65 fd ff ff       	call   b10 <semaphore_create>
 dab:	85 c0                	test   %eax,%eax
 dad:	89 43 08             	mov    %eax,0x8(%ebx)
 db0:	74 a1                	je     d53 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 db2:	e8 79 f7 ff ff       	call   530 <binary_sem_create>
	ret->produce = 0;
 db7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 dbe:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 dc5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 dc8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 dca:	eb 89                	jmp    d55 <BB_create+0x15>
