
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	83 ec 14             	sub    $0x14,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  if(argc < 2){
   f:	83 ff 01             	cmp    $0x1,%edi
  12:	7e 4c                	jle    60 <main+0x60>
    printf(2, "Usage: mkdir files...\n");
    exit();
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	be 01 00 00 00       	mov    $0x1,%esi
  1c:	83 c3 04             	add    $0x4,%ebx
  1f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 e6 02 00 00       	call   310 <mkdir>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 12                	js     40 <main+0x40>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 f7                	cmp    %esi,%edi
  36:	7f e8                	jg     20 <main+0x20>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  38:	e8 6b 02 00 00       	call   2a8 <exit>
  3d:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  40:	8b 03                	mov    (%ebx),%eax
  42:	c7 44 24 04 73 0c 00 	movl   $0xc73,0x4(%esp)
  49:	00 
  4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  51:	89 44 24 08          	mov    %eax,0x8(%esp)
  55:	e8 e6 03 00 00       	call   440 <printf>
      break;
    }
  }

  exit();
  5a:	e8 49 02 00 00       	call   2a8 <exit>
  5f:	90                   	nop
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
  60:	c7 44 24 04 5c 0c 00 	movl   $0xc5c,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 cc 03 00 00       	call   440 <printf>
    exit();
  74:	e8 2f 02 00 00       	call   2a8 <exit>
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	31 d2                	xor    %edx,%edx
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	53                   	push   %ebx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  90:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 c9                	test   %cl,%cl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	5b                   	pop    %ebx
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    
  a1:	eb 0d                	jmp    b0 <strcmp>
  a3:	90                   	nop
  a4:	90                   	nop
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop
  a8:	90                   	nop
  a9:	90                   	nop
  aa:	90                   	nop
  ab:	90                   	nop
  ac:	90                   	nop
  ad:	90                   	nop
  ae:	90                   	nop
  af:	90                   	nop

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ba:	0f b6 01             	movzbl (%ecx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 14                	jne    d5 <strcmp+0x25>
  c1:	eb 25                	jmp    e8 <strcmp+0x38>
  c3:	90                   	nop
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  c8:	83 c1 01             	add    $0x1,%ecx
  cb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ce:	0f b6 01             	movzbl (%ecx),%eax
  d1:	84 c0                	test   %al,%al
  d3:	74 13                	je     e8 <strcmp+0x38>
  d5:	0f b6 1a             	movzbl (%edx),%ebx
  d8:	38 d8                	cmp    %bl,%al
  da:	74 ec                	je     c8 <strcmp+0x18>
  dc:	0f b6 db             	movzbl %bl,%ebx
  df:	0f b6 c0             	movzbl %al,%eax
  e2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  e4:	5b                   	pop    %ebx
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    
  e7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e8:	0f b6 1a             	movzbl (%edx),%ebx
  eb:	31 c0                	xor    %eax,%eax
  ed:	0f b6 db             	movzbl %bl,%ebx
  f0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  f2:	5b                   	pop    %ebx
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strlen>:

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 101:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 103:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 105:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 107:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 10a:	80 39 00             	cmpb   $0x0,(%ecx)
 10d:	74 0c                	je     11b <strlen+0x1b>
 10f:	90                   	nop
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 11                	jne    162 <strchr+0x22>
 151:	eb 15                	jmp    168 <strchr+0x28>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 158:	83 c0 01             	add    $0x1,%eax
 15b:	0f b6 10             	movzbl (%eax),%edx
 15e:	84 d2                	test   %dl,%dl
 160:	74 06                	je     168 <strchr+0x28>
    if(*s == c)
 162:	38 ca                	cmp    %cl,%dl
 164:	75 f2                	jne    158 <strchr+0x18>
      return (char*) s;
  return 0;
}
 166:	5d                   	pop    %ebp
 167:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 16a:	5d                   	pop    %ebp
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	c3                   	ret    
 171:	eb 0d                	jmp    180 <atoi>
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop

00000180 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 180:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 181:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 183:	89 e5                	mov    %esp,%ebp
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
 188:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 189:	0f b6 11             	movzbl (%ecx),%edx
 18c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 18f:	80 fb 09             	cmp    $0x9,%bl
 192:	77 1c                	ja     1b0 <atoi+0x30>
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 198:	0f be d2             	movsbl %dl,%edx
 19b:	83 c1 01             	add    $0x1,%ecx
 19e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1a1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1a5:	0f b6 11             	movzbl (%ecx),%edx
 1a8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1ab:	80 fb 09             	cmp    $0x9,%bl
 1ae:	76 e8                	jbe    198 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	53                   	push   %ebx
 1c8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1ce:	85 db                	test   %ebx,%ebx
 1d0:	7e 14                	jle    1e6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 1d2:	31 d2                	xor    %edx,%edx
 1d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 1d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1df:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1e2:	39 da                	cmp    %ebx,%edx
 1e4:	75 f2                	jne    1d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 1e6:	5b                   	pop    %ebx
 1e7:	5e                   	pop    %esi
 1e8:	5d                   	pop    %ebp
 1e9:	c3                   	ret    
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001f0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1f9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1fc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 1ff:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 204:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20b:	00 
 20c:	89 04 24             	mov    %eax,(%esp)
 20f:	e8 d4 00 00 00       	call   2e8 <open>
  if(fd < 0)
 214:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 216:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 218:	78 19                	js     233 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 1c 24             	mov    %ebx,(%esp)
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	e8 d7 00 00 00       	call   300 <fstat>
  close(fd);
 229:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 22c:	89 c6                	mov    %eax,%esi
  close(fd);
 22e:	e8 9d 00 00 00       	call   2d0 <close>
  return r;
}
 233:	89 f0                	mov    %esi,%eax
 235:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 238:	8b 75 fc             	mov    -0x4(%ebp),%esi
 23b:	89 ec                	mov    %ebp,%esp
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop

00000240 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
 245:	31 f6                	xor    %esi,%esi
 247:	53                   	push   %ebx
 248:	83 ec 2c             	sub    $0x2c,%esp
 24b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24e:	eb 06                	jmp    256 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 250:	3c 0a                	cmp    $0xa,%al
 252:	74 39                	je     28d <gets+0x4d>
 254:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 256:	8d 5e 01             	lea    0x1(%esi),%ebx
 259:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25c:	7d 31                	jge    28f <gets+0x4f>
    cc = read(0, &c, 1);
 25e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 261:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 268:	00 
 269:	89 44 24 04          	mov    %eax,0x4(%esp)
 26d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 274:	e8 47 00 00 00       	call   2c0 <read>
    if(cc < 1)
 279:	85 c0                	test   %eax,%eax
 27b:	7e 12                	jle    28f <gets+0x4f>
      break;
    buf[i++] = c;
 27d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 281:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 285:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 289:	3c 0d                	cmp    $0xd,%al
 28b:	75 c3                	jne    250 <gets+0x10>
 28d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 28f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 293:	89 f8                	mov    %edi,%eax
 295:	83 c4 2c             	add    $0x2c,%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a0:	b8 01 00 00 00       	mov    $0x1,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <exit>:
SYSCALL(exit)
 2a8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <wait>:
SYSCALL(wait)
 2b0:	b8 03 00 00 00       	mov    $0x3,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <pipe>:
SYSCALL(pipe)
 2b8:	b8 04 00 00 00       	mov    $0x4,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <read>:
SYSCALL(read)
 2c0:	b8 06 00 00 00       	mov    $0x6,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <write>:
SYSCALL(write)
 2c8:	b8 05 00 00 00       	mov    $0x5,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <close>:
SYSCALL(close)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <kill>:
SYSCALL(kill)
 2d8:	b8 08 00 00 00       	mov    $0x8,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <exec>:
SYSCALL(exec)
 2e0:	b8 09 00 00 00       	mov    $0x9,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <open>:
SYSCALL(open)
 2e8:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mknod>:
SYSCALL(mknod)
 2f0:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <unlink>:
SYSCALL(unlink)
 2f8:	b8 0c 00 00 00       	mov    $0xc,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <fstat>:
SYSCALL(fstat)
 300:	b8 0d 00 00 00       	mov    $0xd,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <link>:
SYSCALL(link)
 308:	b8 0e 00 00 00       	mov    $0xe,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <mkdir>:
SYSCALL(mkdir)
 310:	b8 0f 00 00 00       	mov    $0xf,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <chdir>:
SYSCALL(chdir)
 318:	b8 10 00 00 00       	mov    $0x10,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <dup>:
SYSCALL(dup)
 320:	b8 11 00 00 00       	mov    $0x11,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <getpid>:
SYSCALL(getpid)
 328:	b8 12 00 00 00       	mov    $0x12,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <sbrk>:
SYSCALL(sbrk)
 330:	b8 13 00 00 00       	mov    $0x13,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <sleep>:
SYSCALL(sleep)
 338:	b8 14 00 00 00       	mov    $0x14,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <uptime>:
SYSCALL(uptime)
 340:	b8 15 00 00 00       	mov    $0x15,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <thread_create>:
SYSCALL(thread_create)
 348:	b8 16 00 00 00       	mov    $0x16,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <thread_getid>:
SYSCALL(thread_getid)
 350:	b8 17 00 00 00       	mov    $0x17,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <thread_getProcId>:
SYSCALL(thread_getProcId)
 358:	b8 18 00 00 00       	mov    $0x18,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <thread_exit>:
SYSCALL(thread_exit)
 360:	b8 1a 00 00 00       	mov    $0x1a,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <thread_join>:
SYSCALL(thread_join)
 368:	b8 19 00 00 00       	mov    $0x19,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <binary_sem_create>:
SYSCALL(binary_sem_create)
 370:	b8 1b 00 00 00       	mov    $0x1b,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <binary_sem_down>:
SYSCALL(binary_sem_down)
 378:	b8 1c 00 00 00       	mov    $0x1c,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <binary_sem_up>:
SYSCALL(binary_sem_up)
 380:	b8 1d 00 00 00       	mov    $0x1d,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 388:	b8 1e 00 00 00       	mov    $0x1e,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exit_all_threads>:
 390:	b8 1f 00 00 00       	mov    $0x1f,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    
 398:	90                   	nop
 399:	90                   	nop
 39a:	90                   	nop
 39b:	90                   	nop
 39c:	90                   	nop
 39d:	90                   	nop
 39e:	90                   	nop
 39f:	90                   	nop

000003a0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	56                   	push   %esi
 3a7:	89 c6                	mov    %eax,%esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 3ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3b0:	85 c9                	test   %ecx,%ecx
 3b2:	74 04                	je     3b8 <printint+0x18>
 3b4:	85 d2                	test   %edx,%edx
 3b6:	78 70                	js     428 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 3b8:	89 d0                	mov    %edx,%eax
 3ba:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3c1:	31 c9                	xor    %ecx,%ecx
 3c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3c6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 3c8:	31 d2                	xor    %edx,%edx
 3ca:	f7 f7                	div    %edi
 3cc:	0f b6 92 96 0c 00 00 	movzbl 0xc96(%edx),%edx
 3d3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 3d6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 3d9:	85 c0                	test   %eax,%eax
 3db:	75 eb                	jne    3c8 <printint+0x28>
	if(neg)
 3dd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3e0:	85 c0                	test   %eax,%eax
 3e2:	74 08                	je     3ec <printint+0x4c>
		buf[i++] = '-';
 3e4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 3e9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 3ec:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3ef:	01 fb                	add    %edi,%ebx
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	0f b6 03             	movzbl (%ebx),%eax
 3fb:	83 ef 01             	sub    $0x1,%edi
 3fe:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 401:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 408:	00 
 409:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 40c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 40f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 412:	89 44 24 04          	mov    %eax,0x4(%esp)
 416:	e8 ad fe ff ff       	call   2c8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 41b:	83 ff ff             	cmp    $0xffffffff,%edi
 41e:	75 d8                	jne    3f8 <printint+0x58>
		putc(fd, buf[i]);
}
 420:	83 c4 4c             	add    $0x4c,%esp
 423:	5b                   	pop    %ebx
 424:	5e                   	pop    %esi
 425:	5f                   	pop    %edi
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 428:	89 d0                	mov    %edx,%eax
 42a:	f7 d8                	neg    %eax
 42c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 433:	eb 8c                	jmp    3c1 <printint+0x21>
 435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 449:	8b 45 0c             	mov    0xc(%ebp),%eax
 44c:	0f b6 10             	movzbl (%eax),%edx
 44f:	84 d2                	test   %dl,%dl
 451:	0f 84 c9 00 00 00    	je     520 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 457:	8d 4d 10             	lea    0x10(%ebp),%ecx
 45a:	31 ff                	xor    %edi,%edi
 45c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 45f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 461:	8d 75 e7             	lea    -0x19(%ebp),%esi
 464:	eb 1e                	jmp    484 <printf+0x44>
 466:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 468:	83 fa 25             	cmp    $0x25,%edx
 46b:	0f 85 b7 00 00 00    	jne    528 <printf+0xe8>
 471:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 475:	83 c3 01             	add    $0x1,%ebx
 478:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 47c:	84 d2                	test   %dl,%dl
 47e:	0f 84 9c 00 00 00    	je     520 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 484:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 486:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 489:	74 dd                	je     468 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 48b:	83 ff 25             	cmp    $0x25,%edi
 48e:	75 e5                	jne    475 <printf+0x35>
			if(c == 'd'){
 490:	83 fa 64             	cmp    $0x64,%edx
 493:	0f 84 57 01 00 00    	je     5f0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 499:	83 fa 70             	cmp    $0x70,%edx
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	0f 84 aa 00 00 00    	je     550 <printf+0x110>
 4a6:	83 fa 78             	cmp    $0x78,%edx
 4a9:	0f 84 a1 00 00 00    	je     550 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 4af:	83 fa 73             	cmp    $0x73,%edx
 4b2:	0f 84 c0 00 00 00    	je     578 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 4b8:	83 fa 63             	cmp    $0x63,%edx
 4bb:	90                   	nop
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c0:	0f 84 52 01 00 00    	je     618 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 4c6:	83 fa 25             	cmp    $0x25,%edx
 4c9:	0f 84 f9 00 00 00    	je     5c8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4cf:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4d2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4d5:	31 ff                	xor    %edi,%edi
 4d7:	89 55 cc             	mov    %edx,-0x34(%ebp)
 4da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e5:	00 
 4e6:	89 0c 24             	mov    %ecx,(%esp)
 4e9:	89 74 24 04          	mov    %esi,0x4(%esp)
 4ed:	e8 d6 fd ff ff       	call   2c8 <write>
 4f2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
 4f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ff:	00 
 500:	89 74 24 04          	mov    %esi,0x4(%esp)
 504:	88 55 e7             	mov    %dl,-0x19(%ebp)
 507:	89 04 24             	mov    %eax,(%esp)
 50a:	e8 b9 fd ff ff       	call   2c8 <write>
 50f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 512:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 516:	84 d2                	test   %dl,%dl
 518:	0f 85 66 ff ff ff    	jne    484 <printf+0x44>
 51e:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 520:	83 c4 3c             	add    $0x3c,%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 528:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 52b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 52e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 535:	00 
 536:	89 74 24 04          	mov    %esi,0x4(%esp)
 53a:	89 04 24             	mov    %eax,(%esp)
 53d:	e8 86 fd ff ff       	call   2c8 <write>
 542:	8b 45 0c             	mov    0xc(%ebp),%eax
 545:	e9 2b ff ff ff       	jmp    475 <printf+0x35>
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 550:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 558:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 55a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 561:	8b 10                	mov    (%eax),%edx
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	e8 35 fe ff ff       	call   3a0 <printint>
 56b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 56e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 572:	e9 fe fe ff ff       	jmp    475 <printf+0x35>
 577:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 578:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 57b:	8b 3a                	mov    (%edx),%edi
				ap++;
 57d:	83 c2 04             	add    $0x4,%edx
 580:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 583:	85 ff                	test   %edi,%edi
 585:	0f 84 ba 00 00 00    	je     645 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 58b:	0f b6 17             	movzbl (%edi),%edx
 58e:	84 d2                	test   %dl,%dl
 590:	74 2d                	je     5bf <printf+0x17f>
 592:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 595:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 598:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 59b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 59e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a5:	00 
 5a6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5aa:	89 1c 24             	mov    %ebx,(%esp)
 5ad:	e8 16 fd ff ff       	call   2c8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 5b2:	0f b6 17             	movzbl (%edi),%edx
 5b5:	84 d2                	test   %dl,%dl
 5b7:	75 df                	jne    598 <printf+0x158>
 5b9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5bc:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5bf:	31 ff                	xor    %edi,%edi
 5c1:	e9 af fe ff ff       	jmp    475 <printf+0x35>
 5c6:	66 90                	xchg   %ax,%ax
 5c8:	8b 55 08             	mov    0x8(%ebp),%edx
 5cb:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 5cd:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d8:	00 
 5d9:	89 74 24 04          	mov    %esi,0x4(%esp)
 5dd:	89 14 24             	mov    %edx,(%esp)
 5e0:	e8 e3 fc ff ff       	call   2c8 <write>
 5e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e8:	e9 88 fe ff ff       	jmp    475 <printf+0x35>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 5f8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 602:	8b 10                	mov    (%eax),%edx
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	e8 94 fd ff ff       	call   3a0 <printint>
 60c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 60f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 613:	e9 5d fe ff ff       	jmp    475 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 618:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 61b:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 61d:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 61f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 626:	00 
 627:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 62b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	89 04 24             	mov    %eax,(%esp)
 634:	e8 8f fc ff ff       	call   2c8 <write>
 639:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 63c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 640:	e9 30 fe ff ff       	jmp    475 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 645:	bf 8f 0c 00 00       	mov    $0xc8f,%edi
 64a:	e9 3c ff ff ff       	jmp    58b <printf+0x14b>
 64f:	90                   	nop

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 60 0d 00 00       	mov    0xd60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	39 c8                	cmp    %ecx,%eax
 663:	73 1d                	jae    682 <free+0x32>
 665:	8d 76 00             	lea    0x0(%esi),%esi
 668:	8b 10                	mov    (%eax),%edx
 66a:	39 d1                	cmp    %edx,%ecx
 66c:	72 1a                	jb     688 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66e:	39 d0                	cmp    %edx,%eax
 670:	72 08                	jb     67a <free+0x2a>
 672:	39 c8                	cmp    %ecx,%eax
 674:	72 12                	jb     688 <free+0x38>
 676:	39 d1                	cmp    %edx,%ecx
 678:	72 0e                	jb     688 <free+0x38>
 67a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67c:	39 c8                	cmp    %ecx,%eax
 67e:	66 90                	xchg   %ax,%ax
 680:	72 e6                	jb     668 <free+0x18>
 682:	8b 10                	mov    (%eax),%edx
 684:	eb e8                	jmp    66e <free+0x1e>
 686:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 71 04             	mov    0x4(%ecx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 d7                	cmp    %edx,%edi
 690:	74 19                	je     6ab <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 692:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69b:	39 ce                	cmp    %ecx,%esi
 69d:	74 23                	je     6c2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6a1:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 6a6:	5b                   	pop    %ebx
 6a7:	5e                   	pop    %esi
 6a8:	5f                   	pop    %edi
 6a9:	5d                   	pop    %ebp
 6aa:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6ab:	03 72 04             	add    0x4(%edx),%esi
 6ae:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	8b 12                	mov    (%edx),%edx
 6b5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6b8:	8b 50 04             	mov    0x4(%eax),%edx
 6bb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6be:	39 ce                	cmp    %ecx,%esi
 6c0:	75 dd                	jne    69f <free+0x4f>
    p->s.size += bp->s.size;
 6c2:	03 51 04             	add    0x4(%ecx),%edx
 6c5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6cb:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 6cd:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 6d2:	5b                   	pop    %ebx
 6d3:	5e                   	pop    %esi
 6d4:	5f                   	pop    %edi
 6d5:	5d                   	pop    %ebp
 6d6:	c3                   	ret    
 6d7:	89 f6                	mov    %esi,%esi
 6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 6ec:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	83 c3 07             	add    $0x7,%ebx
 6f5:	c1 eb 03             	shr    $0x3,%ebx
 6f8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6fb:	85 c9                	test   %ecx,%ecx
 6fd:	0f 84 93 00 00 00    	je     796 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 703:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	39 d3                	cmp    %edx,%ebx
 70a:	76 1f                	jbe    72b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 70c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 713:	90                   	nop
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 718:	3b 05 60 0d 00 00    	cmp    0xd60,%eax
 71e:	74 30                	je     750 <malloc+0x70>
 720:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 722:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 724:	8b 50 04             	mov    0x4(%eax),%edx
 727:	39 d3                	cmp    %edx,%ebx
 729:	77 ed                	ja     718 <malloc+0x38>
      if(p->s.size == nunits)
 72b:	39 d3                	cmp    %edx,%ebx
 72d:	74 61                	je     790 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 72f:	29 da                	sub    %ebx,%edx
 731:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 734:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 737:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 73a:	89 0d 60 0d 00 00    	mov    %ecx,0xd60
      return (void*) (p + 1);
 740:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 743:	83 c4 1c             	add    $0x1c,%esp
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    
 74b:	90                   	nop
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 750:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 756:	b8 00 80 00 00       	mov    $0x8000,%eax
 75b:	bf 00 10 00 00       	mov    $0x1000,%edi
 760:	76 04                	jbe    766 <malloc+0x86>
 762:	89 f0                	mov    %esi,%eax
 764:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 766:	89 04 24             	mov    %eax,(%esp)
 769:	e8 c2 fb ff ff       	call   330 <sbrk>
  if(p == (char*) -1)
 76e:	83 f8 ff             	cmp    $0xffffffff,%eax
 771:	74 18                	je     78b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 773:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 776:	83 c0 08             	add    $0x8,%eax
 779:	89 04 24             	mov    %eax,(%esp)
 77c:	e8 cf fe ff ff       	call   650 <free>
  return freep;
 781:	8b 0d 60 0d 00 00    	mov    0xd60,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 787:	85 c9                	test   %ecx,%ecx
 789:	75 97                	jne    722 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 78b:	31 c0                	xor    %eax,%eax
 78d:	eb b4                	jmp    743 <malloc+0x63>
 78f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 790:	8b 10                	mov    (%eax),%edx
 792:	89 11                	mov    %edx,(%ecx)
 794:	eb a4                	jmp    73a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 796:	c7 05 60 0d 00 00 58 	movl   $0xd58,0xd60
 79d:	0d 00 00 
    base.s.size = 0;
 7a0:	b9 58 0d 00 00       	mov    $0xd58,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7a5:	c7 05 58 0d 00 00 58 	movl   $0xd58,0xd58
 7ac:	0d 00 00 
    base.s.size = 0;
 7af:	c7 05 5c 0d 00 00 00 	movl   $0x0,0xd5c
 7b6:	00 00 00 
 7b9:	e9 45 ff ff ff       	jmp    703 <malloc+0x23>
 7be:	90                   	nop
 7bf:	90                   	nop

000007c0 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	53                   	push   %ebx
 7c4:	83 ec 14             	sub    $0x14,%esp
 7c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 7ca:	8b 03                	mov    (%ebx),%eax
 7cc:	89 04 24             	mov    %eax,(%esp)
 7cf:	e8 b4 fb ff ff       	call   388 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 7d4:	8b 43 04             	mov    0x4(%ebx),%eax
 7d7:	89 04 24             	mov    %eax,(%esp)
 7da:	e8 a9 fb ff ff       	call   388 <binary_sem_clear>
	free(sem);
 7df:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 7e2:	83 c4 14             	add    $0x14,%esp
 7e5:	5b                   	pop    %ebx
 7e6:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 7e7:	e9 64 fe ff ff       	jmp    650 <free>
 7ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007f0 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	83 ec 18             	sub    $0x18,%esp
 7f6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 7f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7fc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 7ff:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 802:	8b 43 04             	mov    0x4(%ebx),%eax
 805:	89 04 24             	mov    %eax,(%esp)
 808:	e8 6b fb ff ff       	call   378 <binary_sem_down>
	binary_sem_down(sem->S1);
 80d:	8b 03                	mov    (%ebx),%eax
 80f:	89 04 24             	mov    %eax,(%esp)
 812:	e8 61 fb ff ff       	call   378 <binary_sem_down>
	sem->value -= num;
 817:	8b 43 08             	mov    0x8(%ebx),%eax
 81a:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 81c:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 81e:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 821:	74 0b                	je     82e <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 823:	8b 43 04             	mov    0x4(%ebx),%eax
 826:	89 04 24             	mov    %eax,(%esp)
 829:	e8 52 fb ff ff       	call   380 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 82e:	8b 03                	mov    (%ebx),%eax
}
 830:	8b 75 fc             	mov    -0x4(%ebp),%esi
 833:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 836:	89 45 08             	mov    %eax,0x8(%ebp)
}
 839:	89 ec                	mov    %ebp,%esp
 83b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 83c:	e9 3f fb ff ff       	jmp    380 <binary_sem_up>
 841:	eb 0d                	jmp    850 <sem_down>
 843:	90                   	nop
 844:	90                   	nop
 845:	90                   	nop
 846:	90                   	nop
 847:	90                   	nop
 848:	90                   	nop
 849:	90                   	nop
 84a:	90                   	nop
 84b:	90                   	nop
 84c:	90                   	nop
 84d:	90                   	nop
 84e:	90                   	nop
 84f:	90                   	nop

00000850 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	53                   	push   %ebx
 854:	83 ec 14             	sub    $0x14,%esp
 857:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 85a:	8b 43 04             	mov    0x4(%ebx),%eax
 85d:	89 04 24             	mov    %eax,(%esp)
 860:	e8 13 fb ff ff       	call   378 <binary_sem_down>
	binary_sem_down(sem->S1);
 865:	8b 03                	mov    (%ebx),%eax
 867:	89 04 24             	mov    %eax,(%esp)
 86a:	e8 09 fb ff ff       	call   378 <binary_sem_down>
	sem->value--;
 86f:	8b 43 08             	mov    0x8(%ebx),%eax
 872:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 875:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 877:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 87a:	74 0b                	je     887 <sem_down+0x37>
		binary_sem_up(sem->S2);
 87c:	8b 43 04             	mov    0x4(%ebx),%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 f9 fa ff ff       	call   380 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 887:	8b 03                	mov    (%ebx),%eax
 889:	89 45 08             	mov    %eax,0x8(%ebp)
}
 88c:	83 c4 14             	add    $0x14,%esp
 88f:	5b                   	pop    %ebx
 890:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 891:	e9 ea fa ff ff       	jmp    380 <binary_sem_up>
 896:	8d 76 00             	lea    0x0(%esi),%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	83 ec 18             	sub    $0x18,%esp
 8a6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 8a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
 8af:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 8b2:	8b 03                	mov    (%ebx),%eax
 8b4:	89 04 24             	mov    %eax,(%esp)
 8b7:	e8 bc fa ff ff       	call   378 <binary_sem_down>
	sem->value+= num;
 8bc:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 8bf:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 8c2:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 8c5:	74 19                	je     8e0 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 8c7:	8b 03                	mov    (%ebx),%eax
}
 8c9:	8b 75 fc             	mov    -0x4(%ebp),%esi
 8cc:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 8cf:	89 45 08             	mov    %eax,0x8(%ebp)
}
 8d2:	89 ec                	mov    %ebp,%esp
 8d4:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 8d5:	e9 a6 fa ff ff       	jmp    380 <binary_sem_up>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 8e0:	8b 43 04             	mov    0x4(%ebx),%eax
 8e3:	89 04 24             	mov    %eax,(%esp)
 8e6:	e8 95 fa ff ff       	call   380 <binary_sem_up>
 8eb:	eb da                	jmp    8c7 <sem_ups+0x27>
 8ed:	8d 76 00             	lea    0x0(%esi),%esi

000008f0 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	53                   	push   %ebx
 8f4:	83 ec 14             	sub    $0x14,%esp
 8f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 8fa:	8b 03                	mov    (%ebx),%eax
 8fc:	89 04 24             	mov    %eax,(%esp)
 8ff:	e8 74 fa ff ff       	call   378 <binary_sem_down>
	sem->value++;
 904:	8b 43 08             	mov    0x8(%ebx),%eax
 907:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 90a:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 90d:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 910:	74 16                	je     928 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 912:	8b 03                	mov    (%ebx),%eax
 914:	89 45 08             	mov    %eax,0x8(%ebp)
}
 917:	83 c4 14             	add    $0x14,%esp
 91a:	5b                   	pop    %ebx
 91b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 91c:	e9 5f fa ff ff       	jmp    380 <binary_sem_up>
 921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 928:	8b 43 04             	mov    0x4(%ebx),%eax
 92b:	89 04 24             	mov    %eax,(%esp)
 92e:	e8 4d fa ff ff       	call   380 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 933:	8b 03                	mov    (%ebx),%eax
 935:	89 45 08             	mov    %eax,0x8(%ebp)
}
 938:	83 c4 14             	add    $0x14,%esp
 93b:	5b                   	pop    %ebx
 93c:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 93d:	e9 3e fa ff ff       	jmp    380 <binary_sem_up>
 942:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000950 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 956:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 95d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 960:	89 75 f8             	mov    %esi,-0x8(%ebp)
 963:	89 7d fc             	mov    %edi,-0x4(%ebp)
 966:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 969:	e8 72 fd ff ff       	call   6e0 <malloc>
	ret->value = initial_semaphore_value;
 96e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 971:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 973:	e8 f8 f9 ff ff       	call   370 <binary_sem_create>
 978:	89 03                	mov    %eax,(%ebx)
 97a:	89 c6                	mov    %eax,%esi
 97c:	e8 ef f9 ff ff       	call   370 <binary_sem_create>
 981:	01 c6                	add    %eax,%esi
 983:	89 43 04             	mov    %eax,0x4(%ebx)
 986:	78 20                	js     9a8 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 988:	85 ff                	test   %edi,%edi
 98a:	75 08                	jne    994 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 98c:	89 04 24             	mov    %eax,(%esp)
 98f:	e8 e4 f9 ff ff       	call   378 <binary_sem_down>
	}
	return ret;
}
 994:	89 d8                	mov    %ebx,%eax
 996:	8b 75 f8             	mov    -0x8(%ebp),%esi
 999:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 99c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 99f:	89 ec                	mov    %ebp,%esp
 9a1:	5d                   	pop    %ebp
 9a2:	c3                   	ret    
 9a3:	90                   	nop
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 9a8:	c7 44 24 04 a8 0c 00 	movl   $0xca8,0x4(%esp)
 9af:	00 
 9b0:	31 db                	xor    %ebx,%ebx
 9b2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 9b9:	e8 82 fa ff ff       	call   440 <printf>
		return 0;
 9be:	eb d4                	jmp    994 <semaphore_create+0x44>

000009c0 <semaphore_clear>:
	binary_sem_up(bb->mutex);
	sem_up(bb->empty);
	return element;
}

void semaphore_clear(struct BB* bb) {
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	53                   	push   %ebx
 9c4:	83 ec 14             	sub    $0x14,%esp
 9c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	free(bb->buffer);
 9ca:	8b 43 0c             	mov    0xc(%ebx),%eax
 9cd:	89 04 24             	mov    %eax,(%esp)
 9d0:	e8 7b fc ff ff       	call   650 <free>
	sem_clear(bb->empty);
 9d5:	8b 43 04             	mov    0x4(%ebx),%eax
 9d8:	89 04 24             	mov    %eax,(%esp)
 9db:	e8 e0 fd ff ff       	call   7c0 <sem_clear>
	sem_clear(bb->full);
 9e0:	8b 43 08             	mov    0x8(%ebx),%eax
 9e3:	89 04 24             	mov    %eax,(%esp)
 9e6:	e8 d5 fd ff ff       	call   7c0 <sem_clear>
	binary_sem_clear(bb->mutex);
 9eb:	8b 03                	mov    (%ebx),%eax
 9ed:	89 04 24             	mov    %eax,(%esp)
 9f0:	e8 93 f9 ff ff       	call   388 <binary_sem_clear>
	free(bb);
 9f5:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 9f8:	83 c4 14             	add    $0x14,%esp
 9fb:	5b                   	pop    %ebx
 9fc:	5d                   	pop    %ebp
void semaphore_clear(struct BB* bb) {
	free(bb->buffer);
	sem_clear(bb->empty);
	sem_clear(bb->full);
	binary_sem_clear(bb->mutex);
	free(bb);
 9fd:	e9 4e fc ff ff       	jmp    650 <free>
 a02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 a16:	8b 45 08             	mov    0x8(%ebp),%eax
 a19:	8b 00                	mov    (%eax),%eax
 a1b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a1e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 a1f:	e9 5c f9 ff ff       	jmp    380 <binary_sem_up>
 a24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a30 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	56                   	push   %esi
 a34:	53                   	push   %ebx
 a35:	83 ec 10             	sub    $0x10,%esp
 a38:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 a3b:	8b 43 08             	mov    0x8(%ebx),%eax
 a3e:	89 04 24             	mov    %eax,(%esp)
 a41:	e8 0a fe ff ff       	call   850 <sem_down>
	binary_sem_down(bb->mutex);
 a46:	8b 03                	mov    (%ebx),%eax
 a48:	89 04 24             	mov    %eax,(%esp)
 a4b:	e8 28 f9 ff ff       	call   378 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 a50:	8b 43 14             	mov    0x14(%ebx),%eax
 a53:	c1 e0 02             	shl    $0x2,%eax
 a56:	03 43 0c             	add    0xc(%ebx),%eax
 a59:	8b 30                	mov    (%eax),%esi
 a5b:	85 f6                	test   %esi,%esi
 a5d:	74 42                	je     aa1 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 a5f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 a65:	8b 53 18             	mov    0x18(%ebx),%edx
 a68:	8b 43 14             	mov    0x14(%ebx),%eax
 a6b:	83 ea 01             	sub    $0x1,%edx
 a6e:	39 d0                	cmp    %edx,%eax
 a70:	74 26                	je     a98 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 a72:	83 c0 01             	add    $0x1,%eax
 a75:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 a78:	8b 03                	mov    (%ebx),%eax
 a7a:	89 04 24             	mov    %eax,(%esp)
 a7d:	e8 fe f8 ff ff       	call   380 <binary_sem_up>
	sem_up(bb->empty);
 a82:	8b 43 04             	mov    0x4(%ebx),%eax
 a85:	89 04 24             	mov    %eax,(%esp)
 a88:	e8 63 fe ff ff       	call   8f0 <sem_up>
	return element;
}
 a8d:	83 c4 10             	add    $0x10,%esp
 a90:	89 f0                	mov    %esi,%eax
 a92:	5b                   	pop    %ebx
 a93:	5e                   	pop    %esi
 a94:	5d                   	pop    %ebp
 a95:	c3                   	ret    
 a96:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 a98:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 a9f:	eb d7                	jmp    a78 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 aa1:	c7 44 24 04 d0 0c 00 	movl   $0xcd0,0x4(%esp)
 aa8:	00 
 aa9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ab0:	e8 8b f9 ff ff       	call   440 <printf>
 ab5:	eb c1                	jmp    a78 <semaphore_pop+0x48>
 ab7:	89 f6                	mov    %esi,%esi
 ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ac0 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	56                   	push   %esi
 ac4:	53                   	push   %ebx
 ac5:	83 ec 10             	sub    $0x10,%esp
 ac8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 acb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 ace:	8b 43 04             	mov    0x4(%ebx),%eax
 ad1:	89 04 24             	mov    %eax,(%esp)
 ad4:	e8 77 fd ff ff       	call   850 <sem_down>
	binary_sem_down(bb->mutex);
 ad9:	8b 03                	mov    (%ebx),%eax
 adb:	89 04 24             	mov    %eax,(%esp)
 ade:	e8 95 f8 ff ff       	call   378 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 ae3:	8b 43 10             	mov    0x10(%ebx),%eax
 ae6:	c1 e0 02             	shl    $0x2,%eax
 ae9:	03 43 0c             	add    0xc(%ebx),%eax
 aec:	8b 10                	mov    (%eax),%edx
 aee:	85 d2                	test   %edx,%edx
 af0:	74 26                	je     b18 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 af2:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 af9:	00 
 afa:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b01:	e8 3a f9 ff ff       	call   440 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 b06:	8b 43 08             	mov    0x8(%ebx),%eax
 b09:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b0c:	83 c4 10             	add    $0x10,%esp
 b0f:	5b                   	pop    %ebx
 b10:	5e                   	pop    %esi
 b11:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 b12:	e9 d9 fd ff ff       	jmp    8f0 <sem_up>
 b17:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 b18:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 b1a:	8b 53 18             	mov    0x18(%ebx),%edx
 b1d:	8b 43 10             	mov    0x10(%ebx),%eax
 b20:	83 ea 01             	sub    $0x1,%edx
 b23:	39 d0                	cmp    %edx,%eax
 b25:	74 09                	je     b30 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 b27:	83 c0 01             	add    $0x1,%eax
 b2a:	89 43 10             	mov    %eax,0x10(%ebx)
 b2d:	eb d7                	jmp    b06 <semaphore_put_atomic+0x46>
 b2f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 b30:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 b37:	eb cd                	jmp    b06 <semaphore_put_atomic+0x46>
 b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b40 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	56                   	push   %esi
 b44:	53                   	push   %ebx
 b45:	83 ec 10             	sub    $0x10,%esp
 b48:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b4b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 b4e:	8b 43 04             	mov    0x4(%ebx),%eax
 b51:	89 04 24             	mov    %eax,(%esp)
 b54:	e8 f7 fc ff ff       	call   850 <sem_down>
	binary_sem_down(bb->mutex);
 b59:	8b 03                	mov    (%ebx),%eax
 b5b:	89 04 24             	mov    %eax,(%esp)
 b5e:	e8 15 f8 ff ff       	call   378 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 b63:	8b 43 10             	mov    0x10(%ebx),%eax
 b66:	c1 e0 02             	shl    $0x2,%eax
 b69:	03 43 0c             	add    0xc(%ebx),%eax
 b6c:	8b 08                	mov    (%eax),%ecx
 b6e:	85 c9                	test   %ecx,%ecx
 b70:	74 36                	je     ba8 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 b72:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 b79:	00 
 b7a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b81:	e8 ba f8 ff ff       	call   440 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 b86:	8b 03                	mov    (%ebx),%eax
 b88:	89 04 24             	mov    %eax,(%esp)
 b8b:	e8 f0 f7 ff ff       	call   380 <binary_sem_up>
	sem_up(bb->full);
 b90:	8b 43 08             	mov    0x8(%ebx),%eax
 b93:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b96:	83 c4 10             	add    $0x10,%esp
 b99:	5b                   	pop    %ebx
 b9a:	5e                   	pop    %esi
 b9b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 b9c:	e9 4f fd ff ff       	jmp    8f0 <sem_up>
 ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 ba8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 baa:	8b 53 18             	mov    0x18(%ebx),%edx
 bad:	8b 43 10             	mov    0x10(%ebx),%eax
 bb0:	83 ea 01             	sub    $0x1,%edx
 bb3:	39 d0                	cmp    %edx,%eax
 bb5:	74 09                	je     bc0 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 bb7:	83 c0 01             	add    $0x1,%eax
 bba:	89 43 10             	mov    %eax,0x10(%ebx)
 bbd:	eb c7                	jmp    b86 <semaphore_put+0x46>
 bbf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 bc0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 bc7:	eb bd                	jmp    b86 <semaphore_put+0x46>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	83 ec 18             	sub    $0x18,%esp
 bd6:	89 75 fc             	mov    %esi,-0x4(%ebp)
 bd9:	8b 75 08             	mov    0x8(%ebp),%esi
 bdc:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 bdf:	85 f6                	test   %esi,%esi
 be1:	79 15                	jns    bf8 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 be3:	31 db                	xor    %ebx,%ebx
}
 be5:	89 d8                	mov    %ebx,%eax
 be7:	8b 75 fc             	mov    -0x4(%ebp),%esi
 bea:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 bed:	89 ec                	mov    %ebp,%esp
 bef:	5d                   	pop    %ebp
 bf0:	c3                   	ret    
 bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 bf8:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 bff:	e8 dc fa ff ff       	call   6e0 <malloc>
 c04:	85 c0                	test   %eax,%eax
 c06:	89 c3                	mov    %eax,%ebx
 c08:	74 db                	je     be5 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 c0a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 c11:	89 04 24             	mov    %eax,(%esp)
 c14:	e8 c7 fa ff ff       	call   6e0 <malloc>
 c19:	85 c0                	test   %eax,%eax
 c1b:	89 43 0c             	mov    %eax,0xc(%ebx)
 c1e:	74 c3                	je     be3 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 c20:	89 34 24             	mov    %esi,(%esp)
 c23:	e8 28 fd ff ff       	call   950 <semaphore_create>
 c28:	85 c0                	test   %eax,%eax
 c2a:	89 43 04             	mov    %eax,0x4(%ebx)
 c2d:	74 b4                	je     be3 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 c2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 c36:	e8 15 fd ff ff       	call   950 <semaphore_create>
 c3b:	85 c0                	test   %eax,%eax
 c3d:	89 43 08             	mov    %eax,0x8(%ebx)
 c40:	74 a1                	je     be3 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 c42:	e8 29 f7 ff ff       	call   370 <binary_sem_create>
	ret->produce = 0;
 c47:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 c4e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 c55:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 c58:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 c5a:	eb 89                	jmp    be5 <BB_create+0x15>
