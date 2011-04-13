
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	53                   	push   %ebx
   7:	83 ec 1c             	sub    $0x1c,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 ac 0c 00 00 	movl   $0xcac,(%esp)
  19:	e8 6a 03 00 00       	call   388 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 b7 00 00 00    	js     dd <main+0xdd>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 8e 03 00 00       	call   3c0 <dup>
  dup(0);  // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 82 03 00 00       	call   3c0 <dup>
  3e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  40:	c7 44 24 04 b4 0c 00 	movl   $0xcb4,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 8c 04 00 00       	call   4e0 <printf>
    pid = fork();
  54:	e8 e7 02 00 00       	call   340 <fork>
    if(pid < 0){
  59:	83 f8 00             	cmp    $0x0,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
  5c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5e:	7c 30                	jl     90 <main+0x90>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  60:	74 4e                	je     b0 <main+0xb0>
  62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  68:	e8 e3 02 00 00       	call   350 <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	90                   	nop
  70:	78 ce                	js     40 <main+0x40>
  72:	39 c3                	cmp    %eax,%ebx
  74:	74 ca                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  76:	c7 44 24 04 f3 0c 00 	movl   $0xcf3,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 56 04 00 00       	call   4e0 <printf>
  8a:	eb d6                	jmp    62 <main+0x62>
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 c7 0c 00 	movl   $0xcc7,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 3c 04 00 00       	call   4e0 <printf>
      exit();
  a4:	e8 9f 02 00 00       	call   348 <exit>
  a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    if(pid == 0){
      exec("sh", argv);
  b0:	c7 44 24 04 c4 0d 00 	movl   $0xdc4,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 da 0c 00 00 	movl   $0xcda,(%esp)
  bf:	e8 bc 02 00 00       	call   380 <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 dd 0c 00 	movl   $0xcdd,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 08 04 00 00       	call   4e0 <printf>
      exit();
  d8:	e8 6b 02 00 00       	call   348 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  dd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  e4:	00 
  e5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  ec:	00 
  ed:	c7 04 24 ac 0c 00 00 	movl   $0xcac,(%esp)
  f4:	e8 97 02 00 00       	call   390 <mknod>
    open("console", O_RDWR);
  f9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 100:	00 
 101:	c7 04 24 ac 0c 00 00 	movl   $0xcac,(%esp)
 108:	e8 7b 02 00 00       	call   388 <open>
 10d:	e9 14 ff ff ff       	jmp    26 <main+0x26>
 112:	90                   	nop
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 120:	55                   	push   %ebp
 121:	31 d2                	xor    %edx,%edx
 123:	89 e5                	mov    %esp,%ebp
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	53                   	push   %ebx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 130:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 134:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 c9                	test   %cl,%cl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	5b                   	pop    %ebx
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <strcmp>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 4d 08             	mov    0x8(%ebp),%ecx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 15a:	0f b6 01             	movzbl (%ecx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 14                	jne    175 <strcmp+0x25>
 161:	eb 25                	jmp    188 <strcmp+0x38>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 168:	83 c1 01             	add    $0x1,%ecx
 16b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 16e:	0f b6 01             	movzbl (%ecx),%eax
 171:	84 c0                	test   %al,%al
 173:	74 13                	je     188 <strcmp+0x38>
 175:	0f b6 1a             	movzbl (%edx),%ebx
 178:	38 d8                	cmp    %bl,%al
 17a:	74 ec                	je     168 <strcmp+0x18>
 17c:	0f b6 db             	movzbl %bl,%ebx
 17f:	0f b6 c0             	movzbl %al,%eax
 182:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 184:	5b                   	pop    %ebx
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 188:	0f b6 1a             	movzbl (%edx),%ebx
 18b:	31 c0                	xor    %eax,%eax
 18d:	0f b6 db             	movzbl %bl,%ebx
 190:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 192:	5b                   	pop    %ebx
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    
 195:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strlen>:

uint
strlen(char *s)
{
 1a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1a1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 1a5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1aa:	80 39 00             	cmpb   $0x0,(%ecx)
 1ad:	74 0c                	je     1bb <strlen+0x1b>
 1af:	90                   	nop
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 11                	jne    202 <strchr+0x22>
 1f1:	eb 15                	jmp    208 <strchr+0x28>
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f8:	83 c0 01             	add    $0x1,%eax
 1fb:	0f b6 10             	movzbl (%eax),%edx
 1fe:	84 d2                	test   %dl,%dl
 200:	74 06                	je     208 <strchr+0x28>
    if(*s == c)
 202:	38 ca                	cmp    %cl,%dl
 204:	75 f2                	jne    1f8 <strchr+0x18>
      return (char*) s;
  return 0;
}
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 208:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 20a:	5d                   	pop    %ebp
 20b:	90                   	nop
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <atoi>
 213:	90                   	nop
 214:	90                   	nop
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

00000220 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 221:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 4d 08             	mov    0x8(%ebp),%ecx
 228:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	0f b6 11             	movzbl (%ecx),%edx
 22c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 22f:	80 fb 09             	cmp    $0x9,%bl
 232:	77 1c                	ja     250 <atoi+0x30>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 238:	0f be d2             	movsbl %dl,%edx
 23b:	83 c1 01             	add    $0x1,%ecx
 23e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 241:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 245:	0f b6 11             	movzbl (%ecx),%edx
 248:	8d 5a d0             	lea    -0x30(%edx),%ebx
 24b:	80 fb 09             	cmp    $0x9,%bl
 24e:	76 e8                	jbe    238 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	53                   	push   %ebx
 268:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 db                	test   %ebx,%ebx
 270:	7e 14                	jle    286 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 272:	31 d2                	xor    %edx,%edx
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 296:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 299:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 29c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 29f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ab:	00 
 2ac:	89 04 24             	mov    %eax,(%esp)
 2af:	e8 d4 00 00 00       	call   388 <open>
  if(fd < 0)
 2b4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2b8:	78 19                	js     2d3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 1c 24             	mov    %ebx,(%esp)
 2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c4:	e8 d7 00 00 00       	call   3a0 <fstat>
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2cc:	89 c6                	mov    %eax,%esi
  close(fd);
 2ce:	e8 9d 00 00 00       	call   370 <close>
  return r;
}
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2d8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2db:	89 ec                	mov    %ebp,%esp
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop

000002e0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	31 f6                	xor    %esi,%esi
 2e7:	53                   	push   %ebx
 2e8:	83 ec 2c             	sub    $0x2c,%esp
 2eb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ee:	eb 06                	jmp    2f6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f0:	3c 0a                	cmp    $0xa,%al
 2f2:	74 39                	je     32d <gets+0x4d>
 2f4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f6:	8d 5e 01             	lea    0x1(%esi),%ebx
 2f9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fc:	7d 31                	jge    32f <gets+0x4f>
    cc = read(0, &c, 1);
 2fe:	8d 45 e7             	lea    -0x19(%ebp),%eax
 301:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 308:	00 
 309:	89 44 24 04          	mov    %eax,0x4(%esp)
 30d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 314:	e8 47 00 00 00       	call   360 <read>
    if(cc < 1)
 319:	85 c0                	test   %eax,%eax
 31b:	7e 12                	jle    32f <gets+0x4f>
      break;
    buf[i++] = c;
 31d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 321:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 325:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 329:	3c 0d                	cmp    $0xd,%al
 32b:	75 c3                	jne    2f0 <gets+0x10>
 32d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 333:	89 f8                	mov    %edi,%eax
 335:	83 c4 2c             	add    $0x2c,%esp
 338:	5b                   	pop    %ebx
 339:	5e                   	pop    %esi
 33a:	5f                   	pop    %edi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <fork>:
 340:	b8 01 00 00 00       	mov    $0x1,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exit>:
 348:	b8 02 00 00 00       	mov    $0x2,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <wait>:
 350:	b8 03 00 00 00       	mov    $0x3,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <pipe>:
 358:	b8 04 00 00 00       	mov    $0x4,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <read>:
 360:	b8 06 00 00 00       	mov    $0x6,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <write>:
 368:	b8 05 00 00 00       	mov    $0x5,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <close>:
 370:	b8 07 00 00 00       	mov    $0x7,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <kill>:
 378:	b8 08 00 00 00       	mov    $0x8,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <exec>:
 380:	b8 09 00 00 00       	mov    $0x9,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <open>:
 388:	b8 0a 00 00 00       	mov    $0xa,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <mknod>:
 390:	b8 0b 00 00 00       	mov    $0xb,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <unlink>:
 398:	b8 0c 00 00 00       	mov    $0xc,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <fstat>:
 3a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <link>:
 3a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <mkdir>:
 3b0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <chdir>:
 3b8:	b8 10 00 00 00       	mov    $0x10,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <dup>:
 3c0:	b8 11 00 00 00       	mov    $0x11,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <getpid>:
 3c8:	b8 12 00 00 00       	mov    $0x12,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <sbrk>:
 3d0:	b8 13 00 00 00       	mov    $0x13,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <sleep>:
 3d8:	b8 14 00 00 00       	mov    $0x14,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <uptime>:
 3e0:	b8 15 00 00 00       	mov    $0x15,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <thread_create>:
 3e8:	b8 16 00 00 00       	mov    $0x16,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <thread_getid>:
 3f0:	b8 17 00 00 00       	mov    $0x17,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <thread_getProcid>:
 3f8:	b8 18 00 00 00       	mov    $0x18,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <thread_exit>:
 400:	b8 1a 00 00 00       	mov    $0x1a,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <thread_join>:
 408:	b8 19 00 00 00       	mov    $0x19,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <binary_sem_create>:
 410:	b8 1b 00 00 00       	mov    $0x1b,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <binary_sem_down>:
 418:	b8 1c 00 00 00       	mov    $0x1c,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <binary_sem_up>:
 420:	b8 1d 00 00 00       	mov    $0x1d,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <binary_sem_clear>:
 428:	b8 1e 00 00 00       	mov    $0x1e,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <exit_all_threads>:
 430:	b8 1f 00 00 00       	mov    $0x1f,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    
 438:	90                   	nop
 439:	90                   	nop
 43a:	90                   	nop
 43b:	90                   	nop
 43c:	90                   	nop
 43d:	90                   	nop
 43e:	90                   	nop
 43f:	90                   	nop

00000440 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	89 cf                	mov    %ecx,%edi
 446:	56                   	push   %esi
 447:	89 c6                	mov    %eax,%esi
 449:	53                   	push   %ebx
 44a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 44d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 450:	85 c9                	test   %ecx,%ecx
 452:	74 04                	je     458 <printint+0x18>
 454:	85 d2                	test   %edx,%edx
 456:	78 70                	js     4c8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 458:	89 d0                	mov    %edx,%eax
 45a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 461:	31 c9                	xor    %ecx,%ecx
 463:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 466:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 468:	31 d2                	xor    %edx,%edx
 46a:	f7 f7                	div    %edi
 46c:	0f b6 92 03 0d 00 00 	movzbl 0xd03(%edx),%edx
 473:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 476:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 479:	85 c0                	test   %eax,%eax
 47b:	75 eb                	jne    468 <printint+0x28>
	if(neg)
 47d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 480:	85 c0                	test   %eax,%eax
 482:	74 08                	je     48c <printint+0x4c>
		buf[i++] = '-';
 484:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 489:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 48c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 48f:	01 fb                	add    %edi,%ebx
 491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 498:	0f b6 03             	movzbl (%ebx),%eax
 49b:	83 ef 01             	sub    $0x1,%edi
 49e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a8:	00 
 4a9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 4ac:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4af:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b6:	e8 ad fe ff ff       	call   368 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 4bb:	83 ff ff             	cmp    $0xffffffff,%edi
 4be:	75 d8                	jne    498 <printint+0x58>
		putc(fd, buf[i]);
}
 4c0:	83 c4 4c             	add    $0x4c,%esp
 4c3:	5b                   	pop    %ebx
 4c4:	5e                   	pop    %esi
 4c5:	5f                   	pop    %edi
 4c6:	5d                   	pop    %ebp
 4c7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	f7 d8                	neg    %eax
 4cc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4d3:	eb 8c                	jmp    461 <printint+0x21>
 4d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	0f b6 10             	movzbl (%eax),%edx
 4ef:	84 d2                	test   %dl,%dl
 4f1:	0f 84 c9 00 00 00    	je     5c0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4fa:	31 ff                	xor    %edi,%edi
 4fc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4ff:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 501:	8d 75 e7             	lea    -0x19(%ebp),%esi
 504:	eb 1e                	jmp    524 <printf+0x44>
 506:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 508:	83 fa 25             	cmp    $0x25,%edx
 50b:	0f 85 b7 00 00 00    	jne    5c8 <printf+0xe8>
 511:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 515:	83 c3 01             	add    $0x1,%ebx
 518:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 51c:	84 d2                	test   %dl,%dl
 51e:	0f 84 9c 00 00 00    	je     5c0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 524:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 526:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 529:	74 dd                	je     508 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 52b:	83 ff 25             	cmp    $0x25,%edi
 52e:	75 e5                	jne    515 <printf+0x35>
			if(c == 'd'){
 530:	83 fa 64             	cmp    $0x64,%edx
 533:	0f 84 57 01 00 00    	je     690 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 539:	83 fa 70             	cmp    $0x70,%edx
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	0f 84 aa 00 00 00    	je     5f0 <printf+0x110>
 546:	83 fa 78             	cmp    $0x78,%edx
 549:	0f 84 a1 00 00 00    	je     5f0 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 54f:	83 fa 73             	cmp    $0x73,%edx
 552:	0f 84 c0 00 00 00    	je     618 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 558:	83 fa 63             	cmp    $0x63,%edx
 55b:	90                   	nop
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 560:	0f 84 52 01 00 00    	je     6b8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 566:	83 fa 25             	cmp    $0x25,%edx
 569:	0f 84 f9 00 00 00    	je     668 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 56f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 572:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 575:	31 ff                	xor    %edi,%edi
 577:	89 55 cc             	mov    %edx,-0x34(%ebp)
 57a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 585:	00 
 586:	89 0c 24             	mov    %ecx,(%esp)
 589:	89 74 24 04          	mov    %esi,0x4(%esp)
 58d:	e8 d6 fd ff ff       	call   368 <write>
 592:	8b 55 cc             	mov    -0x34(%ebp),%edx
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59f:	00 
 5a0:	89 74 24 04          	mov    %esi,0x4(%esp)
 5a4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5a7:	89 04 24             	mov    %eax,(%esp)
 5aa:	e8 b9 fd ff ff       	call   368 <write>
 5af:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5b2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5b6:	84 d2                	test   %dl,%dl
 5b8:	0f 85 66 ff ff ff    	jne    524 <printf+0x44>
 5be:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 5c0:	83 c4 3c             	add    $0x3c,%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 5cb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d5:	00 
 5d6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5da:	89 04 24             	mov    %eax,(%esp)
 5dd:	e8 86 fd ff ff       	call   368 <write>
 5e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e5:	e9 2b ff ff ff       	jmp    515 <printf+0x35>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 5f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 5f8:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 5fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 601:	8b 10                	mov    (%eax),%edx
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	e8 35 fe ff ff       	call   440 <printint>
 60b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 60e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 612:	e9 fe fe ff ff       	jmp    515 <printf+0x35>
 617:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 618:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 61b:	8b 3a                	mov    (%edx),%edi
				ap++;
 61d:	83 c2 04             	add    $0x4,%edx
 620:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 623:	85 ff                	test   %edi,%edi
 625:	0f 84 ba 00 00 00    	je     6e5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 62b:	0f b6 17             	movzbl (%edi),%edx
 62e:	84 d2                	test   %dl,%dl
 630:	74 2d                	je     65f <printf+0x17f>
 632:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 635:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 638:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 63b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 63e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 645:	00 
 646:	89 74 24 04          	mov    %esi,0x4(%esp)
 64a:	89 1c 24             	mov    %ebx,(%esp)
 64d:	e8 16 fd ff ff       	call   368 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 652:	0f b6 17             	movzbl (%edi),%edx
 655:	84 d2                	test   %dl,%dl
 657:	75 df                	jne    638 <printf+0x158>
 659:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 65c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 65f:	31 ff                	xor    %edi,%edi
 661:	e9 af fe ff ff       	jmp    515 <printf+0x35>
 666:	66 90                	xchg   %ax,%ax
 668:	8b 55 08             	mov    0x8(%ebp),%edx
 66b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 66d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 671:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 678:	00 
 679:	89 74 24 04          	mov    %esi,0x4(%esp)
 67d:	89 14 24             	mov    %edx,(%esp)
 680:	e8 e3 fc ff ff       	call   368 <write>
 685:	8b 45 0c             	mov    0xc(%ebp),%eax
 688:	e9 88 fe ff ff       	jmp    515 <printf+0x35>
 68d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 690:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 698:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 69b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6a2:	8b 10                	mov    (%eax),%edx
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	e8 94 fd ff ff       	call   440 <printint>
 6ac:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 6af:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6b3:	e9 5d fe ff ff       	jmp    515 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6b8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 6bb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6bd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6bf:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c6:	00 
 6c7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6cb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 8f fc ff ff       	call   368 <write>
 6d9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 6dc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6e0:	e9 30 fe ff ff       	jmp    515 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 6e5:	bf fc 0c 00 00       	mov    $0xcfc,%edi
 6ea:	e9 3c ff ff ff       	jmp    62b <printf+0x14b>
 6ef:	90                   	nop

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 d4 0d 00 00       	mov    0xdd4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	39 c8                	cmp    %ecx,%eax
 703:	73 1d                	jae    722 <free+0x32>
 705:	8d 76 00             	lea    0x0(%esi),%esi
 708:	8b 10                	mov    (%eax),%edx
 70a:	39 d1                	cmp    %edx,%ecx
 70c:	72 1a                	jb     728 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70e:	39 d0                	cmp    %edx,%eax
 710:	72 08                	jb     71a <free+0x2a>
 712:	39 c8                	cmp    %ecx,%eax
 714:	72 12                	jb     728 <free+0x38>
 716:	39 d1                	cmp    %edx,%ecx
 718:	72 0e                	jb     728 <free+0x38>
 71a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71c:	39 c8                	cmp    %ecx,%eax
 71e:	66 90                	xchg   %ax,%ax
 720:	72 e6                	jb     708 <free+0x18>
 722:	8b 10                	mov    (%eax),%edx
 724:	eb e8                	jmp    70e <free+0x1e>
 726:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 728:	8b 71 04             	mov    0x4(%ecx),%esi
 72b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72e:	39 d7                	cmp    %edx,%edi
 730:	74 19                	je     74b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 732:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 735:	8b 50 04             	mov    0x4(%eax),%edx
 738:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 73b:	39 ce                	cmp    %ecx,%esi
 73d:	74 23                	je     762 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 73f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 741:	a3 d4 0d 00 00       	mov    %eax,0xdd4
}
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 74b:	03 72 04             	add    0x4(%edx),%esi
 74e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 751:	8b 10                	mov    (%eax),%edx
 753:	8b 12                	mov    (%edx),%edx
 755:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 758:	8b 50 04             	mov    0x4(%eax),%edx
 75b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 75e:	39 ce                	cmp    %ecx,%esi
 760:	75 dd                	jne    73f <free+0x4f>
    p->s.size += bp->s.size;
 762:	03 51 04             	add    0x4(%ecx),%edx
 765:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 768:	8b 53 f8             	mov    -0x8(%ebx),%edx
 76b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 76d:	a3 d4 0d 00 00       	mov    %eax,0xdd4
}
 772:	5b                   	pop    %ebx
 773:	5e                   	pop    %esi
 774:	5f                   	pop    %edi
 775:	5d                   	pop    %ebp
 776:	c3                   	ret    
 777:	89 f6                	mov    %esi,%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 78c:	8b 0d d4 0d 00 00    	mov    0xdd4,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	83 c3 07             	add    $0x7,%ebx
 795:	c1 eb 03             	shr    $0x3,%ebx
 798:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 79b:	85 c9                	test   %ecx,%ecx
 79d:	0f 84 93 00 00 00    	je     836 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7a5:	8b 50 04             	mov    0x4(%eax),%edx
 7a8:	39 d3                	cmp    %edx,%ebx
 7aa:	76 1f                	jbe    7cb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 7ac:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7b3:	90                   	nop
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 7b8:	3b 05 d4 0d 00 00    	cmp    0xdd4,%eax
 7be:	74 30                	je     7f0 <malloc+0x70>
 7c0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7c4:	8b 50 04             	mov    0x4(%eax),%edx
 7c7:	39 d3                	cmp    %edx,%ebx
 7c9:	77 ed                	ja     7b8 <malloc+0x38>
      if(p->s.size == nunits)
 7cb:	39 d3                	cmp    %edx,%ebx
 7cd:	74 61                	je     830 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7cf:	29 da                	sub    %ebx,%edx
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7d7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7da:	89 0d d4 0d 00 00    	mov    %ecx,0xdd4
      return (void*) (p + 1);
 7e0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7e3:	83 c4 1c             	add    $0x1c,%esp
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    
 7eb:	90                   	nop
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7f0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 7f6:	b8 00 80 00 00       	mov    $0x8000,%eax
 7fb:	bf 00 10 00 00       	mov    $0x1000,%edi
 800:	76 04                	jbe    806 <malloc+0x86>
 802:	89 f0                	mov    %esi,%eax
 804:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 806:	89 04 24             	mov    %eax,(%esp)
 809:	e8 c2 fb ff ff       	call   3d0 <sbrk>
  if(p == (char*) -1)
 80e:	83 f8 ff             	cmp    $0xffffffff,%eax
 811:	74 18                	je     82b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 813:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 816:	83 c0 08             	add    $0x8,%eax
 819:	89 04 24             	mov    %eax,(%esp)
 81c:	e8 cf fe ff ff       	call   6f0 <free>
  return freep;
 821:	8b 0d d4 0d 00 00    	mov    0xdd4,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 827:	85 c9                	test   %ecx,%ecx
 829:	75 97                	jne    7c2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 82b:	31 c0                	xor    %eax,%eax
 82d:	eb b4                	jmp    7e3 <malloc+0x63>
 82f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 830:	8b 10                	mov    (%eax),%edx
 832:	89 11                	mov    %edx,(%ecx)
 834:	eb a4                	jmp    7da <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 836:	c7 05 d4 0d 00 00 cc 	movl   $0xdcc,0xdd4
 83d:	0d 00 00 
    base.s.size = 0;
 840:	b9 cc 0d 00 00       	mov    $0xdcc,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 845:	c7 05 cc 0d 00 00 cc 	movl   $0xdcc,0xdcc
 84c:	0d 00 00 
    base.s.size = 0;
 84f:	c7 05 d0 0d 00 00 00 	movl   $0x0,0xdd0
 856:	00 00 00 
 859:	e9 45 ff ff ff       	jmp    7a3 <malloc+0x23>
 85e:	90                   	nop
 85f:	90                   	nop

00000860 <sem_clear>:
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	53                   	push   %ebx
 864:	83 ec 14             	sub    $0x14,%esp
 867:	8b 5d 08             	mov    0x8(%ebp),%ebx
 86a:	8b 03                	mov    (%ebx),%eax
 86c:	89 04 24             	mov    %eax,(%esp)
 86f:	e8 b4 fb ff ff       	call   428 <binary_sem_clear>
 874:	8b 43 04             	mov    0x4(%ebx),%eax
 877:	89 04 24             	mov    %eax,(%esp)
 87a:	e8 a9 fb ff ff       	call   428 <binary_sem_clear>
 87f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 882:	83 c4 14             	add    $0x14,%esp
 885:	5b                   	pop    %ebx
 886:	5d                   	pop    %ebp
 887:	e9 64 fe ff ff       	jmp    6f0 <free>
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000890 <sem_downs>:
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	83 ec 18             	sub    $0x18,%esp
 896:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 899:	8b 5d 08             	mov    0x8(%ebp),%ebx
 89c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 89f:	8b 75 0c             	mov    0xc(%ebp),%esi
 8a2:	8b 43 04             	mov    0x4(%ebx),%eax
 8a5:	89 04 24             	mov    %eax,(%esp)
 8a8:	e8 6b fb ff ff       	call   418 <binary_sem_down>
 8ad:	8b 03                	mov    (%ebx),%eax
 8af:	89 04 24             	mov    %eax,(%esp)
 8b2:	e8 61 fb ff ff       	call   418 <binary_sem_down>
 8b7:	8b 43 08             	mov    0x8(%ebx),%eax
 8ba:	29 f0                	sub    %esi,%eax
 8bc:	85 c0                	test   %eax,%eax
 8be:	89 43 08             	mov    %eax,0x8(%ebx)
 8c1:	74 0b                	je     8ce <sem_downs+0x3e>
 8c3:	8b 43 04             	mov    0x4(%ebx),%eax
 8c6:	89 04 24             	mov    %eax,(%esp)
 8c9:	e8 52 fb ff ff       	call   420 <binary_sem_up>
 8ce:	8b 03                	mov    (%ebx),%eax
 8d0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 8d3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 8d6:	89 45 08             	mov    %eax,0x8(%ebp)
 8d9:	89 ec                	mov    %ebp,%esp
 8db:	5d                   	pop    %ebp
 8dc:	e9 3f fb ff ff       	jmp    420 <binary_sem_up>
 8e1:	eb 0d                	jmp    8f0 <sem_down>
 8e3:	90                   	nop
 8e4:	90                   	nop
 8e5:	90                   	nop
 8e6:	90                   	nop
 8e7:	90                   	nop
 8e8:	90                   	nop
 8e9:	90                   	nop
 8ea:	90                   	nop
 8eb:	90                   	nop
 8ec:	90                   	nop
 8ed:	90                   	nop
 8ee:	90                   	nop
 8ef:	90                   	nop

000008f0 <sem_down>:
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	53                   	push   %ebx
 8f4:	83 ec 14             	sub    $0x14,%esp
 8f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8fa:	8b 43 04             	mov    0x4(%ebx),%eax
 8fd:	89 04 24             	mov    %eax,(%esp)
 900:	e8 13 fb ff ff       	call   418 <binary_sem_down>
 905:	8b 03                	mov    (%ebx),%eax
 907:	89 04 24             	mov    %eax,(%esp)
 90a:	e8 09 fb ff ff       	call   418 <binary_sem_down>
 90f:	8b 43 08             	mov    0x8(%ebx),%eax
 912:	83 e8 01             	sub    $0x1,%eax
 915:	85 c0                	test   %eax,%eax
 917:	89 43 08             	mov    %eax,0x8(%ebx)
 91a:	74 0b                	je     927 <sem_down+0x37>
 91c:	8b 43 04             	mov    0x4(%ebx),%eax
 91f:	89 04 24             	mov    %eax,(%esp)
 922:	e8 f9 fa ff ff       	call   420 <binary_sem_up>
 927:	8b 03                	mov    (%ebx),%eax
 929:	89 45 08             	mov    %eax,0x8(%ebp)
 92c:	83 c4 14             	add    $0x14,%esp
 92f:	5b                   	pop    %ebx
 930:	5d                   	pop    %ebp
 931:	e9 ea fa ff ff       	jmp    420 <binary_sem_up>
 936:	8d 76 00             	lea    0x0(%esi),%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000940 <sem_ups>:
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	83 ec 18             	sub    $0x18,%esp
 946:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 949:	8b 5d 08             	mov    0x8(%ebp),%ebx
 94c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 94f:	8b 75 0c             	mov    0xc(%ebp),%esi
 952:	8b 03                	mov    (%ebx),%eax
 954:	89 04 24             	mov    %eax,(%esp)
 957:	e8 bc fa ff ff       	call   418 <binary_sem_down>
 95c:	03 73 08             	add    0x8(%ebx),%esi
 95f:	83 fe 01             	cmp    $0x1,%esi
 962:	89 73 08             	mov    %esi,0x8(%ebx)
 965:	74 19                	je     980 <sem_ups+0x40>
 967:	8b 03                	mov    (%ebx),%eax
 969:	8b 75 fc             	mov    -0x4(%ebp),%esi
 96c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 96f:	89 45 08             	mov    %eax,0x8(%ebp)
 972:	89 ec                	mov    %ebp,%esp
 974:	5d                   	pop    %ebp
 975:	e9 a6 fa ff ff       	jmp    420 <binary_sem_up>
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 980:	8b 43 04             	mov    0x4(%ebx),%eax
 983:	89 04 24             	mov    %eax,(%esp)
 986:	e8 95 fa ff ff       	call   420 <binary_sem_up>
 98b:	eb da                	jmp    967 <sem_ups+0x27>
 98d:	8d 76 00             	lea    0x0(%esi),%esi

00000990 <sem_up>:
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	53                   	push   %ebx
 994:	83 ec 14             	sub    $0x14,%esp
 997:	8b 5d 08             	mov    0x8(%ebp),%ebx
 99a:	8b 03                	mov    (%ebx),%eax
 99c:	89 04 24             	mov    %eax,(%esp)
 99f:	e8 74 fa ff ff       	call   418 <binary_sem_down>
 9a4:	8b 43 08             	mov    0x8(%ebx),%eax
 9a7:	83 c0 01             	add    $0x1,%eax
 9aa:	83 f8 01             	cmp    $0x1,%eax
 9ad:	89 43 08             	mov    %eax,0x8(%ebx)
 9b0:	74 16                	je     9c8 <sem_up+0x38>
 9b2:	8b 03                	mov    (%ebx),%eax
 9b4:	89 45 08             	mov    %eax,0x8(%ebp)
 9b7:	83 c4 14             	add    $0x14,%esp
 9ba:	5b                   	pop    %ebx
 9bb:	5d                   	pop    %ebp
 9bc:	e9 5f fa ff ff       	jmp    420 <binary_sem_up>
 9c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9c8:	8b 43 04             	mov    0x4(%ebx),%eax
 9cb:	89 04 24             	mov    %eax,(%esp)
 9ce:	e8 4d fa ff ff       	call   420 <binary_sem_up>
 9d3:	8b 03                	mov    (%ebx),%eax
 9d5:	89 45 08             	mov    %eax,0x8(%ebp)
 9d8:	83 c4 14             	add    $0x14,%esp
 9db:	5b                   	pop    %ebx
 9dc:	5d                   	pop    %ebp
 9dd:	e9 3e fa ff ff       	jmp    420 <binary_sem_up>
 9e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <semaphore_create>:
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	83 ec 28             	sub    $0x28,%esp
 9f6:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 9fd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 a00:	89 75 f8             	mov    %esi,-0x8(%ebp)
 a03:	89 7d fc             	mov    %edi,-0x4(%ebp)
 a06:	8b 7d 08             	mov    0x8(%ebp),%edi
 a09:	e8 72 fd ff ff       	call   780 <malloc>
 a0e:	89 78 08             	mov    %edi,0x8(%eax)
 a11:	89 c3                	mov    %eax,%ebx
 a13:	e8 f8 f9 ff ff       	call   410 <binary_sem_create>
 a18:	89 03                	mov    %eax,(%ebx)
 a1a:	89 c6                	mov    %eax,%esi
 a1c:	e8 ef f9 ff ff       	call   410 <binary_sem_create>
 a21:	01 c6                	add    %eax,%esi
 a23:	89 43 04             	mov    %eax,0x4(%ebx)
 a26:	78 20                	js     a48 <semaphore_create+0x58>
 a28:	85 ff                	test   %edi,%edi
 a2a:	75 08                	jne    a34 <semaphore_create+0x44>
 a2c:	89 04 24             	mov    %eax,(%esp)
 a2f:	e8 e4 f9 ff ff       	call   418 <binary_sem_down>
 a34:	89 d8                	mov    %ebx,%eax
 a36:	8b 75 f8             	mov    -0x8(%ebp),%esi
 a39:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a3c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a3f:	89 ec                	mov    %ebp,%esp
 a41:	5d                   	pop    %ebp
 a42:	c3                   	ret    
 a43:	90                   	nop
 a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a48:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 a4f:	00 
 a50:	31 db                	xor    %ebx,%ebx
 a52:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a59:	e8 82 fa ff ff       	call   4e0 <printf>
 a5e:	eb d4                	jmp    a34 <semaphore_create+0x44>

00000a60 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 a66:	8b 45 08             	mov    0x8(%ebp),%eax
 a69:	8b 00                	mov    (%eax),%eax
 a6b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a6e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 a6f:	e9 ac f9 ff ff       	jmp    420 <binary_sem_up>
 a74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a80 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	56                   	push   %esi
 a84:	53                   	push   %ebx
 a85:	83 ec 10             	sub    $0x10,%esp
 a88:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 a8b:	8b 43 08             	mov    0x8(%ebx),%eax
 a8e:	89 04 24             	mov    %eax,(%esp)
 a91:	e8 5a fe ff ff       	call   8f0 <sem_down>
	binary_sem_down(bb->mutex);
 a96:	8b 03                	mov    (%ebx),%eax
 a98:	89 04 24             	mov    %eax,(%esp)
 a9b:	e8 78 f9 ff ff       	call   418 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 aa0:	8b 43 14             	mov    0x14(%ebx),%eax
 aa3:	c1 e0 02             	shl    $0x2,%eax
 aa6:	03 43 0c             	add    0xc(%ebx),%eax
 aa9:	8b 30                	mov    (%eax),%esi
 aab:	85 f6                	test   %esi,%esi
 aad:	74 42                	je     af1 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 aaf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 ab5:	8b 53 18             	mov    0x18(%ebx),%edx
 ab8:	8b 43 14             	mov    0x14(%ebx),%eax
 abb:	83 ea 01             	sub    $0x1,%edx
 abe:	39 d0                	cmp    %edx,%eax
 ac0:	74 26                	je     ae8 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 ac2:	83 c0 01             	add    $0x1,%eax
 ac5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 ac8:	8b 03                	mov    (%ebx),%eax
 aca:	89 04 24             	mov    %eax,(%esp)
 acd:	e8 4e f9 ff ff       	call   420 <binary_sem_up>
	sem_up(bb->empty);
 ad2:	8b 43 04             	mov    0x4(%ebx),%eax
 ad5:	89 04 24             	mov    %eax,(%esp)
 ad8:	e8 b3 fe ff ff       	call   990 <sem_up>
	return element;
}
 add:	83 c4 10             	add    $0x10,%esp
 ae0:	89 f0                	mov    %esi,%eax
 ae2:	5b                   	pop    %ebx
 ae3:	5e                   	pop    %esi
 ae4:	5d                   	pop    %ebp
 ae5:	c3                   	ret    
 ae6:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 ae8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 aef:	eb d7                	jmp    ac8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 af1:	c7 44 24 04 3c 0d 00 	movl   $0xd3c,0x4(%esp)
 af8:	00 
 af9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b00:	e8 db f9 ff ff       	call   4e0 <printf>
 b05:	eb c1                	jmp    ac8 <semaphore_pop+0x48>
 b07:	89 f6                	mov    %esi,%esi
 b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	56                   	push   %esi
 b14:	53                   	push   %ebx
 b15:	83 ec 10             	sub    $0x10,%esp
 b18:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b1b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 b1e:	8b 43 04             	mov    0x4(%ebx),%eax
 b21:	89 04 24             	mov    %eax,(%esp)
 b24:	e8 c7 fd ff ff       	call   8f0 <sem_down>
	binary_sem_down(bb->mutex);
 b29:	8b 03                	mov    (%ebx),%eax
 b2b:	89 04 24             	mov    %eax,(%esp)
 b2e:	e8 e5 f8 ff ff       	call   418 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 b33:	8b 43 10             	mov    0x10(%ebx),%eax
 b36:	c1 e0 02             	shl    $0x2,%eax
 b39:	03 43 0c             	add    0xc(%ebx),%eax
 b3c:	8b 10                	mov    (%eax),%edx
 b3e:	85 d2                	test   %edx,%edx
 b40:	74 26                	je     b68 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 b42:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 b49:	00 
 b4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b51:	e8 8a f9 ff ff       	call   4e0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 b56:	8b 43 08             	mov    0x8(%ebx),%eax
 b59:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b5c:	83 c4 10             	add    $0x10,%esp
 b5f:	5b                   	pop    %ebx
 b60:	5e                   	pop    %esi
 b61:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 b62:	e9 29 fe ff ff       	jmp    990 <sem_up>
 b67:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 b68:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 b6a:	8b 53 18             	mov    0x18(%ebx),%edx
 b6d:	8b 43 10             	mov    0x10(%ebx),%eax
 b70:	83 ea 01             	sub    $0x1,%edx
 b73:	39 d0                	cmp    %edx,%eax
 b75:	74 09                	je     b80 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 b77:	83 c0 01             	add    $0x1,%eax
 b7a:	89 43 10             	mov    %eax,0x10(%ebx)
 b7d:	eb d7                	jmp    b56 <semaphore_put_atomic+0x46>
 b7f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 b80:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 b87:	eb cd                	jmp    b56 <semaphore_put_atomic+0x46>
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b90 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
 b93:	56                   	push   %esi
 b94:	53                   	push   %ebx
 b95:	83 ec 10             	sub    $0x10,%esp
 b98:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b9b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 b9e:	8b 43 04             	mov    0x4(%ebx),%eax
 ba1:	89 04 24             	mov    %eax,(%esp)
 ba4:	e8 47 fd ff ff       	call   8f0 <sem_down>
	binary_sem_down(bb->mutex);
 ba9:	8b 03                	mov    (%ebx),%eax
 bab:	89 04 24             	mov    %eax,(%esp)
 bae:	e8 65 f8 ff ff       	call   418 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 bb3:	8b 43 10             	mov    0x10(%ebx),%eax
 bb6:	c1 e0 02             	shl    $0x2,%eax
 bb9:	03 43 0c             	add    0xc(%ebx),%eax
 bbc:	8b 08                	mov    (%eax),%ecx
 bbe:	85 c9                	test   %ecx,%ecx
 bc0:	74 36                	je     bf8 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 bc2:	c7 44 24 04 80 0d 00 	movl   $0xd80,0x4(%esp)
 bc9:	00 
 bca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 bd1:	e8 0a f9 ff ff       	call   4e0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 bd6:	8b 03                	mov    (%ebx),%eax
 bd8:	89 04 24             	mov    %eax,(%esp)
 bdb:	e8 40 f8 ff ff       	call   420 <binary_sem_up>
	sem_up(bb->full);
 be0:	8b 43 08             	mov    0x8(%ebx),%eax
 be3:	89 45 08             	mov    %eax,0x8(%ebp)
}
 be6:	83 c4 10             	add    $0x10,%esp
 be9:	5b                   	pop    %ebx
 bea:	5e                   	pop    %esi
 beb:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 bec:	e9 9f fd ff ff       	jmp    990 <sem_up>
 bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 bf8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 bfa:	8b 53 18             	mov    0x18(%ebx),%edx
 bfd:	8b 43 10             	mov    0x10(%ebx),%eax
 c00:	83 ea 01             	sub    $0x1,%edx
 c03:	39 d0                	cmp    %edx,%eax
 c05:	74 09                	je     c10 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c07:	83 c0 01             	add    $0x1,%eax
 c0a:	89 43 10             	mov    %eax,0x10(%ebx)
 c0d:	eb c7                	jmp    bd6 <semaphore_put+0x46>
 c0f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c10:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c17:	eb bd                	jmp    bd6 <semaphore_put+0x46>
 c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c20 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
 c23:	83 ec 18             	sub    $0x18,%esp
 c26:	89 75 fc             	mov    %esi,-0x4(%ebp)
 c29:	8b 75 08             	mov    0x8(%ebp),%esi
 c2c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 c2f:	85 f6                	test   %esi,%esi
 c31:	79 15                	jns    c48 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 c33:	31 db                	xor    %ebx,%ebx
}
 c35:	89 d8                	mov    %ebx,%eax
 c37:	8b 75 fc             	mov    -0x4(%ebp),%esi
 c3a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 c3d:	89 ec                	mov    %ebp,%esp
 c3f:	5d                   	pop    %ebp
 c40:	c3                   	ret    
 c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 c48:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 c4f:	e8 2c fb ff ff       	call   780 <malloc>
 c54:	85 c0                	test   %eax,%eax
 c56:	89 c3                	mov    %eax,%ebx
 c58:	74 db                	je     c35 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 c5a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 c61:	89 04 24             	mov    %eax,(%esp)
 c64:	e8 17 fb ff ff       	call   780 <malloc>
 c69:	85 c0                	test   %eax,%eax
 c6b:	89 43 0c             	mov    %eax,0xc(%ebx)
 c6e:	74 c3                	je     c33 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 c70:	89 34 24             	mov    %esi,(%esp)
 c73:	e8 78 fd ff ff       	call   9f0 <semaphore_create>
 c78:	85 c0                	test   %eax,%eax
 c7a:	89 43 04             	mov    %eax,0x4(%ebx)
 c7d:	74 b4                	je     c33 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 c7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 c86:	e8 65 fd ff ff       	call   9f0 <semaphore_create>
 c8b:	85 c0                	test   %eax,%eax
 c8d:	89 43 08             	mov    %eax,0x8(%ebx)
 c90:	74 a1                	je     c33 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 c92:	e8 79 f7 ff ff       	call   410 <binary_sem_create>
	ret->produce = 0;
 c97:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 c9e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 ca5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 ca8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 caa:	eb 89                	jmp    c35 <BB_create+0x15>
