
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	31 ff                	xor    %edi,%edi
   6:	56                   	push   %esi
   7:	31 f6                	xor    %esi,%esi
   9:	53                   	push   %ebx
   a:	83 ec 3c             	sub    $0x3c,%esp
   d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  14:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1b:	90                   	nop
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	8b 45 08             	mov    0x8(%ebp),%eax
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 60 0e 00 	movl   $0xe60,0x4(%esp)
  32:	00 
  33:	89 04 24             	mov    %eax,(%esp)
  36:	e8 a5 03 00 00       	call   3e0 <read>
  3b:	83 f8 00             	cmp    $0x0,%eax
  3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  41:	7e 4f                	jle    92 <wc+0x92>
  43:	31 db                	xor    %ebx,%ebx
  45:	eb 0b                	jmp    52 <wc+0x52>
  47:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  48:	31 ff                	xor    %edi,%edi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  4a:	83 c3 01             	add    $0x1,%ebx
  4d:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  50:	7e 38                	jle    8a <wc+0x8a>
      c++;
      if(buf[i] == '\n')
  52:	0f be 83 60 0e 00 00 	movsbl 0xe60(%ebx),%eax
        l++;
  59:	31 d2                	xor    %edx,%edx
      if(strchr(" \r\t\n\v", buf[i]))
  5b:	c7 04 24 2c 0d 00 00 	movl   $0xd2c,(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
  62:	3c 0a                	cmp    $0xa,%al
  64:	0f 94 c2             	sete   %dl
  67:	01 d6                	add    %edx,%esi
      if(strchr(" \r\t\n\v", buf[i]))
  69:	89 44 24 04          	mov    %eax,0x4(%esp)
  6d:	e8 ee 01 00 00       	call   260 <strchr>
  72:	85 c0                	test   %eax,%eax
  74:	75 d2                	jne    48 <wc+0x48>
        inword = 0;
      else if(!inword){
  76:	85 ff                	test   %edi,%edi
  78:	75 d0                	jne    4a <wc+0x4a>
        w++;
  7a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 c3 01             	add    $0x1,%ebx
  81:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
  84:	66 bf 01 00          	mov    $0x1,%di
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  88:	7f c8                	jg     52 <wc+0x52>
  8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8d:	01 45 dc             	add    %eax,-0x24(%ebp)
  90:	eb 8e                	jmp    20 <wc+0x20>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  92:	75 35                	jne    c9 <wc+0xc9>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	89 74 24 08          	mov    %esi,0x8(%esp)
  9b:	c7 44 24 04 42 0d 00 	movl   $0xd42,0x4(%esp)
  a2:	00 
  a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  aa:	89 44 24 14          	mov    %eax,0x14(%esp)
  ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  b1:	89 44 24 10          	mov    %eax,0x10(%esp)
  b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  b8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  bc:	e8 9f 04 00 00       	call   560 <printf>
}
  c1:	83 c4 3c             	add    $0x3c,%esp
  c4:	5b                   	pop    %ebx
  c5:	5e                   	pop    %esi
  c6:	5f                   	pop    %edi
  c7:	5d                   	pop    %ebp
  c8:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
  c9:	c7 44 24 04 32 0d 00 	movl   $0xd32,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 83 04 00 00       	call   560 <printf>
    exit();
  dd:	e8 e6 02 00 00       	call   3c8 <exit>
  e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	83 e4 f0             	and    $0xfffffff0,%esp
  f6:	57                   	push   %edi
  f7:	56                   	push   %esi
  f8:	53                   	push   %ebx
  f9:	83 ec 24             	sub    $0x24,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  ff:	83 ff 01             	cmp    $0x1,%edi
 102:	7e 74                	jle    178 <main+0x88>
    wc(0, "");
    exit();
 104:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 107:	be 01 00 00 00       	mov    $0x1,%esi
 10c:	83 c3 04             	add    $0x4,%ebx
 10f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 110:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 117:	00 
 118:	8b 03                	mov    (%ebx),%eax
 11a:	89 04 24             	mov    %eax,(%esp)
 11d:	e8 e6 02 00 00       	call   408 <open>
 122:	85 c0                	test   %eax,%eax
 124:	78 32                	js     158 <main+0x68>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 126:	8b 13                	mov    (%ebx),%edx
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 128:	83 c6 01             	add    $0x1,%esi
 12b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 12e:	89 04 24             	mov    %eax,(%esp)
 131:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 135:	89 54 24 04          	mov    %edx,0x4(%esp)
 139:	e8 c2 fe ff ff       	call   0 <wc>
    close(fd);
 13e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 142:	89 04 24             	mov    %eax,(%esp)
 145:	e8 a6 02 00 00       	call   3f0 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 14a:	39 f7                	cmp    %esi,%edi
 14c:	7f c2                	jg     110 <main+0x20>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 14e:	e8 75 02 00 00       	call   3c8 <exit>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
 158:	8b 03                	mov    (%ebx),%eax
 15a:	c7 44 24 04 4f 0d 00 	movl   $0xd4f,0x4(%esp)
 161:	00 
 162:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 169:	89 44 24 08          	mov    %eax,0x8(%esp)
 16d:	e8 ee 03 00 00       	call   560 <printf>
      exit();
 172:	e8 51 02 00 00       	call   3c8 <exit>
 177:	90                   	nop
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
 178:	c7 44 24 04 41 0d 00 	movl   $0xd41,0x4(%esp)
 17f:	00 
 180:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 187:	e8 74 fe ff ff       	call   0 <wc>
    exit();
 18c:	e8 37 02 00 00       	call   3c8 <exit>
 191:	90                   	nop
 192:	90                   	nop
 193:	90                   	nop
 194:	90                   	nop
 195:	90                   	nop
 196:	90                   	nop
 197:	90                   	nop
 198:	90                   	nop
 199:	90                   	nop
 19a:	90                   	nop
 19b:	90                   	nop
 19c:	90                   	nop
 19d:	90                   	nop
 19e:	90                   	nop
 19f:	90                   	nop

000001a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1a0:	55                   	push   %ebp
 1a1:	31 d2                	xor    %edx,%edx
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	53                   	push   %ebx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 c9                	test   %cl,%cl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	5b                   	pop    %ebx
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <strcmp>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1da:	0f b6 01             	movzbl (%ecx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 14                	jne    1f5 <strcmp+0x25>
 1e1:	eb 25                	jmp    208 <strcmp+0x38>
 1e3:	90                   	nop
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 1e8:	83 c1 01             	add    $0x1,%ecx
 1eb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1ee:	0f b6 01             	movzbl (%ecx),%eax
 1f1:	84 c0                	test   %al,%al
 1f3:	74 13                	je     208 <strcmp+0x38>
 1f5:	0f b6 1a             	movzbl (%edx),%ebx
 1f8:	38 d8                	cmp    %bl,%al
 1fa:	74 ec                	je     1e8 <strcmp+0x18>
 1fc:	0f b6 db             	movzbl %bl,%ebx
 1ff:	0f b6 c0             	movzbl %al,%eax
 202:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 208:	0f b6 1a             	movzbl (%edx),%ebx
 20b:	31 c0                	xor    %eax,%eax
 20d:	0f b6 db             	movzbl %bl,%ebx
 210:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 212:	5b                   	pop    %ebx
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strlen>:

uint
strlen(char *s)
{
 220:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 221:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 223:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 225:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 227:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22a:	80 39 00             	cmpb   $0x0,(%ecx)
 22d:	74 0c                	je     23b <strlen+0x1b>
 22f:	90                   	nop
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 11                	jne    282 <strchr+0x22>
 271:	eb 15                	jmp    288 <strchr+0x28>
 273:	90                   	nop
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 10             	movzbl (%eax),%edx
 27e:	84 d2                	test   %dl,%dl
 280:	74 06                	je     288 <strchr+0x28>
    if(*s == c)
 282:	38 ca                	cmp    %cl,%dl
 284:	75 f2                	jne    278 <strchr+0x18>
      return (char*) s;
  return 0;
}
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 288:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 28a:	5d                   	pop    %ebp
 28b:	90                   	nop
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <atoi>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2a8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a9:	0f b6 11             	movzbl (%ecx),%edx
 2ac:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2af:	80 fb 09             	cmp    $0x9,%bl
 2b2:	77 1c                	ja     2d0 <atoi+0x30>
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2b8:	0f be d2             	movsbl %dl,%edx
 2bb:	83 c1 01             	add    $0x1,%ecx
 2be:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2c1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c5:	0f b6 11             	movzbl (%ecx),%edx
 2c8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2cb:	80 fb 09             	cmp    $0x9,%bl
 2ce:	76 e8                	jbe    2b8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	53                   	push   %ebx
 2e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ee:	85 db                	test   %ebx,%ebx
 2f0:	7e 14                	jle    306 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 2f2:	31 d2                	xor    %edx,%edx
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ff:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 302:	39 da                	cmp    %ebx,%edx
 304:	75 f2                	jne    2f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 316:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 319:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 31c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 31f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 324:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 32b:	00 
 32c:	89 04 24             	mov    %eax,(%esp)
 32f:	e8 d4 00 00 00       	call   408 <open>
  if(fd < 0)
 334:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 336:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 338:	78 19                	js     353 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 1c 24             	mov    %ebx,(%esp)
 340:	89 44 24 04          	mov    %eax,0x4(%esp)
 344:	e8 d7 00 00 00       	call   420 <fstat>
  close(fd);
 349:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 34c:	89 c6                	mov    %eax,%esi
  close(fd);
 34e:	e8 9d 00 00 00       	call   3f0 <close>
  return r;
}
 353:	89 f0                	mov    %esi,%eax
 355:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 358:	8b 75 fc             	mov    -0x4(%ebp),%esi
 35b:	89 ec                	mov    %ebp,%esp
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret    
 35f:	90                   	nop

00000360 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	31 f6                	xor    %esi,%esi
 367:	53                   	push   %ebx
 368:	83 ec 2c             	sub    $0x2c,%esp
 36b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 36e:	eb 06                	jmp    376 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 370:	3c 0a                	cmp    $0xa,%al
 372:	74 39                	je     3ad <gets+0x4d>
 374:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 376:	8d 5e 01             	lea    0x1(%esi),%ebx
 379:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37c:	7d 31                	jge    3af <gets+0x4f>
    cc = read(0, &c, 1);
 37e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 381:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 388:	00 
 389:	89 44 24 04          	mov    %eax,0x4(%esp)
 38d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 394:	e8 47 00 00 00       	call   3e0 <read>
    if(cc < 1)
 399:	85 c0                	test   %eax,%eax
 39b:	7e 12                	jle    3af <gets+0x4f>
      break;
    buf[i++] = c;
 39d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 3a5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3a9:	3c 0d                	cmp    $0xd,%al
 3ab:	75 c3                	jne    370 <gets+0x10>
 3ad:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3af:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b3:	89 f8                	mov    %edi,%eax
 3b5:	83 c4 2c             	add    $0x2c,%esp
 3b8:	5b                   	pop    %ebx
 3b9:	5e                   	pop    %esi
 3ba:	5f                   	pop    %edi
 3bb:	5d                   	pop    %ebp
 3bc:	c3                   	ret    
 3bd:	90                   	nop
 3be:	90                   	nop
 3bf:	90                   	nop

000003c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3c0:	b8 01 00 00 00       	mov    $0x1,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <exit>:
SYSCALL(exit)
 3c8:	b8 02 00 00 00       	mov    $0x2,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <wait>:
SYSCALL(wait)
 3d0:	b8 03 00 00 00       	mov    $0x3,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <pipe>:
SYSCALL(pipe)
 3d8:	b8 04 00 00 00       	mov    $0x4,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <read>:
SYSCALL(read)
 3e0:	b8 06 00 00 00       	mov    $0x6,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <write>:
SYSCALL(write)
 3e8:	b8 05 00 00 00       	mov    $0x5,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <close>:
SYSCALL(close)
 3f0:	b8 07 00 00 00       	mov    $0x7,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <kill>:
SYSCALL(kill)
 3f8:	b8 08 00 00 00       	mov    $0x8,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <exec>:
SYSCALL(exec)
 400:	b8 09 00 00 00       	mov    $0x9,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <open>:
SYSCALL(open)
 408:	b8 0a 00 00 00       	mov    $0xa,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <mknod>:
SYSCALL(mknod)
 410:	b8 0b 00 00 00       	mov    $0xb,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <unlink>:
SYSCALL(unlink)
 418:	b8 0c 00 00 00       	mov    $0xc,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <fstat>:
SYSCALL(fstat)
 420:	b8 0d 00 00 00       	mov    $0xd,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <link>:
SYSCALL(link)
 428:	b8 0e 00 00 00       	mov    $0xe,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <mkdir>:
SYSCALL(mkdir)
 430:	b8 0f 00 00 00       	mov    $0xf,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <chdir>:
SYSCALL(chdir)
 438:	b8 10 00 00 00       	mov    $0x10,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <dup>:
SYSCALL(dup)
 440:	b8 11 00 00 00       	mov    $0x11,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <getpid>:
SYSCALL(getpid)
 448:	b8 12 00 00 00       	mov    $0x12,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <sbrk>:
SYSCALL(sbrk)
 450:	b8 13 00 00 00       	mov    $0x13,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <sleep>:
SYSCALL(sleep)
 458:	b8 14 00 00 00       	mov    $0x14,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <uptime>:
SYSCALL(uptime)
 460:	b8 15 00 00 00       	mov    $0x15,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <thread_create>:
SYSCALL(thread_create)
 468:	b8 16 00 00 00       	mov    $0x16,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <thread_getid>:
SYSCALL(thread_getid)
 470:	b8 17 00 00 00       	mov    $0x17,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <thread_getProcid>:
SYSCALL(thread_getProcid)
 478:	b8 18 00 00 00       	mov    $0x18,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <thread_exit>:
SYSCALL(thread_exit)
 480:	b8 1a 00 00 00       	mov    $0x1a,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <thread_join>:
SYSCALL(thread_join)
 488:	b8 19 00 00 00       	mov    $0x19,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <binary_sem_create>:
SYSCALL(binary_sem_create)
 490:	b8 1b 00 00 00       	mov    $0x1b,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <binary_sem_down>:
SYSCALL(binary_sem_down)
 498:	b8 1c 00 00 00       	mov    $0x1c,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <binary_sem_up>:
SYSCALL(binary_sem_up)
 4a0:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 4a8:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <exit_all_threads>:
 4b0:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    
 4b8:	90                   	nop
 4b9:	90                   	nop
 4ba:	90                   	nop
 4bb:	90                   	nop
 4bc:	90                   	nop
 4bd:	90                   	nop
 4be:	90                   	nop
 4bf:	90                   	nop

000004c0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	89 cf                	mov    %ecx,%edi
 4c6:	56                   	push   %esi
 4c7:	89 c6                	mov    %eax,%esi
 4c9:	53                   	push   %ebx
 4ca:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 4cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4d0:	85 c9                	test   %ecx,%ecx
 4d2:	74 04                	je     4d8 <printint+0x18>
 4d4:	85 d2                	test   %edx,%edx
 4d6:	78 70                	js     548 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 4d8:	89 d0                	mov    %edx,%eax
 4da:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e1:	31 c9                	xor    %ecx,%ecx
 4e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4e6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 4e8:	31 d2                	xor    %edx,%edx
 4ea:	f7 f7                	div    %edi
 4ec:	0f b6 92 6b 0d 00 00 	movzbl 0xd6b(%edx),%edx
 4f3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 4f6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 4f9:	85 c0                	test   %eax,%eax
 4fb:	75 eb                	jne    4e8 <printint+0x28>
	if(neg)
 4fd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 500:	85 c0                	test   %eax,%eax
 502:	74 08                	je     50c <printint+0x4c>
		buf[i++] = '-';
 504:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 509:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 50c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 50f:	01 fb                	add    %edi,%ebx
 511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 518:	0f b6 03             	movzbl (%ebx),%eax
 51b:	83 ef 01             	sub    $0x1,%edi
 51e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 521:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 528:	00 
 529:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 52c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 52f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 532:	89 44 24 04          	mov    %eax,0x4(%esp)
 536:	e8 ad fe ff ff       	call   3e8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 53b:	83 ff ff             	cmp    $0xffffffff,%edi
 53e:	75 d8                	jne    518 <printint+0x58>
		putc(fd, buf[i]);
}
 540:	83 c4 4c             	add    $0x4c,%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 548:	89 d0                	mov    %edx,%eax
 54a:	f7 d8                	neg    %eax
 54c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 553:	eb 8c                	jmp    4e1 <printint+0x21>
 555:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000560 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 569:	8b 45 0c             	mov    0xc(%ebp),%eax
 56c:	0f b6 10             	movzbl (%eax),%edx
 56f:	84 d2                	test   %dl,%dl
 571:	0f 84 c9 00 00 00    	je     640 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 577:	8d 4d 10             	lea    0x10(%ebp),%ecx
 57a:	31 ff                	xor    %edi,%edi
 57c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 57f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 581:	8d 75 e7             	lea    -0x19(%ebp),%esi
 584:	eb 1e                	jmp    5a4 <printf+0x44>
 586:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 588:	83 fa 25             	cmp    $0x25,%edx
 58b:	0f 85 b7 00 00 00    	jne    648 <printf+0xe8>
 591:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 595:	83 c3 01             	add    $0x1,%ebx
 598:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 59c:	84 d2                	test   %dl,%dl
 59e:	0f 84 9c 00 00 00    	je     640 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 5a4:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 5a6:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 5a9:	74 dd                	je     588 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 5ab:	83 ff 25             	cmp    $0x25,%edi
 5ae:	75 e5                	jne    595 <printf+0x35>
			if(c == 'd'){
 5b0:	83 fa 64             	cmp    $0x64,%edx
 5b3:	0f 84 57 01 00 00    	je     710 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 5b9:	83 fa 70             	cmp    $0x70,%edx
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5c0:	0f 84 aa 00 00 00    	je     670 <printf+0x110>
 5c6:	83 fa 78             	cmp    $0x78,%edx
 5c9:	0f 84 a1 00 00 00    	je     670 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 5cf:	83 fa 73             	cmp    $0x73,%edx
 5d2:	0f 84 c0 00 00 00    	je     698 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 5d8:	83 fa 63             	cmp    $0x63,%edx
 5db:	90                   	nop
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	0f 84 52 01 00 00    	je     738 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 5e6:	83 fa 25             	cmp    $0x25,%edx
 5e9:	0f 84 f9 00 00 00    	je     6e8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 5f2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 5f5:	31 ff                	xor    %edi,%edi
 5f7:	89 55 cc             	mov    %edx,-0x34(%ebp)
 5fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 605:	00 
 606:	89 0c 24             	mov    %ecx,(%esp)
 609:	89 74 24 04          	mov    %esi,0x4(%esp)
 60d:	e8 d6 fd ff ff       	call   3e8 <write>
 612:	8b 55 cc             	mov    -0x34(%ebp),%edx
 615:	8b 45 08             	mov    0x8(%ebp),%eax
 618:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 61f:	00 
 620:	89 74 24 04          	mov    %esi,0x4(%esp)
 624:	88 55 e7             	mov    %dl,-0x19(%ebp)
 627:	89 04 24             	mov    %eax,(%esp)
 62a:	e8 b9 fd ff ff       	call   3e8 <write>
 62f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 632:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 636:	84 d2                	test   %dl,%dl
 638:	0f 85 66 ff ff ff    	jne    5a4 <printf+0x44>
 63e:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 640:	83 c4 3c             	add    $0x3c,%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 648:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 64b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 64e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 655:	00 
 656:	89 74 24 04          	mov    %esi,0x4(%esp)
 65a:	89 04 24             	mov    %eax,(%esp)
 65d:	e8 86 fd ff ff       	call   3e8 <write>
 662:	8b 45 0c             	mov    0xc(%ebp),%eax
 665:	e9 2b ff ff ff       	jmp    595 <printf+0x35>
 66a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 670:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 673:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 678:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 67a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 681:	8b 10                	mov    (%eax),%edx
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	e8 35 fe ff ff       	call   4c0 <printint>
 68b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 68e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 692:	e9 fe fe ff ff       	jmp    595 <printf+0x35>
 697:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 698:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 69b:	8b 3a                	mov    (%edx),%edi
				ap++;
 69d:	83 c2 04             	add    $0x4,%edx
 6a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 6a3:	85 ff                	test   %edi,%edi
 6a5:	0f 84 ba 00 00 00    	je     765 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 6ab:	0f b6 17             	movzbl (%edi),%edx
 6ae:	84 d2                	test   %dl,%dl
 6b0:	74 2d                	je     6df <printf+0x17f>
 6b2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 6b8:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 6bb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c5:	00 
 6c6:	89 74 24 04          	mov    %esi,0x4(%esp)
 6ca:	89 1c 24             	mov    %ebx,(%esp)
 6cd:	e8 16 fd ff ff       	call   3e8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 6d2:	0f b6 17             	movzbl (%edi),%edx
 6d5:	84 d2                	test   %dl,%dl
 6d7:	75 df                	jne    6b8 <printf+0x158>
 6d9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6df:	31 ff                	xor    %edi,%edi
 6e1:	e9 af fe ff ff       	jmp    595 <printf+0x35>
 6e6:	66 90                	xchg   %ax,%ax
 6e8:	8b 55 08             	mov    0x8(%ebp),%edx
 6eb:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 6ed:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6f8:	00 
 6f9:	89 74 24 04          	mov    %esi,0x4(%esp)
 6fd:	89 14 24             	mov    %edx,(%esp)
 700:	e8 e3 fc ff ff       	call   3e8 <write>
 705:	8b 45 0c             	mov    0xc(%ebp),%eax
 708:	e9 88 fe ff ff       	jmp    595 <printf+0x35>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 710:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 713:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 718:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 71b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 722:	8b 10                	mov    (%eax),%edx
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	e8 94 fd ff ff       	call   4c0 <printint>
 72c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 72f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 733:	e9 5d fe ff ff       	jmp    595 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 73b:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 73d:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 73f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 746:	00 
 747:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 74b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	89 04 24             	mov    %eax,(%esp)
 754:	e8 8f fc ff ff       	call   3e8 <write>
 759:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 75c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 760:	e9 30 fe ff ff       	jmp    595 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 765:	bf 64 0d 00 00       	mov    $0xd64,%edi
 76a:	e9 3c ff ff ff       	jmp    6ab <printf+0x14b>
 76f:	90                   	nop

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 48 0e 00 00       	mov    0xe48,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 77e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	39 c8                	cmp    %ecx,%eax
 783:	73 1d                	jae    7a2 <free+0x32>
 785:	8d 76 00             	lea    0x0(%esi),%esi
 788:	8b 10                	mov    (%eax),%edx
 78a:	39 d1                	cmp    %edx,%ecx
 78c:	72 1a                	jb     7a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78e:	39 d0                	cmp    %edx,%eax
 790:	72 08                	jb     79a <free+0x2a>
 792:	39 c8                	cmp    %ecx,%eax
 794:	72 12                	jb     7a8 <free+0x38>
 796:	39 d1                	cmp    %edx,%ecx
 798:	72 0e                	jb     7a8 <free+0x38>
 79a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79c:	39 c8                	cmp    %ecx,%eax
 79e:	66 90                	xchg   %ax,%ax
 7a0:	72 e6                	jb     788 <free+0x18>
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	eb e8                	jmp    78e <free+0x1e>
 7a6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 71 04             	mov    0x4(%ecx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 d7                	cmp    %edx,%edi
 7b0:	74 19                	je     7cb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7b5:	8b 50 04             	mov    0x4(%eax),%edx
 7b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7bb:	39 ce                	cmp    %ecx,%esi
 7bd:	74 23                	je     7e2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7c1:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 7c6:	5b                   	pop    %ebx
 7c7:	5e                   	pop    %esi
 7c8:	5f                   	pop    %edi
 7c9:	5d                   	pop    %ebp
 7ca:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7cb:	03 72 04             	add    0x4(%edx),%esi
 7ce:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d1:	8b 10                	mov    (%eax),%edx
 7d3:	8b 12                	mov    (%edx),%edx
 7d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d8:	8b 50 04             	mov    0x4(%eax),%edx
 7db:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7de:	39 ce                	cmp    %ecx,%esi
 7e0:	75 dd                	jne    7bf <free+0x4f>
    p->s.size += bp->s.size;
 7e2:	03 51 04             	add    0x4(%ecx),%edx
 7e5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7eb:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 7ed:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 7f2:	5b                   	pop    %ebx
 7f3:	5e                   	pop    %esi
 7f4:	5f                   	pop    %edi
 7f5:	5d                   	pop    %ebp
 7f6:	c3                   	ret    
 7f7:	89 f6                	mov    %esi,%esi
 7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 80c:	8b 0d 48 0e 00 00    	mov    0xe48,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	83 c3 07             	add    $0x7,%ebx
 815:	c1 eb 03             	shr    $0x3,%ebx
 818:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 81b:	85 c9                	test   %ecx,%ecx
 81d:	0f 84 93 00 00 00    	je     8b6 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 823:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 825:	8b 50 04             	mov    0x4(%eax),%edx
 828:	39 d3                	cmp    %edx,%ebx
 82a:	76 1f                	jbe    84b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 82c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 838:	3b 05 48 0e 00 00    	cmp    0xe48,%eax
 83e:	74 30                	je     870 <malloc+0x70>
 840:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 842:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 844:	8b 50 04             	mov    0x4(%eax),%edx
 847:	39 d3                	cmp    %edx,%ebx
 849:	77 ed                	ja     838 <malloc+0x38>
      if(p->s.size == nunits)
 84b:	39 d3                	cmp    %edx,%ebx
 84d:	74 61                	je     8b0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 84f:	29 da                	sub    %ebx,%edx
 851:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 854:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 857:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 85a:	89 0d 48 0e 00 00    	mov    %ecx,0xe48
      return (void*) (p + 1);
 860:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 863:	83 c4 1c             	add    $0x1c,%esp
 866:	5b                   	pop    %ebx
 867:	5e                   	pop    %esi
 868:	5f                   	pop    %edi
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    
 86b:	90                   	nop
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 870:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 876:	b8 00 80 00 00       	mov    $0x8000,%eax
 87b:	bf 00 10 00 00       	mov    $0x1000,%edi
 880:	76 04                	jbe    886 <malloc+0x86>
 882:	89 f0                	mov    %esi,%eax
 884:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 886:	89 04 24             	mov    %eax,(%esp)
 889:	e8 c2 fb ff ff       	call   450 <sbrk>
  if(p == (char*) -1)
 88e:	83 f8 ff             	cmp    $0xffffffff,%eax
 891:	74 18                	je     8ab <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 893:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 896:	83 c0 08             	add    $0x8,%eax
 899:	89 04 24             	mov    %eax,(%esp)
 89c:	e8 cf fe ff ff       	call   770 <free>
  return freep;
 8a1:	8b 0d 48 0e 00 00    	mov    0xe48,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 8a7:	85 c9                	test   %ecx,%ecx
 8a9:	75 97                	jne    842 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8ab:	31 c0                	xor    %eax,%eax
 8ad:	eb b4                	jmp    863 <malloc+0x63>
 8af:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 10                	mov    (%eax),%edx
 8b2:	89 11                	mov    %edx,(%ecx)
 8b4:	eb a4                	jmp    85a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 05 48 0e 00 00 40 	movl   $0xe40,0xe48
 8bd:	0e 00 00 
    base.s.size = 0;
 8c0:	b9 40 0e 00 00       	mov    $0xe40,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8c5:	c7 05 40 0e 00 00 40 	movl   $0xe40,0xe40
 8cc:	0e 00 00 
    base.s.size = 0;
 8cf:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 8d6:	00 00 00 
 8d9:	e9 45 ff ff ff       	jmp    823 <malloc+0x23>
 8de:	90                   	nop
 8df:	90                   	nop

000008e0 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	53                   	push   %ebx
 8e4:	83 ec 14             	sub    $0x14,%esp
 8e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 8ea:	8b 03                	mov    (%ebx),%eax
 8ec:	89 04 24             	mov    %eax,(%esp)
 8ef:	e8 b4 fb ff ff       	call   4a8 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 8f4:	8b 43 04             	mov    0x4(%ebx),%eax
 8f7:	89 04 24             	mov    %eax,(%esp)
 8fa:	e8 a9 fb ff ff       	call   4a8 <binary_sem_clear>
	free(sem);
 8ff:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 902:	83 c4 14             	add    $0x14,%esp
 905:	5b                   	pop    %ebx
 906:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 907:	e9 64 fe ff ff       	jmp    770 <free>
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000910 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	83 ec 18             	sub    $0x18,%esp
 916:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 919:	8b 5d 08             	mov    0x8(%ebp),%ebx
 91c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 91f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 922:	8b 43 04             	mov    0x4(%ebx),%eax
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 6b fb ff ff       	call   498 <binary_sem_down>
	binary_sem_down(sem->S1);
 92d:	8b 03                	mov    (%ebx),%eax
 92f:	89 04 24             	mov    %eax,(%esp)
 932:	e8 61 fb ff ff       	call   498 <binary_sem_down>
	sem->value -= num;
 937:	8b 43 08             	mov    0x8(%ebx),%eax
 93a:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 93c:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 93e:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 941:	74 0b                	je     94e <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 943:	8b 43 04             	mov    0x4(%ebx),%eax
 946:	89 04 24             	mov    %eax,(%esp)
 949:	e8 52 fb ff ff       	call   4a0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 94e:	8b 03                	mov    (%ebx),%eax
}
 950:	8b 75 fc             	mov    -0x4(%ebp),%esi
 953:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 956:	89 45 08             	mov    %eax,0x8(%ebp)
}
 959:	89 ec                	mov    %ebp,%esp
 95b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 95c:	e9 3f fb ff ff       	jmp    4a0 <binary_sem_up>
 961:	eb 0d                	jmp    970 <sem_down>
 963:	90                   	nop
 964:	90                   	nop
 965:	90                   	nop
 966:	90                   	nop
 967:	90                   	nop
 968:	90                   	nop
 969:	90                   	nop
 96a:	90                   	nop
 96b:	90                   	nop
 96c:	90                   	nop
 96d:	90                   	nop
 96e:	90                   	nop
 96f:	90                   	nop

00000970 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	53                   	push   %ebx
 974:	83 ec 14             	sub    $0x14,%esp
 977:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 97a:	8b 43 04             	mov    0x4(%ebx),%eax
 97d:	89 04 24             	mov    %eax,(%esp)
 980:	e8 13 fb ff ff       	call   498 <binary_sem_down>
	binary_sem_down(sem->S1);
 985:	8b 03                	mov    (%ebx),%eax
 987:	89 04 24             	mov    %eax,(%esp)
 98a:	e8 09 fb ff ff       	call   498 <binary_sem_down>
	sem->value--;
 98f:	8b 43 08             	mov    0x8(%ebx),%eax
 992:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 995:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 997:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 99a:	74 0b                	je     9a7 <sem_down+0x37>
		binary_sem_up(sem->S2);
 99c:	8b 43 04             	mov    0x4(%ebx),%eax
 99f:	89 04 24             	mov    %eax,(%esp)
 9a2:	e8 f9 fa ff ff       	call   4a0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 9a7:	8b 03                	mov    (%ebx),%eax
 9a9:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9ac:	83 c4 14             	add    $0x14,%esp
 9af:	5b                   	pop    %ebx
 9b0:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9b1:	e9 ea fa ff ff       	jmp    4a0 <binary_sem_up>
 9b6:	8d 76 00             	lea    0x0(%esi),%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	83 ec 18             	sub    $0x18,%esp
 9c6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 9c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 9cf:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 9d2:	8b 03                	mov    (%ebx),%eax
 9d4:	89 04 24             	mov    %eax,(%esp)
 9d7:	e8 bc fa ff ff       	call   498 <binary_sem_down>
	sem->value+= num;
 9dc:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 9df:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 9e2:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 9e5:	74 19                	je     a00 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9e7:	8b 03                	mov    (%ebx),%eax
}
 9e9:	8b 75 fc             	mov    -0x4(%ebp),%esi
 9ec:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9ef:	89 45 08             	mov    %eax,0x8(%ebp)
}
 9f2:	89 ec                	mov    %ebp,%esp
 9f4:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 9f5:	e9 a6 fa ff ff       	jmp    4a0 <binary_sem_up>
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 a00:	8b 43 04             	mov    0x4(%ebx),%eax
 a03:	89 04 24             	mov    %eax,(%esp)
 a06:	e8 95 fa ff ff       	call   4a0 <binary_sem_up>
 a0b:	eb da                	jmp    9e7 <sem_ups+0x27>
 a0d:	8d 76 00             	lea    0x0(%esi),%esi

00000a10 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	53                   	push   %ebx
 a14:	83 ec 14             	sub    $0x14,%esp
 a17:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 a1a:	8b 03                	mov    (%ebx),%eax
 a1c:	89 04 24             	mov    %eax,(%esp)
 a1f:	e8 74 fa ff ff       	call   498 <binary_sem_down>
	sem->value++;
 a24:	8b 43 08             	mov    0x8(%ebx),%eax
 a27:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 a2a:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 a2d:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 a30:	74 16                	je     a48 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a32:	8b 03                	mov    (%ebx),%eax
 a34:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a37:	83 c4 14             	add    $0x14,%esp
 a3a:	5b                   	pop    %ebx
 a3b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a3c:	e9 5f fa ff ff       	jmp    4a0 <binary_sem_up>
 a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 a48:	8b 43 04             	mov    0x4(%ebx),%eax
 a4b:	89 04 24             	mov    %eax,(%esp)
 a4e:	e8 4d fa ff ff       	call   4a0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 a53:	8b 03                	mov    (%ebx),%eax
 a55:	89 45 08             	mov    %eax,0x8(%ebp)
}
 a58:	83 c4 14             	add    $0x14,%esp
 a5b:	5b                   	pop    %ebx
 a5c:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 a5d:	e9 3e fa ff ff       	jmp    4a0 <binary_sem_up>
 a62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 a76:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 a7d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 a80:	89 75 f8             	mov    %esi,-0x8(%ebp)
 a83:	89 7d fc             	mov    %edi,-0x4(%ebp)
 a86:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 a89:	e8 72 fd ff ff       	call   800 <malloc>
	ret->value = initial_semaphore_value;
 a8e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 a91:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 a93:	e8 f8 f9 ff ff       	call   490 <binary_sem_create>
 a98:	89 03                	mov    %eax,(%ebx)
 a9a:	89 c6                	mov    %eax,%esi
 a9c:	e8 ef f9 ff ff       	call   490 <binary_sem_create>
 aa1:	01 c6                	add    %eax,%esi
 aa3:	89 43 04             	mov    %eax,0x4(%ebx)
 aa6:	78 20                	js     ac8 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 aa8:	85 ff                	test   %edi,%edi
 aaa:	75 08                	jne    ab4 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 aac:	89 04 24             	mov    %eax,(%esp)
 aaf:	e8 e4 f9 ff ff       	call   498 <binary_sem_down>
	}
	return ret;
}
 ab4:	89 d8                	mov    %ebx,%eax
 ab6:	8b 75 f8             	mov    -0x8(%ebp),%esi
 ab9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 abc:	8b 7d fc             	mov    -0x4(%ebp),%edi
 abf:	89 ec                	mov    %ebp,%esp
 ac1:	5d                   	pop    %ebp
 ac2:	c3                   	ret    
 ac3:	90                   	nop
 ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 ac8:	c7 44 24 04 7c 0d 00 	movl   $0xd7c,0x4(%esp)
 acf:	00 
 ad0:	31 db                	xor    %ebx,%ebx
 ad2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 ad9:	e8 82 fa ff ff       	call   560 <printf>
		return 0;
 ade:	eb d4                	jmp    ab4 <semaphore_create+0x44>

00000ae0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 ae6:	8b 45 08             	mov    0x8(%ebp),%eax
 ae9:	8b 00                	mov    (%eax),%eax
 aeb:	89 45 08             	mov    %eax,0x8(%ebp)
}
 aee:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 aef:	e9 ac f9 ff ff       	jmp    4a0 <binary_sem_up>
 af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b00 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	56                   	push   %esi
 b04:	53                   	push   %ebx
 b05:	83 ec 10             	sub    $0x10,%esp
 b08:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 b0b:	8b 43 08             	mov    0x8(%ebx),%eax
 b0e:	89 04 24             	mov    %eax,(%esp)
 b11:	e8 5a fe ff ff       	call   970 <sem_down>
	binary_sem_down(bb->mutex);
 b16:	8b 03                	mov    (%ebx),%eax
 b18:	89 04 24             	mov    %eax,(%esp)
 b1b:	e8 78 f9 ff ff       	call   498 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 b20:	8b 43 14             	mov    0x14(%ebx),%eax
 b23:	c1 e0 02             	shl    $0x2,%eax
 b26:	03 43 0c             	add    0xc(%ebx),%eax
 b29:	8b 30                	mov    (%eax),%esi
 b2b:	85 f6                	test   %esi,%esi
 b2d:	74 42                	je     b71 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 b2f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 b35:	8b 53 18             	mov    0x18(%ebx),%edx
 b38:	8b 43 14             	mov    0x14(%ebx),%eax
 b3b:	83 ea 01             	sub    $0x1,%edx
 b3e:	39 d0                	cmp    %edx,%eax
 b40:	74 26                	je     b68 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 b42:	83 c0 01             	add    $0x1,%eax
 b45:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 b48:	8b 03                	mov    (%ebx),%eax
 b4a:	89 04 24             	mov    %eax,(%esp)
 b4d:	e8 4e f9 ff ff       	call   4a0 <binary_sem_up>
	sem_up(bb->empty);
 b52:	8b 43 04             	mov    0x4(%ebx),%eax
 b55:	89 04 24             	mov    %eax,(%esp)
 b58:	e8 b3 fe ff ff       	call   a10 <sem_up>
	return element;
}
 b5d:	83 c4 10             	add    $0x10,%esp
 b60:	89 f0                	mov    %esi,%eax
 b62:	5b                   	pop    %ebx
 b63:	5e                   	pop    %esi
 b64:	5d                   	pop    %ebp
 b65:	c3                   	ret    
 b66:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 b68:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 b6f:	eb d7                	jmp    b48 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 b71:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 b78:	00 
 b79:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 b80:	e8 db f9 ff ff       	call   560 <printf>
 b85:	eb c1                	jmp    b48 <semaphore_pop+0x48>
 b87:	89 f6                	mov    %esi,%esi
 b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
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
 ba4:	e8 c7 fd ff ff       	call   970 <sem_down>
	binary_sem_down(bb->mutex);
 ba9:	8b 03                	mov    (%ebx),%eax
 bab:	89 04 24             	mov    %eax,(%esp)
 bae:	e8 e5 f8 ff ff       	call   498 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 bb3:	8b 43 10             	mov    0x10(%ebx),%eax
 bb6:	c1 e0 02             	shl    $0x2,%eax
 bb9:	03 43 0c             	add    0xc(%ebx),%eax
 bbc:	8b 10                	mov    (%eax),%edx
 bbe:	85 d2                	test   %edx,%edx
 bc0:	74 26                	je     be8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 bc2:	c7 44 24 04 e8 0d 00 	movl   $0xde8,0x4(%esp)
 bc9:	00 
 bca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 bd1:	e8 8a f9 ff ff       	call   560 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 bd6:	8b 43 08             	mov    0x8(%ebx),%eax
 bd9:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bdc:	83 c4 10             	add    $0x10,%esp
 bdf:	5b                   	pop    %ebx
 be0:	5e                   	pop    %esi
 be1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 be2:	e9 29 fe ff ff       	jmp    a10 <sem_up>
 be7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 be8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 bea:	8b 53 18             	mov    0x18(%ebx),%edx
 bed:	8b 43 10             	mov    0x10(%ebx),%eax
 bf0:	83 ea 01             	sub    $0x1,%edx
 bf3:	39 d0                	cmp    %edx,%eax
 bf5:	74 09                	je     c00 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 bf7:	83 c0 01             	add    $0x1,%eax
 bfa:	89 43 10             	mov    %eax,0x10(%ebx)
 bfd:	eb d7                	jmp    bd6 <semaphore_put_atomic+0x46>
 bff:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c00:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c07:	eb cd                	jmp    bd6 <semaphore_put_atomic+0x46>
 c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c10 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
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
 c24:	e8 47 fd ff ff       	call   970 <sem_down>
	binary_sem_down(bb->mutex);
 c29:	8b 03                	mov    (%ebx),%eax
 c2b:	89 04 24             	mov    %eax,(%esp)
 c2e:	e8 65 f8 ff ff       	call   498 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 c33:	8b 43 10             	mov    0x10(%ebx),%eax
 c36:	c1 e0 02             	shl    $0x2,%eax
 c39:	03 43 0c             	add    0xc(%ebx),%eax
 c3c:	8b 08                	mov    (%eax),%ecx
 c3e:	85 c9                	test   %ecx,%ecx
 c40:	74 36                	je     c78 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 c42:	c7 44 24 04 e8 0d 00 	movl   $0xde8,0x4(%esp)
 c49:	00 
 c4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c51:	e8 0a f9 ff ff       	call   560 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 c56:	8b 03                	mov    (%ebx),%eax
 c58:	89 04 24             	mov    %eax,(%esp)
 c5b:	e8 40 f8 ff ff       	call   4a0 <binary_sem_up>
	sem_up(bb->full);
 c60:	8b 43 08             	mov    0x8(%ebx),%eax
 c63:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c66:	83 c4 10             	add    $0x10,%esp
 c69:	5b                   	pop    %ebx
 c6a:	5e                   	pop    %esi
 c6b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 c6c:	e9 9f fd ff ff       	jmp    a10 <sem_up>
 c71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 c78:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 c7a:	8b 53 18             	mov    0x18(%ebx),%edx
 c7d:	8b 43 10             	mov    0x10(%ebx),%eax
 c80:	83 ea 01             	sub    $0x1,%edx
 c83:	39 d0                	cmp    %edx,%eax
 c85:	74 09                	je     c90 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 c87:	83 c0 01             	add    $0x1,%eax
 c8a:	89 43 10             	mov    %eax,0x10(%ebx)
 c8d:	eb c7                	jmp    c56 <semaphore_put+0x46>
 c8f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 c90:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 c97:	eb bd                	jmp    c56 <semaphore_put+0x46>
 c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ca0 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 ca0:	55                   	push   %ebp
 ca1:	89 e5                	mov    %esp,%ebp
 ca3:	83 ec 18             	sub    $0x18,%esp
 ca6:	89 75 fc             	mov    %esi,-0x4(%ebp)
 ca9:	8b 75 08             	mov    0x8(%ebp),%esi
 cac:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 caf:	85 f6                	test   %esi,%esi
 cb1:	79 15                	jns    cc8 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 cb3:	31 db                	xor    %ebx,%ebx
}
 cb5:	89 d8                	mov    %ebx,%eax
 cb7:	8b 75 fc             	mov    -0x4(%ebp),%esi
 cba:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 cbd:	89 ec                	mov    %ebp,%esp
 cbf:	5d                   	pop    %ebp
 cc0:	c3                   	ret    
 cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 cc8:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 ccf:	e8 2c fb ff ff       	call   800 <malloc>
 cd4:	85 c0                	test   %eax,%eax
 cd6:	89 c3                	mov    %eax,%ebx
 cd8:	74 db                	je     cb5 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 cda:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 ce1:	89 04 24             	mov    %eax,(%esp)
 ce4:	e8 17 fb ff ff       	call   800 <malloc>
 ce9:	85 c0                	test   %eax,%eax
 ceb:	89 43 0c             	mov    %eax,0xc(%ebx)
 cee:	74 c3                	je     cb3 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 cf0:	89 34 24             	mov    %esi,(%esp)
 cf3:	e8 78 fd ff ff       	call   a70 <semaphore_create>
 cf8:	85 c0                	test   %eax,%eax
 cfa:	89 43 04             	mov    %eax,0x4(%ebx)
 cfd:	74 b4                	je     cb3 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 cff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 d06:	e8 65 fd ff ff       	call   a70 <semaphore_create>
 d0b:	85 c0                	test   %eax,%eax
 d0d:	89 43 08             	mov    %eax,0x8(%ebx)
 d10:	74 a1                	je     cb3 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 d12:	e8 79 f7 ff ff       	call   490 <binary_sem_create>
	ret->produce = 0;
 d17:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 d1e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 d25:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 d28:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 d2a:	eb 89                	jmp    cb5 <BB_create+0x15>
