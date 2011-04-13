
_sheker:     file format elf32-i386


Disassembly of section .text:

00000000 <stub>:
#include "types.h"
#include "stat.h"
#include "user.h"
#define STK_SIZE 4096

void* stub() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	eb fe                	jmp    3 <stub+0x3>
   5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <exit_func>:
	while(1) {
		i = -i;
		}
}

void* exit_func() {
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	83 ec 08             	sub    $0x8,%esp
	exit();
  16:	e8 9d 03 00 00       	call   3b8 <exit>
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000020 <main>:
}

int
main(int argc, char *argv[])
{
  20:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  24:	83 e4 f0             	and    $0xfffffff0,%esp
  27:	ff 71 fc             	pushl  -0x4(%ecx)
  2a:	55                   	push   %ebp
  2b:	89 e5                	mov    %esp,%ebp
  2d:	57                   	push   %edi
  2e:	56                   	push   %esi
  2f:	53                   	push   %ebx
  30:	51                   	push   %ecx
  31:	83 ec 28             	sub    $0x28,%esp
  34:	8b 41 04             	mov    0x4(%ecx),%eax
// void** lol = 0;
if(argc < 2 || argc > 2) {
  37:	83 39 02             	cmpl   $0x2,(%ecx)
  3a:	74 19                	je     55 <main+0x35>
  printf(2,"insert argument\n");
  3c:	c7 44 24 04 1c 0d 00 	movl   $0xd1c,0x4(%esp)
  43:	00 
  44:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4b:	e8 00 05 00 00       	call   550 <printf>
  exit();
  50:	e8 63 03 00 00       	call   3b8 <exit>
}
else {
int n = atoi(argv[1]);
  55:	8b 40 04             	mov    0x4(%eax),%eax
  58:	89 04 24             	mov    %eax,(%esp)
  5b:	e8 30 02 00 00       	call   290 <atoi>
int i;
void* ustack;

if(n < 0) {
  60:	85 c0                	test   %eax,%eax
if(argc < 2 || argc > 2) {
  printf(2,"insert argument\n");
  exit();
}
else {
int n = atoi(argv[1]);
  62:	89 c6                	mov    %eax,%esi
int i;
void* ustack;

if(n < 0) {
  64:	0f 88 d2 00 00 00    	js     13c <main+0x11c>
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
  6a:	8d 04 85 1e 00 00 00 	lea    0x1e(,%eax,4),%eax
  71:	83 e0 f0             	and    $0xfffffff0,%eax
int i;
void* ustack;

if(n < 0) {
printf(2,"invalid input\n");
exit();
  74:	89 65 e0             	mov    %esp,-0x20(%ebp)
}
else {
int tid[n];
  77:	29 c4                	sub    %eax,%esp
  79:	8d 7c 24 1b          	lea    0x1b(%esp),%edi
  7d:	83 e7 f0             	and    $0xfffffff0,%edi
for(i=0;i<n;i++) {
  80:	85 f6                	test   %esi,%esi
  82:	0f 84 e6 00 00 00    	je     16e <main+0x14e>
  88:	8d 46 ff             	lea    -0x1(%esi),%eax
  8b:	31 db                	xor    %ebx,%ebx
  8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  90:	eb 5a                	jmp    ec <main+0xcc>
  92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
if(i != n-1) {
if((ustack = malloc(STK_SIZE)) <= 0) {
  98:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  9f:	e8 4c 07 00 00       	call   7f0 <malloc>
  a4:	85 c0                	test   %eax,%eax
  a6:	0f 84 a9 00 00 00    	je     155 <main+0x135>
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
printf(1, "i'm a normal thread\n");
  ac:	c7 44 24 04 3c 0d 00 	movl   $0xd3c,0x4(%esp)
  b3:	00 
  b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
  be:	e8 8d 04 00 00       	call   550 <printf>
tid[i] = thread_create(stub ,ustack, STK_SIZE);
  c3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  ca:	00 
  cb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  d9:	e8 7a 03 00 00       	call   458 <thread_create>
  de:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
for(i=0;i<n;i++) {
  e1:	83 c3 01             	add    $0x1,%ebx
  e4:	39 de                	cmp    %ebx,%esi
  e6:	0f 8e 82 00 00 00    	jle    16e <main+0x14e>
if(i != n-1) {
  ec:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  ef:	75 a7                	jne    98 <main+0x78>
printf(1, "i'm a normal thread\n");
tid[i] = thread_create(stub ,ustack, STK_SIZE);
}
}
else {
if((ustack = malloc(STK_SIZE)) <= 0) {
  f1:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  f8:	e8 f3 06 00 00       	call   7f0 <malloc>
  fd:	85 c0                	test   %eax,%eax
  ff:	90                   	nop
 100:	74 53                	je     155 <main+0x135>
printf(2,"cant malloc the stack for the thread\n");
exit();
}
else {
printf(1, "i'm the exiting thread\n");
 102:	c7 44 24 04 51 0d 00 	movl   $0xd51,0x4(%esp)
 109:	00 
 10a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 111:	89 45 dc             	mov    %eax,-0x24(%ebp)
 114:	e8 37 04 00 00       	call   550 <printf>
tid[i] = thread_create(exit_func ,ustack, STK_SIZE);
 119:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
 120:	00 
 121:	8b 45 dc             	mov    -0x24(%ebp),%eax
 124:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 12b:	89 44 24 04          	mov    %eax,0x4(%esp)
 12f:	e8 24 03 00 00       	call   458 <thread_create>
 134:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 137:	89 04 97             	mov    %eax,(%edi,%edx,4)
 13a:	eb a5                	jmp    e1 <main+0xc1>
int n = atoi(argv[1]);
int i;
void* ustack;

if(n < 0) {
printf(2,"invalid input\n");
 13c:	c7 44 24 04 2d 0d 00 	movl   $0xd2d,0x4(%esp)
 143:	00 
 144:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 14b:	e8 00 04 00 00       	call   550 <printf>
exit();
 150:	e8 63 02 00 00       	call   3b8 <exit>
tid[i] = thread_create(stub ,ustack, STK_SIZE);
}
}
else {
if((ustack = malloc(STK_SIZE)) <= 0) {
printf(2,"cant malloc the stack for the thread\n");
 155:	c7 44 24 04 78 0d 00 	movl   $0xd78,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 164:	e8 e7 03 00 00       	call   550 <printf>
exit();
 169:	e8 4a 02 00 00       	call   3b8 <exit>
printf(2,"invalid input\n");
exit();
}
else {
int tid[n];
for(i=0;i<n;i++) {
 16e:	8b 65 e0             	mov    -0x20(%ebp),%esp
}
}
}
int i;
i = 1;
printf(1, "i'm a process\n");
 171:	c7 44 24 04 69 0d 00 	movl   $0xd69,0x4(%esp)
 178:	00 
 179:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 180:	e8 cb 03 00 00       	call   550 <printf>
 185:	eb fe                	jmp    185 <main+0x165>
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 190:	55                   	push   %ebp
 191:	31 d2                	xor    %edx,%edx
 193:	89 e5                	mov    %esp,%ebp
 195:	8b 45 08             	mov    0x8(%ebp),%eax
 198:	53                   	push   %ebx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 c9                	test   %cl,%cl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	5b                   	pop    %ebx
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <strcmp>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ca:	0f b6 01             	movzbl (%ecx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 14                	jne    1e5 <strcmp+0x25>
 1d1:	eb 25                	jmp    1f8 <strcmp+0x38>
 1d3:	90                   	nop
 1d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 1d8:	83 c1 01             	add    $0x1,%ecx
 1db:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1de:	0f b6 01             	movzbl (%ecx),%eax
 1e1:	84 c0                	test   %al,%al
 1e3:	74 13                	je     1f8 <strcmp+0x38>
 1e5:	0f b6 1a             	movzbl (%edx),%ebx
 1e8:	38 d8                	cmp    %bl,%al
 1ea:	74 ec                	je     1d8 <strcmp+0x18>
 1ec:	0f b6 db             	movzbl %bl,%ebx
 1ef:	0f b6 c0             	movzbl %al,%eax
 1f2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1f4:	5b                   	pop    %ebx
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f8:	0f b6 1a             	movzbl (%edx),%ebx
 1fb:	31 c0                	xor    %eax,%eax
 1fd:	0f b6 db             	movzbl %bl,%ebx
 200:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 202:	5b                   	pop    %ebx
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    
 205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strlen>:

uint
strlen(char *s)
{
 210:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 211:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 213:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 215:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 217:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 39 00             	cmpb   $0x0,(%ecx)
 21d:	74 0c                	je     22b <strlen+0x1b>
 21f:	90                   	nop
 220:	83 c2 01             	add    $0x1,%edx
 223:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 227:	89 d0                	mov    %edx,%eax
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
 236:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	84 d2                	test   %dl,%dl
 25f:	75 11                	jne    272 <strchr+0x22>
 261:	eb 15                	jmp    278 <strchr+0x28>
 263:	90                   	nop
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 268:	83 c0 01             	add    $0x1,%eax
 26b:	0f b6 10             	movzbl (%eax),%edx
 26e:	84 d2                	test   %dl,%dl
 270:	74 06                	je     278 <strchr+0x28>
    if(*s == c)
 272:	38 ca                	cmp    %cl,%dl
 274:	75 f2                	jne    268 <strchr+0x18>
      return (char*) s;
  return 0;
}
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 278:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 27a:	5d                   	pop    %ebp
 27b:	90                   	nop
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 280:	c3                   	ret    
 281:	eb 0d                	jmp    290 <atoi>
 283:	90                   	nop
 284:	90                   	nop
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop
 288:	90                   	nop
 289:	90                   	nop
 28a:	90                   	nop
 28b:	90                   	nop
 28c:	90                   	nop
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 290:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 291:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 293:	89 e5                	mov    %esp,%ebp
 295:	8b 4d 08             	mov    0x8(%ebp),%ecx
 298:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 299:	0f b6 11             	movzbl (%ecx),%edx
 29c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 29f:	80 fb 09             	cmp    $0x9,%bl
 2a2:	77 1c                	ja     2c0 <atoi+0x30>
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2a8:	0f be d2             	movsbl %dl,%edx
 2ab:	83 c1 01             	add    $0x1,%ecx
 2ae:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2b1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b5:	0f b6 11             	movzbl (%ecx),%edx
 2b8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2bb:	80 fb 09             	cmp    $0x9,%bl
 2be:	76 e8                	jbe    2a8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2c0:	5b                   	pop    %ebx
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	53                   	push   %ebx
 2d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2de:	85 db                	test   %ebx,%ebx
 2e0:	7e 14                	jle    2f6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 2e2:	31 d2                	xor    %edx,%edx
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    
 2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000300 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 306:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 309:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 30c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 30f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 314:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 31b:	00 
 31c:	89 04 24             	mov    %eax,(%esp)
 31f:	e8 d4 00 00 00       	call   3f8 <open>
  if(fd < 0)
 324:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 326:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 328:	78 19                	js     343 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	89 1c 24             	mov    %ebx,(%esp)
 330:	89 44 24 04          	mov    %eax,0x4(%esp)
 334:	e8 d7 00 00 00       	call   410 <fstat>
  close(fd);
 339:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 33c:	89 c6                	mov    %eax,%esi
  close(fd);
 33e:	e8 9d 00 00 00       	call   3e0 <close>
  return r;
}
 343:	89 f0                	mov    %esi,%eax
 345:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 348:	8b 75 fc             	mov    -0x4(%ebp),%esi
 34b:	89 ec                	mov    %ebp,%esp
 34d:	5d                   	pop    %ebp
 34e:	c3                   	ret    
 34f:	90                   	nop

00000350 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	31 f6                	xor    %esi,%esi
 357:	53                   	push   %ebx
 358:	83 ec 2c             	sub    $0x2c,%esp
 35b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 35e:	eb 06                	jmp    366 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 360:	3c 0a                	cmp    $0xa,%al
 362:	74 39                	je     39d <gets+0x4d>
 364:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 366:	8d 5e 01             	lea    0x1(%esi),%ebx
 369:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36c:	7d 31                	jge    39f <gets+0x4f>
    cc = read(0, &c, 1);
 36e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 371:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 378:	00 
 379:	89 44 24 04          	mov    %eax,0x4(%esp)
 37d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 384:	e8 47 00 00 00       	call   3d0 <read>
    if(cc < 1)
 389:	85 c0                	test   %eax,%eax
 38b:	7e 12                	jle    39f <gets+0x4f>
      break;
    buf[i++] = c;
 38d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 391:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 395:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 399:	3c 0d                	cmp    $0xd,%al
 39b:	75 c3                	jne    360 <gets+0x10>
 39d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 39f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3a3:	89 f8                	mov    %edi,%eax
 3a5:	83 c4 2c             	add    $0x2c,%esp
 3a8:	5b                   	pop    %ebx
 3a9:	5e                   	pop    %esi
 3aa:	5f                   	pop    %edi
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
 3ad:	90                   	nop
 3ae:	90                   	nop
 3af:	90                   	nop

000003b0 <fork>:
 3b0:	b8 01 00 00 00       	mov    $0x1,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <exit>:
 3b8:	b8 02 00 00 00       	mov    $0x2,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <wait>:
 3c0:	b8 03 00 00 00       	mov    $0x3,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <pipe>:
 3c8:	b8 04 00 00 00       	mov    $0x4,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <read>:
 3d0:	b8 06 00 00 00       	mov    $0x6,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <write>:
 3d8:	b8 05 00 00 00       	mov    $0x5,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <close>:
 3e0:	b8 07 00 00 00       	mov    $0x7,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <kill>:
 3e8:	b8 08 00 00 00       	mov    $0x8,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <exec>:
 3f0:	b8 09 00 00 00       	mov    $0x9,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <open>:
 3f8:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <mknod>:
 400:	b8 0b 00 00 00       	mov    $0xb,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <unlink>:
 408:	b8 0c 00 00 00       	mov    $0xc,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <fstat>:
 410:	b8 0d 00 00 00       	mov    $0xd,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <link>:
 418:	b8 0e 00 00 00       	mov    $0xe,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <mkdir>:
 420:	b8 0f 00 00 00       	mov    $0xf,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <chdir>:
 428:	b8 10 00 00 00       	mov    $0x10,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <dup>:
 430:	b8 11 00 00 00       	mov    $0x11,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <getpid>:
 438:	b8 12 00 00 00       	mov    $0x12,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <sbrk>:
 440:	b8 13 00 00 00       	mov    $0x13,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <sleep>:
 448:	b8 14 00 00 00       	mov    $0x14,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <uptime>:
 450:	b8 15 00 00 00       	mov    $0x15,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <thread_create>:
 458:	b8 16 00 00 00       	mov    $0x16,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <thread_getid>:
 460:	b8 17 00 00 00       	mov    $0x17,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <thread_getProcid>:
 468:	b8 18 00 00 00       	mov    $0x18,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <thread_exit>:
 470:	b8 1a 00 00 00       	mov    $0x1a,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <thread_join>:
 478:	b8 19 00 00 00       	mov    $0x19,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <binary_sem_create>:
 480:	b8 1b 00 00 00       	mov    $0x1b,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <binary_sem_down>:
 488:	b8 1c 00 00 00       	mov    $0x1c,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <binary_sem_up>:
 490:	b8 1d 00 00 00       	mov    $0x1d,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <binary_sem_clear>:
 498:	b8 1e 00 00 00       	mov    $0x1e,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <exit_all_threads>:
 4a0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    
 4a8:	90                   	nop
 4a9:	90                   	nop
 4aa:	90                   	nop
 4ab:	90                   	nop
 4ac:	90                   	nop
 4ad:	90                   	nop
 4ae:	90                   	nop
 4af:	90                   	nop

000004b0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	89 cf                	mov    %ecx,%edi
 4b6:	56                   	push   %esi
 4b7:	89 c6                	mov    %eax,%esi
 4b9:	53                   	push   %ebx
 4ba:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 4bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4c0:	85 c9                	test   %ecx,%ecx
 4c2:	74 04                	je     4c8 <printint+0x18>
 4c4:	85 d2                	test   %edx,%edx
 4c6:	78 70                	js     538 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4d1:	31 c9                	xor    %ecx,%ecx
 4d3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4d6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 4d8:	31 d2                	xor    %edx,%edx
 4da:	f7 f7                	div    %edi
 4dc:	0f b6 92 a5 0d 00 00 	movzbl 0xda5(%edx),%edx
 4e3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 4e6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 4e9:	85 c0                	test   %eax,%eax
 4eb:	75 eb                	jne    4d8 <printint+0x28>
	if(neg)
 4ed:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4f0:	85 c0                	test   %eax,%eax
 4f2:	74 08                	je     4fc <printint+0x4c>
		buf[i++] = '-';
 4f4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 4f9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 4fc:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4ff:	01 fb                	add    %edi,%ebx
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	0f b6 03             	movzbl (%ebx),%eax
 50b:	83 ef 01             	sub    $0x1,%edi
 50e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 511:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 518:	00 
 519:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 51c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 51f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 522:	89 44 24 04          	mov    %eax,0x4(%esp)
 526:	e8 ad fe ff ff       	call   3d8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 52b:	83 ff ff             	cmp    $0xffffffff,%edi
 52e:	75 d8                	jne    508 <printint+0x58>
		putc(fd, buf[i]);
}
 530:	83 c4 4c             	add    $0x4c,%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5f                   	pop    %edi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 538:	89 d0                	mov    %edx,%eax
 53a:	f7 d8                	neg    %eax
 53c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 543:	eb 8c                	jmp    4d1 <printint+0x21>
 545:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000550 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 559:	8b 45 0c             	mov    0xc(%ebp),%eax
 55c:	0f b6 10             	movzbl (%eax),%edx
 55f:	84 d2                	test   %dl,%dl
 561:	0f 84 c9 00 00 00    	je     630 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 567:	8d 4d 10             	lea    0x10(%ebp),%ecx
 56a:	31 ff                	xor    %edi,%edi
 56c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 56f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 571:	8d 75 e7             	lea    -0x19(%ebp),%esi
 574:	eb 1e                	jmp    594 <printf+0x44>
 576:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 578:	83 fa 25             	cmp    $0x25,%edx
 57b:	0f 85 b7 00 00 00    	jne    638 <printf+0xe8>
 581:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 585:	83 c3 01             	add    $0x1,%ebx
 588:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 58c:	84 d2                	test   %dl,%dl
 58e:	0f 84 9c 00 00 00    	je     630 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 594:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 596:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 599:	74 dd                	je     578 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 59b:	83 ff 25             	cmp    $0x25,%edi
 59e:	75 e5                	jne    585 <printf+0x35>
			if(c == 'd'){
 5a0:	83 fa 64             	cmp    $0x64,%edx
 5a3:	0f 84 57 01 00 00    	je     700 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 5a9:	83 fa 70             	cmp    $0x70,%edx
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b0:	0f 84 aa 00 00 00    	je     660 <printf+0x110>
 5b6:	83 fa 78             	cmp    $0x78,%edx
 5b9:	0f 84 a1 00 00 00    	je     660 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 5bf:	83 fa 73             	cmp    $0x73,%edx
 5c2:	0f 84 c0 00 00 00    	je     688 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5c8:	83 fa 63             	cmp    $0x63,%edx
 5cb:	90                   	nop
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	0f 84 52 01 00 00    	je     728 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 5d6:	83 fa 25             	cmp    $0x25,%edx
 5d9:	0f 84 f9 00 00 00    	je     6d8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5df:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5e2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5e5:	31 ff                	xor    %edi,%edi
 5e7:	89 55 cc             	mov    %edx,-0x34(%ebp)
 5ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f5:	00 
 5f6:	89 0c 24             	mov    %ecx,(%esp)
 5f9:	89 74 24 04          	mov    %esi,0x4(%esp)
 5fd:	e8 d6 fd ff ff       	call   3d8 <write>
 602:	8b 55 cc             	mov    -0x34(%ebp),%edx
 605:	8b 45 08             	mov    0x8(%ebp),%eax
 608:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 60f:	00 
 610:	89 74 24 04          	mov    %esi,0x4(%esp)
 614:	88 55 e7             	mov    %dl,-0x19(%ebp)
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 b9 fd ff ff       	call   3d8 <write>
 61f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 622:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 626:	84 d2                	test   %dl,%dl
 628:	0f 85 66 ff ff ff    	jne    594 <printf+0x44>
 62e:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 630:	83 c4 3c             	add    $0x3c,%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 638:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 63b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 63e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 645:	00 
 646:	89 74 24 04          	mov    %esi,0x4(%esp)
 64a:	89 04 24             	mov    %eax,(%esp)
 64d:	e8 86 fd ff ff       	call   3d8 <write>
 652:	8b 45 0c             	mov    0xc(%ebp),%eax
 655:	e9 2b ff ff ff       	jmp    585 <printf+0x35>
 65a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 660:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 668:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 66a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 45 08             	mov    0x8(%ebp),%eax
 676:	e8 35 fe ff ff       	call   4b0 <printint>
 67b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 67e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 682:	e9 fe fe ff ff       	jmp    585 <printf+0x35>
 687:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 688:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 68b:	8b 3a                	mov    (%edx),%edi
				ap++;
 68d:	83 c2 04             	add    $0x4,%edx
 690:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 693:	85 ff                	test   %edi,%edi
 695:	0f 84 ba 00 00 00    	je     755 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 69b:	0f b6 17             	movzbl (%edi),%edx
 69e:	84 d2                	test   %dl,%dl
 6a0:	74 2d                	je     6cf <printf+0x17f>
 6a2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 6a8:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 6ab:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b5:	00 
 6b6:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ba:	89 1c 24             	mov    %ebx,(%esp)
 6bd:	e8 16 fd ff ff       	call   3d8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 6c2:	0f b6 17             	movzbl (%edi),%edx
 6c5:	84 d2                	test   %dl,%dl
 6c7:	75 df                	jne    6a8 <printf+0x158>
 6c9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6cc:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6cf:	31 ff                	xor    %edi,%edi
 6d1:	e9 af fe ff ff       	jmp    585 <printf+0x35>
 6d6:	66 90                	xchg   %ax,%ax
 6d8:	8b 55 08             	mov    0x8(%ebp),%edx
 6db:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 6dd:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6e8:	00 
 6e9:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ed:	89 14 24             	mov    %edx,(%esp)
 6f0:	e8 e3 fc ff ff       	call   3d8 <write>
 6f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f8:	e9 88 fe ff ff       	jmp    585 <printf+0x35>
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 700:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 708:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 70b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 712:	8b 10                	mov    (%eax),%edx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	e8 94 fd ff ff       	call   4b0 <printint>
 71c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 71f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 723:	e9 5d fe ff ff       	jmp    585 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 728:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 72b:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 72d:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 72f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 736:	00 
 737:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 73b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 8f fc ff ff       	call   3d8 <write>
 749:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 74c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 750:	e9 30 fe ff ff       	jmp    585 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 755:	bf 9e 0d 00 00       	mov    $0xd9e,%edi
 75a:	e9 3c ff ff ff       	jmp    69b <printf+0x14b>
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 70 0e 00 00       	mov    0xe70,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	39 c8                	cmp    %ecx,%eax
 773:	73 1d                	jae    792 <free+0x32>
 775:	8d 76 00             	lea    0x0(%esi),%esi
 778:	8b 10                	mov    (%eax),%edx
 77a:	39 d1                	cmp    %edx,%ecx
 77c:	72 1a                	jb     798 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77e:	39 d0                	cmp    %edx,%eax
 780:	72 08                	jb     78a <free+0x2a>
 782:	39 c8                	cmp    %ecx,%eax
 784:	72 12                	jb     798 <free+0x38>
 786:	39 d1                	cmp    %edx,%ecx
 788:	72 0e                	jb     798 <free+0x38>
 78a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78c:	39 c8                	cmp    %ecx,%eax
 78e:	66 90                	xchg   %ax,%ax
 790:	72 e6                	jb     778 <free+0x18>
 792:	8b 10                	mov    (%eax),%edx
 794:	eb e8                	jmp    77e <free+0x1e>
 796:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 71 04             	mov    0x4(%ecx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 d7                	cmp    %edx,%edi
 7a0:	74 19                	je     7bb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7a5:	8b 50 04             	mov    0x4(%eax),%edx
 7a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ab:	39 ce                	cmp    %ecx,%esi
 7ad:	74 23                	je     7d2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7af:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b1:	a3 70 0e 00 00       	mov    %eax,0xe70
}
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
 7b8:	5f                   	pop    %edi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7bb:	03 72 04             	add    0x4(%edx),%esi
 7be:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c1:	8b 10                	mov    (%eax),%edx
 7c3:	8b 12                	mov    (%edx),%edx
 7c5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7c8:	8b 50 04             	mov    0x4(%eax),%edx
 7cb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7ce:	39 ce                	cmp    %ecx,%esi
 7d0:	75 dd                	jne    7af <free+0x4f>
    p->s.size += bp->s.size;
 7d2:	03 51 04             	add    0x4(%ecx),%edx
 7d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7db:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 7dd:	a3 70 0e 00 00       	mov    %eax,0xe70
}
 7e2:	5b                   	pop    %ebx
 7e3:	5e                   	pop    %esi
 7e4:	5f                   	pop    %edi
 7e5:	5d                   	pop    %ebp
 7e6:	c3                   	ret    
 7e7:	89 f6                	mov    %esi,%esi
 7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 7fc:	8b 0d 70 0e 00 00    	mov    0xe70,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	83 c3 07             	add    $0x7,%ebx
 805:	c1 eb 03             	shr    $0x3,%ebx
 808:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 80b:	85 c9                	test   %ecx,%ecx
 80d:	0f 84 93 00 00 00    	je     8a6 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 815:	8b 50 04             	mov    0x4(%eax),%edx
 818:	39 d3                	cmp    %edx,%ebx
 81a:	76 1f                	jbe    83b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 81c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 823:	90                   	nop
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 828:	3b 05 70 0e 00 00    	cmp    0xe70,%eax
 82e:	74 30                	je     860 <malloc+0x70>
 830:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 832:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 834:	8b 50 04             	mov    0x4(%eax),%edx
 837:	39 d3                	cmp    %edx,%ebx
 839:	77 ed                	ja     828 <malloc+0x38>
      if(p->s.size == nunits)
 83b:	39 d3                	cmp    %edx,%ebx
 83d:	74 61                	je     8a0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 83f:	29 da                	sub    %ebx,%edx
 841:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 844:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 847:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 84a:	89 0d 70 0e 00 00    	mov    %ecx,0xe70
      return (void*) (p + 1);
 850:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 853:	83 c4 1c             	add    $0x1c,%esp
 856:	5b                   	pop    %ebx
 857:	5e                   	pop    %esi
 858:	5f                   	pop    %edi
 859:	5d                   	pop    %ebp
 85a:	c3                   	ret    
 85b:	90                   	nop
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 860:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 866:	b8 00 80 00 00       	mov    $0x8000,%eax
 86b:	bf 00 10 00 00       	mov    $0x1000,%edi
 870:	76 04                	jbe    876 <malloc+0x86>
 872:	89 f0                	mov    %esi,%eax
 874:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 876:	89 04 24             	mov    %eax,(%esp)
 879:	e8 c2 fb ff ff       	call   440 <sbrk>
  if(p == (char*) -1)
 87e:	83 f8 ff             	cmp    $0xffffffff,%eax
 881:	74 18                	je     89b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 883:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 886:	83 c0 08             	add    $0x8,%eax
 889:	89 04 24             	mov    %eax,(%esp)
 88c:	e8 cf fe ff ff       	call   760 <free>
  return freep;
 891:	8b 0d 70 0e 00 00    	mov    0xe70,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 897:	85 c9                	test   %ecx,%ecx
 899:	75 97                	jne    832 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 89b:	31 c0                	xor    %eax,%eax
 89d:	eb b4                	jmp    853 <malloc+0x63>
 89f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 10                	mov    (%eax),%edx
 8a2:	89 11                	mov    %edx,(%ecx)
 8a4:	eb a4                	jmp    84a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8a6:	c7 05 70 0e 00 00 68 	movl   $0xe68,0xe70
 8ad:	0e 00 00 
    base.s.size = 0;
 8b0:	b9 68 0e 00 00       	mov    $0xe68,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8b5:	c7 05 68 0e 00 00 68 	movl   $0xe68,0xe68
 8bc:	0e 00 00 
    base.s.size = 0;
 8bf:	c7 05 6c 0e 00 00 00 	movl   $0x0,0xe6c
 8c6:	00 00 00 
 8c9:	e9 45 ff ff ff       	jmp    813 <malloc+0x23>
 8ce:	90                   	nop
 8cf:	90                   	nop

000008d0 <sem_clear>:
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 14             	sub    $0x14,%esp
 8d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8da:	8b 03                	mov    (%ebx),%eax
 8dc:	89 04 24             	mov    %eax,(%esp)
 8df:	e8 b4 fb ff ff       	call   498 <binary_sem_clear>
 8e4:	8b 43 04             	mov    0x4(%ebx),%eax
 8e7:	89 04 24             	mov    %eax,(%esp)
 8ea:	e8 a9 fb ff ff       	call   498 <binary_sem_clear>
 8ef:	89 5d 08             	mov    %ebx,0x8(%ebp)
 8f2:	83 c4 14             	add    $0x14,%esp
 8f5:	5b                   	pop    %ebx
 8f6:	5d                   	pop    %ebp
 8f7:	e9 64 fe ff ff       	jmp    760 <free>
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000900 <sem_downs>:
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	83 ec 18             	sub    $0x18,%esp
 906:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 909:	8b 5d 08             	mov    0x8(%ebp),%ebx
 90c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 90f:	8b 75 0c             	mov    0xc(%ebp),%esi
 912:	8b 43 04             	mov    0x4(%ebx),%eax
 915:	89 04 24             	mov    %eax,(%esp)
 918:	e8 6b fb ff ff       	call   488 <binary_sem_down>
 91d:	8b 03                	mov    (%ebx),%eax
 91f:	89 04 24             	mov    %eax,(%esp)
 922:	e8 61 fb ff ff       	call   488 <binary_sem_down>
 927:	8b 43 08             	mov    0x8(%ebx),%eax
 92a:	29 f0                	sub    %esi,%eax
 92c:	85 c0                	test   %eax,%eax
 92e:	89 43 08             	mov    %eax,0x8(%ebx)
 931:	74 0b                	je     93e <sem_downs+0x3e>
 933:	8b 43 04             	mov    0x4(%ebx),%eax
 936:	89 04 24             	mov    %eax,(%esp)
 939:	e8 52 fb ff ff       	call   490 <binary_sem_up>
 93e:	8b 03                	mov    (%ebx),%eax
 940:	8b 75 fc             	mov    -0x4(%ebp),%esi
 943:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 946:	89 45 08             	mov    %eax,0x8(%ebp)
 949:	89 ec                	mov    %ebp,%esp
 94b:	5d                   	pop    %ebp
 94c:	e9 3f fb ff ff       	jmp    490 <binary_sem_up>
 951:	eb 0d                	jmp    960 <sem_down>
 953:	90                   	nop
 954:	90                   	nop
 955:	90                   	nop
 956:	90                   	nop
 957:	90                   	nop
 958:	90                   	nop
 959:	90                   	nop
 95a:	90                   	nop
 95b:	90                   	nop
 95c:	90                   	nop
 95d:	90                   	nop
 95e:	90                   	nop
 95f:	90                   	nop

00000960 <sem_down>:
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	83 ec 14             	sub    $0x14,%esp
 967:	8b 5d 08             	mov    0x8(%ebp),%ebx
 96a:	8b 43 04             	mov    0x4(%ebx),%eax
 96d:	89 04 24             	mov    %eax,(%esp)
 970:	e8 13 fb ff ff       	call   488 <binary_sem_down>
 975:	8b 03                	mov    (%ebx),%eax
 977:	89 04 24             	mov    %eax,(%esp)
 97a:	e8 09 fb ff ff       	call   488 <binary_sem_down>
 97f:	8b 43 08             	mov    0x8(%ebx),%eax
 982:	83 e8 01             	sub    $0x1,%eax
 985:	85 c0                	test   %eax,%eax
 987:	89 43 08             	mov    %eax,0x8(%ebx)
 98a:	74 0b                	je     997 <sem_down+0x37>
 98c:	8b 43 04             	mov    0x4(%ebx),%eax
 98f:	89 04 24             	mov    %eax,(%esp)
 992:	e8 f9 fa ff ff       	call   490 <binary_sem_up>
 997:	8b 03                	mov    (%ebx),%eax
 999:	89 45 08             	mov    %eax,0x8(%ebp)
 99c:	83 c4 14             	add    $0x14,%esp
 99f:	5b                   	pop    %ebx
 9a0:	5d                   	pop    %ebp
 9a1:	e9 ea fa ff ff       	jmp    490 <binary_sem_up>
 9a6:	8d 76 00             	lea    0x0(%esi),%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <sem_ups>:
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	83 ec 18             	sub    $0x18,%esp
 9b6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 9b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9bc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 9bf:	8b 75 0c             	mov    0xc(%ebp),%esi
 9c2:	8b 03                	mov    (%ebx),%eax
 9c4:	89 04 24             	mov    %eax,(%esp)
 9c7:	e8 bc fa ff ff       	call   488 <binary_sem_down>
 9cc:	03 73 08             	add    0x8(%ebx),%esi
 9cf:	83 fe 01             	cmp    $0x1,%esi
 9d2:	89 73 08             	mov    %esi,0x8(%ebx)
 9d5:	74 19                	je     9f0 <sem_ups+0x40>
 9d7:	8b 03                	mov    (%ebx),%eax
 9d9:	8b 75 fc             	mov    -0x4(%ebp),%esi
 9dc:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 9df:	89 45 08             	mov    %eax,0x8(%ebp)
 9e2:	89 ec                	mov    %ebp,%esp
 9e4:	5d                   	pop    %ebp
 9e5:	e9 a6 fa ff ff       	jmp    490 <binary_sem_up>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9f0:	8b 43 04             	mov    0x4(%ebx),%eax
 9f3:	89 04 24             	mov    %eax,(%esp)
 9f6:	e8 95 fa ff ff       	call   490 <binary_sem_up>
 9fb:	eb da                	jmp    9d7 <sem_ups+0x27>
 9fd:	8d 76 00             	lea    0x0(%esi),%esi

00000a00 <sem_up>:
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	53                   	push   %ebx
 a04:	83 ec 14             	sub    $0x14,%esp
 a07:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a0a:	8b 03                	mov    (%ebx),%eax
 a0c:	89 04 24             	mov    %eax,(%esp)
 a0f:	e8 74 fa ff ff       	call   488 <binary_sem_down>
 a14:	8b 43 08             	mov    0x8(%ebx),%eax
 a17:	83 c0 01             	add    $0x1,%eax
 a1a:	83 f8 01             	cmp    $0x1,%eax
 a1d:	89 43 08             	mov    %eax,0x8(%ebx)
 a20:	74 16                	je     a38 <sem_up+0x38>
 a22:	8b 03                	mov    (%ebx),%eax
 a24:	89 45 08             	mov    %eax,0x8(%ebp)
 a27:	83 c4 14             	add    $0x14,%esp
 a2a:	5b                   	pop    %ebx
 a2b:	5d                   	pop    %ebp
 a2c:	e9 5f fa ff ff       	jmp    490 <binary_sem_up>
 a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a38:	8b 43 04             	mov    0x4(%ebx),%eax
 a3b:	89 04 24             	mov    %eax,(%esp)
 a3e:	e8 4d fa ff ff       	call   490 <binary_sem_up>
 a43:	8b 03                	mov    (%ebx),%eax
 a45:	89 45 08             	mov    %eax,0x8(%ebp)
 a48:	83 c4 14             	add    $0x14,%esp
 a4b:	5b                   	pop    %ebx
 a4c:	5d                   	pop    %ebp
 a4d:	e9 3e fa ff ff       	jmp    490 <binary_sem_up>
 a52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a60 <semaphore_create>:
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	83 ec 28             	sub    $0x28,%esp
 a66:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 a6d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 a70:	89 75 f8             	mov    %esi,-0x8(%ebp)
 a73:	89 7d fc             	mov    %edi,-0x4(%ebp)
 a76:	8b 7d 08             	mov    0x8(%ebp),%edi
 a79:	e8 72 fd ff ff       	call   7f0 <malloc>
 a7e:	89 78 08             	mov    %edi,0x8(%eax)
 a81:	89 c3                	mov    %eax,%ebx
 a83:	e8 f8 f9 ff ff       	call   480 <binary_sem_create>
 a88:	89 03                	mov    %eax,(%ebx)
 a8a:	89 c6                	mov    %eax,%esi
 a8c:	e8 ef f9 ff ff       	call   480 <binary_sem_create>
 a91:	01 c6                	add    %eax,%esi
 a93:	89 43 04             	mov    %eax,0x4(%ebx)
 a96:	78 20                	js     ab8 <semaphore_create+0x58>
 a98:	85 ff                	test   %edi,%edi
 a9a:	75 08                	jne    aa4 <semaphore_create+0x44>
 a9c:	89 04 24             	mov    %eax,(%esp)
 a9f:	e8 e4 f9 ff ff       	call   488 <binary_sem_down>
 aa4:	89 d8                	mov    %ebx,%eax
 aa6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 aa9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 aac:	8b 7d fc             	mov    -0x4(%ebp),%edi
 aaf:	89 ec                	mov    %ebp,%esp
 ab1:	5d                   	pop    %ebp
 ab2:	c3                   	ret    
 ab3:	90                   	nop
 ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ab8:	c7 44 24 04 b8 0d 00 	movl   $0xdb8,0x4(%esp)
 abf:	00 
 ac0:	31 db                	xor    %ebx,%ebx
 ac2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ac9:	e8 82 fa ff ff       	call   550 <printf>
 ace:	eb d4                	jmp    aa4 <semaphore_create+0x44>

00000ad0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 ad6:	8b 45 08             	mov    0x8(%ebp),%eax
 ad9:	8b 00                	mov    (%eax),%eax
 adb:	89 45 08             	mov    %eax,0x8(%ebp)
}
 ade:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 adf:	e9 ac f9 ff ff       	jmp    490 <binary_sem_up>
 ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000af0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
 af3:	56                   	push   %esi
 af4:	53                   	push   %ebx
 af5:	83 ec 10             	sub    $0x10,%esp
 af8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 afb:	8b 43 08             	mov    0x8(%ebx),%eax
 afe:	89 04 24             	mov    %eax,(%esp)
 b01:	e8 5a fe ff ff       	call   960 <sem_down>
	binary_sem_down(bb->mutex);
 b06:	8b 03                	mov    (%ebx),%eax
 b08:	89 04 24             	mov    %eax,(%esp)
 b0b:	e8 78 f9 ff ff       	call   488 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 b10:	8b 43 14             	mov    0x14(%ebx),%eax
 b13:	c1 e0 02             	shl    $0x2,%eax
 b16:	03 43 0c             	add    0xc(%ebx),%eax
 b19:	8b 30                	mov    (%eax),%esi
 b1b:	85 f6                	test   %esi,%esi
 b1d:	74 42                	je     b61 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 b1f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 b25:	8b 53 18             	mov    0x18(%ebx),%edx
 b28:	8b 43 14             	mov    0x14(%ebx),%eax
 b2b:	83 ea 01             	sub    $0x1,%edx
 b2e:	39 d0                	cmp    %edx,%eax
 b30:	74 26                	je     b58 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 b32:	83 c0 01             	add    $0x1,%eax
 b35:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 b38:	8b 03                	mov    (%ebx),%eax
 b3a:	89 04 24             	mov    %eax,(%esp)
 b3d:	e8 4e f9 ff ff       	call   490 <binary_sem_up>
	sem_up(bb->empty);
 b42:	8b 43 04             	mov    0x4(%ebx),%eax
 b45:	89 04 24             	mov    %eax,(%esp)
 b48:	e8 b3 fe ff ff       	call   a00 <sem_up>
	return element;
}
 b4d:	83 c4 10             	add    $0x10,%esp
 b50:	89 f0                	mov    %esi,%eax
 b52:	5b                   	pop    %ebx
 b53:	5e                   	pop    %esi
 b54:	5d                   	pop    %ebp
 b55:	c3                   	ret    
 b56:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 b58:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 b5f:	eb d7                	jmp    b38 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 b61:	c7 44 24 04 e0 0d 00 	movl   $0xde0,0x4(%esp)
 b68:	00 
 b69:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b70:	e8 db f9 ff ff       	call   550 <printf>
 b75:	eb c1                	jmp    b38 <semaphore_pop+0x48>
 b77:	89 f6                	mov    %esi,%esi
 b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	56                   	push   %esi
 b84:	53                   	push   %ebx
 b85:	83 ec 10             	sub    $0x10,%esp
 b88:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b8b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 b8e:	8b 43 04             	mov    0x4(%ebx),%eax
 b91:	89 04 24             	mov    %eax,(%esp)
 b94:	e8 c7 fd ff ff       	call   960 <sem_down>
	binary_sem_down(bb->mutex);
 b99:	8b 03                	mov    (%ebx),%eax
 b9b:	89 04 24             	mov    %eax,(%esp)
 b9e:	e8 e5 f8 ff ff       	call   488 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 ba3:	8b 43 10             	mov    0x10(%ebx),%eax
 ba6:	c1 e0 02             	shl    $0x2,%eax
 ba9:	03 43 0c             	add    0xc(%ebx),%eax
 bac:	8b 10                	mov    (%eax),%edx
 bae:	85 d2                	test   %edx,%edx
 bb0:	74 26                	je     bd8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 bb2:	c7 44 24 04 24 0e 00 	movl   $0xe24,0x4(%esp)
 bb9:	00 
 bba:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 bc1:	e8 8a f9 ff ff       	call   550 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 bc6:	8b 43 08             	mov    0x8(%ebx),%eax
 bc9:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bcc:	83 c4 10             	add    $0x10,%esp
 bcf:	5b                   	pop    %ebx
 bd0:	5e                   	pop    %esi
 bd1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 bd2:	e9 29 fe ff ff       	jmp    a00 <sem_up>
 bd7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 bd8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 bda:	8b 53 18             	mov    0x18(%ebx),%edx
 bdd:	8b 43 10             	mov    0x10(%ebx),%eax
 be0:	83 ea 01             	sub    $0x1,%edx
 be3:	39 d0                	cmp    %edx,%eax
 be5:	74 09                	je     bf0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 be7:	83 c0 01             	add    $0x1,%eax
 bea:	89 43 10             	mov    %eax,0x10(%ebx)
 bed:	eb d7                	jmp    bc6 <semaphore_put_atomic+0x46>
 bef:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 bf0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 bf7:	eb cd                	jmp    bc6 <semaphore_put_atomic+0x46>
 bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c00 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 c00:	55                   	push   %ebp
 c01:	89 e5                	mov    %esp,%ebp
 c03:	56                   	push   %esi
 c04:	53                   	push   %ebx
 c05:	83 ec 10             	sub    $0x10,%esp
 c08:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c0b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 c0e:	8b 43 04             	mov    0x4(%ebx),%eax
 c11:	89 04 24             	mov    %eax,(%esp)
 c14:	e8 47 fd ff ff       	call   960 <sem_down>
	binary_sem_down(bb->mutex);
 c19:	8b 03                	mov    (%ebx),%eax
 c1b:	89 04 24             	mov    %eax,(%esp)
 c1e:	e8 65 f8 ff ff       	call   488 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 c23:	8b 43 10             	mov    0x10(%ebx),%eax
 c26:	c1 e0 02             	shl    $0x2,%eax
 c29:	03 43 0c             	add    0xc(%ebx),%eax
 c2c:	8b 08                	mov    (%eax),%ecx
 c2e:	85 c9                	test   %ecx,%ecx
 c30:	74 36                	je     c68 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c32:	c7 44 24 04 24 0e 00 	movl   $0xe24,0x4(%esp)
 c39:	00 
 c3a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c41:	e8 0a f9 ff ff       	call   550 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 c46:	8b 03                	mov    (%ebx),%eax
 c48:	89 04 24             	mov    %eax,(%esp)
 c4b:	e8 40 f8 ff ff       	call   490 <binary_sem_up>
	sem_up(bb->full);
 c50:	8b 43 08             	mov    0x8(%ebx),%eax
 c53:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c56:	83 c4 10             	add    $0x10,%esp
 c59:	5b                   	pop    %ebx
 c5a:	5e                   	pop    %esi
 c5b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 c5c:	e9 9f fd ff ff       	jmp    a00 <sem_up>
 c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
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
 c75:	74 09                	je     c80 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c77:	83 c0 01             	add    $0x1,%eax
 c7a:	89 43 10             	mov    %eax,0x10(%ebx)
 c7d:	eb c7                	jmp    c46 <semaphore_put+0x46>
 c7f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c80:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c87:	eb bd                	jmp    c46 <semaphore_put+0x46>
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 c90:	55                   	push   %ebp
 c91:	89 e5                	mov    %esp,%ebp
 c93:	83 ec 18             	sub    $0x18,%esp
 c96:	89 75 fc             	mov    %esi,-0x4(%ebp)
 c99:	8b 75 08             	mov    0x8(%ebp),%esi
 c9c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 c9f:	85 f6                	test   %esi,%esi
 ca1:	79 15                	jns    cb8 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 ca3:	31 db                	xor    %ebx,%ebx
}
 ca5:	89 d8                	mov    %ebx,%eax
 ca7:	8b 75 fc             	mov    -0x4(%ebp),%esi
 caa:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 cad:	89 ec                	mov    %ebp,%esp
 caf:	5d                   	pop    %ebp
 cb0:	c3                   	ret    
 cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 cb8:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 cbf:	e8 2c fb ff ff       	call   7f0 <malloc>
 cc4:	85 c0                	test   %eax,%eax
 cc6:	89 c3                	mov    %eax,%ebx
 cc8:	74 db                	je     ca5 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 cca:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 cd1:	89 04 24             	mov    %eax,(%esp)
 cd4:	e8 17 fb ff ff       	call   7f0 <malloc>
 cd9:	85 c0                	test   %eax,%eax
 cdb:	89 43 0c             	mov    %eax,0xc(%ebx)
 cde:	74 c3                	je     ca3 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 ce0:	89 34 24             	mov    %esi,(%esp)
 ce3:	e8 78 fd ff ff       	call   a60 <semaphore_create>
 ce8:	85 c0                	test   %eax,%eax
 cea:	89 43 04             	mov    %eax,0x4(%ebx)
 ced:	74 b4                	je     ca3 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 cef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 cf6:	e8 65 fd ff ff       	call   a60 <semaphore_create>
 cfb:	85 c0                	test   %eax,%eax
 cfd:	89 43 08             	mov    %eax,0x8(%ebx)
 d00:	74 a1                	je     ca3 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 d02:	e8 79 f7 ff ff       	call   480 <binary_sem_create>
	ret->produce = 0;
 d07:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 d0e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 d15:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 d18:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 d1a:	eb 89                	jmp    ca5 <BB_create+0x15>
