
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 42 02 00 00       	call   250 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 ca 02 00 00       	call   2e8 <sleep>
  exit();
  1e:	e8 35 02 00 00       	call   258 <exit>
  23:	90                   	nop
  24:	90                   	nop
  25:	90                   	nop
  26:	90                   	nop
  27:	90                   	nop
  28:	90                   	nop
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  30:	55                   	push   %ebp
  31:	31 d2                	xor    %edx,%edx
  33:	89 e5                	mov    %esp,%ebp
  35:	8b 45 08             	mov    0x8(%ebp),%eax
  38:	53                   	push   %ebx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  40:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  44:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 c9                	test   %cl,%cl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	5b                   	pop    %ebx
  4f:	5d                   	pop    %ebp
  50:	c3                   	ret    
  51:	eb 0d                	jmp    60 <strcmp>
  53:	90                   	nop
  54:	90                   	nop
  55:	90                   	nop
  56:	90                   	nop
  57:	90                   	nop
  58:	90                   	nop
  59:	90                   	nop
  5a:	90                   	nop
  5b:	90                   	nop
  5c:	90                   	nop
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  6a:	0f b6 01             	movzbl (%ecx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 14                	jne    85 <strcmp+0x25>
  71:	eb 25                	jmp    98 <strcmp+0x38>
  73:	90                   	nop
  74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  78:	83 c1 01             	add    $0x1,%ecx
  7b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  7e:	0f b6 01             	movzbl (%ecx),%eax
  81:	84 c0                	test   %al,%al
  83:	74 13                	je     98 <strcmp+0x38>
  85:	0f b6 1a             	movzbl (%edx),%ebx
  88:	38 d8                	cmp    %bl,%al
  8a:	74 ec                	je     78 <strcmp+0x18>
  8c:	0f b6 db             	movzbl %bl,%ebx
  8f:	0f b6 c0             	movzbl %al,%eax
  92:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  94:	5b                   	pop    %ebx
  95:	5d                   	pop    %ebp
  96:	c3                   	ret    
  97:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  98:	0f b6 1a             	movzbl (%edx),%ebx
  9b:	31 c0                	xor    %eax,%eax
  9d:	0f b6 db             	movzbl %bl,%ebx
  a0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  a2:	5b                   	pop    %ebx
  a3:	5d                   	pop    %ebp
  a4:	c3                   	ret    
  a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000b0 <strlen>:

uint
strlen(char *s)
{
  b0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  b1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  b3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
  b5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ba:	80 39 00             	cmpb   $0x0,(%ecx)
  bd:	74 0c                	je     cb <strlen+0x1b>
  bf:	90                   	nop
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi

000000d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  da:	8b 45 0c             	mov    0xc(%ebp),%eax
  dd:	89 d7                	mov    %edx,%edi
  df:	fc                   	cld    
  e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e2:	89 d0                	mov    %edx,%eax
  e4:	5f                   	pop    %edi
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fa:	0f b6 10             	movzbl (%eax),%edx
  fd:	84 d2                	test   %dl,%dl
  ff:	75 11                	jne    112 <strchr+0x22>
 101:	eb 15                	jmp    118 <strchr+0x28>
 103:	90                   	nop
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c0 01             	add    $0x1,%eax
 10b:	0f b6 10             	movzbl (%eax),%edx
 10e:	84 d2                	test   %dl,%dl
 110:	74 06                	je     118 <strchr+0x28>
    if(*s == c)
 112:	38 ca                	cmp    %cl,%dl
 114:	75 f2                	jne    108 <strchr+0x18>
      return (char*) s;
  return 0;
}
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 118:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 11a:	5d                   	pop    %ebp
 11b:	90                   	nop
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <atoi>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 130:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 131:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 133:	89 e5                	mov    %esp,%ebp
 135:	8b 4d 08             	mov    0x8(%ebp),%ecx
 138:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 139:	0f b6 11             	movzbl (%ecx),%edx
 13c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 13f:	80 fb 09             	cmp    $0x9,%bl
 142:	77 1c                	ja     160 <atoi+0x30>
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 148:	0f be d2             	movsbl %dl,%edx
 14b:	83 c1 01             	add    $0x1,%ecx
 14e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 151:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 155:	0f b6 11             	movzbl (%ecx),%edx
 158:	8d 5a d0             	lea    -0x30(%edx),%ebx
 15b:	80 fb 09             	cmp    $0x9,%bl
 15e:	76 e8                	jbe    148 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	56                   	push   %esi
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	53                   	push   %ebx
 178:	8b 5d 10             	mov    0x10(%ebp),%ebx
 17b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 17e:	85 db                	test   %ebx,%ebx
 180:	7e 14                	jle    196 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 182:	31 d2                	xor    %edx,%edx
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 188:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 18c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 18f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 192:	39 da                	cmp    %ebx,%edx
 194:	75 f2                	jne    188 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 196:	5b                   	pop    %ebx
 197:	5e                   	pop    %esi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001a0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1a9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 1af:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bb:	00 
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 d4 00 00 00       	call   298 <open>
  if(fd < 0)
 1c4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1c8:	78 19                	js     1e3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 1c 24             	mov    %ebx,(%esp)
 1d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d4:	e8 d7 00 00 00       	call   2b0 <fstat>
  close(fd);
 1d9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 1dc:	89 c6                	mov    %eax,%esi
  close(fd);
 1de:	e8 9d 00 00 00       	call   280 <close>
  return r;
}
 1e3:	89 f0                	mov    %esi,%eax
 1e5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 1e8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 1eb:	89 ec                	mov    %ebp,%esp
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop

000001f0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	31 f6                	xor    %esi,%esi
 1f7:	53                   	push   %ebx
 1f8:	83 ec 2c             	sub    $0x2c,%esp
 1fb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fe:	eb 06                	jmp    206 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 200:	3c 0a                	cmp    $0xa,%al
 202:	74 39                	je     23d <gets+0x4d>
 204:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 206:	8d 5e 01             	lea    0x1(%esi),%ebx
 209:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20c:	7d 31                	jge    23f <gets+0x4f>
    cc = read(0, &c, 1);
 20e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 211:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 218:	00 
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 224:	e8 47 00 00 00       	call   270 <read>
    if(cc < 1)
 229:	85 c0                	test   %eax,%eax
 22b:	7e 12                	jle    23f <gets+0x4f>
      break;
    buf[i++] = c;
 22d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 231:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 235:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 239:	3c 0d                	cmp    $0xd,%al
 23b:	75 c3                	jne    200 <gets+0x10>
 23d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 23f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 243:	89 f8                	mov    %edi,%eax
 245:	83 c4 2c             	add    $0x2c,%esp
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5f                   	pop    %edi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <fork>:
 250:	b8 01 00 00 00       	mov    $0x1,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret    

00000258 <exit>:
 258:	b8 02 00 00 00       	mov    $0x2,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret    

00000260 <wait>:
 260:	b8 03 00 00 00       	mov    $0x3,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret    

00000268 <pipe>:
 268:	b8 04 00 00 00       	mov    $0x4,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret    

00000270 <read>:
 270:	b8 06 00 00 00       	mov    $0x6,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret    

00000278 <write>:
 278:	b8 05 00 00 00       	mov    $0x5,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret    

00000280 <close>:
 280:	b8 07 00 00 00       	mov    $0x7,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <kill>:
 288:	b8 08 00 00 00       	mov    $0x8,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exec>:
 290:	b8 09 00 00 00       	mov    $0x9,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <open>:
 298:	b8 0a 00 00 00       	mov    $0xa,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <mknod>:
 2a0:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <unlink>:
 2a8:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <fstat>:
 2b0:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <link>:
 2b8:	b8 0e 00 00 00       	mov    $0xe,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <mkdir>:
 2c0:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <chdir>:
 2c8:	b8 10 00 00 00       	mov    $0x10,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <dup>:
 2d0:	b8 11 00 00 00       	mov    $0x11,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <getpid>:
 2d8:	b8 12 00 00 00       	mov    $0x12,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <sbrk>:
 2e0:	b8 13 00 00 00       	mov    $0x13,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <sleep>:
 2e8:	b8 14 00 00 00       	mov    $0x14,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <uptime>:
 2f0:	b8 15 00 00 00       	mov    $0x15,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <thread_create>:
 2f8:	b8 16 00 00 00       	mov    $0x16,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <thread_getid>:
 300:	b8 17 00 00 00       	mov    $0x17,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <thread_getProcid>:
 308:	b8 18 00 00 00       	mov    $0x18,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <thread_exit>:
 310:	b8 1a 00 00 00       	mov    $0x1a,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <thread_join>:
 318:	b8 19 00 00 00       	mov    $0x19,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <binary_sem_create>:
 320:	b8 1b 00 00 00       	mov    $0x1b,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <binary_sem_down>:
 328:	b8 1c 00 00 00       	mov    $0x1c,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <binary_sem_up>:
 330:	b8 1d 00 00 00       	mov    $0x1d,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <binary_sem_clear>:
 338:	b8 1e 00 00 00       	mov    $0x1e,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <exit_all_threads>:
 340:	b8 1f 00 00 00       	mov    $0x1f,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	89 cf                	mov    %ecx,%edi
 356:	56                   	push   %esi
 357:	89 c6                	mov    %eax,%esi
 359:	53                   	push   %ebx
 35a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 35d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 360:	85 c9                	test   %ecx,%ecx
 362:	74 04                	je     368 <printint+0x18>
 364:	85 d2                	test   %edx,%edx
 366:	78 70                	js     3d8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 368:	89 d0                	mov    %edx,%eax
 36a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 371:	31 c9                	xor    %ecx,%ecx
 373:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 376:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 378:	31 d2                	xor    %edx,%edx
 37a:	f7 f7                	div    %edi
 37c:	0f b6 92 c3 0b 00 00 	movzbl 0xbc3(%edx),%edx
 383:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 386:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 389:	85 c0                	test   %eax,%eax
 38b:	75 eb                	jne    378 <printint+0x28>
	if(neg)
 38d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 390:	85 c0                	test   %eax,%eax
 392:	74 08                	je     39c <printint+0x4c>
		buf[i++] = '-';
 394:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 399:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 39c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 39f:	01 fb                	add    %edi,%ebx
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	0f b6 03             	movzbl (%ebx),%eax
 3ab:	83 ef 01             	sub    $0x1,%edi
 3ae:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 3b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b8:	00 
 3b9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 3bc:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 3bf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c6:	e8 ad fe ff ff       	call   278 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 3cb:	83 ff ff             	cmp    $0xffffffff,%edi
 3ce:	75 d8                	jne    3a8 <printint+0x58>
		putc(fd, buf[i]);
}
 3d0:	83 c4 4c             	add    $0x4c,%esp
 3d3:	5b                   	pop    %ebx
 3d4:	5e                   	pop    %esi
 3d5:	5f                   	pop    %edi
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 3d8:	89 d0                	mov    %edx,%eax
 3da:	f7 d8                	neg    %eax
 3dc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3e3:	eb 8c                	jmp    371 <printint+0x21>
 3e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	0f b6 10             	movzbl (%eax),%edx
 3ff:	84 d2                	test   %dl,%dl
 401:	0f 84 c9 00 00 00    	je     4d0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 407:	8d 4d 10             	lea    0x10(%ebp),%ecx
 40a:	31 ff                	xor    %edi,%edi
 40c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 40f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 411:	8d 75 e7             	lea    -0x19(%ebp),%esi
 414:	eb 1e                	jmp    434 <printf+0x44>
 416:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 418:	83 fa 25             	cmp    $0x25,%edx
 41b:	0f 85 b7 00 00 00    	jne    4d8 <printf+0xe8>
 421:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 425:	83 c3 01             	add    $0x1,%ebx
 428:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 42c:	84 d2                	test   %dl,%dl
 42e:	0f 84 9c 00 00 00    	je     4d0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 434:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 436:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 439:	74 dd                	je     418 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 43b:	83 ff 25             	cmp    $0x25,%edi
 43e:	75 e5                	jne    425 <printf+0x35>
			if(c == 'd'){
 440:	83 fa 64             	cmp    $0x64,%edx
 443:	0f 84 57 01 00 00    	je     5a0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 449:	83 fa 70             	cmp    $0x70,%edx
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	0f 84 aa 00 00 00    	je     500 <printf+0x110>
 456:	83 fa 78             	cmp    $0x78,%edx
 459:	0f 84 a1 00 00 00    	je     500 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 45f:	83 fa 73             	cmp    $0x73,%edx
 462:	0f 84 c0 00 00 00    	je     528 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 468:	83 fa 63             	cmp    $0x63,%edx
 46b:	90                   	nop
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 470:	0f 84 52 01 00 00    	je     5c8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 476:	83 fa 25             	cmp    $0x25,%edx
 479:	0f 84 f9 00 00 00    	je     578 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 47f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 482:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 485:	31 ff                	xor    %edi,%edi
 487:	89 55 cc             	mov    %edx,-0x34(%ebp)
 48a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 48e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 495:	00 
 496:	89 0c 24             	mov    %ecx,(%esp)
 499:	89 74 24 04          	mov    %esi,0x4(%esp)
 49d:	e8 d6 fd ff ff       	call   278 <write>
 4a2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4af:	00 
 4b0:	89 74 24 04          	mov    %esi,0x4(%esp)
 4b4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 b9 fd ff ff       	call   278 <write>
 4bf:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4c2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4c6:	84 d2                	test   %dl,%dl
 4c8:	0f 85 66 ff ff ff    	jne    434 <printf+0x44>
 4ce:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 4d0:	83 c4 3c             	add    $0x3c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 4db:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e5:	00 
 4e6:	89 74 24 04          	mov    %esi,0x4(%esp)
 4ea:	89 04 24             	mov    %eax,(%esp)
 4ed:	e8 86 fd ff ff       	call   278 <write>
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	e9 2b ff ff ff       	jmp    425 <printf+0x35>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 508:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 50a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 511:	8b 10                	mov    (%eax),%edx
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	e8 35 fe ff ff       	call   350 <printint>
 51b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 51e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 522:	e9 fe fe ff ff       	jmp    425 <printf+0x35>
 527:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 528:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 52b:	8b 3a                	mov    (%edx),%edi
				ap++;
 52d:	83 c2 04             	add    $0x4,%edx
 530:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 533:	85 ff                	test   %edi,%edi
 535:	0f 84 ba 00 00 00    	je     5f5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 53b:	0f b6 17             	movzbl (%edi),%edx
 53e:	84 d2                	test   %dl,%dl
 540:	74 2d                	je     56f <printf+0x17f>
 542:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 545:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 548:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 54b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 54e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 555:	00 
 556:	89 74 24 04          	mov    %esi,0x4(%esp)
 55a:	89 1c 24             	mov    %ebx,(%esp)
 55d:	e8 16 fd ff ff       	call   278 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 562:	0f b6 17             	movzbl (%edi),%edx
 565:	84 d2                	test   %dl,%dl
 567:	75 df                	jne    548 <printf+0x158>
 569:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 56c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 56f:	31 ff                	xor    %edi,%edi
 571:	e9 af fe ff ff       	jmp    425 <printf+0x35>
 576:	66 90                	xchg   %ax,%ax
 578:	8b 55 08             	mov    0x8(%ebp),%edx
 57b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 57d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 581:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 588:	00 
 589:	89 74 24 04          	mov    %esi,0x4(%esp)
 58d:	89 14 24             	mov    %edx,(%esp)
 590:	e8 e3 fc ff ff       	call   278 <write>
 595:	8b 45 0c             	mov    0xc(%ebp),%eax
 598:	e9 88 fe ff ff       	jmp    425 <printf+0x35>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 5a8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	8b 45 08             	mov    0x8(%ebp),%eax
 5b7:	e8 94 fd ff ff       	call   350 <printint>
 5bc:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 5bf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5c3:	e9 5d fe ff ff       	jmp    425 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5c8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 5cb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5cd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5cf:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d6:	00 
 5d7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5db:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	89 04 24             	mov    %eax,(%esp)
 5e4:	e8 8f fc ff ff       	call   278 <write>
 5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 5ec:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f0:	e9 30 fe ff ff       	jmp    425 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 5f5:	bf bc 0b 00 00       	mov    $0xbbc,%edi
 5fa:	e9 3c ff ff ff       	jmp    53b <printf+0x14b>
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 8c 0c 00 00       	mov    0xc8c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	39 c8                	cmp    %ecx,%eax
 613:	73 1d                	jae    632 <free+0x32>
 615:	8d 76 00             	lea    0x0(%esi),%esi
 618:	8b 10                	mov    (%eax),%edx
 61a:	39 d1                	cmp    %edx,%ecx
 61c:	72 1a                	jb     638 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61e:	39 d0                	cmp    %edx,%eax
 620:	72 08                	jb     62a <free+0x2a>
 622:	39 c8                	cmp    %ecx,%eax
 624:	72 12                	jb     638 <free+0x38>
 626:	39 d1                	cmp    %edx,%ecx
 628:	72 0e                	jb     638 <free+0x38>
 62a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	66 90                	xchg   %ax,%ax
 630:	72 e6                	jb     618 <free+0x18>
 632:	8b 10                	mov    (%eax),%edx
 634:	eb e8                	jmp    61e <free+0x1e>
 636:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 71 04             	mov    0x4(%ecx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 d7                	cmp    %edx,%edi
 640:	74 19                	je     65b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64b:	39 ce                	cmp    %ecx,%esi
 64d:	74 23                	je     672 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 651:	a3 8c 0c 00 00       	mov    %eax,0xc8c
}
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 65b:	03 72 04             	add    0x4(%edx),%esi
 65e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 10                	mov    (%eax),%edx
 663:	8b 12                	mov    (%edx),%edx
 665:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66e:	39 ce                	cmp    %ecx,%esi
 670:	75 dd                	jne    64f <free+0x4f>
    p->s.size += bp->s.size;
 672:	03 51 04             	add    0x4(%ecx),%edx
 675:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 678:	8b 53 f8             	mov    -0x8(%ebx),%edx
 67b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 67d:	a3 8c 0c 00 00       	mov    %eax,0xc8c
}
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 69c:	8b 0d 8c 0c 00 00    	mov    0xc8c,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	83 c3 07             	add    $0x7,%ebx
 6a5:	c1 eb 03             	shr    $0x3,%ebx
 6a8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ab:	85 c9                	test   %ecx,%ecx
 6ad:	0f 84 93 00 00 00    	je     746 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	39 d3                	cmp    %edx,%ebx
 6ba:	76 1f                	jbe    6db <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 6bc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 6c8:	3b 05 8c 0c 00 00    	cmp    0xc8c,%eax
 6ce:	74 30                	je     700 <malloc+0x70>
 6d0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6d4:	8b 50 04             	mov    0x4(%eax),%edx
 6d7:	39 d3                	cmp    %edx,%ebx
 6d9:	77 ed                	ja     6c8 <malloc+0x38>
      if(p->s.size == nunits)
 6db:	39 d3                	cmp    %edx,%ebx
 6dd:	74 61                	je     740 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6df:	29 da                	sub    %ebx,%edx
 6e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6e4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6e7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6ea:	89 0d 8c 0c 00 00    	mov    %ecx,0xc8c
      return (void*) (p + 1);
 6f0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f3:	83 c4 1c             	add    $0x1c,%esp
 6f6:	5b                   	pop    %ebx
 6f7:	5e                   	pop    %esi
 6f8:	5f                   	pop    %edi
 6f9:	5d                   	pop    %ebp
 6fa:	c3                   	ret    
 6fb:	90                   	nop
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 700:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 706:	b8 00 80 00 00       	mov    $0x8000,%eax
 70b:	bf 00 10 00 00       	mov    $0x1000,%edi
 710:	76 04                	jbe    716 <malloc+0x86>
 712:	89 f0                	mov    %esi,%eax
 714:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 716:	89 04 24             	mov    %eax,(%esp)
 719:	e8 c2 fb ff ff       	call   2e0 <sbrk>
  if(p == (char*) -1)
 71e:	83 f8 ff             	cmp    $0xffffffff,%eax
 721:	74 18                	je     73b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 723:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 726:	83 c0 08             	add    $0x8,%eax
 729:	89 04 24             	mov    %eax,(%esp)
 72c:	e8 cf fe ff ff       	call   600 <free>
  return freep;
 731:	8b 0d 8c 0c 00 00    	mov    0xc8c,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 737:	85 c9                	test   %ecx,%ecx
 739:	75 97                	jne    6d2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 73b:	31 c0                	xor    %eax,%eax
 73d:	eb b4                	jmp    6f3 <malloc+0x63>
 73f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 740:	8b 10                	mov    (%eax),%edx
 742:	89 11                	mov    %edx,(%ecx)
 744:	eb a4                	jmp    6ea <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 746:	c7 05 8c 0c 00 00 84 	movl   $0xc84,0xc8c
 74d:	0c 00 00 
    base.s.size = 0;
 750:	b9 84 0c 00 00       	mov    $0xc84,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 755:	c7 05 84 0c 00 00 84 	movl   $0xc84,0xc84
 75c:	0c 00 00 
    base.s.size = 0;
 75f:	c7 05 88 0c 00 00 00 	movl   $0x0,0xc88
 766:	00 00 00 
 769:	e9 45 ff ff ff       	jmp    6b3 <malloc+0x23>
 76e:	90                   	nop
 76f:	90                   	nop

00000770 <sem_clear>:
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	53                   	push   %ebx
 774:	83 ec 14             	sub    $0x14,%esp
 777:	8b 5d 08             	mov    0x8(%ebp),%ebx
 77a:	8b 03                	mov    (%ebx),%eax
 77c:	89 04 24             	mov    %eax,(%esp)
 77f:	e8 b4 fb ff ff       	call   338 <binary_sem_clear>
 784:	8b 43 04             	mov    0x4(%ebx),%eax
 787:	89 04 24             	mov    %eax,(%esp)
 78a:	e8 a9 fb ff ff       	call   338 <binary_sem_clear>
 78f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 792:	83 c4 14             	add    $0x14,%esp
 795:	5b                   	pop    %ebx
 796:	5d                   	pop    %ebp
 797:	e9 64 fe ff ff       	jmp    600 <free>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <sem_downs>:
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	83 ec 18             	sub    $0x18,%esp
 7a6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 7a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
 7af:	8b 75 0c             	mov    0xc(%ebp),%esi
 7b2:	8b 43 04             	mov    0x4(%ebx),%eax
 7b5:	89 04 24             	mov    %eax,(%esp)
 7b8:	e8 6b fb ff ff       	call   328 <binary_sem_down>
 7bd:	8b 03                	mov    (%ebx),%eax
 7bf:	89 04 24             	mov    %eax,(%esp)
 7c2:	e8 61 fb ff ff       	call   328 <binary_sem_down>
 7c7:	8b 43 08             	mov    0x8(%ebx),%eax
 7ca:	29 f0                	sub    %esi,%eax
 7cc:	85 c0                	test   %eax,%eax
 7ce:	89 43 08             	mov    %eax,0x8(%ebx)
 7d1:	74 0b                	je     7de <sem_downs+0x3e>
 7d3:	8b 43 04             	mov    0x4(%ebx),%eax
 7d6:	89 04 24             	mov    %eax,(%esp)
 7d9:	e8 52 fb ff ff       	call   330 <binary_sem_up>
 7de:	8b 03                	mov    (%ebx),%eax
 7e0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 7e3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 7e6:	89 45 08             	mov    %eax,0x8(%ebp)
 7e9:	89 ec                	mov    %ebp,%esp
 7eb:	5d                   	pop    %ebp
 7ec:	e9 3f fb ff ff       	jmp    330 <binary_sem_up>
 7f1:	eb 0d                	jmp    800 <sem_down>
 7f3:	90                   	nop
 7f4:	90                   	nop
 7f5:	90                   	nop
 7f6:	90                   	nop
 7f7:	90                   	nop
 7f8:	90                   	nop
 7f9:	90                   	nop
 7fa:	90                   	nop
 7fb:	90                   	nop
 7fc:	90                   	nop
 7fd:	90                   	nop
 7fe:	90                   	nop
 7ff:	90                   	nop

00000800 <sem_down>:
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	53                   	push   %ebx
 804:	83 ec 14             	sub    $0x14,%esp
 807:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80a:	8b 43 04             	mov    0x4(%ebx),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 13 fb ff ff       	call   328 <binary_sem_down>
 815:	8b 03                	mov    (%ebx),%eax
 817:	89 04 24             	mov    %eax,(%esp)
 81a:	e8 09 fb ff ff       	call   328 <binary_sem_down>
 81f:	8b 43 08             	mov    0x8(%ebx),%eax
 822:	83 e8 01             	sub    $0x1,%eax
 825:	85 c0                	test   %eax,%eax
 827:	89 43 08             	mov    %eax,0x8(%ebx)
 82a:	74 0b                	je     837 <sem_down+0x37>
 82c:	8b 43 04             	mov    0x4(%ebx),%eax
 82f:	89 04 24             	mov    %eax,(%esp)
 832:	e8 f9 fa ff ff       	call   330 <binary_sem_up>
 837:	8b 03                	mov    (%ebx),%eax
 839:	89 45 08             	mov    %eax,0x8(%ebp)
 83c:	83 c4 14             	add    $0x14,%esp
 83f:	5b                   	pop    %ebx
 840:	5d                   	pop    %ebp
 841:	e9 ea fa ff ff       	jmp    330 <binary_sem_up>
 846:	8d 76 00             	lea    0x0(%esi),%esi
 849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000850 <sem_ups>:
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	83 ec 18             	sub    $0x18,%esp
 856:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 859:	8b 5d 08             	mov    0x8(%ebp),%ebx
 85c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 85f:	8b 75 0c             	mov    0xc(%ebp),%esi
 862:	8b 03                	mov    (%ebx),%eax
 864:	89 04 24             	mov    %eax,(%esp)
 867:	e8 bc fa ff ff       	call   328 <binary_sem_down>
 86c:	03 73 08             	add    0x8(%ebx),%esi
 86f:	83 fe 01             	cmp    $0x1,%esi
 872:	89 73 08             	mov    %esi,0x8(%ebx)
 875:	74 19                	je     890 <sem_ups+0x40>
 877:	8b 03                	mov    (%ebx),%eax
 879:	8b 75 fc             	mov    -0x4(%ebp),%esi
 87c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 87f:	89 45 08             	mov    %eax,0x8(%ebp)
 882:	89 ec                	mov    %ebp,%esp
 884:	5d                   	pop    %ebp
 885:	e9 a6 fa ff ff       	jmp    330 <binary_sem_up>
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 890:	8b 43 04             	mov    0x4(%ebx),%eax
 893:	89 04 24             	mov    %eax,(%esp)
 896:	e8 95 fa ff ff       	call   330 <binary_sem_up>
 89b:	eb da                	jmp    877 <sem_ups+0x27>
 89d:	8d 76 00             	lea    0x0(%esi),%esi

000008a0 <sem_up>:
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	53                   	push   %ebx
 8a4:	83 ec 14             	sub    $0x14,%esp
 8a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8aa:	8b 03                	mov    (%ebx),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 74 fa ff ff       	call   328 <binary_sem_down>
 8b4:	8b 43 08             	mov    0x8(%ebx),%eax
 8b7:	83 c0 01             	add    $0x1,%eax
 8ba:	83 f8 01             	cmp    $0x1,%eax
 8bd:	89 43 08             	mov    %eax,0x8(%ebx)
 8c0:	74 16                	je     8d8 <sem_up+0x38>
 8c2:	8b 03                	mov    (%ebx),%eax
 8c4:	89 45 08             	mov    %eax,0x8(%ebp)
 8c7:	83 c4 14             	add    $0x14,%esp
 8ca:	5b                   	pop    %ebx
 8cb:	5d                   	pop    %ebp
 8cc:	e9 5f fa ff ff       	jmp    330 <binary_sem_up>
 8d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8d8:	8b 43 04             	mov    0x4(%ebx),%eax
 8db:	89 04 24             	mov    %eax,(%esp)
 8de:	e8 4d fa ff ff       	call   330 <binary_sem_up>
 8e3:	8b 03                	mov    (%ebx),%eax
 8e5:	89 45 08             	mov    %eax,0x8(%ebp)
 8e8:	83 c4 14             	add    $0x14,%esp
 8eb:	5b                   	pop    %ebx
 8ec:	5d                   	pop    %ebp
 8ed:	e9 3e fa ff ff       	jmp    330 <binary_sem_up>
 8f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <semaphore_create>:
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	83 ec 28             	sub    $0x28,%esp
 906:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 90d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 910:	89 75 f8             	mov    %esi,-0x8(%ebp)
 913:	89 7d fc             	mov    %edi,-0x4(%ebp)
 916:	8b 7d 08             	mov    0x8(%ebp),%edi
 919:	e8 72 fd ff ff       	call   690 <malloc>
 91e:	89 78 08             	mov    %edi,0x8(%eax)
 921:	89 c3                	mov    %eax,%ebx
 923:	e8 f8 f9 ff ff       	call   320 <binary_sem_create>
 928:	89 03                	mov    %eax,(%ebx)
 92a:	89 c6                	mov    %eax,%esi
 92c:	e8 ef f9 ff ff       	call   320 <binary_sem_create>
 931:	01 c6                	add    %eax,%esi
 933:	89 43 04             	mov    %eax,0x4(%ebx)
 936:	78 20                	js     958 <semaphore_create+0x58>
 938:	85 ff                	test   %edi,%edi
 93a:	75 08                	jne    944 <semaphore_create+0x44>
 93c:	89 04 24             	mov    %eax,(%esp)
 93f:	e8 e4 f9 ff ff       	call   328 <binary_sem_down>
 944:	89 d8                	mov    %ebx,%eax
 946:	8b 75 f8             	mov    -0x8(%ebp),%esi
 949:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 94c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 94f:	89 ec                	mov    %ebp,%esp
 951:	5d                   	pop    %ebp
 952:	c3                   	ret    
 953:	90                   	nop
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 958:	c7 44 24 04 d4 0b 00 	movl   $0xbd4,0x4(%esp)
 95f:	00 
 960:	31 db                	xor    %ebx,%ebx
 962:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 969:	e8 82 fa ff ff       	call   3f0 <printf>
 96e:	eb d4                	jmp    944 <semaphore_create+0x44>

00000970 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 976:	8b 45 08             	mov    0x8(%ebp),%eax
 979:	8b 00                	mov    (%eax),%eax
 97b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 97e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 97f:	e9 ac f9 ff ff       	jmp    330 <binary_sem_up>
 984:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 98a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000990 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	56                   	push   %esi
 994:	53                   	push   %ebx
 995:	83 ec 10             	sub    $0x10,%esp
 998:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 99b:	8b 43 08             	mov    0x8(%ebx),%eax
 99e:	89 04 24             	mov    %eax,(%esp)
 9a1:	e8 5a fe ff ff       	call   800 <sem_down>
	binary_sem_down(bb->mutex);
 9a6:	8b 03                	mov    (%ebx),%eax
 9a8:	89 04 24             	mov    %eax,(%esp)
 9ab:	e8 78 f9 ff ff       	call   328 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 9b0:	8b 43 14             	mov    0x14(%ebx),%eax
 9b3:	c1 e0 02             	shl    $0x2,%eax
 9b6:	03 43 0c             	add    0xc(%ebx),%eax
 9b9:	8b 30                	mov    (%eax),%esi
 9bb:	85 f6                	test   %esi,%esi
 9bd:	74 42                	je     a01 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 9bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 9c5:	8b 53 18             	mov    0x18(%ebx),%edx
 9c8:	8b 43 14             	mov    0x14(%ebx),%eax
 9cb:	83 ea 01             	sub    $0x1,%edx
 9ce:	39 d0                	cmp    %edx,%eax
 9d0:	74 26                	je     9f8 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 9d2:	83 c0 01             	add    $0x1,%eax
 9d5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 9d8:	8b 03                	mov    (%ebx),%eax
 9da:	89 04 24             	mov    %eax,(%esp)
 9dd:	e8 4e f9 ff ff       	call   330 <binary_sem_up>
	sem_up(bb->empty);
 9e2:	8b 43 04             	mov    0x4(%ebx),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 b3 fe ff ff       	call   8a0 <sem_up>
	return element;
}
 9ed:	83 c4 10             	add    $0x10,%esp
 9f0:	89 f0                	mov    %esi,%eax
 9f2:	5b                   	pop    %ebx
 9f3:	5e                   	pop    %esi
 9f4:	5d                   	pop    %ebp
 9f5:	c3                   	ret    
 9f6:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 9f8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 9ff:	eb d7                	jmp    9d8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 a01:	c7 44 24 04 fc 0b 00 	movl   $0xbfc,0x4(%esp)
 a08:	00 
 a09:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a10:	e8 db f9 ff ff       	call   3f0 <printf>
 a15:	eb c1                	jmp    9d8 <semaphore_pop+0x48>
 a17:	89 f6                	mov    %esi,%esi
 a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	56                   	push   %esi
 a24:	53                   	push   %ebx
 a25:	83 ec 10             	sub    $0x10,%esp
 a28:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a2b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 a2e:	8b 43 04             	mov    0x4(%ebx),%eax
 a31:	89 04 24             	mov    %eax,(%esp)
 a34:	e8 c7 fd ff ff       	call   800 <sem_down>
	binary_sem_down(bb->mutex);
 a39:	8b 03                	mov    (%ebx),%eax
 a3b:	89 04 24             	mov    %eax,(%esp)
 a3e:	e8 e5 f8 ff ff       	call   328 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 a43:	8b 43 10             	mov    0x10(%ebx),%eax
 a46:	c1 e0 02             	shl    $0x2,%eax
 a49:	03 43 0c             	add    0xc(%ebx),%eax
 a4c:	8b 10                	mov    (%eax),%edx
 a4e:	85 d2                	test   %edx,%edx
 a50:	74 26                	je     a78 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 a52:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 a59:	00 
 a5a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a61:	e8 8a f9 ff ff       	call   3f0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 a66:	8b 43 08             	mov    0x8(%ebx),%eax
 a69:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a6c:	83 c4 10             	add    $0x10,%esp
 a6f:	5b                   	pop    %ebx
 a70:	5e                   	pop    %esi
 a71:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 a72:	e9 29 fe ff ff       	jmp    8a0 <sem_up>
 a77:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 a78:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 a7a:	8b 53 18             	mov    0x18(%ebx),%edx
 a7d:	8b 43 10             	mov    0x10(%ebx),%eax
 a80:	83 ea 01             	sub    $0x1,%edx
 a83:	39 d0                	cmp    %edx,%eax
 a85:	74 09                	je     a90 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 a87:	83 c0 01             	add    $0x1,%eax
 a8a:	89 43 10             	mov    %eax,0x10(%ebx)
 a8d:	eb d7                	jmp    a66 <semaphore_put_atomic+0x46>
 a8f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 a90:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 a97:	eb cd                	jmp    a66 <semaphore_put_atomic+0x46>
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	56                   	push   %esi
 aa4:	53                   	push   %ebx
 aa5:	83 ec 10             	sub    $0x10,%esp
 aa8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 aab:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 aae:	8b 43 04             	mov    0x4(%ebx),%eax
 ab1:	89 04 24             	mov    %eax,(%esp)
 ab4:	e8 47 fd ff ff       	call   800 <sem_down>
	binary_sem_down(bb->mutex);
 ab9:	8b 03                	mov    (%ebx),%eax
 abb:	89 04 24             	mov    %eax,(%esp)
 abe:	e8 65 f8 ff ff       	call   328 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 ac3:	8b 43 10             	mov    0x10(%ebx),%eax
 ac6:	c1 e0 02             	shl    $0x2,%eax
 ac9:	03 43 0c             	add    0xc(%ebx),%eax
 acc:	8b 08                	mov    (%eax),%ecx
 ace:	85 c9                	test   %ecx,%ecx
 ad0:	74 36                	je     b08 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 ad2:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 ad9:	00 
 ada:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ae1:	e8 0a f9 ff ff       	call   3f0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 ae6:	8b 03                	mov    (%ebx),%eax
 ae8:	89 04 24             	mov    %eax,(%esp)
 aeb:	e8 40 f8 ff ff       	call   330 <binary_sem_up>
	sem_up(bb->full);
 af0:	8b 43 08             	mov    0x8(%ebx),%eax
 af3:	89 45 08             	mov    %eax,0x8(%ebp)
}
 af6:	83 c4 10             	add    $0x10,%esp
 af9:	5b                   	pop    %ebx
 afa:	5e                   	pop    %esi
 afb:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 afc:	e9 9f fd ff ff       	jmp    8a0 <sem_up>
 b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 b08:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 b0a:	8b 53 18             	mov    0x18(%ebx),%edx
 b0d:	8b 43 10             	mov    0x10(%ebx),%eax
 b10:	83 ea 01             	sub    $0x1,%edx
 b13:	39 d0                	cmp    %edx,%eax
 b15:	74 09                	je     b20 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 b17:	83 c0 01             	add    $0x1,%eax
 b1a:	89 43 10             	mov    %eax,0x10(%ebx)
 b1d:	eb c7                	jmp    ae6 <semaphore_put+0x46>
 b1f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 b20:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 b27:	eb bd                	jmp    ae6 <semaphore_put+0x46>
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 18             	sub    $0x18,%esp
 b36:	89 75 fc             	mov    %esi,-0x4(%ebp)
 b39:	8b 75 08             	mov    0x8(%ebp),%esi
 b3c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 b3f:	85 f6                	test   %esi,%esi
 b41:	79 15                	jns    b58 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 b43:	31 db                	xor    %ebx,%ebx
}
 b45:	89 d8                	mov    %ebx,%eax
 b47:	8b 75 fc             	mov    -0x4(%ebp),%esi
 b4a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 b4d:	89 ec                	mov    %ebp,%esp
 b4f:	5d                   	pop    %ebp
 b50:	c3                   	ret    
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 b58:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 b5f:	e8 2c fb ff ff       	call   690 <malloc>
 b64:	85 c0                	test   %eax,%eax
 b66:	89 c3                	mov    %eax,%ebx
 b68:	74 db                	je     b45 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 b6a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 b71:	89 04 24             	mov    %eax,(%esp)
 b74:	e8 17 fb ff ff       	call   690 <malloc>
 b79:	85 c0                	test   %eax,%eax
 b7b:	89 43 0c             	mov    %eax,0xc(%ebx)
 b7e:	74 c3                	je     b43 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 b80:	89 34 24             	mov    %esi,(%esp)
 b83:	e8 78 fd ff ff       	call   900 <semaphore_create>
 b88:	85 c0                	test   %eax,%eax
 b8a:	89 43 04             	mov    %eax,0x4(%ebx)
 b8d:	74 b4                	je     b43 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 b8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 b96:	e8 65 fd ff ff       	call   900 <semaphore_create>
 b9b:	85 c0                	test   %eax,%eax
 b9d:	89 43 08             	mov    %eax,0x8(%ebx)
 ba0:	74 a1                	je     b43 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 ba2:	e8 79 f7 ff ff       	call   320 <binary_sem_create>
	ret->produce = 0;
 ba7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 bae:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 bb5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 bb8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 bba:	eb 89                	jmp    b45 <BB_create+0x15>
