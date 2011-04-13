
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
   7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   a:	eb 1c                	jmp    28 <cat+0x28>
   c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    write(1, buf, n);
  10:	89 44 24 08          	mov    %eax,0x8(%esp)
  14:	c7 44 24 04 00 0e 00 	movl   $0xe00,0x4(%esp)
  1b:	00 
  1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  23:	e8 30 03 00 00       	call   358 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  28:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2f:	00 
  30:	c7 44 24 04 00 0e 00 	movl   $0xe00,0x4(%esp)
  37:	00 
  38:	89 1c 24             	mov    %ebx,(%esp)
  3b:	e8 10 03 00 00       	call   350 <read>
  40:	83 f8 00             	cmp    $0x0,%eax
  43:	7f cb                	jg     10 <cat+0x10>
    write(1, buf, n);
  if(n < 0){
  45:	75 0a                	jne    51 <cat+0x51>
    printf(1, "cat: read error\n");
    exit();
  }
}
  47:	83 c4 14             	add    $0x14,%esp
  4a:	5b                   	pop    %ebx
  4b:	5d                   	pop    %ebp
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  50:	c3                   	ret    
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    write(1, buf, n);
  if(n < 0){
    printf(1, "cat: read error\n");
  51:	c7 44 24 04 ec 0c 00 	movl   $0xcec,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 6b 04 00 00       	call   4d0 <printf>
    exit();
  65:	e8 ce 02 00 00       	call   338 <exit>
  6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000070 <main>:
  }
}

int
main(int argc, char *argv[])
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	83 e4 f0             	and    $0xfffffff0,%esp
  76:	57                   	push   %edi
  77:	56                   	push   %esi
  78:	53                   	push   %ebx
  79:	83 ec 24             	sub    $0x24,%esp
  7c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  7f:	83 ff 01             	cmp    $0x1,%edi
  82:	7e 6c                	jle    f0 <main+0x80>
    cat(0);
    exit();
  84:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  87:	be 01 00 00 00       	mov    $0x1,%esi
  8c:	83 c3 04             	add    $0x4,%ebx
  8f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  90:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  97:	00 
  98:	8b 03                	mov    (%ebx),%eax
  9a:	89 04 24             	mov    %eax,(%esp)
  9d:	e8 d6 02 00 00       	call   378 <open>
  a2:	85 c0                	test   %eax,%eax
  a4:	78 2a                	js     d0 <main+0x60>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  a6:	89 04 24             	mov    %eax,(%esp)
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  a9:	83 c6 01             	add    $0x1,%esi
  ac:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  af:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  b3:	e8 48 ff ff ff       	call   0 <cat>
    close(fd);
  b8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  bc:	89 04 24             	mov    %eax,(%esp)
  bf:	e8 9c 02 00 00       	call   360 <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  c4:	39 f7                	cmp    %esi,%edi
  c6:	7f c8                	jg     90 <main+0x20>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  c8:	e8 6b 02 00 00       	call   338 <exit>
  cd:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  d0:	8b 03                	mov    (%ebx),%eax
  d2:	c7 44 24 04 fd 0c 00 	movl   $0xcfd,0x4(%esp)
  d9:	00 
  da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e1:	89 44 24 08          	mov    %eax,0x8(%esp)
  e5:	e8 e6 03 00 00       	call   4d0 <printf>
      exit();
  ea:	e8 49 02 00 00       	call   338 <exit>
  ef:	90                   	nop
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
  f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  f7:	e8 04 ff ff ff       	call   0 <cat>
    exit();
  fc:	e8 37 02 00 00       	call   338 <exit>
 101:	90                   	nop
 102:	90                   	nop
 103:	90                   	nop
 104:	90                   	nop
 105:	90                   	nop
 106:	90                   	nop
 107:	90                   	nop
 108:	90                   	nop
 109:	90                   	nop
 10a:	90                   	nop
 10b:	90                   	nop
 10c:	90                   	nop
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 110:	55                   	push   %ebp
 111:	31 d2                	xor    %edx,%edx
 113:	89 e5                	mov    %esp,%ebp
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	53                   	push   %ebx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 120:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 124:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 c9                	test   %cl,%cl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	5b                   	pop    %ebx
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	eb 0d                	jmp    140 <strcmp>
 133:	90                   	nop
 134:	90                   	nop
 135:	90                   	nop
 136:	90                   	nop
 137:	90                   	nop
 138:	90                   	nop
 139:	90                   	nop
 13a:	90                   	nop
 13b:	90                   	nop
 13c:	90                   	nop
 13d:	90                   	nop
 13e:	90                   	nop
 13f:	90                   	nop

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 4d 08             	mov    0x8(%ebp),%ecx
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14a:	0f b6 01             	movzbl (%ecx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	75 14                	jne    165 <strcmp+0x25>
 151:	eb 25                	jmp    178 <strcmp+0x38>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 158:	83 c1 01             	add    $0x1,%ecx
 15b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 15e:	0f b6 01             	movzbl (%ecx),%eax
 161:	84 c0                	test   %al,%al
 163:	74 13                	je     178 <strcmp+0x38>
 165:	0f b6 1a             	movzbl (%edx),%ebx
 168:	38 d8                	cmp    %bl,%al
 16a:	74 ec                	je     158 <strcmp+0x18>
 16c:	0f b6 db             	movzbl %bl,%ebx
 16f:	0f b6 c0             	movzbl %al,%eax
 172:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 174:	5b                   	pop    %ebx
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 178:	0f b6 1a             	movzbl (%edx),%ebx
 17b:	31 c0                	xor    %eax,%eax
 17d:	0f b6 db             	movzbl %bl,%ebx
 180:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 182:	5b                   	pop    %ebx
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <strlen>:

uint
strlen(char *s)
{
 190:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 191:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 193:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 195:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 197:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 19a:	80 39 00             	cmpb   $0x0,(%ecx)
 19d:	74 0c                	je     1ab <strlen+0x1b>
 19f:	90                   	nop
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	89 d0                	mov    %edx,%eax
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 11                	jne    1f2 <strchr+0x22>
 1e1:	eb 15                	jmp    1f8 <strchr+0x28>
 1e3:	90                   	nop
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	0f b6 10             	movzbl (%eax),%edx
 1ee:	84 d2                	test   %dl,%dl
 1f0:	74 06                	je     1f8 <strchr+0x28>
    if(*s == c)
 1f2:	38 ca                	cmp    %cl,%dl
 1f4:	75 f2                	jne    1e8 <strchr+0x18>
      return (char*) s;
  return 0;
}
 1f6:	5d                   	pop    %ebp
 1f7:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f8:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 1fa:	5d                   	pop    %ebp
 1fb:	90                   	nop
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 200:	c3                   	ret    
 201:	eb 0d                	jmp    210 <atoi>
 203:	90                   	nop
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

00000210 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 211:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 213:	89 e5                	mov    %esp,%ebp
 215:	8b 4d 08             	mov    0x8(%ebp),%ecx
 218:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 219:	0f b6 11             	movzbl (%ecx),%edx
 21c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 21f:	80 fb 09             	cmp    $0x9,%bl
 222:	77 1c                	ja     240 <atoi+0x30>
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 228:	0f be d2             	movsbl %dl,%edx
 22b:	83 c1 01             	add    $0x1,%ecx
 22e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 231:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 235:	0f b6 11             	movzbl (%ecx),%edx
 238:	8d 5a d0             	lea    -0x30(%edx),%ebx
 23b:	80 fb 09             	cmp    $0x9,%bl
 23e:	76 e8                	jbe    228 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	8b 45 08             	mov    0x8(%ebp),%eax
 257:	53                   	push   %ebx
 258:	8b 5d 10             	mov    0x10(%ebp),%ebx
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 db                	test   %ebx,%ebx
 260:	7e 14                	jle    276 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 262:	31 d2                	xor    %edx,%edx
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 26c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 26f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 272:	39 da                	cmp    %ebx,%edx
 274:	75 f2                	jne    268 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 286:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 289:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 28c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 28f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 294:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 29b:	00 
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 d4 00 00 00       	call   378 <open>
  if(fd < 0)
 2a4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2a8:	78 19                	js     2c3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 1c 24             	mov    %ebx,(%esp)
 2b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b4:	e8 d7 00 00 00       	call   390 <fstat>
  close(fd);
 2b9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2bc:	89 c6                	mov    %eax,%esi
  close(fd);
 2be:	e8 9d 00 00 00       	call   360 <close>
  return r;
}
 2c3:	89 f0                	mov    %esi,%eax
 2c5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2c8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2cb:	89 ec                	mov    %ebp,%esp
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    
 2cf:	90                   	nop

000002d0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	31 f6                	xor    %esi,%esi
 2d7:	53                   	push   %ebx
 2d8:	83 ec 2c             	sub    $0x2c,%esp
 2db:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2de:	eb 06                	jmp    2e6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2e0:	3c 0a                	cmp    $0xa,%al
 2e2:	74 39                	je     31d <gets+0x4d>
 2e4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	8d 5e 01             	lea    0x1(%esi),%ebx
 2e9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ec:	7d 31                	jge    31f <gets+0x4f>
    cc = read(0, &c, 1);
 2ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2f8:	00 
 2f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 304:	e8 47 00 00 00       	call   350 <read>
    if(cc < 1)
 309:	85 c0                	test   %eax,%eax
 30b:	7e 12                	jle    31f <gets+0x4f>
      break;
    buf[i++] = c;
 30d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 311:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 315:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 319:	3c 0d                	cmp    $0xd,%al
 31b:	75 c3                	jne    2e0 <gets+0x10>
 31d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 31f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 323:	89 f8                	mov    %edi,%eax
 325:	83 c4 2c             	add    $0x2c,%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	90                   	nop
 32e:	90                   	nop
 32f:	90                   	nop

00000330 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 330:	b8 01 00 00 00       	mov    $0x1,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <exit>:
SYSCALL(exit)
 338:	b8 02 00 00 00       	mov    $0x2,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <wait>:
SYSCALL(wait)
 340:	b8 03 00 00 00       	mov    $0x3,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <pipe>:
SYSCALL(pipe)
 348:	b8 04 00 00 00       	mov    $0x4,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <read>:
SYSCALL(read)
 350:	b8 06 00 00 00       	mov    $0x6,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <write>:
SYSCALL(write)
 358:	b8 05 00 00 00       	mov    $0x5,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <close>:
SYSCALL(close)
 360:	b8 07 00 00 00       	mov    $0x7,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <kill>:
SYSCALL(kill)
 368:	b8 08 00 00 00       	mov    $0x8,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <exec>:
SYSCALL(exec)
 370:	b8 09 00 00 00       	mov    $0x9,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <open>:
SYSCALL(open)
 378:	b8 0a 00 00 00       	mov    $0xa,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <mknod>:
SYSCALL(mknod)
 380:	b8 0b 00 00 00       	mov    $0xb,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <unlink>:
SYSCALL(unlink)
 388:	b8 0c 00 00 00       	mov    $0xc,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <fstat>:
SYSCALL(fstat)
 390:	b8 0d 00 00 00       	mov    $0xd,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <link>:
SYSCALL(link)
 398:	b8 0e 00 00 00       	mov    $0xe,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <mkdir>:
SYSCALL(mkdir)
 3a0:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <chdir>:
SYSCALL(chdir)
 3a8:	b8 10 00 00 00       	mov    $0x10,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <dup>:
SYSCALL(dup)
 3b0:	b8 11 00 00 00       	mov    $0x11,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <getpid>:
SYSCALL(getpid)
 3b8:	b8 12 00 00 00       	mov    $0x12,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <sbrk>:
SYSCALL(sbrk)
 3c0:	b8 13 00 00 00       	mov    $0x13,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <sleep>:
SYSCALL(sleep)
 3c8:	b8 14 00 00 00       	mov    $0x14,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <uptime>:
SYSCALL(uptime)
 3d0:	b8 15 00 00 00       	mov    $0x15,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <thread_create>:
SYSCALL(thread_create)
 3d8:	b8 16 00 00 00       	mov    $0x16,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <thread_getid>:
SYSCALL(thread_getid)
 3e0:	b8 17 00 00 00       	mov    $0x17,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <thread_getProcId>:
SYSCALL(thread_getProcId)
 3e8:	b8 18 00 00 00       	mov    $0x18,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <thread_exit>:
SYSCALL(thread_exit)
 3f0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <thread_join>:
SYSCALL(thread_join)
 3f8:	b8 19 00 00 00       	mov    $0x19,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <binary_sem_create>:
SYSCALL(binary_sem_create)
 400:	b8 1b 00 00 00       	mov    $0x1b,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <binary_sem_down>:
SYSCALL(binary_sem_down)
 408:	b8 1c 00 00 00       	mov    $0x1c,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <binary_sem_up>:
SYSCALL(binary_sem_up)
 410:	b8 1d 00 00 00       	mov    $0x1d,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 418:	b8 1e 00 00 00       	mov    $0x1e,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <exit_all_threads>:
 420:	b8 1f 00 00 00       	mov    $0x1f,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	89 cf                	mov    %ecx,%edi
 436:	56                   	push   %esi
 437:	89 c6                	mov    %eax,%esi
 439:	53                   	push   %ebx
 43a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 43d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 440:	85 c9                	test   %ecx,%ecx
 442:	74 04                	je     448 <printint+0x18>
 444:	85 d2                	test   %edx,%edx
 446:	78 70                	js     4b8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 448:	89 d0                	mov    %edx,%eax
 44a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 451:	31 c9                	xor    %ecx,%ecx
 453:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 456:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 458:	31 d2                	xor    %edx,%edx
 45a:	f7 f7                	div    %edi
 45c:	0f b6 92 19 0d 00 00 	movzbl 0xd19(%edx),%edx
 463:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 466:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 469:	85 c0                	test   %eax,%eax
 46b:	75 eb                	jne    458 <printint+0x28>
	if(neg)
 46d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 470:	85 c0                	test   %eax,%eax
 472:	74 08                	je     47c <printint+0x4c>
		buf[i++] = '-';
 474:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 479:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 47c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 47f:	01 fb                	add    %edi,%ebx
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	0f b6 03             	movzbl (%ebx),%eax
 48b:	83 ef 01             	sub    $0x1,%edi
 48e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 491:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 498:	00 
 499:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 49c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 49f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a6:	e8 ad fe ff ff       	call   358 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 4ab:	83 ff ff             	cmp    $0xffffffff,%edi
 4ae:	75 d8                	jne    488 <printint+0x58>
		putc(fd, buf[i]);
}
 4b0:	83 c4 4c             	add    $0x4c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	f7 d8                	neg    %eax
 4bc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4c3:	eb 8c                	jmp    451 <printint+0x21>
 4c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 4d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dc:	0f b6 10             	movzbl (%eax),%edx
 4df:	84 d2                	test   %dl,%dl
 4e1:	0f 84 c9 00 00 00    	je     5b0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 4e7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4ea:	31 ff                	xor    %edi,%edi
 4ec:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4ef:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 4f1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4f4:	eb 1e                	jmp    514 <printf+0x44>
 4f6:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 4f8:	83 fa 25             	cmp    $0x25,%edx
 4fb:	0f 85 b7 00 00 00    	jne    5b8 <printf+0xe8>
 501:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 505:	83 c3 01             	add    $0x1,%ebx
 508:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 50c:	84 d2                	test   %dl,%dl
 50e:	0f 84 9c 00 00 00    	je     5b0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 514:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 516:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 519:	74 dd                	je     4f8 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 51b:	83 ff 25             	cmp    $0x25,%edi
 51e:	75 e5                	jne    505 <printf+0x35>
			if(c == 'd'){
 520:	83 fa 64             	cmp    $0x64,%edx
 523:	0f 84 57 01 00 00    	je     680 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 529:	83 fa 70             	cmp    $0x70,%edx
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 530:	0f 84 aa 00 00 00    	je     5e0 <printf+0x110>
 536:	83 fa 78             	cmp    $0x78,%edx
 539:	0f 84 a1 00 00 00    	je     5e0 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 53f:	83 fa 73             	cmp    $0x73,%edx
 542:	0f 84 c0 00 00 00    	je     608 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 548:	83 fa 63             	cmp    $0x63,%edx
 54b:	90                   	nop
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 550:	0f 84 52 01 00 00    	je     6a8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 556:	83 fa 25             	cmp    $0x25,%edx
 559:	0f 84 f9 00 00 00    	je     658 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 55f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 562:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 565:	31 ff                	xor    %edi,%edi
 567:	89 55 cc             	mov    %edx,-0x34(%ebp)
 56a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 56e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 575:	00 
 576:	89 0c 24             	mov    %ecx,(%esp)
 579:	89 74 24 04          	mov    %esi,0x4(%esp)
 57d:	e8 d6 fd ff ff       	call   358 <write>
 582:	8b 55 cc             	mov    -0x34(%ebp),%edx
 585:	8b 45 08             	mov    0x8(%ebp),%eax
 588:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58f:	00 
 590:	89 74 24 04          	mov    %esi,0x4(%esp)
 594:	88 55 e7             	mov    %dl,-0x19(%ebp)
 597:	89 04 24             	mov    %eax,(%esp)
 59a:	e8 b9 fd ff ff       	call   358 <write>
 59f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5a2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 5a6:	84 d2                	test   %dl,%dl
 5a8:	0f 85 66 ff ff ff    	jne    514 <printf+0x44>
 5ae:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 5b0:	83 c4 3c             	add    $0x3c,%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 5bb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c5:	00 
 5c6:	89 74 24 04          	mov    %esi,0x4(%esp)
 5ca:	89 04 24             	mov    %eax,(%esp)
 5cd:	e8 86 fd ff ff       	call   358 <write>
 5d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d5:	e9 2b ff ff ff       	jmp    505 <printf+0x35>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 5e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 5e8:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 5ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5f1:	8b 10                	mov    (%eax),%edx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 35 fe ff ff       	call   430 <printint>
 5fb:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 5fe:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 602:	e9 fe fe ff ff       	jmp    505 <printf+0x35>
 607:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 608:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 60b:	8b 3a                	mov    (%edx),%edi
				ap++;
 60d:	83 c2 04             	add    $0x4,%edx
 610:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 613:	85 ff                	test   %edi,%edi
 615:	0f 84 ba 00 00 00    	je     6d5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 61b:	0f b6 17             	movzbl (%edi),%edx
 61e:	84 d2                	test   %dl,%dl
 620:	74 2d                	je     64f <printf+0x17f>
 622:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 625:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 628:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 62b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 62e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 635:	00 
 636:	89 74 24 04          	mov    %esi,0x4(%esp)
 63a:	89 1c 24             	mov    %ebx,(%esp)
 63d:	e8 16 fd ff ff       	call   358 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 642:	0f b6 17             	movzbl (%edi),%edx
 645:	84 d2                	test   %dl,%dl
 647:	75 df                	jne    628 <printf+0x158>
 649:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 64c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 64f:	31 ff                	xor    %edi,%edi
 651:	e9 af fe ff ff       	jmp    505 <printf+0x35>
 656:	66 90                	xchg   %ax,%ax
 658:	8b 55 08             	mov    0x8(%ebp),%edx
 65b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 65d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 661:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 668:	00 
 669:	89 74 24 04          	mov    %esi,0x4(%esp)
 66d:	89 14 24             	mov    %edx,(%esp)
 670:	e8 e3 fc ff ff       	call   358 <write>
 675:	8b 45 0c             	mov    0xc(%ebp),%eax
 678:	e9 88 fe ff ff       	jmp    505 <printf+0x35>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 680:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 688:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 68b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 692:	8b 10                	mov    (%eax),%edx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	e8 94 fd ff ff       	call   430 <printint>
 69c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 69f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6a3:	e9 5d fe ff ff       	jmp    505 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6a8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 6ab:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6ad:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b6:	00 
 6b7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 6bb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6be:	8b 45 08             	mov    0x8(%ebp),%eax
 6c1:	89 04 24             	mov    %eax,(%esp)
 6c4:	e8 8f fc ff ff       	call   358 <write>
 6c9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 6cc:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6d0:	e9 30 fe ff ff       	jmp    505 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 6d5:	bf 12 0d 00 00       	mov    $0xd12,%edi
 6da:	e9 3c ff ff ff       	jmp    61b <printf+0x14b>
 6df:	90                   	nop

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 e8 0d 00 00       	mov    0xde8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	39 c8                	cmp    %ecx,%eax
 6f3:	73 1d                	jae    712 <free+0x32>
 6f5:	8d 76 00             	lea    0x0(%esi),%esi
 6f8:	8b 10                	mov    (%eax),%edx
 6fa:	39 d1                	cmp    %edx,%ecx
 6fc:	72 1a                	jb     718 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fe:	39 d0                	cmp    %edx,%eax
 700:	72 08                	jb     70a <free+0x2a>
 702:	39 c8                	cmp    %ecx,%eax
 704:	72 12                	jb     718 <free+0x38>
 706:	39 d1                	cmp    %edx,%ecx
 708:	72 0e                	jb     718 <free+0x38>
 70a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70c:	39 c8                	cmp    %ecx,%eax
 70e:	66 90                	xchg   %ax,%ax
 710:	72 e6                	jb     6f8 <free+0x18>
 712:	8b 10                	mov    (%eax),%edx
 714:	eb e8                	jmp    6fe <free+0x1e>
 716:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 718:	8b 71 04             	mov    0x4(%ecx),%esi
 71b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71e:	39 d7                	cmp    %edx,%edi
 720:	74 19                	je     73b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 722:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 725:	8b 50 04             	mov    0x4(%eax),%edx
 728:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 72b:	39 ce                	cmp    %ecx,%esi
 72d:	74 23                	je     752 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 72f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 731:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 736:	5b                   	pop    %ebx
 737:	5e                   	pop    %esi
 738:	5f                   	pop    %edi
 739:	5d                   	pop    %ebp
 73a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 73b:	03 72 04             	add    0x4(%edx),%esi
 73e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 741:	8b 10                	mov    (%eax),%edx
 743:	8b 12                	mov    (%edx),%edx
 745:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 748:	8b 50 04             	mov    0x4(%eax),%edx
 74b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 74e:	39 ce                	cmp    %ecx,%esi
 750:	75 dd                	jne    72f <free+0x4f>
    p->s.size += bp->s.size;
 752:	03 51 04             	add    0x4(%ecx),%edx
 755:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 758:	8b 53 f8             	mov    -0x8(%ebx),%edx
 75b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 75d:	a3 e8 0d 00 00       	mov    %eax,0xde8
}
 762:	5b                   	pop    %ebx
 763:	5e                   	pop    %esi
 764:	5f                   	pop    %edi
 765:	5d                   	pop    %ebp
 766:	c3                   	ret    
 767:	89 f6                	mov    %esi,%esi
 769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 77c:	8b 0d e8 0d 00 00    	mov    0xde8,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	83 c3 07             	add    $0x7,%ebx
 785:	c1 eb 03             	shr    $0x3,%ebx
 788:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 78b:	85 c9                	test   %ecx,%ecx
 78d:	0f 84 93 00 00 00    	je     826 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	39 d3                	cmp    %edx,%ebx
 79a:	76 1f                	jbe    7bb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 79c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7a3:	90                   	nop
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 7a8:	3b 05 e8 0d 00 00    	cmp    0xde8,%eax
 7ae:	74 30                	je     7e0 <malloc+0x70>
 7b0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 7b4:	8b 50 04             	mov    0x4(%eax),%edx
 7b7:	39 d3                	cmp    %edx,%ebx
 7b9:	77 ed                	ja     7a8 <malloc+0x38>
      if(p->s.size == nunits)
 7bb:	39 d3                	cmp    %edx,%ebx
 7bd:	74 61                	je     820 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7bf:	29 da                	sub    %ebx,%edx
 7c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7c7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7ca:	89 0d e8 0d 00 00    	mov    %ecx,0xde8
      return (void*) (p + 1);
 7d0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d3:	83 c4 1c             	add    $0x1c,%esp
 7d6:	5b                   	pop    %ebx
 7d7:	5e                   	pop    %esi
 7d8:	5f                   	pop    %edi
 7d9:	5d                   	pop    %ebp
 7da:	c3                   	ret    
 7db:	90                   	nop
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7e0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 7e6:	b8 00 80 00 00       	mov    $0x8000,%eax
 7eb:	bf 00 10 00 00       	mov    $0x1000,%edi
 7f0:	76 04                	jbe    7f6 <malloc+0x86>
 7f2:	89 f0                	mov    %esi,%eax
 7f4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7f6:	89 04 24             	mov    %eax,(%esp)
 7f9:	e8 c2 fb ff ff       	call   3c0 <sbrk>
  if(p == (char*) -1)
 7fe:	83 f8 ff             	cmp    $0xffffffff,%eax
 801:	74 18                	je     81b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 803:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 806:	83 c0 08             	add    $0x8,%eax
 809:	89 04 24             	mov    %eax,(%esp)
 80c:	e8 cf fe ff ff       	call   6e0 <free>
  return freep;
 811:	8b 0d e8 0d 00 00    	mov    0xde8,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 817:	85 c9                	test   %ecx,%ecx
 819:	75 97                	jne    7b2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 81b:	31 c0                	xor    %eax,%eax
 81d:	eb b4                	jmp    7d3 <malloc+0x63>
 81f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 820:	8b 10                	mov    (%eax),%edx
 822:	89 11                	mov    %edx,(%ecx)
 824:	eb a4                	jmp    7ca <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 826:	c7 05 e8 0d 00 00 e0 	movl   $0xde0,0xde8
 82d:	0d 00 00 
    base.s.size = 0;
 830:	b9 e0 0d 00 00       	mov    $0xde0,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 835:	c7 05 e0 0d 00 00 e0 	movl   $0xde0,0xde0
 83c:	0d 00 00 
    base.s.size = 0;
 83f:	c7 05 e4 0d 00 00 00 	movl   $0x0,0xde4
 846:	00 00 00 
 849:	e9 45 ff ff ff       	jmp    793 <malloc+0x23>
 84e:	90                   	nop
 84f:	90                   	nop

00000850 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	53                   	push   %ebx
 854:	83 ec 14             	sub    $0x14,%esp
 857:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 85a:	8b 03                	mov    (%ebx),%eax
 85c:	89 04 24             	mov    %eax,(%esp)
 85f:	e8 b4 fb ff ff       	call   418 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 864:	8b 43 04             	mov    0x4(%ebx),%eax
 867:	89 04 24             	mov    %eax,(%esp)
 86a:	e8 a9 fb ff ff       	call   418 <binary_sem_clear>
	free(sem);
 86f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 872:	83 c4 14             	add    $0x14,%esp
 875:	5b                   	pop    %ebx
 876:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 877:	e9 64 fe ff ff       	jmp    6e0 <free>
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000880 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 18             	sub    $0x18,%esp
 886:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 889:	8b 5d 08             	mov    0x8(%ebp),%ebx
 88c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 88f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 892:	8b 43 04             	mov    0x4(%ebx),%eax
 895:	89 04 24             	mov    %eax,(%esp)
 898:	e8 6b fb ff ff       	call   408 <binary_sem_down>
	binary_sem_down(sem->S1);
 89d:	8b 03                	mov    (%ebx),%eax
 89f:	89 04 24             	mov    %eax,(%esp)
 8a2:	e8 61 fb ff ff       	call   408 <binary_sem_down>
	sem->value -= num;
 8a7:	8b 43 08             	mov    0x8(%ebx),%eax
 8aa:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 8ac:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 8ae:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 8b1:	74 0b                	je     8be <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 8b3:	8b 43 04             	mov    0x4(%ebx),%eax
 8b6:	89 04 24             	mov    %eax,(%esp)
 8b9:	e8 52 fb ff ff       	call   410 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 8be:	8b 03                	mov    (%ebx),%eax
}
 8c0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 8c3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 8c6:	89 45 08             	mov    %eax,0x8(%ebp)
}
 8c9:	89 ec                	mov    %ebp,%esp
 8cb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 8cc:	e9 3f fb ff ff       	jmp    410 <binary_sem_up>
 8d1:	eb 0d                	jmp    8e0 <sem_down>
 8d3:	90                   	nop
 8d4:	90                   	nop
 8d5:	90                   	nop
 8d6:	90                   	nop
 8d7:	90                   	nop
 8d8:	90                   	nop
 8d9:	90                   	nop
 8da:	90                   	nop
 8db:	90                   	nop
 8dc:	90                   	nop
 8dd:	90                   	nop
 8de:	90                   	nop
 8df:	90                   	nop

000008e0 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	53                   	push   %ebx
 8e4:	83 ec 14             	sub    $0x14,%esp
 8e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 8ea:	8b 43 04             	mov    0x4(%ebx),%eax
 8ed:	89 04 24             	mov    %eax,(%esp)
 8f0:	e8 13 fb ff ff       	call   408 <binary_sem_down>
	binary_sem_down(sem->S1);
 8f5:	8b 03                	mov    (%ebx),%eax
 8f7:	89 04 24             	mov    %eax,(%esp)
 8fa:	e8 09 fb ff ff       	call   408 <binary_sem_down>
	sem->value--;
 8ff:	8b 43 08             	mov    0x8(%ebx),%eax
 902:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 905:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 907:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 90a:	74 0b                	je     917 <sem_down+0x37>
		binary_sem_up(sem->S2);
 90c:	8b 43 04             	mov    0x4(%ebx),%eax
 90f:	89 04 24             	mov    %eax,(%esp)
 912:	e8 f9 fa ff ff       	call   410 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 917:	8b 03                	mov    (%ebx),%eax
 919:	89 45 08             	mov    %eax,0x8(%ebp)
}
 91c:	83 c4 14             	add    $0x14,%esp
 91f:	5b                   	pop    %ebx
 920:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 921:	e9 ea fa ff ff       	jmp    410 <binary_sem_up>
 926:	8d 76 00             	lea    0x0(%esi),%esi
 929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000930 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 18             	sub    $0x18,%esp
 936:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 939:	8b 5d 08             	mov    0x8(%ebp),%ebx
 93c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 93f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 942:	8b 03                	mov    (%ebx),%eax
 944:	89 04 24             	mov    %eax,(%esp)
 947:	e8 bc fa ff ff       	call   408 <binary_sem_down>
	sem->value+= num;
 94c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 94f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 952:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 955:	74 19                	je     970 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 957:	8b 03                	mov    (%ebx),%eax
}
 959:	8b 75 fc             	mov    -0x4(%ebp),%esi
 95c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 95f:	89 45 08             	mov    %eax,0x8(%ebp)
}
 962:	89 ec                	mov    %ebp,%esp
 964:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 965:	e9 a6 fa ff ff       	jmp    410 <binary_sem_up>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 970:	8b 43 04             	mov    0x4(%ebx),%eax
 973:	89 04 24             	mov    %eax,(%esp)
 976:	e8 95 fa ff ff       	call   410 <binary_sem_up>
 97b:	eb da                	jmp    957 <sem_ups+0x27>
 97d:	8d 76 00             	lea    0x0(%esi),%esi

00000980 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	53                   	push   %ebx
 984:	83 ec 14             	sub    $0x14,%esp
 987:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 98a:	8b 03                	mov    (%ebx),%eax
 98c:	89 04 24             	mov    %eax,(%esp)
 98f:	e8 74 fa ff ff       	call   408 <binary_sem_down>
	sem->value++;
 994:	8b 43 08             	mov    0x8(%ebx),%eax
 997:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 99a:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 99d:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 9a0:	74 16                	je     9b8 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9a2:	8b 03                	mov    (%ebx),%eax
 9a4:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9a7:	83 c4 14             	add    $0x14,%esp
 9aa:	5b                   	pop    %ebx
 9ab:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9ac:	e9 5f fa ff ff       	jmp    410 <binary_sem_up>
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 9b8:	8b 43 04             	mov    0x4(%ebx),%eax
 9bb:	89 04 24             	mov    %eax,(%esp)
 9be:	e8 4d fa ff ff       	call   410 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 9c3:	8b 03                	mov    (%ebx),%eax
 9c5:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9c8:	83 c4 14             	add    $0x14,%esp
 9cb:	5b                   	pop    %ebx
 9cc:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9cd:	e9 3e fa ff ff       	jmp    410 <binary_sem_up>
 9d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009e0 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
 9e3:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 9e6:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 9ed:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 9f0:	89 75 f8             	mov    %esi,-0x8(%ebp)
 9f3:	89 7d fc             	mov    %edi,-0x4(%ebp)
 9f6:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 9f9:	e8 72 fd ff ff       	call   770 <malloc>
	ret->value = initial_semaphore_value;
 9fe:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 a01:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 a03:	e8 f8 f9 ff ff       	call   400 <binary_sem_create>
 a08:	89 03                	mov    %eax,(%ebx)
 a0a:	89 c6                	mov    %eax,%esi
 a0c:	e8 ef f9 ff ff       	call   400 <binary_sem_create>
 a11:	01 c6                	add    %eax,%esi
 a13:	89 43 04             	mov    %eax,0x4(%ebx)
 a16:	78 20                	js     a38 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 a18:	85 ff                	test   %edi,%edi
 a1a:	75 08                	jne    a24 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 a1c:	89 04 24             	mov    %eax,(%esp)
 a1f:	e8 e4 f9 ff ff       	call   408 <binary_sem_down>
	}
	return ret;
}
 a24:	89 d8                	mov    %ebx,%eax
 a26:	8b 75 f8             	mov    -0x8(%ebp),%esi
 a29:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 a2c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a2f:	89 ec                	mov    %ebp,%esp
 a31:	5d                   	pop    %ebp
 a32:	c3                   	ret    
 a33:	90                   	nop
 a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 a38:	c7 44 24 04 2c 0d 00 	movl   $0xd2c,0x4(%esp)
 a3f:	00 
 a40:	31 db                	xor    %ebx,%ebx
 a42:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 a49:	e8 82 fa ff ff       	call   4d0 <printf>
		return 0;
 a4e:	eb d4                	jmp    a24 <semaphore_create+0x44>

00000a50 <semaphore_clear>:
	binary_sem_up(bb->mutex);
	sem_up(bb->empty);
	return element;
}

void semaphore_clear(struct BB* bb) {
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	53                   	push   %ebx
 a54:	83 ec 14             	sub    $0x14,%esp
 a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
	free(bb->buffer);
 a5a:	8b 43 0c             	mov    0xc(%ebx),%eax
 a5d:	89 04 24             	mov    %eax,(%esp)
 a60:	e8 7b fc ff ff       	call   6e0 <free>
	sem_clear(bb->empty);
 a65:	8b 43 04             	mov    0x4(%ebx),%eax
 a68:	89 04 24             	mov    %eax,(%esp)
 a6b:	e8 e0 fd ff ff       	call   850 <sem_clear>
	sem_clear(bb->full);
 a70:	8b 43 08             	mov    0x8(%ebx),%eax
 a73:	89 04 24             	mov    %eax,(%esp)
 a76:	e8 d5 fd ff ff       	call   850 <sem_clear>
	binary_sem_clear(bb->mutex);
 a7b:	8b 03                	mov    (%ebx),%eax
 a7d:	89 04 24             	mov    %eax,(%esp)
 a80:	e8 93 f9 ff ff       	call   418 <binary_sem_clear>
	free(bb);
 a85:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 a88:	83 c4 14             	add    $0x14,%esp
 a8b:	5b                   	pop    %ebx
 a8c:	5d                   	pop    %ebp
void semaphore_clear(struct BB* bb) {
	free(bb->buffer);
	sem_clear(bb->empty);
	sem_clear(bb->full);
	binary_sem_clear(bb->mutex);
	free(bb);
 a8d:	e9 4e fc ff ff       	jmp    6e0 <free>
 a92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 aa6:	8b 45 08             	mov    0x8(%ebp),%eax
 aa9:	8b 00                	mov    (%eax),%eax
 aab:	89 45 08             	mov    %eax,0x8(%ebp)
}
 aae:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 aaf:	e9 5c f9 ff ff       	jmp    410 <binary_sem_up>
 ab4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 aba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ac0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	56                   	push   %esi
 ac4:	53                   	push   %ebx
 ac5:	83 ec 10             	sub    $0x10,%esp
 ac8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 acb:	8b 43 08             	mov    0x8(%ebx),%eax
 ace:	89 04 24             	mov    %eax,(%esp)
 ad1:	e8 0a fe ff ff       	call   8e0 <sem_down>
	binary_sem_down(bb->mutex);
 ad6:	8b 03                	mov    (%ebx),%eax
 ad8:	89 04 24             	mov    %eax,(%esp)
 adb:	e8 28 f9 ff ff       	call   408 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 ae0:	8b 43 14             	mov    0x14(%ebx),%eax
 ae3:	c1 e0 02             	shl    $0x2,%eax
 ae6:	03 43 0c             	add    0xc(%ebx),%eax
 ae9:	8b 30                	mov    (%eax),%esi
 aeb:	85 f6                	test   %esi,%esi
 aed:	74 42                	je     b31 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 aef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 af5:	8b 53 18             	mov    0x18(%ebx),%edx
 af8:	8b 43 14             	mov    0x14(%ebx),%eax
 afb:	83 ea 01             	sub    $0x1,%edx
 afe:	39 d0                	cmp    %edx,%eax
 b00:	74 26                	je     b28 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 b02:	83 c0 01             	add    $0x1,%eax
 b05:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 b08:	8b 03                	mov    (%ebx),%eax
 b0a:	89 04 24             	mov    %eax,(%esp)
 b0d:	e8 fe f8 ff ff       	call   410 <binary_sem_up>
	sem_up(bb->empty);
 b12:	8b 43 04             	mov    0x4(%ebx),%eax
 b15:	89 04 24             	mov    %eax,(%esp)
 b18:	e8 63 fe ff ff       	call   980 <sem_up>
	return element;
}
 b1d:	83 c4 10             	add    $0x10,%esp
 b20:	89 f0                	mov    %esi,%eax
 b22:	5b                   	pop    %ebx
 b23:	5e                   	pop    %esi
 b24:	5d                   	pop    %ebp
 b25:	c3                   	ret    
 b26:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 b28:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 b2f:	eb d7                	jmp    b08 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 b31:	c7 44 24 04 54 0d 00 	movl   $0xd54,0x4(%esp)
 b38:	00 
 b39:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b40:	e8 8b f9 ff ff       	call   4d0 <printf>
 b45:	eb c1                	jmp    b08 <semaphore_pop+0x48>
 b47:	89 f6                	mov    %esi,%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	56                   	push   %esi
 b54:	53                   	push   %ebx
 b55:	83 ec 10             	sub    $0x10,%esp
 b58:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b5b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 b5e:	8b 43 04             	mov    0x4(%ebx),%eax
 b61:	89 04 24             	mov    %eax,(%esp)
 b64:	e8 77 fd ff ff       	call   8e0 <sem_down>
	binary_sem_down(bb->mutex);
 b69:	8b 03                	mov    (%ebx),%eax
 b6b:	89 04 24             	mov    %eax,(%esp)
 b6e:	e8 95 f8 ff ff       	call   408 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 b73:	8b 43 10             	mov    0x10(%ebx),%eax
 b76:	c1 e0 02             	shl    $0x2,%eax
 b79:	03 43 0c             	add    0xc(%ebx),%eax
 b7c:	8b 10                	mov    (%eax),%edx
 b7e:	85 d2                	test   %edx,%edx
 b80:	74 26                	je     ba8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 b82:	c7 44 24 04 98 0d 00 	movl   $0xd98,0x4(%esp)
 b89:	00 
 b8a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b91:	e8 3a f9 ff ff       	call   4d0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 b96:	8b 43 08             	mov    0x8(%ebx),%eax
 b99:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b9c:	83 c4 10             	add    $0x10,%esp
 b9f:	5b                   	pop    %ebx
 ba0:	5e                   	pop    %esi
 ba1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 ba2:	e9 d9 fd ff ff       	jmp    980 <sem_up>
 ba7:	90                   	nop
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
 bb5:	74 09                	je     bc0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 bb7:	83 c0 01             	add    $0x1,%eax
 bba:	89 43 10             	mov    %eax,0x10(%ebx)
 bbd:	eb d7                	jmp    b96 <semaphore_put_atomic+0x46>
 bbf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 bc0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 bc7:	eb cd                	jmp    b96 <semaphore_put_atomic+0x46>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	56                   	push   %esi
 bd4:	53                   	push   %ebx
 bd5:	83 ec 10             	sub    $0x10,%esp
 bd8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bdb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 bde:	8b 43 04             	mov    0x4(%ebx),%eax
 be1:	89 04 24             	mov    %eax,(%esp)
 be4:	e8 f7 fc ff ff       	call   8e0 <sem_down>
	binary_sem_down(bb->mutex);
 be9:	8b 03                	mov    (%ebx),%eax
 beb:	89 04 24             	mov    %eax,(%esp)
 bee:	e8 15 f8 ff ff       	call   408 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 bf3:	8b 43 10             	mov    0x10(%ebx),%eax
 bf6:	c1 e0 02             	shl    $0x2,%eax
 bf9:	03 43 0c             	add    0xc(%ebx),%eax
 bfc:	8b 08                	mov    (%eax),%ecx
 bfe:	85 c9                	test   %ecx,%ecx
 c00:	74 36                	je     c38 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c02:	c7 44 24 04 98 0d 00 	movl   $0xd98,0x4(%esp)
 c09:	00 
 c0a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c11:	e8 ba f8 ff ff       	call   4d0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 c16:	8b 03                	mov    (%ebx),%eax
 c18:	89 04 24             	mov    %eax,(%esp)
 c1b:	e8 f0 f7 ff ff       	call   410 <binary_sem_up>
	sem_up(bb->full);
 c20:	8b 43 08             	mov    0x8(%ebx),%eax
 c23:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c26:	83 c4 10             	add    $0x10,%esp
 c29:	5b                   	pop    %ebx
 c2a:	5e                   	pop    %esi
 c2b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 c2c:	e9 4f fd ff ff       	jmp    980 <sem_up>
 c31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 c38:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 c3a:	8b 53 18             	mov    0x18(%ebx),%edx
 c3d:	8b 43 10             	mov    0x10(%ebx),%eax
 c40:	83 ea 01             	sub    $0x1,%edx
 c43:	39 d0                	cmp    %edx,%eax
 c45:	74 09                	je     c50 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c47:	83 c0 01             	add    $0x1,%eax
 c4a:	89 43 10             	mov    %eax,0x10(%ebx)
 c4d:	eb c7                	jmp    c16 <semaphore_put+0x46>
 c4f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c50:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c57:	eb bd                	jmp    c16 <semaphore_put+0x46>
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
 c63:	83 ec 18             	sub    $0x18,%esp
 c66:	89 75 fc             	mov    %esi,-0x4(%ebp)
 c69:	8b 75 08             	mov    0x8(%ebp),%esi
 c6c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 c6f:	85 f6                	test   %esi,%esi
 c71:	79 15                	jns    c88 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 c73:	31 db                	xor    %ebx,%ebx
}
 c75:	89 d8                	mov    %ebx,%eax
 c77:	8b 75 fc             	mov    -0x4(%ebp),%esi
 c7a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 c7d:	89 ec                	mov    %ebp,%esp
 c7f:	5d                   	pop    %ebp
 c80:	c3                   	ret    
 c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 c88:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 c8f:	e8 dc fa ff ff       	call   770 <malloc>
 c94:	85 c0                	test   %eax,%eax
 c96:	89 c3                	mov    %eax,%ebx
 c98:	74 db                	je     c75 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 c9a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 ca1:	89 04 24             	mov    %eax,(%esp)
 ca4:	e8 c7 fa ff ff       	call   770 <malloc>
 ca9:	85 c0                	test   %eax,%eax
 cab:	89 43 0c             	mov    %eax,0xc(%ebx)
 cae:	74 c3                	je     c73 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 cb0:	89 34 24             	mov    %esi,(%esp)
 cb3:	e8 28 fd ff ff       	call   9e0 <semaphore_create>
 cb8:	85 c0                	test   %eax,%eax
 cba:	89 43 04             	mov    %eax,0x4(%ebx)
 cbd:	74 b4                	je     c73 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 cbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 cc6:	e8 15 fd ff ff       	call   9e0 <semaphore_create>
 ccb:	85 c0                	test   %eax,%eax
 ccd:	89 43 08             	mov    %eax,0x8(%ebx)
 cd0:	74 a1                	je     c73 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 cd2:	e8 29 f7 ff ff       	call   400 <binary_sem_create>
	ret->produce = 0;
 cd7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 cde:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 ce5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 ce8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 cea:	eb 89                	jmp    c75 <BB_create+0x15>
