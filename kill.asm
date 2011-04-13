
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	83 ec 14             	sub    $0x14,%esp
   c:	8b 75 08             	mov    0x8(%ebp),%esi
   f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  if(argc < 1){
  12:	85 f6                	test   %esi,%esi
  14:	7e 2a                	jle    40 <main+0x40>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  16:	83 fe 01             	cmp    $0x1,%esi
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  19:	bb 01 00 00 00       	mov    $0x1,%ebx
  }
  for(i=1; i<argc; i++)
  1e:	74 1a                	je     3a <main+0x3a>
    kill(atoi(argv[i]));
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  23:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 32 01 00 00       	call   160 <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 82 02 00 00       	call   2b8 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  36:	39 de                	cmp    %ebx,%esi
  38:	7f e6                	jg     20 <main+0x20>
    kill(atoi(argv[i]));
  exit();
  3a:	e8 49 02 00 00       	call   288 <exit>
  3f:	90                   	nop
main(int argc, char **argv)
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
  40:	c7 44 24 04 ec 0b 00 	movl   $0xbec,0x4(%esp)
  47:	00 
  48:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4f:	e8 cc 03 00 00       	call   420 <printf>
    exit();
  54:	e8 2f 02 00 00       	call   288 <exit>
  59:	90                   	nop
  5a:	90                   	nop
  5b:	90                   	nop
  5c:	90                   	nop
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	55                   	push   %ebp
  61:	31 d2                	xor    %edx,%edx
  63:	89 e5                	mov    %esp,%ebp
  65:	8b 45 08             	mov    0x8(%ebp),%eax
  68:	53                   	push   %ebx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 c9                	test   %cl,%cl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	5b                   	pop    %ebx
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    
  81:	eb 0d                	jmp    90 <strcmp>
  83:	90                   	nop
  84:	90                   	nop
  85:	90                   	nop
  86:	90                   	nop
  87:	90                   	nop
  88:	90                   	nop
  89:	90                   	nop
  8a:	90                   	nop
  8b:	90                   	nop
  8c:	90                   	nop
  8d:	90                   	nop
  8e:	90                   	nop
  8f:	90                   	nop

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9a:	0f b6 01             	movzbl (%ecx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 14                	jne    b5 <strcmp+0x25>
  a1:	eb 25                	jmp    c8 <strcmp+0x38>
  a3:	90                   	nop
  a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  a8:	83 c1 01             	add    $0x1,%ecx
  ab:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	84 c0                	test   %al,%al
  b3:	74 13                	je     c8 <strcmp+0x38>
  b5:	0f b6 1a             	movzbl (%edx),%ebx
  b8:	38 d8                	cmp    %bl,%al
  ba:	74 ec                	je     a8 <strcmp+0x18>
  bc:	0f b6 db             	movzbl %bl,%ebx
  bf:	0f b6 c0             	movzbl %al,%eax
  c2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c4:	5b                   	pop    %ebx
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret    
  c7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c8:	0f b6 1a             	movzbl (%edx),%ebx
  cb:	31 c0                	xor    %eax,%eax
  cd:	0f b6 db             	movzbl %bl,%ebx
  d0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  d2:	5b                   	pop    %ebx
  d3:	5d                   	pop    %ebp
  d4:	c3                   	ret    
  d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strlen>:

uint
strlen(char *s)
{
  e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  e1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  e3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
  e5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  ea:	80 39 00             	cmpb   $0x0,(%ecx)
  ed:	74 0c                	je     fb <strlen+0x1b>
  ef:	90                   	nop
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi

00000100 <memset>:

void*
memset(void *dst, int c, uint n)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
 106:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 107:	8b 4d 10             	mov    0x10(%ebp),%ecx
 10a:	8b 45 0c             	mov    0xc(%ebp),%eax
 10d:	89 d7                	mov    %edx,%edi
 10f:	fc                   	cld    
 110:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 112:	89 d0                	mov    %edx,%eax
 114:	5f                   	pop    %edi
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	89 f6                	mov    %esi,%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 12a:	0f b6 10             	movzbl (%eax),%edx
 12d:	84 d2                	test   %dl,%dl
 12f:	75 11                	jne    142 <strchr+0x22>
 131:	eb 15                	jmp    148 <strchr+0x28>
 133:	90                   	nop
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 138:	83 c0 01             	add    $0x1,%eax
 13b:	0f b6 10             	movzbl (%eax),%edx
 13e:	84 d2                	test   %dl,%dl
 140:	74 06                	je     148 <strchr+0x28>
    if(*s == c)
 142:	38 ca                	cmp    %cl,%dl
 144:	75 f2                	jne    138 <strchr+0x18>
      return (char*) s;
  return 0;
}
 146:	5d                   	pop    %ebp
 147:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 148:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 14a:	5d                   	pop    %ebp
 14b:	90                   	nop
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	c3                   	ret    
 151:	eb 0d                	jmp    160 <atoi>
 153:	90                   	nop
 154:	90                   	nop
 155:	90                   	nop
 156:	90                   	nop
 157:	90                   	nop
 158:	90                   	nop
 159:	90                   	nop
 15a:	90                   	nop
 15b:	90                   	nop
 15c:	90                   	nop
 15d:	90                   	nop
 15e:	90                   	nop
 15f:	90                   	nop

00000160 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 160:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 161:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 163:	89 e5                	mov    %esp,%ebp
 165:	8b 4d 08             	mov    0x8(%ebp),%ecx
 168:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 169:	0f b6 11             	movzbl (%ecx),%edx
 16c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 16f:	80 fb 09             	cmp    $0x9,%bl
 172:	77 1c                	ja     190 <atoi+0x30>
 174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 178:	0f be d2             	movsbl %dl,%edx
 17b:	83 c1 01             	add    $0x1,%ecx
 17e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 181:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 185:	0f b6 11             	movzbl (%ecx),%edx
 188:	8d 5a d0             	lea    -0x30(%edx),%ebx
 18b:	80 fb 09             	cmp    $0x9,%bl
 18e:	76 e8                	jbe    178 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 190:	5b                   	pop    %ebx
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    
 193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	53                   	push   %ebx
 1a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1ae:	85 db                	test   %ebx,%ebx
 1b0:	7e 14                	jle    1c6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 1b2:	31 d2                	xor    %edx,%edx
 1b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 1b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1bf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1c2:	39 da                	cmp    %ebx,%edx
 1c4:	75 f2                	jne    1b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5d                   	pop    %ebp
 1c9:	c3                   	ret    
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001d0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 1df:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1eb:	00 
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 d4 00 00 00       	call   2c8 <open>
  if(fd < 0)
 1f4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1f8:	78 19                	js     213 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	89 44 24 04          	mov    %eax,0x4(%esp)
 204:	e8 d7 00 00 00       	call   2e0 <fstat>
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 20c:	89 c6                	mov    %eax,%esi
  close(fd);
 20e:	e8 9d 00 00 00       	call   2b0 <close>
  return r;
}
 213:	89 f0                	mov    %esi,%eax
 215:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 218:	8b 75 fc             	mov    -0x4(%ebp),%esi
 21b:	89 ec                	mov    %ebp,%esp
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop

00000220 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	31 f6                	xor    %esi,%esi
 227:	53                   	push   %ebx
 228:	83 ec 2c             	sub    $0x2c,%esp
 22b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	eb 06                	jmp    236 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 230:	3c 0a                	cmp    $0xa,%al
 232:	74 39                	je     26d <gets+0x4d>
 234:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	8d 5e 01             	lea    0x1(%esi),%ebx
 239:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23c:	7d 31                	jge    26f <gets+0x4f>
    cc = read(0, &c, 1);
 23e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 241:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 248:	00 
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 254:	e8 47 00 00 00       	call   2a0 <read>
    if(cc < 1)
 259:	85 c0                	test   %eax,%eax
 25b:	7e 12                	jle    26f <gets+0x4f>
      break;
    buf[i++] = c;
 25d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 261:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 265:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 269:	3c 0d                	cmp    $0xd,%al
 26b:	75 c3                	jne    230 <gets+0x10>
 26d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 26f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 273:	89 f8                	mov    %edi,%eax
 275:	83 c4 2c             	add    $0x2c,%esp
 278:	5b                   	pop    %ebx
 279:	5e                   	pop    %esi
 27a:	5f                   	pop    %edi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <fork>:
 280:	b8 01 00 00 00       	mov    $0x1,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <exit>:
 288:	b8 02 00 00 00       	mov    $0x2,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <wait>:
 290:	b8 03 00 00 00       	mov    $0x3,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <pipe>:
 298:	b8 04 00 00 00       	mov    $0x4,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <read>:
 2a0:	b8 06 00 00 00       	mov    $0x6,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <write>:
 2a8:	b8 05 00 00 00       	mov    $0x5,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <close>:
 2b0:	b8 07 00 00 00       	mov    $0x7,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <kill>:
 2b8:	b8 08 00 00 00       	mov    $0x8,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <exec>:
 2c0:	b8 09 00 00 00       	mov    $0x9,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <open>:
 2c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <mknod>:
 2d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <unlink>:
 2d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <fstat>:
 2e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <link>:
 2e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mkdir>:
 2f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <chdir>:
 2f8:	b8 10 00 00 00       	mov    $0x10,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <dup>:
 300:	b8 11 00 00 00       	mov    $0x11,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <getpid>:
 308:	b8 12 00 00 00       	mov    $0x12,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <sbrk>:
 310:	b8 13 00 00 00       	mov    $0x13,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <sleep>:
 318:	b8 14 00 00 00       	mov    $0x14,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <uptime>:
 320:	b8 15 00 00 00       	mov    $0x15,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <thread_create>:
 328:	b8 16 00 00 00       	mov    $0x16,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <thread_getid>:
 330:	b8 17 00 00 00       	mov    $0x17,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <thread_getProcid>:
 338:	b8 18 00 00 00       	mov    $0x18,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <thread_exit>:
 340:	b8 1a 00 00 00       	mov    $0x1a,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <thread_join>:
 348:	b8 19 00 00 00       	mov    $0x19,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <binary_sem_create>:
 350:	b8 1b 00 00 00       	mov    $0x1b,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <binary_sem_down>:
 358:	b8 1c 00 00 00       	mov    $0x1c,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <binary_sem_up>:
 360:	b8 1d 00 00 00       	mov    $0x1d,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <binary_sem_clear>:
 368:	b8 1e 00 00 00       	mov    $0x1e,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <exit_all_threads>:
 370:	b8 1f 00 00 00       	mov    $0x1f,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    
 378:	90                   	nop
 379:	90                   	nop
 37a:	90                   	nop
 37b:	90                   	nop
 37c:	90                   	nop
 37d:	90                   	nop
 37e:	90                   	nop
 37f:	90                   	nop

00000380 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	89 cf                	mov    %ecx,%edi
 386:	56                   	push   %esi
 387:	89 c6                	mov    %eax,%esi
 389:	53                   	push   %ebx
 38a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 38d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 390:	85 c9                	test   %ecx,%ecx
 392:	74 04                	je     398 <printint+0x18>
 394:	85 d2                	test   %edx,%edx
 396:	78 70                	js     408 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 398:	89 d0                	mov    %edx,%eax
 39a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3a1:	31 c9                	xor    %ecx,%ecx
 3a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3a6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 3a8:	31 d2                	xor    %edx,%edx
 3aa:	f7 f7                	div    %edi
 3ac:	0f b6 92 07 0c 00 00 	movzbl 0xc07(%edx),%edx
 3b3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 3b6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 3b9:	85 c0                	test   %eax,%eax
 3bb:	75 eb                	jne    3a8 <printint+0x28>
	if(neg)
 3bd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3c0:	85 c0                	test   %eax,%eax
 3c2:	74 08                	je     3cc <printint+0x4c>
		buf[i++] = '-';
 3c4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 3c9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 3cc:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3cf:	01 fb                	add    %edi,%ebx
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	0f b6 03             	movzbl (%ebx),%eax
 3db:	83 ef 01             	sub    $0x1,%edi
 3de:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 3e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3e8:	00 
 3e9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 3ec:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 3ef:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f6:	e8 ad fe ff ff       	call   2a8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 3fb:	83 ff ff             	cmp    $0xffffffff,%edi
 3fe:	75 d8                	jne    3d8 <printint+0x58>
		putc(fd, buf[i]);
}
 400:	83 c4 4c             	add    $0x4c,%esp
 403:	5b                   	pop    %ebx
 404:	5e                   	pop    %esi
 405:	5f                   	pop    %edi
 406:	5d                   	pop    %ebp
 407:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 408:	89 d0                	mov    %edx,%eax
 40a:	f7 d8                	neg    %eax
 40c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 413:	eb 8c                	jmp    3a1 <printint+0x21>
 415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 429:	8b 45 0c             	mov    0xc(%ebp),%eax
 42c:	0f b6 10             	movzbl (%eax),%edx
 42f:	84 d2                	test   %dl,%dl
 431:	0f 84 c9 00 00 00    	je     500 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 437:	8d 4d 10             	lea    0x10(%ebp),%ecx
 43a:	31 ff                	xor    %edi,%edi
 43c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 43f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 441:	8d 75 e7             	lea    -0x19(%ebp),%esi
 444:	eb 1e                	jmp    464 <printf+0x44>
 446:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 448:	83 fa 25             	cmp    $0x25,%edx
 44b:	0f 85 b7 00 00 00    	jne    508 <printf+0xe8>
 451:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 455:	83 c3 01             	add    $0x1,%ebx
 458:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 45c:	84 d2                	test   %dl,%dl
 45e:	0f 84 9c 00 00 00    	je     500 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 464:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 466:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 469:	74 dd                	je     448 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 46b:	83 ff 25             	cmp    $0x25,%edi
 46e:	75 e5                	jne    455 <printf+0x35>
			if(c == 'd'){
 470:	83 fa 64             	cmp    $0x64,%edx
 473:	0f 84 57 01 00 00    	je     5d0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 479:	83 fa 70             	cmp    $0x70,%edx
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 480:	0f 84 aa 00 00 00    	je     530 <printf+0x110>
 486:	83 fa 78             	cmp    $0x78,%edx
 489:	0f 84 a1 00 00 00    	je     530 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 48f:	83 fa 73             	cmp    $0x73,%edx
 492:	0f 84 c0 00 00 00    	je     558 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 498:	83 fa 63             	cmp    $0x63,%edx
 49b:	90                   	nop
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4a0:	0f 84 52 01 00 00    	je     5f8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 4a6:	83 fa 25             	cmp    $0x25,%edx
 4a9:	0f 84 f9 00 00 00    	je     5a8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4af:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4b2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4b5:	31 ff                	xor    %edi,%edi
 4b7:	89 55 cc             	mov    %edx,-0x34(%ebp)
 4ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c5:	00 
 4c6:	89 0c 24             	mov    %ecx,(%esp)
 4c9:	89 74 24 04          	mov    %esi,0x4(%esp)
 4cd:	e8 d6 fd ff ff       	call   2a8 <write>
 4d2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4df:	00 
 4e0:	89 74 24 04          	mov    %esi,0x4(%esp)
 4e4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e7:	89 04 24             	mov    %eax,(%esp)
 4ea:	e8 b9 fd ff ff       	call   2a8 <write>
 4ef:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4f2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4f6:	84 d2                	test   %dl,%dl
 4f8:	0f 85 66 ff ff ff    	jne    464 <printf+0x44>
 4fe:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 500:	83 c4 3c             	add    $0x3c,%esp
 503:	5b                   	pop    %ebx
 504:	5e                   	pop    %esi
 505:	5f                   	pop    %edi
 506:	5d                   	pop    %ebp
 507:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 508:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 50b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 50e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 515:	00 
 516:	89 74 24 04          	mov    %esi,0x4(%esp)
 51a:	89 04 24             	mov    %eax,(%esp)
 51d:	e8 86 fd ff ff       	call   2a8 <write>
 522:	8b 45 0c             	mov    0xc(%ebp),%eax
 525:	e9 2b ff ff ff       	jmp    455 <printf+0x35>
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 530:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 533:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 538:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 53a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 541:	8b 10                	mov    (%eax),%edx
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	e8 35 fe ff ff       	call   380 <printint>
 54b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 54e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 552:	e9 fe fe ff ff       	jmp    455 <printf+0x35>
 557:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 558:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 55b:	8b 3a                	mov    (%edx),%edi
				ap++;
 55d:	83 c2 04             	add    $0x4,%edx
 560:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 563:	85 ff                	test   %edi,%edi
 565:	0f 84 ba 00 00 00    	je     625 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 56b:	0f b6 17             	movzbl (%edi),%edx
 56e:	84 d2                	test   %dl,%dl
 570:	74 2d                	je     59f <printf+0x17f>
 572:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 575:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 578:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 57b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 57e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 585:	00 
 586:	89 74 24 04          	mov    %esi,0x4(%esp)
 58a:	89 1c 24             	mov    %ebx,(%esp)
 58d:	e8 16 fd ff ff       	call   2a8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 592:	0f b6 17             	movzbl (%edi),%edx
 595:	84 d2                	test   %dl,%dl
 597:	75 df                	jne    578 <printf+0x158>
 599:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 59f:	31 ff                	xor    %edi,%edi
 5a1:	e9 af fe ff ff       	jmp    455 <printf+0x35>
 5a6:	66 90                	xchg   %ax,%ax
 5a8:	8b 55 08             	mov    0x8(%ebp),%edx
 5ab:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 5ad:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b8:	00 
 5b9:	89 74 24 04          	mov    %esi,0x4(%esp)
 5bd:	89 14 24             	mov    %edx,(%esp)
 5c0:	e8 e3 fc ff ff       	call   2a8 <write>
 5c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c8:	e9 88 fe ff ff       	jmp    455 <printf+0x35>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 5d8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 5db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	8b 45 08             	mov    0x8(%ebp),%eax
 5e7:	e8 94 fd ff ff       	call   380 <printint>
 5ec:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 5ef:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5f3:	e9 5d fe ff ff       	jmp    455 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5f8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 5fb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5fd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5ff:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 606:	00 
 607:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 60b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	89 04 24             	mov    %eax,(%esp)
 614:	e8 8f fc ff ff       	call   2a8 <write>
 619:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 61c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 620:	e9 30 fe ff ff       	jmp    455 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 625:	bf 00 0c 00 00       	mov    $0xc00,%edi
 62a:	e9 3c ff ff ff       	jmp    56b <printf+0x14b>
 62f:	90                   	nop

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 d0 0c 00 00       	mov    0xcd0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	39 c8                	cmp    %ecx,%eax
 643:	73 1d                	jae    662 <free+0x32>
 645:	8d 76 00             	lea    0x0(%esi),%esi
 648:	8b 10                	mov    (%eax),%edx
 64a:	39 d1                	cmp    %edx,%ecx
 64c:	72 1a                	jb     668 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64e:	39 d0                	cmp    %edx,%eax
 650:	72 08                	jb     65a <free+0x2a>
 652:	39 c8                	cmp    %ecx,%eax
 654:	72 12                	jb     668 <free+0x38>
 656:	39 d1                	cmp    %edx,%ecx
 658:	72 0e                	jb     668 <free+0x38>
 65a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65c:	39 c8                	cmp    %ecx,%eax
 65e:	66 90                	xchg   %ax,%ax
 660:	72 e6                	jb     648 <free+0x18>
 662:	8b 10                	mov    (%eax),%edx
 664:	eb e8                	jmp    64e <free+0x1e>
 666:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 71 04             	mov    0x4(%ecx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 d7                	cmp    %edx,%edi
 670:	74 19                	je     68b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 672:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67b:	39 ce                	cmp    %ecx,%esi
 67d:	74 23                	je     6a2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 67f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 681:	a3 d0 0c 00 00       	mov    %eax,0xcd0
}
 686:	5b                   	pop    %ebx
 687:	5e                   	pop    %esi
 688:	5f                   	pop    %edi
 689:	5d                   	pop    %ebp
 68a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 68b:	03 72 04             	add    0x4(%edx),%esi
 68e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 691:	8b 10                	mov    (%eax),%edx
 693:	8b 12                	mov    (%edx),%edx
 695:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69e:	39 ce                	cmp    %ecx,%esi
 6a0:	75 dd                	jne    67f <free+0x4f>
    p->s.size += bp->s.size;
 6a2:	03 51 04             	add    0x4(%ecx),%edx
 6a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ab:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 6ad:	a3 d0 0c 00 00       	mov    %eax,0xcd0
}
 6b2:	5b                   	pop    %ebx
 6b3:	5e                   	pop    %esi
 6b4:	5f                   	pop    %edi
 6b5:	5d                   	pop    %ebp
 6b6:	c3                   	ret    
 6b7:	89 f6                	mov    %esi,%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 6cc:	8b 0d d0 0c 00 00    	mov    0xcd0,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	83 c3 07             	add    $0x7,%ebx
 6d5:	c1 eb 03             	shr    $0x3,%ebx
 6d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6db:	85 c9                	test   %ecx,%ecx
 6dd:	0f 84 93 00 00 00    	je     776 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	39 d3                	cmp    %edx,%ebx
 6ea:	76 1f                	jbe    70b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 6ec:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 6f8:	3b 05 d0 0c 00 00    	cmp    0xcd0,%eax
 6fe:	74 30                	je     730 <malloc+0x70>
 700:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 702:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 704:	8b 50 04             	mov    0x4(%eax),%edx
 707:	39 d3                	cmp    %edx,%ebx
 709:	77 ed                	ja     6f8 <malloc+0x38>
      if(p->s.size == nunits)
 70b:	39 d3                	cmp    %edx,%ebx
 70d:	74 61                	je     770 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 70f:	29 da                	sub    %ebx,%edx
 711:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 714:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 717:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 71a:	89 0d d0 0c 00 00    	mov    %ecx,0xcd0
      return (void*) (p + 1);
 720:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 723:	83 c4 1c             	add    $0x1c,%esp
 726:	5b                   	pop    %ebx
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	90                   	nop
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 730:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 736:	b8 00 80 00 00       	mov    $0x8000,%eax
 73b:	bf 00 10 00 00       	mov    $0x1000,%edi
 740:	76 04                	jbe    746 <malloc+0x86>
 742:	89 f0                	mov    %esi,%eax
 744:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 746:	89 04 24             	mov    %eax,(%esp)
 749:	e8 c2 fb ff ff       	call   310 <sbrk>
  if(p == (char*) -1)
 74e:	83 f8 ff             	cmp    $0xffffffff,%eax
 751:	74 18                	je     76b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 753:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 756:	83 c0 08             	add    $0x8,%eax
 759:	89 04 24             	mov    %eax,(%esp)
 75c:	e8 cf fe ff ff       	call   630 <free>
  return freep;
 761:	8b 0d d0 0c 00 00    	mov    0xcd0,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 767:	85 c9                	test   %ecx,%ecx
 769:	75 97                	jne    702 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 76b:	31 c0                	xor    %eax,%eax
 76d:	eb b4                	jmp    723 <malloc+0x63>
 76f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 770:	8b 10                	mov    (%eax),%edx
 772:	89 11                	mov    %edx,(%ecx)
 774:	eb a4                	jmp    71a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 776:	c7 05 d0 0c 00 00 c8 	movl   $0xcc8,0xcd0
 77d:	0c 00 00 
    base.s.size = 0;
 780:	b9 c8 0c 00 00       	mov    $0xcc8,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 785:	c7 05 c8 0c 00 00 c8 	movl   $0xcc8,0xcc8
 78c:	0c 00 00 
    base.s.size = 0;
 78f:	c7 05 cc 0c 00 00 00 	movl   $0x0,0xccc
 796:	00 00 00 
 799:	e9 45 ff ff ff       	jmp    6e3 <malloc+0x23>
 79e:	90                   	nop
 79f:	90                   	nop

000007a0 <sem_clear>:
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	53                   	push   %ebx
 7a4:	83 ec 14             	sub    $0x14,%esp
 7a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7aa:	8b 03                	mov    (%ebx),%eax
 7ac:	89 04 24             	mov    %eax,(%esp)
 7af:	e8 b4 fb ff ff       	call   368 <binary_sem_clear>
 7b4:	8b 43 04             	mov    0x4(%ebx),%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 a9 fb ff ff       	call   368 <binary_sem_clear>
 7bf:	89 5d 08             	mov    %ebx,0x8(%ebp)
 7c2:	83 c4 14             	add    $0x14,%esp
 7c5:	5b                   	pop    %ebx
 7c6:	5d                   	pop    %ebp
 7c7:	e9 64 fe ff ff       	jmp    630 <free>
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007d0 <sem_downs>:
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	83 ec 18             	sub    $0x18,%esp
 7d6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 7d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 7df:	8b 75 0c             	mov    0xc(%ebp),%esi
 7e2:	8b 43 04             	mov    0x4(%ebx),%eax
 7e5:	89 04 24             	mov    %eax,(%esp)
 7e8:	e8 6b fb ff ff       	call   358 <binary_sem_down>
 7ed:	8b 03                	mov    (%ebx),%eax
 7ef:	89 04 24             	mov    %eax,(%esp)
 7f2:	e8 61 fb ff ff       	call   358 <binary_sem_down>
 7f7:	8b 43 08             	mov    0x8(%ebx),%eax
 7fa:	29 f0                	sub    %esi,%eax
 7fc:	85 c0                	test   %eax,%eax
 7fe:	89 43 08             	mov    %eax,0x8(%ebx)
 801:	74 0b                	je     80e <sem_downs+0x3e>
 803:	8b 43 04             	mov    0x4(%ebx),%eax
 806:	89 04 24             	mov    %eax,(%esp)
 809:	e8 52 fb ff ff       	call   360 <binary_sem_up>
 80e:	8b 03                	mov    (%ebx),%eax
 810:	8b 75 fc             	mov    -0x4(%ebp),%esi
 813:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 816:	89 45 08             	mov    %eax,0x8(%ebp)
 819:	89 ec                	mov    %ebp,%esp
 81b:	5d                   	pop    %ebp
 81c:	e9 3f fb ff ff       	jmp    360 <binary_sem_up>
 821:	eb 0d                	jmp    830 <sem_down>
 823:	90                   	nop
 824:	90                   	nop
 825:	90                   	nop
 826:	90                   	nop
 827:	90                   	nop
 828:	90                   	nop
 829:	90                   	nop
 82a:	90                   	nop
 82b:	90                   	nop
 82c:	90                   	nop
 82d:	90                   	nop
 82e:	90                   	nop
 82f:	90                   	nop

00000830 <sem_down>:
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	53                   	push   %ebx
 834:	83 ec 14             	sub    $0x14,%esp
 837:	8b 5d 08             	mov    0x8(%ebp),%ebx
 83a:	8b 43 04             	mov    0x4(%ebx),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 13 fb ff ff       	call   358 <binary_sem_down>
 845:	8b 03                	mov    (%ebx),%eax
 847:	89 04 24             	mov    %eax,(%esp)
 84a:	e8 09 fb ff ff       	call   358 <binary_sem_down>
 84f:	8b 43 08             	mov    0x8(%ebx),%eax
 852:	83 e8 01             	sub    $0x1,%eax
 855:	85 c0                	test   %eax,%eax
 857:	89 43 08             	mov    %eax,0x8(%ebx)
 85a:	74 0b                	je     867 <sem_down+0x37>
 85c:	8b 43 04             	mov    0x4(%ebx),%eax
 85f:	89 04 24             	mov    %eax,(%esp)
 862:	e8 f9 fa ff ff       	call   360 <binary_sem_up>
 867:	8b 03                	mov    (%ebx),%eax
 869:	89 45 08             	mov    %eax,0x8(%ebp)
 86c:	83 c4 14             	add    $0x14,%esp
 86f:	5b                   	pop    %ebx
 870:	5d                   	pop    %ebp
 871:	e9 ea fa ff ff       	jmp    360 <binary_sem_up>
 876:	8d 76 00             	lea    0x0(%esi),%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000880 <sem_ups>:
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 18             	sub    $0x18,%esp
 886:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 889:	8b 5d 08             	mov    0x8(%ebp),%ebx
 88c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 88f:	8b 75 0c             	mov    0xc(%ebp),%esi
 892:	8b 03                	mov    (%ebx),%eax
 894:	89 04 24             	mov    %eax,(%esp)
 897:	e8 bc fa ff ff       	call   358 <binary_sem_down>
 89c:	03 73 08             	add    0x8(%ebx),%esi
 89f:	83 fe 01             	cmp    $0x1,%esi
 8a2:	89 73 08             	mov    %esi,0x8(%ebx)
 8a5:	74 19                	je     8c0 <sem_ups+0x40>
 8a7:	8b 03                	mov    (%ebx),%eax
 8a9:	8b 75 fc             	mov    -0x4(%ebp),%esi
 8ac:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 8af:	89 45 08             	mov    %eax,0x8(%ebp)
 8b2:	89 ec                	mov    %ebp,%esp
 8b4:	5d                   	pop    %ebp
 8b5:	e9 a6 fa ff ff       	jmp    360 <binary_sem_up>
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8c0:	8b 43 04             	mov    0x4(%ebx),%eax
 8c3:	89 04 24             	mov    %eax,(%esp)
 8c6:	e8 95 fa ff ff       	call   360 <binary_sem_up>
 8cb:	eb da                	jmp    8a7 <sem_ups+0x27>
 8cd:	8d 76 00             	lea    0x0(%esi),%esi

000008d0 <sem_up>:
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 14             	sub    $0x14,%esp
 8d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8da:	8b 03                	mov    (%ebx),%eax
 8dc:	89 04 24             	mov    %eax,(%esp)
 8df:	e8 74 fa ff ff       	call   358 <binary_sem_down>
 8e4:	8b 43 08             	mov    0x8(%ebx),%eax
 8e7:	83 c0 01             	add    $0x1,%eax
 8ea:	83 f8 01             	cmp    $0x1,%eax
 8ed:	89 43 08             	mov    %eax,0x8(%ebx)
 8f0:	74 16                	je     908 <sem_up+0x38>
 8f2:	8b 03                	mov    (%ebx),%eax
 8f4:	89 45 08             	mov    %eax,0x8(%ebp)
 8f7:	83 c4 14             	add    $0x14,%esp
 8fa:	5b                   	pop    %ebx
 8fb:	5d                   	pop    %ebp
 8fc:	e9 5f fa ff ff       	jmp    360 <binary_sem_up>
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 908:	8b 43 04             	mov    0x4(%ebx),%eax
 90b:	89 04 24             	mov    %eax,(%esp)
 90e:	e8 4d fa ff ff       	call   360 <binary_sem_up>
 913:	8b 03                	mov    (%ebx),%eax
 915:	89 45 08             	mov    %eax,0x8(%ebp)
 918:	83 c4 14             	add    $0x14,%esp
 91b:	5b                   	pop    %ebx
 91c:	5d                   	pop    %ebp
 91d:	e9 3e fa ff ff       	jmp    360 <binary_sem_up>
 922:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000930 <semaphore_create>:
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 28             	sub    $0x28,%esp
 936:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 93d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 940:	89 75 f8             	mov    %esi,-0x8(%ebp)
 943:	89 7d fc             	mov    %edi,-0x4(%ebp)
 946:	8b 7d 08             	mov    0x8(%ebp),%edi
 949:	e8 72 fd ff ff       	call   6c0 <malloc>
 94e:	89 78 08             	mov    %edi,0x8(%eax)
 951:	89 c3                	mov    %eax,%ebx
 953:	e8 f8 f9 ff ff       	call   350 <binary_sem_create>
 958:	89 03                	mov    %eax,(%ebx)
 95a:	89 c6                	mov    %eax,%esi
 95c:	e8 ef f9 ff ff       	call   350 <binary_sem_create>
 961:	01 c6                	add    %eax,%esi
 963:	89 43 04             	mov    %eax,0x4(%ebx)
 966:	78 20                	js     988 <semaphore_create+0x58>
 968:	85 ff                	test   %edi,%edi
 96a:	75 08                	jne    974 <semaphore_create+0x44>
 96c:	89 04 24             	mov    %eax,(%esp)
 96f:	e8 e4 f9 ff ff       	call   358 <binary_sem_down>
 974:	89 d8                	mov    %ebx,%eax
 976:	8b 75 f8             	mov    -0x8(%ebp),%esi
 979:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 97c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 97f:	89 ec                	mov    %ebp,%esp
 981:	5d                   	pop    %ebp
 982:	c3                   	ret    
 983:	90                   	nop
 984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 988:	c7 44 24 04 18 0c 00 	movl   $0xc18,0x4(%esp)
 98f:	00 
 990:	31 db                	xor    %ebx,%ebx
 992:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 999:	e8 82 fa ff ff       	call   420 <printf>
 99e:	eb d4                	jmp    974 <semaphore_create+0x44>

000009a0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 9a6:	8b 45 08             	mov    0x8(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9ae:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 9af:	e9 ac f9 ff ff       	jmp    360 <binary_sem_up>
 9b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009c0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	56                   	push   %esi
 9c4:	53                   	push   %ebx
 9c5:	83 ec 10             	sub    $0x10,%esp
 9c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 9cb:	8b 43 08             	mov    0x8(%ebx),%eax
 9ce:	89 04 24             	mov    %eax,(%esp)
 9d1:	e8 5a fe ff ff       	call   830 <sem_down>
	binary_sem_down(bb->mutex);
 9d6:	8b 03                	mov    (%ebx),%eax
 9d8:	89 04 24             	mov    %eax,(%esp)
 9db:	e8 78 f9 ff ff       	call   358 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 9e0:	8b 43 14             	mov    0x14(%ebx),%eax
 9e3:	c1 e0 02             	shl    $0x2,%eax
 9e6:	03 43 0c             	add    0xc(%ebx),%eax
 9e9:	8b 30                	mov    (%eax),%esi
 9eb:	85 f6                	test   %esi,%esi
 9ed:	74 42                	je     a31 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 9ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 9f5:	8b 53 18             	mov    0x18(%ebx),%edx
 9f8:	8b 43 14             	mov    0x14(%ebx),%eax
 9fb:	83 ea 01             	sub    $0x1,%edx
 9fe:	39 d0                	cmp    %edx,%eax
 a00:	74 26                	je     a28 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 a02:	83 c0 01             	add    $0x1,%eax
 a05:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 a08:	8b 03                	mov    (%ebx),%eax
 a0a:	89 04 24             	mov    %eax,(%esp)
 a0d:	e8 4e f9 ff ff       	call   360 <binary_sem_up>
	sem_up(bb->empty);
 a12:	8b 43 04             	mov    0x4(%ebx),%eax
 a15:	89 04 24             	mov    %eax,(%esp)
 a18:	e8 b3 fe ff ff       	call   8d0 <sem_up>
	return element;
}
 a1d:	83 c4 10             	add    $0x10,%esp
 a20:	89 f0                	mov    %esi,%eax
 a22:	5b                   	pop    %ebx
 a23:	5e                   	pop    %esi
 a24:	5d                   	pop    %ebp
 a25:	c3                   	ret    
 a26:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 a28:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 a2f:	eb d7                	jmp    a08 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 a31:	c7 44 24 04 40 0c 00 	movl   $0xc40,0x4(%esp)
 a38:	00 
 a39:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a40:	e8 db f9 ff ff       	call   420 <printf>
 a45:	eb c1                	jmp    a08 <semaphore_pop+0x48>
 a47:	89 f6                	mov    %esi,%esi
 a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	56                   	push   %esi
 a54:	53                   	push   %ebx
 a55:	83 ec 10             	sub    $0x10,%esp
 a58:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a5b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 a5e:	8b 43 04             	mov    0x4(%ebx),%eax
 a61:	89 04 24             	mov    %eax,(%esp)
 a64:	e8 c7 fd ff ff       	call   830 <sem_down>
	binary_sem_down(bb->mutex);
 a69:	8b 03                	mov    (%ebx),%eax
 a6b:	89 04 24             	mov    %eax,(%esp)
 a6e:	e8 e5 f8 ff ff       	call   358 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 a73:	8b 43 10             	mov    0x10(%ebx),%eax
 a76:	c1 e0 02             	shl    $0x2,%eax
 a79:	03 43 0c             	add    0xc(%ebx),%eax
 a7c:	8b 10                	mov    (%eax),%edx
 a7e:	85 d2                	test   %edx,%edx
 a80:	74 26                	je     aa8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 a82:	c7 44 24 04 84 0c 00 	movl   $0xc84,0x4(%esp)
 a89:	00 
 a8a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a91:	e8 8a f9 ff ff       	call   420 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 a96:	8b 43 08             	mov    0x8(%ebx),%eax
 a99:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a9c:	83 c4 10             	add    $0x10,%esp
 a9f:	5b                   	pop    %ebx
 aa0:	5e                   	pop    %esi
 aa1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 aa2:	e9 29 fe ff ff       	jmp    8d0 <sem_up>
 aa7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 aa8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 aaa:	8b 53 18             	mov    0x18(%ebx),%edx
 aad:	8b 43 10             	mov    0x10(%ebx),%eax
 ab0:	83 ea 01             	sub    $0x1,%edx
 ab3:	39 d0                	cmp    %edx,%eax
 ab5:	74 09                	je     ac0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 ab7:	83 c0 01             	add    $0x1,%eax
 aba:	89 43 10             	mov    %eax,0x10(%ebx)
 abd:	eb d7                	jmp    a96 <semaphore_put_atomic+0x46>
 abf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 ac0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 ac7:	eb cd                	jmp    a96 <semaphore_put_atomic+0x46>
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	56                   	push   %esi
 ad4:	53                   	push   %ebx
 ad5:	83 ec 10             	sub    $0x10,%esp
 ad8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 adb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 ade:	8b 43 04             	mov    0x4(%ebx),%eax
 ae1:	89 04 24             	mov    %eax,(%esp)
 ae4:	e8 47 fd ff ff       	call   830 <sem_down>
	binary_sem_down(bb->mutex);
 ae9:	8b 03                	mov    (%ebx),%eax
 aeb:	89 04 24             	mov    %eax,(%esp)
 aee:	e8 65 f8 ff ff       	call   358 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 af3:	8b 43 10             	mov    0x10(%ebx),%eax
 af6:	c1 e0 02             	shl    $0x2,%eax
 af9:	03 43 0c             	add    0xc(%ebx),%eax
 afc:	8b 08                	mov    (%eax),%ecx
 afe:	85 c9                	test   %ecx,%ecx
 b00:	74 36                	je     b38 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 b02:	c7 44 24 04 84 0c 00 	movl   $0xc84,0x4(%esp)
 b09:	00 
 b0a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b11:	e8 0a f9 ff ff       	call   420 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 b16:	8b 03                	mov    (%ebx),%eax
 b18:	89 04 24             	mov    %eax,(%esp)
 b1b:	e8 40 f8 ff ff       	call   360 <binary_sem_up>
	sem_up(bb->full);
 b20:	8b 43 08             	mov    0x8(%ebx),%eax
 b23:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b26:	83 c4 10             	add    $0x10,%esp
 b29:	5b                   	pop    %ebx
 b2a:	5e                   	pop    %esi
 b2b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 b2c:	e9 9f fd ff ff       	jmp    8d0 <sem_up>
 b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 b38:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 b3a:	8b 53 18             	mov    0x18(%ebx),%edx
 b3d:	8b 43 10             	mov    0x10(%ebx),%eax
 b40:	83 ea 01             	sub    $0x1,%edx
 b43:	39 d0                	cmp    %edx,%eax
 b45:	74 09                	je     b50 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 b47:	83 c0 01             	add    $0x1,%eax
 b4a:	89 43 10             	mov    %eax,0x10(%ebx)
 b4d:	eb c7                	jmp    b16 <semaphore_put+0x46>
 b4f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 b50:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 b57:	eb bd                	jmp    b16 <semaphore_put+0x46>
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b60 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	83 ec 18             	sub    $0x18,%esp
 b66:	89 75 fc             	mov    %esi,-0x4(%ebp)
 b69:	8b 75 08             	mov    0x8(%ebp),%esi
 b6c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 b6f:	85 f6                	test   %esi,%esi
 b71:	79 15                	jns    b88 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 b73:	31 db                	xor    %ebx,%ebx
}
 b75:	89 d8                	mov    %ebx,%eax
 b77:	8b 75 fc             	mov    -0x4(%ebp),%esi
 b7a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 b7d:	89 ec                	mov    %ebp,%esp
 b7f:	5d                   	pop    %ebp
 b80:	c3                   	ret    
 b81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 b88:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 b8f:	e8 2c fb ff ff       	call   6c0 <malloc>
 b94:	85 c0                	test   %eax,%eax
 b96:	89 c3                	mov    %eax,%ebx
 b98:	74 db                	je     b75 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 b9a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 ba1:	89 04 24             	mov    %eax,(%esp)
 ba4:	e8 17 fb ff ff       	call   6c0 <malloc>
 ba9:	85 c0                	test   %eax,%eax
 bab:	89 43 0c             	mov    %eax,0xc(%ebx)
 bae:	74 c3                	je     b73 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 bb0:	89 34 24             	mov    %esi,(%esp)
 bb3:	e8 78 fd ff ff       	call   930 <semaphore_create>
 bb8:	85 c0                	test   %eax,%eax
 bba:	89 43 04             	mov    %eax,0x4(%ebx)
 bbd:	74 b4                	je     b73 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 bbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 bc6:	e8 65 fd ff ff       	call   930 <semaphore_create>
 bcb:	85 c0                	test   %eax,%eax
 bcd:	89 43 08             	mov    %eax,0x8(%ebx)
 bd0:	74 a1                	je     b73 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 bd2:	e8 79 f7 ff ff       	call   350 <binary_sem_create>
	ret->produce = 0;
 bd7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 bde:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 be5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 be8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 bea:	eb 89                	jmp    b75 <BB_create+0x15>
