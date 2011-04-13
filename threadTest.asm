
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
  28:	c7 44 24 04 ac 0d 00 	movl   $0xdac,0x4(%esp)
  2f:	00 
  30:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  37:	e8 a4 05 00 00       	call   5e0 <printf>
  exit();
  3c:	e8 07 04 00 00       	call   448 <exit>
  41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
else {
int n = atoi(argv[1]);
  48:	8b 40 04             	mov    0x4(%eax),%eax
  4b:	89 04 24             	mov    %eax,(%esp)
  4e:	e8 cd 02 00 00       	call   320 <atoi>
  53:	89 c6                	mov    %eax,%esi
int i;
void* ustack;
binsem = binary_sem_create();
  55:	e8 b6 04 00 00       	call   510 <binary_sem_create>

if (binsem < 0) {
  5a:	85 c0                	test   %eax,%eax
}
else {
int n = atoi(argv[1]);
int i;
void* ustack;
binsem = binary_sem_create();
  5c:	a3 04 0f 00 00       	mov    %eax,0xf04

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
  a3:	e8 40 04 00 00       	call   4e8 <thread_create>
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
  b9:	e8 c2 07 00 00       	call   880 <malloc>
  be:	85 c0                	test   %eax,%eax
  c0:	75 ce                	jne    90 <main+0x90>
printf(2,"cant malloc the stack for the thread\n");
  c2:	c7 44 24 04 e4 0d 00 	movl   $0xde4,0x4(%esp)
  c9:	00 
  ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  d1:	e8 0a 05 00 00       	call   5e0 <printf>
exit();
  d6:	e8 6d 03 00 00       	call   448 <exit>
  db:	90                   	nop
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
printf(2, "no semaphore available\n");
exit();
}

if(n < 0) {
printf(2,"invalid input\n");
  e0:	c7 44 24 04 d5 0d 00 	movl   $0xdd5,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ef:	e8 ec 04 00 00       	call   5e0 <printf>
exit();
  f4:	e8 4f 03 00 00       	call   448 <exit>
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
 119:	e8 ea 03 00 00       	call   508 <thread_join>
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
 125:	e8 1e 03 00 00       	call   448 <exit>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int i;
void* ustack;
binsem = binary_sem_create();

if (binsem < 0) {
printf(2, "no semaphore available\n");
 130:	c7 44 24 04 bd 0d 00 	movl   $0xdbd,0x4(%esp)
 137:	00 
 138:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 13f:	e8 9c 04 00 00       	call   5e0 <printf>
exit();
 144:	e8 ff 02 00 00       	call   448 <exit>
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
 15d:	e8 9e 03 00 00       	call   500 <thread_exit>
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
pid = thread_getProcid();
 178:	e8 7b 03 00 00       	call   4f8 <thread_getProcid>
 17d:	89 c3                	mov    %eax,%ebx
tid = thread_getid();
 17f:	e8 6c 03 00 00       	call   4f0 <thread_getid>
 184:	89 c6                	mov    %eax,%esi
//while(1) {
binary_sem_down(binsem);
 186:	a1 04 0f 00 00       	mov    0xf04,%eax
 18b:	89 04 24             	mov    %eax,(%esp)
 18e:	e8 85 03 00 00       	call   518 <binary_sem_down>
for(i=0;i<3;i++)
{
printf(1, "Process %d Thread %d is running.\n", pid, tid);
 193:	89 74 24 0c          	mov    %esi,0xc(%esp)
 197:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 19b:	c7 44 24 04 0c 0e 00 	movl   $0xe0c,0x4(%esp)
 1a2:	00 
 1a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1aa:	e8 31 04 00 00       	call   5e0 <printf>
 1af:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1b3:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1b7:	c7 44 24 04 0c 0e 00 	movl   $0xe0c,0x4(%esp)
 1be:	00 
 1bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c6:	e8 15 04 00 00       	call   5e0 <printf>
 1cb:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1cf:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1d3:	c7 44 24 04 0c 0e 00 	movl   $0xe0c,0x4(%esp)
 1da:	00 
 1db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e2:	e8 f9 03 00 00       	call   5e0 <printf>
}
binary_sem_up(binsem);
 1e7:	a1 04 0f 00 00       	mov    0xf04,%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 2c 03 00 00       	call   520 <binary_sem_up>
sleep(1);
 1f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fb:	e8 d8 02 00 00       	call   4d8 <sleep>
//}
thread_exit(0);
 200:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 207:	e8 f4 02 00 00       	call   500 <thread_exit>
return 0;
}
 20c:	83 c4 10             	add    $0x10,%esp
 20f:	31 c0                	xor    %eax,%eax
 211:	5b                   	pop    %ebx
 212:	5e                   	pop    %esi
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 220:	55                   	push   %ebp
 221:	31 d2                	xor    %edx,%edx
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	53                   	push   %ebx
 229:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 230:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 234:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 237:	83 c2 01             	add    $0x1,%edx
 23a:	84 c9                	test   %cl,%cl
 23c:	75 f2                	jne    230 <strcpy+0x10>
    ;
  return os;
}
 23e:	5b                   	pop    %ebx
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	eb 0d                	jmp    250 <strcmp>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 4d 08             	mov    0x8(%ebp),%ecx
 257:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 25a:	0f b6 01             	movzbl (%ecx),%eax
 25d:	84 c0                	test   %al,%al
 25f:	75 14                	jne    275 <strcmp+0x25>
 261:	eb 25                	jmp    288 <strcmp+0x38>
 263:	90                   	nop
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 268:	83 c1 01             	add    $0x1,%ecx
 26b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 26e:	0f b6 01             	movzbl (%ecx),%eax
 271:	84 c0                	test   %al,%al
 273:	74 13                	je     288 <strcmp+0x38>
 275:	0f b6 1a             	movzbl (%edx),%ebx
 278:	38 d8                	cmp    %bl,%al
 27a:	74 ec                	je     268 <strcmp+0x18>
 27c:	0f b6 db             	movzbl %bl,%ebx
 27f:	0f b6 c0             	movzbl %al,%eax
 282:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 284:	5b                   	pop    %ebx
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 288:	0f b6 1a             	movzbl (%edx),%ebx
 28b:	31 c0                	xor    %eax,%eax
 28d:	0f b6 db             	movzbl %bl,%ebx
 290:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 292:	5b                   	pop    %ebx
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    
 295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strlen>:

uint
strlen(char *s)
{
 2a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 2a1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 2a3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 2a5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 2a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2aa:	80 39 00             	cmpb   $0x0,(%ecx)
 2ad:	74 0c                	je     2bb <strlen+0x1b>
 2af:	90                   	nop
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi

000002c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 55 08             	mov    0x8(%ebp),%edx
 2c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <strchr>:

char*
strchr(const char *s, char c)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ea:	0f b6 10             	movzbl (%eax),%edx
 2ed:	84 d2                	test   %dl,%dl
 2ef:	75 11                	jne    302 <strchr+0x22>
 2f1:	eb 15                	jmp    308 <strchr+0x28>
 2f3:	90                   	nop
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f8:	83 c0 01             	add    $0x1,%eax
 2fb:	0f b6 10             	movzbl (%eax),%edx
 2fe:	84 d2                	test   %dl,%dl
 300:	74 06                	je     308 <strchr+0x28>
    if(*s == c)
 302:	38 ca                	cmp    %cl,%dl
 304:	75 f2                	jne    2f8 <strchr+0x18>
      return (char*) s;
  return 0;
}
 306:	5d                   	pop    %ebp
 307:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 308:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 30a:	5d                   	pop    %ebp
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 310:	c3                   	ret    
 311:	eb 0d                	jmp    320 <atoi>
 313:	90                   	nop
 314:	90                   	nop
 315:	90                   	nop
 316:	90                   	nop
 317:	90                   	nop
 318:	90                   	nop
 319:	90                   	nop
 31a:	90                   	nop
 31b:	90                   	nop
 31c:	90                   	nop
 31d:	90                   	nop
 31e:	90                   	nop
 31f:	90                   	nop

00000320 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 321:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 323:	89 e5                	mov    %esp,%ebp
 325:	8b 4d 08             	mov    0x8(%ebp),%ecx
 328:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 329:	0f b6 11             	movzbl (%ecx),%edx
 32c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 32f:	80 fb 09             	cmp    $0x9,%bl
 332:	77 1c                	ja     350 <atoi+0x30>
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 338:	0f be d2             	movsbl %dl,%edx
 33b:	83 c1 01             	add    $0x1,%ecx
 33e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 341:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 345:	0f b6 11             	movzbl (%ecx),%edx
 348:	8d 5a d0             	lea    -0x30(%edx),%ebx
 34b:	80 fb 09             	cmp    $0x9,%bl
 34e:	76 e8                	jbe    338 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 350:	5b                   	pop    %ebx
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    
 353:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	53                   	push   %ebx
 368:	8b 5d 10             	mov    0x10(%ebp),%ebx
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 db                	test   %ebx,%ebx
 370:	7e 14                	jle    386 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 372:	31 d2                	xor    %edx,%edx
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 37c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 37f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	39 da                	cmp    %ebx,%edx
 384:	75 f2                	jne    378 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 396:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 399:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 39c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 39f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3ab:	00 
 3ac:	89 04 24             	mov    %eax,(%esp)
 3af:	e8 d4 00 00 00       	call   488 <open>
  if(fd < 0)
 3b4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 3b8:	78 19                	js     3d3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 3ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bd:	89 1c 24             	mov    %ebx,(%esp)
 3c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c4:	e8 d7 00 00 00       	call   4a0 <fstat>
  close(fd);
 3c9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 3cc:	89 c6                	mov    %eax,%esi
  close(fd);
 3ce:	e8 9d 00 00 00       	call   470 <close>
  return r;
}
 3d3:	89 f0                	mov    %esi,%eax
 3d5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 3d8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 3db:	89 ec                	mov    %ebp,%esp
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    
 3df:	90                   	nop

000003e0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	31 f6                	xor    %esi,%esi
 3e7:	53                   	push   %ebx
 3e8:	83 ec 2c             	sub    $0x2c,%esp
 3eb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ee:	eb 06                	jmp    3f6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3f0:	3c 0a                	cmp    $0xa,%al
 3f2:	74 39                	je     42d <gets+0x4d>
 3f4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f6:	8d 5e 01             	lea    0x1(%esi),%ebx
 3f9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3fc:	7d 31                	jge    42f <gets+0x4f>
    cc = read(0, &c, 1);
 3fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 401:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 408:	00 
 409:	89 44 24 04          	mov    %eax,0x4(%esp)
 40d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 414:	e8 47 00 00 00       	call   460 <read>
    if(cc < 1)
 419:	85 c0                	test   %eax,%eax
 41b:	7e 12                	jle    42f <gets+0x4f>
      break;
    buf[i++] = c;
 41d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 421:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 425:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 429:	3c 0d                	cmp    $0xd,%al
 42b:	75 c3                	jne    3f0 <gets+0x10>
 42d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 42f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 433:	89 f8                	mov    %edi,%eax
 435:	83 c4 2c             	add    $0x2c,%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5f                   	pop    %edi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	90                   	nop
 43e:	90                   	nop
 43f:	90                   	nop

00000440 <fork>:
 440:	b8 01 00 00 00       	mov    $0x1,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <exit>:
 448:	b8 02 00 00 00       	mov    $0x2,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <wait>:
 450:	b8 03 00 00 00       	mov    $0x3,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <pipe>:
 458:	b8 04 00 00 00       	mov    $0x4,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <read>:
 460:	b8 06 00 00 00       	mov    $0x6,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <write>:
 468:	b8 05 00 00 00       	mov    $0x5,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <close>:
 470:	b8 07 00 00 00       	mov    $0x7,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <kill>:
 478:	b8 08 00 00 00       	mov    $0x8,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <exec>:
 480:	b8 09 00 00 00       	mov    $0x9,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <open>:
 488:	b8 0a 00 00 00       	mov    $0xa,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <mknod>:
 490:	b8 0b 00 00 00       	mov    $0xb,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <unlink>:
 498:	b8 0c 00 00 00       	mov    $0xc,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <fstat>:
 4a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <link>:
 4a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <mkdir>:
 4b0:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <chdir>:
 4b8:	b8 10 00 00 00       	mov    $0x10,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <dup>:
 4c0:	b8 11 00 00 00       	mov    $0x11,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <getpid>:
 4c8:	b8 12 00 00 00       	mov    $0x12,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <sbrk>:
 4d0:	b8 13 00 00 00       	mov    $0x13,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <sleep>:
 4d8:	b8 14 00 00 00       	mov    $0x14,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <uptime>:
 4e0:	b8 15 00 00 00       	mov    $0x15,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <thread_create>:
 4e8:	b8 16 00 00 00       	mov    $0x16,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <thread_getid>:
 4f0:	b8 17 00 00 00       	mov    $0x17,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <thread_getProcid>:
 4f8:	b8 18 00 00 00       	mov    $0x18,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <thread_exit>:
 500:	b8 1a 00 00 00       	mov    $0x1a,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <thread_join>:
 508:	b8 19 00 00 00       	mov    $0x19,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <binary_sem_create>:
 510:	b8 1b 00 00 00       	mov    $0x1b,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <binary_sem_down>:
 518:	b8 1c 00 00 00       	mov    $0x1c,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <binary_sem_up>:
 520:	b8 1d 00 00 00       	mov    $0x1d,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <binary_sem_clear>:
 528:	b8 1e 00 00 00       	mov    $0x1e,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exit_all_threads>:
 530:	b8 1f 00 00 00       	mov    $0x1f,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    
 538:	90                   	nop
 539:	90                   	nop
 53a:	90                   	nop
 53b:	90                   	nop
 53c:	90                   	nop
 53d:	90                   	nop
 53e:	90                   	nop
 53f:	90                   	nop

00000540 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	89 cf                	mov    %ecx,%edi
 546:	56                   	push   %esi
 547:	89 c6                	mov    %eax,%esi
 549:	53                   	push   %ebx
 54a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 54d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 550:	85 c9                	test   %ecx,%ecx
 552:	74 04                	je     558 <printint+0x18>
 554:	85 d2                	test   %edx,%edx
 556:	78 70                	js     5c8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 558:	89 d0                	mov    %edx,%eax
 55a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 561:	31 c9                	xor    %ecx,%ecx
 563:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 566:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 568:	31 d2                	xor    %edx,%edx
 56a:	f7 f7                	div    %edi
 56c:	0f b6 92 35 0e 00 00 	movzbl 0xe35(%edx),%edx
 573:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 576:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 579:	85 c0                	test   %eax,%eax
 57b:	75 eb                	jne    568 <printint+0x28>
	if(neg)
 57d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 580:	85 c0                	test   %eax,%eax
 582:	74 08                	je     58c <printint+0x4c>
		buf[i++] = '-';
 584:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 589:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 58c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 58f:	01 fb                	add    %edi,%ebx
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	0f b6 03             	movzbl (%ebx),%eax
 59b:	83 ef 01             	sub    $0x1,%edi
 59e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a8:	00 
 5a9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 5ac:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5af:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	e8 ad fe ff ff       	call   468 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 5bb:	83 ff ff             	cmp    $0xffffffff,%edi
 5be:	75 d8                	jne    598 <printint+0x58>
		putc(fd, buf[i]);
}
 5c0:	83 c4 4c             	add    $0x4c,%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 5c8:	89 d0                	mov    %edx,%eax
 5ca:	f7 d8                	neg    %eax
 5cc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5d3:	eb 8c                	jmp    561 <printint+0x21>
 5d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ec:	0f b6 10             	movzbl (%eax),%edx
 5ef:	84 d2                	test   %dl,%dl
 5f1:	0f 84 c9 00 00 00    	je     6c0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 5f7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5fa:	31 ff                	xor    %edi,%edi
 5fc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 5ff:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 601:	8d 75 e7             	lea    -0x19(%ebp),%esi
 604:	eb 1e                	jmp    624 <printf+0x44>
 606:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 608:	83 fa 25             	cmp    $0x25,%edx
 60b:	0f 85 b7 00 00 00    	jne    6c8 <printf+0xe8>
 611:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 615:	83 c3 01             	add    $0x1,%ebx
 618:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 61c:	84 d2                	test   %dl,%dl
 61e:	0f 84 9c 00 00 00    	je     6c0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 624:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 626:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 629:	74 dd                	je     608 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 62b:	83 ff 25             	cmp    $0x25,%edi
 62e:	75 e5                	jne    615 <printf+0x35>
			if(c == 'd'){
 630:	83 fa 64             	cmp    $0x64,%edx
 633:	0f 84 57 01 00 00    	je     790 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 639:	83 fa 70             	cmp    $0x70,%edx
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 640:	0f 84 aa 00 00 00    	je     6f0 <printf+0x110>
 646:	83 fa 78             	cmp    $0x78,%edx
 649:	0f 84 a1 00 00 00    	je     6f0 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 64f:	83 fa 73             	cmp    $0x73,%edx
 652:	0f 84 c0 00 00 00    	je     718 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 658:	83 fa 63             	cmp    $0x63,%edx
 65b:	90                   	nop
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 660:	0f 84 52 01 00 00    	je     7b8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 666:	83 fa 25             	cmp    $0x25,%edx
 669:	0f 84 f9 00 00 00    	je     768 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 66f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 672:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 675:	31 ff                	xor    %edi,%edi
 677:	89 55 cc             	mov    %edx,-0x34(%ebp)
 67a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 67e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 685:	00 
 686:	89 0c 24             	mov    %ecx,(%esp)
 689:	89 74 24 04          	mov    %esi,0x4(%esp)
 68d:	e8 d6 fd ff ff       	call   468 <write>
 692:	8b 55 cc             	mov    -0x34(%ebp),%edx
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69f:	00 
 6a0:	89 74 24 04          	mov    %esi,0x4(%esp)
 6a4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6a7:	89 04 24             	mov    %eax,(%esp)
 6aa:	e8 b9 fd ff ff       	call   468 <write>
 6af:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 6b2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 6b6:	84 d2                	test   %dl,%dl
 6b8:	0f 85 66 ff ff ff    	jne    624 <printf+0x44>
 6be:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 6c0:	83 c4 3c             	add    $0x3c,%esp
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 6cb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6d5:	00 
 6d6:	89 74 24 04          	mov    %esi,0x4(%esp)
 6da:	89 04 24             	mov    %eax,(%esp)
 6dd:	e8 86 fd ff ff       	call   468 <write>
 6e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e5:	e9 2b ff ff ff       	jmp    615 <printf+0x35>
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 6f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6f3:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 6f8:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 6fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 701:	8b 10                	mov    (%eax),%edx
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	e8 35 fe ff ff       	call   540 <printint>
 70b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 70e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 712:	e9 fe fe ff ff       	jmp    615 <printf+0x35>
 717:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 718:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 71b:	8b 3a                	mov    (%edx),%edi
				ap++;
 71d:	83 c2 04             	add    $0x4,%edx
 720:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 723:	85 ff                	test   %edi,%edi
 725:	0f 84 ba 00 00 00    	je     7e5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 72b:	0f b6 17             	movzbl (%edi),%edx
 72e:	84 d2                	test   %dl,%dl
 730:	74 2d                	je     75f <printf+0x17f>
 732:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 735:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 738:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 73b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 73e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 745:	00 
 746:	89 74 24 04          	mov    %esi,0x4(%esp)
 74a:	89 1c 24             	mov    %ebx,(%esp)
 74d:	e8 16 fd ff ff       	call   468 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 752:	0f b6 17             	movzbl (%edi),%edx
 755:	84 d2                	test   %dl,%dl
 757:	75 df                	jne    738 <printf+0x158>
 759:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 75c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 75f:	31 ff                	xor    %edi,%edi
 761:	e9 af fe ff ff       	jmp    615 <printf+0x35>
 766:	66 90                	xchg   %ax,%ax
 768:	8b 55 08             	mov    0x8(%ebp),%edx
 76b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 76d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 771:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 778:	00 
 779:	89 74 24 04          	mov    %esi,0x4(%esp)
 77d:	89 14 24             	mov    %edx,(%esp)
 780:	e8 e3 fc ff ff       	call   468 <write>
 785:	8b 45 0c             	mov    0xc(%ebp),%eax
 788:	e9 88 fe ff ff       	jmp    615 <printf+0x35>
 78d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 790:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 798:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 79b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	e8 94 fd ff ff       	call   540 <printint>
 7ac:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 7af:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7b3:	e9 5d fe ff ff       	jmp    615 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7b8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 7bb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7bd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7bf:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7c6:	00 
 7c7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 7cb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	89 04 24             	mov    %eax,(%esp)
 7d4:	e8 8f fc ff ff       	call   468 <write>
 7d9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 7dc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7e0:	e9 30 fe ff ff       	jmp    615 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 7e5:	bf 2e 0e 00 00       	mov    $0xe2e,%edi
 7ea:	e9 3c ff ff ff       	jmp    72b <printf+0x14b>
 7ef:	90                   	nop

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	a1 00 0f 00 00       	mov    0xf00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 7fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	39 c8                	cmp    %ecx,%eax
 803:	73 1d                	jae    822 <free+0x32>
 805:	8d 76 00             	lea    0x0(%esi),%esi
 808:	8b 10                	mov    (%eax),%edx
 80a:	39 d1                	cmp    %edx,%ecx
 80c:	72 1a                	jb     828 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80e:	39 d0                	cmp    %edx,%eax
 810:	72 08                	jb     81a <free+0x2a>
 812:	39 c8                	cmp    %ecx,%eax
 814:	72 12                	jb     828 <free+0x38>
 816:	39 d1                	cmp    %edx,%ecx
 818:	72 0e                	jb     828 <free+0x38>
 81a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81c:	39 c8                	cmp    %ecx,%eax
 81e:	66 90                	xchg   %ax,%ax
 820:	72 e6                	jb     808 <free+0x18>
 822:	8b 10                	mov    (%eax),%edx
 824:	eb e8                	jmp    80e <free+0x1e>
 826:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 828:	8b 71 04             	mov    0x4(%ecx),%esi
 82b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 82e:	39 d7                	cmp    %edx,%edi
 830:	74 19                	je     84b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 832:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 835:	8b 50 04             	mov    0x4(%eax),%edx
 838:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 83b:	39 ce                	cmp    %ecx,%esi
 83d:	74 23                	je     862 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 83f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 841:	a3 00 0f 00 00       	mov    %eax,0xf00
}
 846:	5b                   	pop    %ebx
 847:	5e                   	pop    %esi
 848:	5f                   	pop    %edi
 849:	5d                   	pop    %ebp
 84a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 84b:	03 72 04             	add    0x4(%edx),%esi
 84e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 851:	8b 10                	mov    (%eax),%edx
 853:	8b 12                	mov    (%edx),%edx
 855:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 858:	8b 50 04             	mov    0x4(%eax),%edx
 85b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85e:	39 ce                	cmp    %ecx,%esi
 860:	75 dd                	jne    83f <free+0x4f>
    p->s.size += bp->s.size;
 862:	03 51 04             	add    0x4(%ecx),%edx
 865:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 868:	8b 53 f8             	mov    -0x8(%ebx),%edx
 86b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 86d:	a3 00 0f 00 00       	mov    %eax,0xf00
}
 872:	5b                   	pop    %ebx
 873:	5e                   	pop    %esi
 874:	5f                   	pop    %edi
 875:	5d                   	pop    %ebp
 876:	c3                   	ret    
 877:	89 f6                	mov    %esi,%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 88c:	8b 0d 00 0f 00 00    	mov    0xf00,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	83 c3 07             	add    $0x7,%ebx
 895:	c1 eb 03             	shr    $0x3,%ebx
 898:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 89b:	85 c9                	test   %ecx,%ecx
 89d:	0f 84 93 00 00 00    	je     936 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8a5:	8b 50 04             	mov    0x4(%eax),%edx
 8a8:	39 d3                	cmp    %edx,%ebx
 8aa:	76 1f                	jbe    8cb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 8ac:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 8b3:	90                   	nop
 8b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 8b8:	3b 05 00 0f 00 00    	cmp    0xf00,%eax
 8be:	74 30                	je     8f0 <malloc+0x70>
 8c0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 8c4:	8b 50 04             	mov    0x4(%eax),%edx
 8c7:	39 d3                	cmp    %edx,%ebx
 8c9:	77 ed                	ja     8b8 <malloc+0x38>
      if(p->s.size == nunits)
 8cb:	39 d3                	cmp    %edx,%ebx
 8cd:	74 61                	je     930 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8cf:	29 da                	sub    %ebx,%edx
 8d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8da:	89 0d 00 0f 00 00    	mov    %ecx,0xf00
      return (void*) (p + 1);
 8e0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8e3:	83 c4 1c             	add    $0x1c,%esp
 8e6:	5b                   	pop    %ebx
 8e7:	5e                   	pop    %esi
 8e8:	5f                   	pop    %edi
 8e9:	5d                   	pop    %ebp
 8ea:	c3                   	ret    
 8eb:	90                   	nop
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 8f0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 8f6:	b8 00 80 00 00       	mov    $0x8000,%eax
 8fb:	bf 00 10 00 00       	mov    $0x1000,%edi
 900:	76 04                	jbe    906 <malloc+0x86>
 902:	89 f0                	mov    %esi,%eax
 904:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 906:	89 04 24             	mov    %eax,(%esp)
 909:	e8 c2 fb ff ff       	call   4d0 <sbrk>
  if(p == (char*) -1)
 90e:	83 f8 ff             	cmp    $0xffffffff,%eax
 911:	74 18                	je     92b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 913:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 916:	83 c0 08             	add    $0x8,%eax
 919:	89 04 24             	mov    %eax,(%esp)
 91c:	e8 cf fe ff ff       	call   7f0 <free>
  return freep;
 921:	8b 0d 00 0f 00 00    	mov    0xf00,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 927:	85 c9                	test   %ecx,%ecx
 929:	75 97                	jne    8c2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 92b:	31 c0                	xor    %eax,%eax
 92d:	eb b4                	jmp    8e3 <malloc+0x63>
 92f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 930:	8b 10                	mov    (%eax),%edx
 932:	89 11                	mov    %edx,(%ecx)
 934:	eb a4                	jmp    8da <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 936:	c7 05 00 0f 00 00 f8 	movl   $0xef8,0xf00
 93d:	0e 00 00 
    base.s.size = 0;
 940:	b9 f8 0e 00 00       	mov    $0xef8,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 945:	c7 05 f8 0e 00 00 f8 	movl   $0xef8,0xef8
 94c:	0e 00 00 
    base.s.size = 0;
 94f:	c7 05 fc 0e 00 00 00 	movl   $0x0,0xefc
 956:	00 00 00 
 959:	e9 45 ff ff ff       	jmp    8a3 <malloc+0x23>
 95e:	90                   	nop
 95f:	90                   	nop

00000960 <sem_clear>:
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	83 ec 14             	sub    $0x14,%esp
 967:	8b 5d 08             	mov    0x8(%ebp),%ebx
 96a:	8b 03                	mov    (%ebx),%eax
 96c:	89 04 24             	mov    %eax,(%esp)
 96f:	e8 b4 fb ff ff       	call   528 <binary_sem_clear>
 974:	8b 43 04             	mov    0x4(%ebx),%eax
 977:	89 04 24             	mov    %eax,(%esp)
 97a:	e8 a9 fb ff ff       	call   528 <binary_sem_clear>
 97f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 982:	83 c4 14             	add    $0x14,%esp
 985:	5b                   	pop    %ebx
 986:	5d                   	pop    %ebp
 987:	e9 64 fe ff ff       	jmp    7f0 <free>
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <sem_downs>:
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	83 ec 18             	sub    $0x18,%esp
 996:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 999:	8b 5d 08             	mov    0x8(%ebp),%ebx
 99c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 99f:	8b 75 0c             	mov    0xc(%ebp),%esi
 9a2:	8b 43 04             	mov    0x4(%ebx),%eax
 9a5:	89 04 24             	mov    %eax,(%esp)
 9a8:	e8 6b fb ff ff       	call   518 <binary_sem_down>
 9ad:	8b 03                	mov    (%ebx),%eax
 9af:	89 04 24             	mov    %eax,(%esp)
 9b2:	e8 61 fb ff ff       	call   518 <binary_sem_down>
 9b7:	8b 43 08             	mov    0x8(%ebx),%eax
 9ba:	29 f0                	sub    %esi,%eax
 9bc:	85 c0                	test   %eax,%eax
 9be:	89 43 08             	mov    %eax,0x8(%ebx)
 9c1:	74 0b                	je     9ce <sem_downs+0x3e>
 9c3:	8b 43 04             	mov    0x4(%ebx),%eax
 9c6:	89 04 24             	mov    %eax,(%esp)
 9c9:	e8 52 fb ff ff       	call   520 <binary_sem_up>
 9ce:	8b 03                	mov    (%ebx),%eax
 9d0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 9d3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 9d6:	89 45 08             	mov    %eax,0x8(%ebp)
 9d9:	89 ec                	mov    %ebp,%esp
 9db:	5d                   	pop    %ebp
 9dc:	e9 3f fb ff ff       	jmp    520 <binary_sem_up>
 9e1:	eb 0d                	jmp    9f0 <sem_down>
 9e3:	90                   	nop
 9e4:	90                   	nop
 9e5:	90                   	nop
 9e6:	90                   	nop
 9e7:	90                   	nop
 9e8:	90                   	nop
 9e9:	90                   	nop
 9ea:	90                   	nop
 9eb:	90                   	nop
 9ec:	90                   	nop
 9ed:	90                   	nop
 9ee:	90                   	nop
 9ef:	90                   	nop

000009f0 <sem_down>:
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	53                   	push   %ebx
 9f4:	83 ec 14             	sub    $0x14,%esp
 9f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9fa:	8b 43 04             	mov    0x4(%ebx),%eax
 9fd:	89 04 24             	mov    %eax,(%esp)
 a00:	e8 13 fb ff ff       	call   518 <binary_sem_down>
 a05:	8b 03                	mov    (%ebx),%eax
 a07:	89 04 24             	mov    %eax,(%esp)
 a0a:	e8 09 fb ff ff       	call   518 <binary_sem_down>
 a0f:	8b 43 08             	mov    0x8(%ebx),%eax
 a12:	83 e8 01             	sub    $0x1,%eax
 a15:	85 c0                	test   %eax,%eax
 a17:	89 43 08             	mov    %eax,0x8(%ebx)
 a1a:	74 0b                	je     a27 <sem_down+0x37>
 a1c:	8b 43 04             	mov    0x4(%ebx),%eax
 a1f:	89 04 24             	mov    %eax,(%esp)
 a22:	e8 f9 fa ff ff       	call   520 <binary_sem_up>
 a27:	8b 03                	mov    (%ebx),%eax
 a29:	89 45 08             	mov    %eax,0x8(%ebp)
 a2c:	83 c4 14             	add    $0x14,%esp
 a2f:	5b                   	pop    %ebx
 a30:	5d                   	pop    %ebp
 a31:	e9 ea fa ff ff       	jmp    520 <binary_sem_up>
 a36:	8d 76 00             	lea    0x0(%esi),%esi
 a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a40 <sem_ups>:
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	83 ec 18             	sub    $0x18,%esp
 a46:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 a49:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a4c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 a4f:	8b 75 0c             	mov    0xc(%ebp),%esi
 a52:	8b 03                	mov    (%ebx),%eax
 a54:	89 04 24             	mov    %eax,(%esp)
 a57:	e8 bc fa ff ff       	call   518 <binary_sem_down>
 a5c:	03 73 08             	add    0x8(%ebx),%esi
 a5f:	83 fe 01             	cmp    $0x1,%esi
 a62:	89 73 08             	mov    %esi,0x8(%ebx)
 a65:	74 19                	je     a80 <sem_ups+0x40>
 a67:	8b 03                	mov    (%ebx),%eax
 a69:	8b 75 fc             	mov    -0x4(%ebp),%esi
 a6c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 a6f:	89 45 08             	mov    %eax,0x8(%ebp)
 a72:	89 ec                	mov    %ebp,%esp
 a74:	5d                   	pop    %ebp
 a75:	e9 a6 fa ff ff       	jmp    520 <binary_sem_up>
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a80:	8b 43 04             	mov    0x4(%ebx),%eax
 a83:	89 04 24             	mov    %eax,(%esp)
 a86:	e8 95 fa ff ff       	call   520 <binary_sem_up>
 a8b:	eb da                	jmp    a67 <sem_ups+0x27>
 a8d:	8d 76 00             	lea    0x0(%esi),%esi

00000a90 <sem_up>:
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	53                   	push   %ebx
 a94:	83 ec 14             	sub    $0x14,%esp
 a97:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a9a:	8b 03                	mov    (%ebx),%eax
 a9c:	89 04 24             	mov    %eax,(%esp)
 a9f:	e8 74 fa ff ff       	call   518 <binary_sem_down>
 aa4:	8b 43 08             	mov    0x8(%ebx),%eax
 aa7:	83 c0 01             	add    $0x1,%eax
 aaa:	83 f8 01             	cmp    $0x1,%eax
 aad:	89 43 08             	mov    %eax,0x8(%ebx)
 ab0:	74 16                	je     ac8 <sem_up+0x38>
 ab2:	8b 03                	mov    (%ebx),%eax
 ab4:	89 45 08             	mov    %eax,0x8(%ebp)
 ab7:	83 c4 14             	add    $0x14,%esp
 aba:	5b                   	pop    %ebx
 abb:	5d                   	pop    %ebp
 abc:	e9 5f fa ff ff       	jmp    520 <binary_sem_up>
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ac8:	8b 43 04             	mov    0x4(%ebx),%eax
 acb:	89 04 24             	mov    %eax,(%esp)
 ace:	e8 4d fa ff ff       	call   520 <binary_sem_up>
 ad3:	8b 03                	mov    (%ebx),%eax
 ad5:	89 45 08             	mov    %eax,0x8(%ebp)
 ad8:	83 c4 14             	add    $0x14,%esp
 adb:	5b                   	pop    %ebx
 adc:	5d                   	pop    %ebp
 add:	e9 3e fa ff ff       	jmp    520 <binary_sem_up>
 ae2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000af0 <semaphore_create>:
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	83 ec 28             	sub    $0x28,%esp
 af6:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 afd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 b00:	89 75 f8             	mov    %esi,-0x8(%ebp)
 b03:	89 7d fc             	mov    %edi,-0x4(%ebp)
 b06:	8b 7d 08             	mov    0x8(%ebp),%edi
 b09:	e8 72 fd ff ff       	call   880 <malloc>
 b0e:	89 78 08             	mov    %edi,0x8(%eax)
 b11:	89 c3                	mov    %eax,%ebx
 b13:	e8 f8 f9 ff ff       	call   510 <binary_sem_create>
 b18:	89 03                	mov    %eax,(%ebx)
 b1a:	89 c6                	mov    %eax,%esi
 b1c:	e8 ef f9 ff ff       	call   510 <binary_sem_create>
 b21:	01 c6                	add    %eax,%esi
 b23:	89 43 04             	mov    %eax,0x4(%ebx)
 b26:	78 20                	js     b48 <semaphore_create+0x58>
 b28:	85 ff                	test   %edi,%edi
 b2a:	75 08                	jne    b34 <semaphore_create+0x44>
 b2c:	89 04 24             	mov    %eax,(%esp)
 b2f:	e8 e4 f9 ff ff       	call   518 <binary_sem_down>
 b34:	89 d8                	mov    %ebx,%eax
 b36:	8b 75 f8             	mov    -0x8(%ebp),%esi
 b39:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 b3c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 b3f:	89 ec                	mov    %ebp,%esp
 b41:	5d                   	pop    %ebp
 b42:	c3                   	ret    
 b43:	90                   	nop
 b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b48:	c7 44 24 04 48 0e 00 	movl   $0xe48,0x4(%esp)
 b4f:	00 
 b50:	31 db                	xor    %ebx,%ebx
 b52:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b59:	e8 82 fa ff ff       	call   5e0 <printf>
 b5e:	eb d4                	jmp    b34 <semaphore_create+0x44>

00000b60 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	8b 00                	mov    (%eax),%eax
 b6b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b6e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 b6f:	e9 ac f9 ff ff       	jmp    520 <binary_sem_up>
 b74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b80 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	56                   	push   %esi
 b84:	53                   	push   %ebx
 b85:	83 ec 10             	sub    $0x10,%esp
 b88:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 b8b:	8b 43 08             	mov    0x8(%ebx),%eax
 b8e:	89 04 24             	mov    %eax,(%esp)
 b91:	e8 5a fe ff ff       	call   9f0 <sem_down>
	binary_sem_down(bb->mutex);
 b96:	8b 03                	mov    (%ebx),%eax
 b98:	89 04 24             	mov    %eax,(%esp)
 b9b:	e8 78 f9 ff ff       	call   518 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 ba0:	8b 43 14             	mov    0x14(%ebx),%eax
 ba3:	c1 e0 02             	shl    $0x2,%eax
 ba6:	03 43 0c             	add    0xc(%ebx),%eax
 ba9:	8b 30                	mov    (%eax),%esi
 bab:	85 f6                	test   %esi,%esi
 bad:	74 42                	je     bf1 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 baf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 bb5:	8b 53 18             	mov    0x18(%ebx),%edx
 bb8:	8b 43 14             	mov    0x14(%ebx),%eax
 bbb:	83 ea 01             	sub    $0x1,%edx
 bbe:	39 d0                	cmp    %edx,%eax
 bc0:	74 26                	je     be8 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 bc2:	83 c0 01             	add    $0x1,%eax
 bc5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 bc8:	8b 03                	mov    (%ebx),%eax
 bca:	89 04 24             	mov    %eax,(%esp)
 bcd:	e8 4e f9 ff ff       	call   520 <binary_sem_up>
	sem_up(bb->empty);
 bd2:	8b 43 04             	mov    0x4(%ebx),%eax
 bd5:	89 04 24             	mov    %eax,(%esp)
 bd8:	e8 b3 fe ff ff       	call   a90 <sem_up>
	return element;
}
 bdd:	83 c4 10             	add    $0x10,%esp
 be0:	89 f0                	mov    %esi,%eax
 be2:	5b                   	pop    %ebx
 be3:	5e                   	pop    %esi
 be4:	5d                   	pop    %ebp
 be5:	c3                   	ret    
 be6:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 be8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 bef:	eb d7                	jmp    bc8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 bf1:	c7 44 24 04 70 0e 00 	movl   $0xe70,0x4(%esp)
 bf8:	00 
 bf9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c00:	e8 db f9 ff ff       	call   5e0 <printf>
 c05:	eb c1                	jmp    bc8 <semaphore_pop+0x48>
 c07:	89 f6                	mov    %esi,%esi
 c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c10 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
 c13:	56                   	push   %esi
 c14:	53                   	push   %ebx
 c15:	83 ec 10             	sub    $0x10,%esp
 c18:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c1b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 c1e:	8b 43 04             	mov    0x4(%ebx),%eax
 c21:	89 04 24             	mov    %eax,(%esp)
 c24:	e8 c7 fd ff ff       	call   9f0 <sem_down>
	binary_sem_down(bb->mutex);
 c29:	8b 03                	mov    (%ebx),%eax
 c2b:	89 04 24             	mov    %eax,(%esp)
 c2e:	e8 e5 f8 ff ff       	call   518 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 c33:	8b 43 10             	mov    0x10(%ebx),%eax
 c36:	c1 e0 02             	shl    $0x2,%eax
 c39:	03 43 0c             	add    0xc(%ebx),%eax
 c3c:	8b 10                	mov    (%eax),%edx
 c3e:	85 d2                	test   %edx,%edx
 c40:	74 26                	je     c68 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c42:	c7 44 24 04 b4 0e 00 	movl   $0xeb4,0x4(%esp)
 c49:	00 
 c4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c51:	e8 8a f9 ff ff       	call   5e0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 c56:	8b 43 08             	mov    0x8(%ebx),%eax
 c59:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c5c:	83 c4 10             	add    $0x10,%esp
 c5f:	5b                   	pop    %ebx
 c60:	5e                   	pop    %esi
 c61:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 c62:	e9 29 fe ff ff       	jmp    a90 <sem_up>
 c67:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 c68:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 c6a:	8b 53 18             	mov    0x18(%ebx),%edx
 c6d:	8b 43 10             	mov    0x10(%ebx),%eax
 c70:	83 ea 01             	sub    $0x1,%edx
 c73:	39 d0                	cmp    %edx,%eax
 c75:	74 09                	je     c80 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c77:	83 c0 01             	add    $0x1,%eax
 c7a:	89 43 10             	mov    %eax,0x10(%ebx)
 c7d:	eb d7                	jmp    c56 <semaphore_put_atomic+0x46>
 c7f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c80:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c87:	eb cd                	jmp    c56 <semaphore_put_atomic+0x46>
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 c90:	55                   	push   %ebp
 c91:	89 e5                	mov    %esp,%ebp
 c93:	56                   	push   %esi
 c94:	53                   	push   %ebx
 c95:	83 ec 10             	sub    $0x10,%esp
 c98:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c9b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 c9e:	8b 43 04             	mov    0x4(%ebx),%eax
 ca1:	89 04 24             	mov    %eax,(%esp)
 ca4:	e8 47 fd ff ff       	call   9f0 <sem_down>
	binary_sem_down(bb->mutex);
 ca9:	8b 03                	mov    (%ebx),%eax
 cab:	89 04 24             	mov    %eax,(%esp)
 cae:	e8 65 f8 ff ff       	call   518 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 cb3:	8b 43 10             	mov    0x10(%ebx),%eax
 cb6:	c1 e0 02             	shl    $0x2,%eax
 cb9:	03 43 0c             	add    0xc(%ebx),%eax
 cbc:	8b 08                	mov    (%eax),%ecx
 cbe:	85 c9                	test   %ecx,%ecx
 cc0:	74 36                	je     cf8 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 cc2:	c7 44 24 04 b4 0e 00 	movl   $0xeb4,0x4(%esp)
 cc9:	00 
 cca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 cd1:	e8 0a f9 ff ff       	call   5e0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 cd6:	8b 03                	mov    (%ebx),%eax
 cd8:	89 04 24             	mov    %eax,(%esp)
 cdb:	e8 40 f8 ff ff       	call   520 <binary_sem_up>
	sem_up(bb->full);
 ce0:	8b 43 08             	mov    0x8(%ebx),%eax
 ce3:	89 45 08             	mov    %eax,0x8(%ebp)
}
 ce6:	83 c4 10             	add    $0x10,%esp
 ce9:	5b                   	pop    %ebx
 cea:	5e                   	pop    %esi
 ceb:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 cec:	e9 9f fd ff ff       	jmp    a90 <sem_up>
 cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 cf8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 cfa:	8b 53 18             	mov    0x18(%ebx),%edx
 cfd:	8b 43 10             	mov    0x10(%ebx),%eax
 d00:	83 ea 01             	sub    $0x1,%edx
 d03:	39 d0                	cmp    %edx,%eax
 d05:	74 09                	je     d10 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 d07:	83 c0 01             	add    $0x1,%eax
 d0a:	89 43 10             	mov    %eax,0x10(%ebx)
 d0d:	eb c7                	jmp    cd6 <semaphore_put+0x46>
 d0f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 d10:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 d17:	eb bd                	jmp    cd6 <semaphore_put+0x46>
 d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d20 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 d20:	55                   	push   %ebp
 d21:	89 e5                	mov    %esp,%ebp
 d23:	83 ec 18             	sub    $0x18,%esp
 d26:	89 75 fc             	mov    %esi,-0x4(%ebp)
 d29:	8b 75 08             	mov    0x8(%ebp),%esi
 d2c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 d2f:	85 f6                	test   %esi,%esi
 d31:	79 15                	jns    d48 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 d33:	31 db                	xor    %ebx,%ebx
}
 d35:	89 d8                	mov    %ebx,%eax
 d37:	8b 75 fc             	mov    -0x4(%ebp),%esi
 d3a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 d3d:	89 ec                	mov    %ebp,%esp
 d3f:	5d                   	pop    %ebp
 d40:	c3                   	ret    
 d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 d48:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 d4f:	e8 2c fb ff ff       	call   880 <malloc>
 d54:	85 c0                	test   %eax,%eax
 d56:	89 c3                	mov    %eax,%ebx
 d58:	74 db                	je     d35 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 d5a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 d61:	89 04 24             	mov    %eax,(%esp)
 d64:	e8 17 fb ff ff       	call   880 <malloc>
 d69:	85 c0                	test   %eax,%eax
 d6b:	89 43 0c             	mov    %eax,0xc(%ebx)
 d6e:	74 c3                	je     d33 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 d70:	89 34 24             	mov    %esi,(%esp)
 d73:	e8 78 fd ff ff       	call   af0 <semaphore_create>
 d78:	85 c0                	test   %eax,%eax
 d7a:	89 43 04             	mov    %eax,0x4(%ebx)
 d7d:	74 b4                	je     d33 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 d7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 d86:	e8 65 fd ff ff       	call   af0 <semaphore_create>
 d8b:	85 c0                	test   %eax,%eax
 d8d:	89 43 08             	mov    %eax,0x8(%ebx)
 d90:	74 a1                	je     d33 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 d92:	e8 79 f7 ff ff       	call   510 <binary_sem_create>
	ret->produce = 0;
 d97:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 d9e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 da5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 da8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 daa:	eb 89                	jmp    d35 <BB_create+0x15>
