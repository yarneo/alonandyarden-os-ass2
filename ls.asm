
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 ec 10             	sub    $0x10,%esp
   8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   b:	89 1c 24             	mov    %ebx,(%esp)
   e:	e8 cd 03 00 00       	call   3e0 <strlen>
  13:	01 d8                	add    %ebx,%eax
  15:	73 10                	jae    27 <fmtname+0x27>
  17:	eb 13                	jmp    2c <fmtname+0x2c>
  19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  20:	83 e8 01             	sub    $0x1,%eax
  23:	39 c3                	cmp    %eax,%ebx
  25:	77 05                	ja     2c <fmtname+0x2c>
  27:	80 38 2f             	cmpb   $0x2f,(%eax)
  2a:	75 f4                	jne    20 <fmtname+0x20>
    ;
  p++;
  2c:	8d 58 01             	lea    0x1(%eax),%ebx
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  2f:	89 1c 24             	mov    %ebx,(%esp)
  32:	e8 a9 03 00 00       	call   3e0 <strlen>
  37:	83 f8 0d             	cmp    $0xd,%eax
  3a:	77 53                	ja     8f <fmtname+0x8f>
    return p;
  memmove(buf, p, strlen(p));
  3c:	89 1c 24             	mov    %ebx,(%esp)
  3f:	e8 9c 03 00 00       	call   3e0 <strlen>
  44:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  48:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  4f:	89 44 24 08          	mov    %eax,0x8(%esp)
  53:	e8 48 04 00 00       	call   4a0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  58:	89 1c 24             	mov    %ebx,(%esp)
  5b:	e8 80 03 00 00       	call   3e0 <strlen>
  60:	89 1c 24             	mov    %ebx,(%esp)
  63:	bb 00 10 00 00       	mov    $0x1000,%ebx
  68:	89 c6                	mov    %eax,%esi
  6a:	e8 71 03 00 00       	call   3e0 <strlen>
  6f:	ba 0e 00 00 00       	mov    $0xe,%edx
  74:	29 f2                	sub    %esi,%edx
  76:	89 54 24 08          	mov    %edx,0x8(%esp)
  7a:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  81:	00 
  82:	05 00 10 00 00       	add    $0x1000,%eax
  87:	89 04 24             	mov    %eax,(%esp)
  8a:	e8 71 03 00 00       	call   400 <memset>
  return buf;
}
  8f:	83 c4 10             	add    $0x10,%esp
  92:	89 d8                	mov    %ebx,%eax
  94:	5b                   	pop    %ebx
  95:	5e                   	pop    %esi
  96:	5d                   	pop    %ebp
  97:	c3                   	ret    
  98:	90                   	nop
  99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000a0 <ls>:

void
ls(char *path)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  a6:	81 ec 6c 02 00 00    	sub    $0x26c,%esp
  ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  b6:	00 
  b7:	89 3c 24             	mov    %edi,(%esp)
  ba:	e8 09 05 00 00       	call   5c8 <open>
  bf:	85 c0                	test   %eax,%eax
  c1:	89 c3                	mov    %eax,%ebx
  c3:	0f 88 c7 01 00 00    	js     290 <ls+0x1f0>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
  c9:	8d 75 c4             	lea    -0x3c(%ebp),%esi
  cc:	89 74 24 04          	mov    %esi,0x4(%esp)
  d0:	89 04 24             	mov    %eax,(%esp)
  d3:	e8 08 05 00 00       	call   5e0 <fstat>
  d8:	85 c0                	test   %eax,%eax
  da:	0f 88 00 02 00 00    	js     2e0 <ls+0x240>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  
  switch(st.type){
  e0:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
  e4:	66 83 f8 01          	cmp    $0x1,%ax
  e8:	74 66                	je     150 <ls+0xb0>
  ea:	66 83 f8 02          	cmp    $0x2,%ax
  ee:	66 90                	xchg   %ax,%ax
  f0:	74 16                	je     108 <ls+0x68>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
  f2:	89 1c 24             	mov    %ebx,(%esp)
  f5:	e8 b6 04 00 00       	call   5b0 <close>
}
  fa:	81 c4 6c 02 00 00    	add    $0x26c,%esp
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }
  
  switch(st.type){
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 108:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 10b:	8b 75 cc             	mov    -0x34(%ebp),%esi
 10e:	89 3c 24             	mov    %edi,(%esp)
 111:	89 95 ac fd ff ff    	mov    %edx,-0x254(%ebp)
 117:	e8 e4 fe ff ff       	call   0 <fmtname>
 11c:	8b 95 ac fd ff ff    	mov    -0x254(%ebp),%edx
 122:	89 74 24 10          	mov    %esi,0x10(%esp)
 126:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 12d:	00 
 12e:	c7 44 24 04 14 0f 00 	movl   $0xf14,0x4(%esp)
 135:	00 
 136:	89 54 24 14          	mov    %edx,0x14(%esp)
 13a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 141:	89 44 24 08          	mov    %eax,0x8(%esp)
 145:	e8 d6 05 00 00       	call   720 <printf>
    break;
 14a:	eb a6                	jmp    f2 <ls+0x52>
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 150:	89 3c 24             	mov    %edi,(%esp)
 153:	e8 88 02 00 00       	call   3e0 <strlen>
 158:	83 c0 10             	add    $0x10,%eax
 15b:	3d 00 02 00 00       	cmp    $0x200,%eax
 160:	0f 87 0a 01 00 00    	ja     270 <ls+0x1d0>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 166:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 16c:	89 7c 24 04          	mov    %edi,0x4(%esp)
 170:	8d 7d d8             	lea    -0x28(%ebp),%edi
 173:	89 04 24             	mov    %eax,(%esp)
 176:	e8 e5 01 00 00       	call   360 <strcpy>
    p = buf+strlen(buf);
 17b:	8d 95 c4 fd ff ff    	lea    -0x23c(%ebp),%edx
 181:	89 14 24             	mov    %edx,(%esp)
 184:	e8 57 02 00 00       	call   3e0 <strlen>
 189:	8d 95 c4 fd ff ff    	lea    -0x23c(%ebp),%edx
 18f:	8d 04 02             	lea    (%edx,%eax,1),%eax
    *p++ = '/';
 192:	c6 00 2f             	movb   $0x2f,(%eax)
 195:	83 c0 01             	add    $0x1,%eax
 198:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 19e:	66 90                	xchg   %ax,%ax
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1a0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 1a7:	00 
 1a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1ac:	89 1c 24             	mov    %ebx,(%esp)
 1af:	e8 ec 03 00 00       	call   5a0 <read>
 1b4:	83 f8 10             	cmp    $0x10,%eax
 1b7:	0f 85 35 ff ff ff    	jne    f2 <ls+0x52>
      if(de.inum == 0)
 1bd:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
 1c2:	74 dc                	je     1a0 <ls+0x100>
        continue;
      memmove(p, de.name, DIRSIZ);
 1c4:	8d 45 da             	lea    -0x26(%ebp),%eax
 1c7:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 1ce:	00 
 1cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d3:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 1d9:	89 14 24             	mov    %edx,(%esp)
 1dc:	e8 bf 02 00 00       	call   4a0 <memmove>
      p[DIRSIZ] = 0;
 1e1:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
      if(stat(buf, &st) < 0){
 1e7:	8d 95 c4 fd ff ff    	lea    -0x23c(%ebp),%edx
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
 1ed:	c6 40 0e 00          	movb   $0x0,0xe(%eax)
      if(stat(buf, &st) < 0){
 1f1:	89 74 24 04          	mov    %esi,0x4(%esp)
 1f5:	89 14 24             	mov    %edx,(%esp)
 1f8:	e8 d3 02 00 00       	call   4d0 <stat>
 1fd:	85 c0                	test   %eax,%eax
 1ff:	0f 88 b3 00 00 00    	js     2b8 <ls+0x218>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 205:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
 209:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 20c:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 20f:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%ebp)
 215:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 21b:	89 04 24             	mov    %eax,(%esp)
 21e:	89 95 ac fd ff ff    	mov    %edx,-0x254(%ebp)
 224:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
 22a:	e8 d1 fd ff ff       	call   0 <fmtname>
 22f:	8b 95 ac fd ff ff    	mov    -0x254(%ebp),%edx
 235:	89 54 24 14          	mov    %edx,0x14(%esp)
 239:	8b 8d a8 fd ff ff    	mov    -0x258(%ebp),%ecx
 23f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 243:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 249:	89 44 24 08          	mov    %eax,0x8(%esp)
 24d:	c7 44 24 04 14 0f 00 	movl   $0xf14,0x4(%esp)
 254:	00 
 255:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 260:	e8 bb 04 00 00       	call   720 <printf>
 265:	e9 36 ff ff ff       	jmp    1a0 <ls+0x100>
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 270:	c7 44 24 04 21 0f 00 	movl   $0xf21,0x4(%esp)
 277:	00 
 278:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 27f:	e8 9c 04 00 00       	call   720 <printf>
      break;
 284:	e9 69 fe ff ff       	jmp    f2 <ls+0x52>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 290:	89 7c 24 08          	mov    %edi,0x8(%esp)
 294:	c7 44 24 04 ec 0e 00 	movl   $0xeec,0x4(%esp)
 29b:	00 
 29c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 2a3:	e8 78 04 00 00       	call   720 <printf>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
}
 2a8:	81 c4 6c 02 00 00    	add    $0x26c,%esp
 2ae:	5b                   	pop    %ebx
 2af:	5e                   	pop    %esi
 2b0:	5f                   	pop    %edi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 2b8:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 2be:	89 44 24 08          	mov    %eax,0x8(%esp)
 2c2:	c7 44 24 04 00 0f 00 	movl   $0xf00,0x4(%esp)
 2c9:	00 
 2ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d1:	e8 4a 04 00 00       	call   720 <printf>
        continue;
 2d6:	e9 c5 fe ff ff       	jmp    1a0 <ls+0x100>
 2db:	90                   	nop
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 2e0:	89 7c 24 08          	mov    %edi,0x8(%esp)
 2e4:	c7 44 24 04 00 0f 00 	movl   $0xf00,0x4(%esp)
 2eb:	00 
 2ec:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 2f3:	e8 28 04 00 00       	call   720 <printf>
    close(fd);
 2f8:	89 1c 24             	mov    %ebx,(%esp)
 2fb:	e8 b0 02 00 00       	call   5b0 <close>
    return;
 300:	e9 f5 fd ff ff       	jmp    fa <ls+0x5a>
 305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 e4 f0             	and    $0xfffffff0,%esp
 316:	57                   	push   %edi
 317:	56                   	push   %esi
 318:	53                   	push   %ebx
  int i;

  if(argc < 2){
    ls(".");
    exit();
 319:	bb 01 00 00 00       	mov    $0x1,%ebx
  close(fd);
}

int
main(int argc, char *argv[])
{
 31e:	83 ec 14             	sub    $0x14,%esp
 321:	8b 75 08             	mov    0x8(%ebp),%esi
 324:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  if(argc < 2){
 327:	83 fe 01             	cmp    $0x1,%esi
 32a:	7e 1c                	jle    348 <main+0x38>
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 330:	8b 04 9f             	mov    (%edi,%ebx,4),%eax

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 333:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
 336:	89 04 24             	mov    %eax,(%esp)
 339:	e8 62 fd ff ff       	call   a0 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 33e:	39 de                	cmp    %ebx,%esi
 340:	7f ee                	jg     330 <main+0x20>
    ls(argv[i]);
  exit();
 342:	e8 41 02 00 00       	call   588 <exit>
 347:	90                   	nop
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
 348:	c7 04 24 34 0f 00 00 	movl   $0xf34,(%esp)
 34f:	e8 4c fd ff ff       	call   a0 <ls>
    exit();
 354:	e8 2f 02 00 00       	call   588 <exit>
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 360:	55                   	push   %ebp
 361:	31 d2                	xor    %edx,%edx
 363:	89 e5                	mov    %esp,%ebp
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	53                   	push   %ebx
 369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 370:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 374:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 377:	83 c2 01             	add    $0x1,%edx
 37a:	84 c9                	test   %cl,%cl
 37c:	75 f2                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 37e:	5b                   	pop    %ebx
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <strcmp>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 4d 08             	mov    0x8(%ebp),%ecx
 397:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 39a:	0f b6 01             	movzbl (%ecx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	75 14                	jne    3b5 <strcmp+0x25>
 3a1:	eb 25                	jmp    3c8 <strcmp+0x38>
 3a3:	90                   	nop
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 3a8:	83 c1 01             	add    $0x1,%ecx
 3ab:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3ae:	0f b6 01             	movzbl (%ecx),%eax
 3b1:	84 c0                	test   %al,%al
 3b3:	74 13                	je     3c8 <strcmp+0x38>
 3b5:	0f b6 1a             	movzbl (%edx),%ebx
 3b8:	38 d8                	cmp    %bl,%al
 3ba:	74 ec                	je     3a8 <strcmp+0x18>
 3bc:	0f b6 db             	movzbl %bl,%ebx
 3bf:	0f b6 c0             	movzbl %al,%eax
 3c2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3c4:	5b                   	pop    %ebx
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c8:	0f b6 1a             	movzbl (%edx),%ebx
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	0f b6 db             	movzbl %bl,%ebx
 3d0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3d2:	5b                   	pop    %ebx
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    
 3d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <strlen>:

uint
strlen(char *s)
{
 3e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 3e1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3e3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 3e5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ea:	80 39 00             	cmpb   $0x0,(%ecx)
 3ed:	74 0c                	je     3fb <strlen+0x1b>
 3ef:	90                   	nop
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
 406:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	89 d0                	mov    %edx,%eax
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 11                	jne    442 <strchr+0x22>
 431:	eb 15                	jmp    448 <strchr+0x28>
 433:	90                   	nop
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 438:	83 c0 01             	add    $0x1,%eax
 43b:	0f b6 10             	movzbl (%eax),%edx
 43e:	84 d2                	test   %dl,%dl
 440:	74 06                	je     448 <strchr+0x28>
    if(*s == c)
 442:	38 ca                	cmp    %cl,%dl
 444:	75 f2                	jne    438 <strchr+0x18>
      return (char*) s;
  return 0;
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 448:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 44a:	5d                   	pop    %ebp
 44b:	90                   	nop
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	c3                   	ret    
 451:	eb 0d                	jmp    460 <atoi>
 453:	90                   	nop
 454:	90                   	nop
 455:	90                   	nop
 456:	90                   	nop
 457:	90                   	nop
 458:	90                   	nop
 459:	90                   	nop
 45a:	90                   	nop
 45b:	90                   	nop
 45c:	90                   	nop
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 460:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 461:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 463:	89 e5                	mov    %esp,%ebp
 465:	8b 4d 08             	mov    0x8(%ebp),%ecx
 468:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 469:	0f b6 11             	movzbl (%ecx),%edx
 46c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 46f:	80 fb 09             	cmp    $0x9,%bl
 472:	77 1c                	ja     490 <atoi+0x30>
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 478:	0f be d2             	movsbl %dl,%edx
 47b:	83 c1 01             	add    $0x1,%ecx
 47e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 481:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 485:	0f b6 11             	movzbl (%ecx),%edx
 488:	8d 5a d0             	lea    -0x30(%edx),%ebx
 48b:	80 fb 09             	cmp    $0x9,%bl
 48e:	76 e8                	jbe    478 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 490:	5b                   	pop    %ebx
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    
 493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	53                   	push   %ebx
 4a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ae:	85 db                	test   %ebx,%ebx
 4b0:	7e 14                	jle    4c6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 4b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4bf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c2:	39 da                	cmp    %ebx,%edx
 4c4:	75 f2                	jne    4b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4c6:	5b                   	pop    %ebx
 4c7:	5e                   	pop    %esi
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 4df:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4eb:	00 
 4ec:	89 04 24             	mov    %eax,(%esp)
 4ef:	e8 d4 00 00 00       	call   5c8 <open>
  if(fd < 0)
 4f4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4f8:	78 19                	js     513 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 4fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fd:	89 1c 24             	mov    %ebx,(%esp)
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	e8 d7 00 00 00       	call   5e0 <fstat>
  close(fd);
 509:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 50c:	89 c6                	mov    %eax,%esi
  close(fd);
 50e:	e8 9d 00 00 00       	call   5b0 <close>
  return r;
}
 513:	89 f0                	mov    %esi,%eax
 515:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 518:	8b 75 fc             	mov    -0x4(%ebp),%esi
 51b:	89 ec                	mov    %ebp,%esp
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret    
 51f:	90                   	nop

00000520 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	31 f6                	xor    %esi,%esi
 527:	53                   	push   %ebx
 528:	83 ec 2c             	sub    $0x2c,%esp
 52b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 52e:	eb 06                	jmp    536 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 530:	3c 0a                	cmp    $0xa,%al
 532:	74 39                	je     56d <gets+0x4d>
 534:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 536:	8d 5e 01             	lea    0x1(%esi),%ebx
 539:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53c:	7d 31                	jge    56f <gets+0x4f>
    cc = read(0, &c, 1);
 53e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 541:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 548:	00 
 549:	89 44 24 04          	mov    %eax,0x4(%esp)
 54d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 554:	e8 47 00 00 00       	call   5a0 <read>
    if(cc < 1)
 559:	85 c0                	test   %eax,%eax
 55b:	7e 12                	jle    56f <gets+0x4f>
      break;
    buf[i++] = c;
 55d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 561:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 565:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 569:	3c 0d                	cmp    $0xd,%al
 56b:	75 c3                	jne    530 <gets+0x10>
 56d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 56f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 573:	89 f8                	mov    %edi,%eax
 575:	83 c4 2c             	add    $0x2c,%esp
 578:	5b                   	pop    %ebx
 579:	5e                   	pop    %esi
 57a:	5f                   	pop    %edi
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    
 57d:	90                   	nop
 57e:	90                   	nop
 57f:	90                   	nop

00000580 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 580:	b8 01 00 00 00       	mov    $0x1,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exit>:
SYSCALL(exit)
 588:	b8 02 00 00 00       	mov    $0x2,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <wait>:
SYSCALL(wait)
 590:	b8 03 00 00 00       	mov    $0x3,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <pipe>:
SYSCALL(pipe)
 598:	b8 04 00 00 00       	mov    $0x4,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <read>:
SYSCALL(read)
 5a0:	b8 06 00 00 00       	mov    $0x6,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <write>:
SYSCALL(write)
 5a8:	b8 05 00 00 00       	mov    $0x5,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <close>:
SYSCALL(close)
 5b0:	b8 07 00 00 00       	mov    $0x7,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <kill>:
SYSCALL(kill)
 5b8:	b8 08 00 00 00       	mov    $0x8,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exec>:
SYSCALL(exec)
 5c0:	b8 09 00 00 00       	mov    $0x9,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <open>:
SYSCALL(open)
 5c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <mknod>:
SYSCALL(mknod)
 5d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unlink>:
SYSCALL(unlink)
 5d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <fstat>:
SYSCALL(fstat)
 5e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <link>:
SYSCALL(link)
 5e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <mkdir>:
SYSCALL(mkdir)
 5f0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <chdir>:
SYSCALL(chdir)
 5f8:	b8 10 00 00 00       	mov    $0x10,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <dup>:
SYSCALL(dup)
 600:	b8 11 00 00 00       	mov    $0x11,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getpid>:
SYSCALL(getpid)
 608:	b8 12 00 00 00       	mov    $0x12,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <sbrk>:
SYSCALL(sbrk)
 610:	b8 13 00 00 00       	mov    $0x13,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sleep>:
SYSCALL(sleep)
 618:	b8 14 00 00 00       	mov    $0x14,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <uptime>:
SYSCALL(uptime)
 620:	b8 15 00 00 00       	mov    $0x15,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <thread_create>:
SYSCALL(thread_create)
 628:	b8 16 00 00 00       	mov    $0x16,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <thread_getid>:
SYSCALL(thread_getid)
 630:	b8 17 00 00 00       	mov    $0x17,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <thread_getProcid>:
SYSCALL(thread_getProcid)
 638:	b8 18 00 00 00       	mov    $0x18,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <thread_exit>:
SYSCALL(thread_exit)
 640:	b8 1a 00 00 00       	mov    $0x1a,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <thread_join>:
SYSCALL(thread_join)
 648:	b8 19 00 00 00       	mov    $0x19,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <binary_sem_create>:
SYSCALL(binary_sem_create)
 650:	b8 1b 00 00 00       	mov    $0x1b,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <binary_sem_down>:
SYSCALL(binary_sem_down)
 658:	b8 1c 00 00 00       	mov    $0x1c,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <binary_sem_up>:
SYSCALL(binary_sem_up)
 660:	b8 1d 00 00 00       	mov    $0x1d,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 668:	b8 1e 00 00 00       	mov    $0x1e,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <exit_all_threads>:
 670:	b8 1f 00 00 00       	mov    $0x1f,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    
 678:	90                   	nop
 679:	90                   	nop
 67a:	90                   	nop
 67b:	90                   	nop
 67c:	90                   	nop
 67d:	90                   	nop
 67e:	90                   	nop
 67f:	90                   	nop

00000680 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	89 cf                	mov    %ecx,%edi
 686:	56                   	push   %esi
 687:	89 c6                	mov    %eax,%esi
 689:	53                   	push   %ebx
 68a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 68d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 690:	85 c9                	test   %ecx,%ecx
 692:	74 04                	je     698 <printint+0x18>
 694:	85 d2                	test   %edx,%edx
 696:	78 70                	js     708 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 698:	89 d0                	mov    %edx,%eax
 69a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6a1:	31 c9                	xor    %ecx,%ecx
 6a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6a6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 6a8:	31 d2                	xor    %edx,%edx
 6aa:	f7 f7                	div    %edi
 6ac:	0f b6 92 3d 0f 00 00 	movzbl 0xf3d(%edx),%edx
 6b3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 6b6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 6b9:	85 c0                	test   %eax,%eax
 6bb:	75 eb                	jne    6a8 <printint+0x28>
	if(neg)
 6bd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6c0:	85 c0                	test   %eax,%eax
 6c2:	74 08                	je     6cc <printint+0x4c>
		buf[i++] = '-';
 6c4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 6c9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 6cc:	8d 79 ff             	lea    -0x1(%ecx),%edi
 6cf:	01 fb                	add    %edi,%ebx
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	0f b6 03             	movzbl (%ebx),%eax
 6db:	83 ef 01             	sub    $0x1,%edi
 6de:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6e8:	00 
 6e9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 6ec:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6ef:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f6:	e8 ad fe ff ff       	call   5a8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 6fb:	83 ff ff             	cmp    $0xffffffff,%edi
 6fe:	75 d8                	jne    6d8 <printint+0x58>
		putc(fd, buf[i]);
}
 700:	83 c4 4c             	add    $0x4c,%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 708:	89 d0                	mov    %edx,%eax
 70a:	f7 d8                	neg    %eax
 70c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 713:	eb 8c                	jmp    6a1 <printint+0x21>
 715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000720 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 729:	8b 45 0c             	mov    0xc(%ebp),%eax
 72c:	0f b6 10             	movzbl (%eax),%edx
 72f:	84 d2                	test   %dl,%dl
 731:	0f 84 c9 00 00 00    	je     800 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 737:	8d 4d 10             	lea    0x10(%ebp),%ecx
 73a:	31 ff                	xor    %edi,%edi
 73c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 73f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 741:	8d 75 e7             	lea    -0x19(%ebp),%esi
 744:	eb 1e                	jmp    764 <printf+0x44>
 746:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 748:	83 fa 25             	cmp    $0x25,%edx
 74b:	0f 85 b7 00 00 00    	jne    808 <printf+0xe8>
 751:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 755:	83 c3 01             	add    $0x1,%ebx
 758:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 75c:	84 d2                	test   %dl,%dl
 75e:	0f 84 9c 00 00 00    	je     800 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 764:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 766:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 769:	74 dd                	je     748 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 76b:	83 ff 25             	cmp    $0x25,%edi
 76e:	75 e5                	jne    755 <printf+0x35>
			if(c == 'd'){
 770:	83 fa 64             	cmp    $0x64,%edx
 773:	0f 84 57 01 00 00    	je     8d0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 779:	83 fa 70             	cmp    $0x70,%edx
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 780:	0f 84 aa 00 00 00    	je     830 <printf+0x110>
 786:	83 fa 78             	cmp    $0x78,%edx
 789:	0f 84 a1 00 00 00    	je     830 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 78f:	83 fa 73             	cmp    $0x73,%edx
 792:	0f 84 c0 00 00 00    	je     858 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 798:	83 fa 63             	cmp    $0x63,%edx
 79b:	90                   	nop
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7a0:	0f 84 52 01 00 00    	je     8f8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 7a6:	83 fa 25             	cmp    $0x25,%edx
 7a9:	0f 84 f9 00 00 00    	je     8a8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7af:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 7b2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7b5:	31 ff                	xor    %edi,%edi
 7b7:	89 55 cc             	mov    %edx,-0x34(%ebp)
 7ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7c5:	00 
 7c6:	89 0c 24             	mov    %ecx,(%esp)
 7c9:	89 74 24 04          	mov    %esi,0x4(%esp)
 7cd:	e8 d6 fd ff ff       	call   5a8 <write>
 7d2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7df:	00 
 7e0:	89 74 24 04          	mov    %esi,0x4(%esp)
 7e4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7e7:	89 04 24             	mov    %eax,(%esp)
 7ea:	e8 b9 fd ff ff       	call   5a8 <write>
 7ef:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 7f2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 7f6:	84 d2                	test   %dl,%dl
 7f8:	0f 85 66 ff ff ff    	jne    764 <printf+0x44>
 7fe:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 800:	83 c4 3c             	add    $0x3c,%esp
 803:	5b                   	pop    %ebx
 804:	5e                   	pop    %esi
 805:	5f                   	pop    %edi
 806:	5d                   	pop    %ebp
 807:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 808:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 80b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 80e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 815:	00 
 816:	89 74 24 04          	mov    %esi,0x4(%esp)
 81a:	89 04 24             	mov    %eax,(%esp)
 81d:	e8 86 fd ff ff       	call   5a8 <write>
 822:	8b 45 0c             	mov    0xc(%ebp),%eax
 825:	e9 2b ff ff ff       	jmp    755 <printf+0x35>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 830:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 833:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 838:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 83a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 841:	8b 10                	mov    (%eax),%edx
 843:	8b 45 08             	mov    0x8(%ebp),%eax
 846:	e8 35 fe ff ff       	call   680 <printint>
 84b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 84e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 852:	e9 fe fe ff ff       	jmp    755 <printf+0x35>
 857:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 858:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 85b:	8b 3a                	mov    (%edx),%edi
				ap++;
 85d:	83 c2 04             	add    $0x4,%edx
 860:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 863:	85 ff                	test   %edi,%edi
 865:	0f 84 ba 00 00 00    	je     925 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 86b:	0f b6 17             	movzbl (%edi),%edx
 86e:	84 d2                	test   %dl,%dl
 870:	74 2d                	je     89f <printf+0x17f>
 872:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 875:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 878:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 87b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 87e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 885:	00 
 886:	89 74 24 04          	mov    %esi,0x4(%esp)
 88a:	89 1c 24             	mov    %ebx,(%esp)
 88d:	e8 16 fd ff ff       	call   5a8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 892:	0f b6 17             	movzbl (%edi),%edx
 895:	84 d2                	test   %dl,%dl
 897:	75 df                	jne    878 <printf+0x158>
 899:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 89c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 89f:	31 ff                	xor    %edi,%edi
 8a1:	e9 af fe ff ff       	jmp    755 <printf+0x35>
 8a6:	66 90                	xchg   %ax,%ax
 8a8:	8b 55 08             	mov    0x8(%ebp),%edx
 8ab:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 8ad:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8b8:	00 
 8b9:	89 74 24 04          	mov    %esi,0x4(%esp)
 8bd:	89 14 24             	mov    %edx,(%esp)
 8c0:	e8 e3 fc ff ff       	call   5a8 <write>
 8c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8c8:	e9 88 fe ff ff       	jmp    755 <printf+0x35>
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 8d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 8d8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 8db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8e2:	8b 10                	mov    (%eax),%edx
 8e4:	8b 45 08             	mov    0x8(%ebp),%eax
 8e7:	e8 94 fd ff ff       	call   680 <printint>
 8ec:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 8ef:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8f3:	e9 5d fe ff ff       	jmp    755 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 8f8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 8fb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 8fd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8ff:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 906:	00 
 907:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 90b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 90e:	8b 45 08             	mov    0x8(%ebp),%eax
 911:	89 04 24             	mov    %eax,(%esp)
 914:	e8 8f fc ff ff       	call   5a8 <write>
 919:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 91c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 920:	e9 30 fe ff ff       	jmp    755 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 925:	bf 36 0f 00 00       	mov    $0xf36,%edi
 92a:	e9 3c ff ff ff       	jmp    86b <printf+0x14b>
 92f:	90                   	nop

00000930 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 930:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	a1 18 10 00 00       	mov    0x1018,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 936:	89 e5                	mov    %esp,%ebp
 938:	57                   	push   %edi
 939:	56                   	push   %esi
 93a:	53                   	push   %ebx
 93b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 93e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	39 c8                	cmp    %ecx,%eax
 943:	73 1d                	jae    962 <free+0x32>
 945:	8d 76 00             	lea    0x0(%esi),%esi
 948:	8b 10                	mov    (%eax),%edx
 94a:	39 d1                	cmp    %edx,%ecx
 94c:	72 1a                	jb     968 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94e:	39 d0                	cmp    %edx,%eax
 950:	72 08                	jb     95a <free+0x2a>
 952:	39 c8                	cmp    %ecx,%eax
 954:	72 12                	jb     968 <free+0x38>
 956:	39 d1                	cmp    %edx,%ecx
 958:	72 0e                	jb     968 <free+0x38>
 95a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 95c:	39 c8                	cmp    %ecx,%eax
 95e:	66 90                	xchg   %ax,%ax
 960:	72 e6                	jb     948 <free+0x18>
 962:	8b 10                	mov    (%eax),%edx
 964:	eb e8                	jmp    94e <free+0x1e>
 966:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 968:	8b 71 04             	mov    0x4(%ecx),%esi
 96b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 96e:	39 d7                	cmp    %edx,%edi
 970:	74 19                	je     98b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 972:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 975:	8b 50 04             	mov    0x4(%eax),%edx
 978:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 97b:	39 ce                	cmp    %ecx,%esi
 97d:	74 23                	je     9a2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 97f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 981:	a3 18 10 00 00       	mov    %eax,0x1018
}
 986:	5b                   	pop    %ebx
 987:	5e                   	pop    %esi
 988:	5f                   	pop    %edi
 989:	5d                   	pop    %ebp
 98a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 98b:	03 72 04             	add    0x4(%edx),%esi
 98e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 991:	8b 10                	mov    (%eax),%edx
 993:	8b 12                	mov    (%edx),%edx
 995:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 998:	8b 50 04             	mov    0x4(%eax),%edx
 99b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 99e:	39 ce                	cmp    %ecx,%esi
 9a0:	75 dd                	jne    97f <free+0x4f>
    p->s.size += bp->s.size;
 9a2:	03 51 04             	add    0x4(%ecx),%edx
 9a5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9a8:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9ab:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 9ad:	a3 18 10 00 00       	mov    %eax,0x1018
}
 9b2:	5b                   	pop    %ebx
 9b3:	5e                   	pop    %esi
 9b4:	5f                   	pop    %edi
 9b5:	5d                   	pop    %ebp
 9b6:	c3                   	ret    
 9b7:	89 f6                	mov    %esi,%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	57                   	push   %edi
 9c4:	56                   	push   %esi
 9c5:	53                   	push   %ebx
 9c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 9cc:	8b 0d 18 10 00 00    	mov    0x1018,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d2:	83 c3 07             	add    $0x7,%ebx
 9d5:	c1 eb 03             	shr    $0x3,%ebx
 9d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9db:	85 c9                	test   %ecx,%ecx
 9dd:	0f 84 93 00 00 00    	je     a76 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 9e5:	8b 50 04             	mov    0x4(%eax),%edx
 9e8:	39 d3                	cmp    %edx,%ebx
 9ea:	76 1f                	jbe    a0b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 9ec:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9f3:	90                   	nop
 9f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 9f8:	3b 05 18 10 00 00    	cmp    0x1018,%eax
 9fe:	74 30                	je     a30 <malloc+0x70>
 a00:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a02:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 a04:	8b 50 04             	mov    0x4(%eax),%edx
 a07:	39 d3                	cmp    %edx,%ebx
 a09:	77 ed                	ja     9f8 <malloc+0x38>
      if(p->s.size == nunits)
 a0b:	39 d3                	cmp    %edx,%ebx
 a0d:	74 61                	je     a70 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a0f:	29 da                	sub    %ebx,%edx
 a11:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a14:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a17:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a1a:	89 0d 18 10 00 00    	mov    %ecx,0x1018
      return (void*) (p + 1);
 a20:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a23:	83 c4 1c             	add    $0x1c,%esp
 a26:	5b                   	pop    %ebx
 a27:	5e                   	pop    %esi
 a28:	5f                   	pop    %edi
 a29:	5d                   	pop    %ebp
 a2a:	c3                   	ret    
 a2b:	90                   	nop
 a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a30:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 a36:	b8 00 80 00 00       	mov    $0x8000,%eax
 a3b:	bf 00 10 00 00       	mov    $0x1000,%edi
 a40:	76 04                	jbe    a46 <malloc+0x86>
 a42:	89 f0                	mov    %esi,%eax
 a44:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a46:	89 04 24             	mov    %eax,(%esp)
 a49:	e8 c2 fb ff ff       	call   610 <sbrk>
  if(p == (char*) -1)
 a4e:	83 f8 ff             	cmp    $0xffffffff,%eax
 a51:	74 18                	je     a6b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a53:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 a56:	83 c0 08             	add    $0x8,%eax
 a59:	89 04 24             	mov    %eax,(%esp)
 a5c:	e8 cf fe ff ff       	call   930 <free>
  return freep;
 a61:	8b 0d 18 10 00 00    	mov    0x1018,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a67:	85 c9                	test   %ecx,%ecx
 a69:	75 97                	jne    a02 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a6b:	31 c0                	xor    %eax,%eax
 a6d:	eb b4                	jmp    a23 <malloc+0x63>
 a6f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a70:	8b 10                	mov    (%eax),%edx
 a72:	89 11                	mov    %edx,(%ecx)
 a74:	eb a4                	jmp    a1a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a76:	c7 05 18 10 00 00 10 	movl   $0x1010,0x1018
 a7d:	10 00 00 
    base.s.size = 0;
 a80:	b9 10 10 00 00       	mov    $0x1010,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a85:	c7 05 10 10 00 00 10 	movl   $0x1010,0x1010
 a8c:	10 00 00 
    base.s.size = 0;
 a8f:	c7 05 14 10 00 00 00 	movl   $0x0,0x1014
 a96:	00 00 00 
 a99:	e9 45 ff ff ff       	jmp    9e3 <malloc+0x23>
 a9e:	90                   	nop
 a9f:	90                   	nop

00000aa0 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	53                   	push   %ebx
 aa4:	83 ec 14             	sub    $0x14,%esp
 aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 aaa:	8b 03                	mov    (%ebx),%eax
 aac:	89 04 24             	mov    %eax,(%esp)
 aaf:	e8 b4 fb ff ff       	call   668 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 ab4:	8b 43 04             	mov    0x4(%ebx),%eax
 ab7:	89 04 24             	mov    %eax,(%esp)
 aba:	e8 a9 fb ff ff       	call   668 <binary_sem_clear>
	free(sem);
 abf:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 ac2:	83 c4 14             	add    $0x14,%esp
 ac5:	5b                   	pop    %ebx
 ac6:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 ac7:	e9 64 fe ff ff       	jmp    930 <free>
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 18             	sub    $0x18,%esp
 ad6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 ad9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 adc:	89 75 fc             	mov    %esi,-0x4(%ebp)
 adf:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 ae2:	8b 43 04             	mov    0x4(%ebx),%eax
 ae5:	89 04 24             	mov    %eax,(%esp)
 ae8:	e8 6b fb ff ff       	call   658 <binary_sem_down>
	binary_sem_down(sem->S1);
 aed:	8b 03                	mov    (%ebx),%eax
 aef:	89 04 24             	mov    %eax,(%esp)
 af2:	e8 61 fb ff ff       	call   658 <binary_sem_down>
	sem->value -= num;
 af7:	8b 43 08             	mov    0x8(%ebx),%eax
 afa:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 afc:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 afe:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 b01:	74 0b                	je     b0e <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 b03:	8b 43 04             	mov    0x4(%ebx),%eax
 b06:	89 04 24             	mov    %eax,(%esp)
 b09:	e8 52 fb ff ff       	call   660 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 b0e:	8b 03                	mov    (%ebx),%eax
}
 b10:	8b 75 fc             	mov    -0x4(%ebp),%esi
 b13:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b16:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b19:	89 ec                	mov    %ebp,%esp
 b1b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b1c:	e9 3f fb ff ff       	jmp    660 <binary_sem_up>
 b21:	eb 0d                	jmp    b30 <sem_down>
 b23:	90                   	nop
 b24:	90                   	nop
 b25:	90                   	nop
 b26:	90                   	nop
 b27:	90                   	nop
 b28:	90                   	nop
 b29:	90                   	nop
 b2a:	90                   	nop
 b2b:	90                   	nop
 b2c:	90                   	nop
 b2d:	90                   	nop
 b2e:	90                   	nop
 b2f:	90                   	nop

00000b30 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	53                   	push   %ebx
 b34:	83 ec 14             	sub    $0x14,%esp
 b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 b3a:	8b 43 04             	mov    0x4(%ebx),%eax
 b3d:	89 04 24             	mov    %eax,(%esp)
 b40:	e8 13 fb ff ff       	call   658 <binary_sem_down>
	binary_sem_down(sem->S1);
 b45:	8b 03                	mov    (%ebx),%eax
 b47:	89 04 24             	mov    %eax,(%esp)
 b4a:	e8 09 fb ff ff       	call   658 <binary_sem_down>
	sem->value--;
 b4f:	8b 43 08             	mov    0x8(%ebx),%eax
 b52:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 b55:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 b57:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 b5a:	74 0b                	je     b67 <sem_down+0x37>
		binary_sem_up(sem->S2);
 b5c:	8b 43 04             	mov    0x4(%ebx),%eax
 b5f:	89 04 24             	mov    %eax,(%esp)
 b62:	e8 f9 fa ff ff       	call   660 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 b67:	8b 03                	mov    (%ebx),%eax
 b69:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b6c:	83 c4 14             	add    $0x14,%esp
 b6f:	5b                   	pop    %ebx
 b70:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b71:	e9 ea fa ff ff       	jmp    660 <binary_sem_up>
 b76:	8d 76 00             	lea    0x0(%esi),%esi
 b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 18             	sub    $0x18,%esp
 b86:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 b89:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b8c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 b8f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 b92:	8b 03                	mov    (%ebx),%eax
 b94:	89 04 24             	mov    %eax,(%esp)
 b97:	e8 bc fa ff ff       	call   658 <binary_sem_down>
	sem->value+= num;
 b9c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 b9f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 ba2:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 ba5:	74 19                	je     bc0 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 ba7:	8b 03                	mov    (%ebx),%eax
}
 ba9:	8b 75 fc             	mov    -0x4(%ebp),%esi
 bac:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 baf:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bb2:	89 ec                	mov    %ebp,%esp
 bb4:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bb5:	e9 a6 fa ff ff       	jmp    660 <binary_sem_up>
 bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 bc0:	8b 43 04             	mov    0x4(%ebx),%eax
 bc3:	89 04 24             	mov    %eax,(%esp)
 bc6:	e8 95 fa ff ff       	call   660 <binary_sem_up>
 bcb:	eb da                	jmp    ba7 <sem_ups+0x27>
 bcd:	8d 76 00             	lea    0x0(%esi),%esi

00000bd0 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	53                   	push   %ebx
 bd4:	83 ec 14             	sub    $0x14,%esp
 bd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 bda:	8b 03                	mov    (%ebx),%eax
 bdc:	89 04 24             	mov    %eax,(%esp)
 bdf:	e8 74 fa ff ff       	call   658 <binary_sem_down>
	sem->value++;
 be4:	8b 43 08             	mov    0x8(%ebx),%eax
 be7:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 bea:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 bed:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 bf0:	74 16                	je     c08 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bf2:	8b 03                	mov    (%ebx),%eax
 bf4:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bf7:	83 c4 14             	add    $0x14,%esp
 bfa:	5b                   	pop    %ebx
 bfb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bfc:	e9 5f fa ff ff       	jmp    660 <binary_sem_up>
 c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 c08:	8b 43 04             	mov    0x4(%ebx),%eax
 c0b:	89 04 24             	mov    %eax,(%esp)
 c0e:	e8 4d fa ff ff       	call   660 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 c13:	8b 03                	mov    (%ebx),%eax
 c15:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c18:	83 c4 14             	add    $0x14,%esp
 c1b:	5b                   	pop    %ebx
 c1c:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 c1d:	e9 3e fa ff ff       	jmp    660 <binary_sem_up>
 c22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c30 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
 c33:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c36:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 c3d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 c40:	89 75 f8             	mov    %esi,-0x8(%ebp)
 c43:	89 7d fc             	mov    %edi,-0x4(%ebp)
 c46:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c49:	e8 72 fd ff ff       	call   9c0 <malloc>
	ret->value = initial_semaphore_value;
 c4e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c51:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 c53:	e8 f8 f9 ff ff       	call   650 <binary_sem_create>
 c58:	89 03                	mov    %eax,(%ebx)
 c5a:	89 c6                	mov    %eax,%esi
 c5c:	e8 ef f9 ff ff       	call   650 <binary_sem_create>
 c61:	01 c6                	add    %eax,%esi
 c63:	89 43 04             	mov    %eax,0x4(%ebx)
 c66:	78 20                	js     c88 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 c68:	85 ff                	test   %edi,%edi
 c6a:	75 08                	jne    c74 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 c6c:	89 04 24             	mov    %eax,(%esp)
 c6f:	e8 e4 f9 ff ff       	call   658 <binary_sem_down>
	}
	return ret;
}
 c74:	89 d8                	mov    %ebx,%eax
 c76:	8b 75 f8             	mov    -0x8(%ebp),%esi
 c79:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 c7c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 c7f:	89 ec                	mov    %ebp,%esp
 c81:	5d                   	pop    %ebp
 c82:	c3                   	ret    
 c83:	90                   	nop
 c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 c88:	c7 44 24 04 50 0f 00 	movl   $0xf50,0x4(%esp)
 c8f:	00 
 c90:	31 db                	xor    %ebx,%ebx
 c92:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c99:	e8 82 fa ff ff       	call   720 <printf>
		return 0;
 c9e:	eb d4                	jmp    c74 <semaphore_create+0x44>

00000ca0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 ca0:	55                   	push   %ebp
 ca1:	89 e5                	mov    %esp,%ebp
 ca3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	8b 00                	mov    (%eax),%eax
 cab:	89 45 08             	mov    %eax,0x8(%ebp)
}
 cae:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 caf:	e9 ac f9 ff ff       	jmp    660 <binary_sem_up>
 cb4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 cba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000cc0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 cc0:	55                   	push   %ebp
 cc1:	89 e5                	mov    %esp,%ebp
 cc3:	56                   	push   %esi
 cc4:	53                   	push   %ebx
 cc5:	83 ec 10             	sub    $0x10,%esp
 cc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 ccb:	8b 43 08             	mov    0x8(%ebx),%eax
 cce:	89 04 24             	mov    %eax,(%esp)
 cd1:	e8 5a fe ff ff       	call   b30 <sem_down>
	binary_sem_down(bb->mutex);
 cd6:	8b 03                	mov    (%ebx),%eax
 cd8:	89 04 24             	mov    %eax,(%esp)
 cdb:	e8 78 f9 ff ff       	call   658 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 ce0:	8b 43 14             	mov    0x14(%ebx),%eax
 ce3:	c1 e0 02             	shl    $0x2,%eax
 ce6:	03 43 0c             	add    0xc(%ebx),%eax
 ce9:	8b 30                	mov    (%eax),%esi
 ceb:	85 f6                	test   %esi,%esi
 ced:	74 42                	je     d31 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 cef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 cf5:	8b 53 18             	mov    0x18(%ebx),%edx
 cf8:	8b 43 14             	mov    0x14(%ebx),%eax
 cfb:	83 ea 01             	sub    $0x1,%edx
 cfe:	39 d0                	cmp    %edx,%eax
 d00:	74 26                	je     d28 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 d02:	83 c0 01             	add    $0x1,%eax
 d05:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 d08:	8b 03                	mov    (%ebx),%eax
 d0a:	89 04 24             	mov    %eax,(%esp)
 d0d:	e8 4e f9 ff ff       	call   660 <binary_sem_up>
	sem_up(bb->empty);
 d12:	8b 43 04             	mov    0x4(%ebx),%eax
 d15:	89 04 24             	mov    %eax,(%esp)
 d18:	e8 b3 fe ff ff       	call   bd0 <sem_up>
	return element;
}
 d1d:	83 c4 10             	add    $0x10,%esp
 d20:	89 f0                	mov    %esi,%eax
 d22:	5b                   	pop    %ebx
 d23:	5e                   	pop    %esi
 d24:	5d                   	pop    %ebp
 d25:	c3                   	ret    
 d26:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 d28:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 d2f:	eb d7                	jmp    d08 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 d31:	c7 44 24 04 78 0f 00 	movl   $0xf78,0x4(%esp)
 d38:	00 
 d39:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d40:	e8 db f9 ff ff       	call   720 <printf>
 d45:	eb c1                	jmp    d08 <semaphore_pop+0x48>
 d47:	89 f6                	mov    %esi,%esi
 d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d50 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 d50:	55                   	push   %ebp
 d51:	89 e5                	mov    %esp,%ebp
 d53:	56                   	push   %esi
 d54:	53                   	push   %ebx
 d55:	83 ec 10             	sub    $0x10,%esp
 d58:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d5b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 d5e:	8b 43 04             	mov    0x4(%ebx),%eax
 d61:	89 04 24             	mov    %eax,(%esp)
 d64:	e8 c7 fd ff ff       	call   b30 <sem_down>
	binary_sem_down(bb->mutex);
 d69:	8b 03                	mov    (%ebx),%eax
 d6b:	89 04 24             	mov    %eax,(%esp)
 d6e:	e8 e5 f8 ff ff       	call   658 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 d73:	8b 43 10             	mov    0x10(%ebx),%eax
 d76:	c1 e0 02             	shl    $0x2,%eax
 d79:	03 43 0c             	add    0xc(%ebx),%eax
 d7c:	8b 10                	mov    (%eax),%edx
 d7e:	85 d2                	test   %edx,%edx
 d80:	74 26                	je     da8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 d82:	c7 44 24 04 bc 0f 00 	movl   $0xfbc,0x4(%esp)
 d89:	00 
 d8a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d91:	e8 8a f9 ff ff       	call   720 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 d96:	8b 43 08             	mov    0x8(%ebx),%eax
 d99:	89 45 08             	mov    %eax,0x8(%ebp)
}
 d9c:	83 c4 10             	add    $0x10,%esp
 d9f:	5b                   	pop    %ebx
 da0:	5e                   	pop    %esi
 da1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 da2:	e9 29 fe ff ff       	jmp    bd0 <sem_up>
 da7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 da8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 daa:	8b 53 18             	mov    0x18(%ebx),%edx
 dad:	8b 43 10             	mov    0x10(%ebx),%eax
 db0:	83 ea 01             	sub    $0x1,%edx
 db3:	39 d0                	cmp    %edx,%eax
 db5:	74 09                	je     dc0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 db7:	83 c0 01             	add    $0x1,%eax
 dba:	89 43 10             	mov    %eax,0x10(%ebx)
 dbd:	eb d7                	jmp    d96 <semaphore_put_atomic+0x46>
 dbf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 dc0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 dc7:	eb cd                	jmp    d96 <semaphore_put_atomic+0x46>
 dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000dd0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 dd0:	55                   	push   %ebp
 dd1:	89 e5                	mov    %esp,%ebp
 dd3:	56                   	push   %esi
 dd4:	53                   	push   %ebx
 dd5:	83 ec 10             	sub    $0x10,%esp
 dd8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ddb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 dde:	8b 43 04             	mov    0x4(%ebx),%eax
 de1:	89 04 24             	mov    %eax,(%esp)
 de4:	e8 47 fd ff ff       	call   b30 <sem_down>
	binary_sem_down(bb->mutex);
 de9:	8b 03                	mov    (%ebx),%eax
 deb:	89 04 24             	mov    %eax,(%esp)
 dee:	e8 65 f8 ff ff       	call   658 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 df3:	8b 43 10             	mov    0x10(%ebx),%eax
 df6:	c1 e0 02             	shl    $0x2,%eax
 df9:	03 43 0c             	add    0xc(%ebx),%eax
 dfc:	8b 08                	mov    (%eax),%ecx
 dfe:	85 c9                	test   %ecx,%ecx
 e00:	74 36                	je     e38 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 e02:	c7 44 24 04 bc 0f 00 	movl   $0xfbc,0x4(%esp)
 e09:	00 
 e0a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 e11:	e8 0a f9 ff ff       	call   720 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 e16:	8b 03                	mov    (%ebx),%eax
 e18:	89 04 24             	mov    %eax,(%esp)
 e1b:	e8 40 f8 ff ff       	call   660 <binary_sem_up>
	sem_up(bb->full);
 e20:	8b 43 08             	mov    0x8(%ebx),%eax
 e23:	89 45 08             	mov    %eax,0x8(%ebp)
}
 e26:	83 c4 10             	add    $0x10,%esp
 e29:	5b                   	pop    %ebx
 e2a:	5e                   	pop    %esi
 e2b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 e2c:	e9 9f fd ff ff       	jmp    bd0 <sem_up>
 e31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 e38:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 e3a:	8b 53 18             	mov    0x18(%ebx),%edx
 e3d:	8b 43 10             	mov    0x10(%ebx),%eax
 e40:	83 ea 01             	sub    $0x1,%edx
 e43:	39 d0                	cmp    %edx,%eax
 e45:	74 09                	je     e50 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 e47:	83 c0 01             	add    $0x1,%eax
 e4a:	89 43 10             	mov    %eax,0x10(%ebx)
 e4d:	eb c7                	jmp    e16 <semaphore_put+0x46>
 e4f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 e50:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 e57:	eb bd                	jmp    e16 <semaphore_put+0x46>
 e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e60 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 e60:	55                   	push   %ebp
 e61:	89 e5                	mov    %esp,%ebp
 e63:	83 ec 18             	sub    $0x18,%esp
 e66:	89 75 fc             	mov    %esi,-0x4(%ebp)
 e69:	8b 75 08             	mov    0x8(%ebp),%esi
 e6c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 e6f:	85 f6                	test   %esi,%esi
 e71:	79 15                	jns    e88 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 e73:	31 db                	xor    %ebx,%ebx
}
 e75:	89 d8                	mov    %ebx,%eax
 e77:	8b 75 fc             	mov    -0x4(%ebp),%esi
 e7a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 e7d:	89 ec                	mov    %ebp,%esp
 e7f:	5d                   	pop    %ebp
 e80:	c3                   	ret    
 e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 e88:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 e8f:	e8 2c fb ff ff       	call   9c0 <malloc>
 e94:	85 c0                	test   %eax,%eax
 e96:	89 c3                	mov    %eax,%ebx
 e98:	74 db                	je     e75 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 e9a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 ea1:	89 04 24             	mov    %eax,(%esp)
 ea4:	e8 17 fb ff ff       	call   9c0 <malloc>
 ea9:	85 c0                	test   %eax,%eax
 eab:	89 43 0c             	mov    %eax,0xc(%ebx)
 eae:	74 c3                	je     e73 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 eb0:	89 34 24             	mov    %esi,(%esp)
 eb3:	e8 78 fd ff ff       	call   c30 <semaphore_create>
 eb8:	85 c0                	test   %eax,%eax
 eba:	89 43 04             	mov    %eax,0x4(%ebx)
 ebd:	74 b4                	je     e73 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 ebf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 ec6:	e8 65 fd ff ff       	call   c30 <semaphore_create>
 ecb:	85 c0                	test   %eax,%eax
 ecd:	89 43 08             	mov    %eax,0x8(%ebx)
 ed0:	74 a1                	je     e73 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 ed2:	e8 79 f7 ff ff       	call   650 <binary_sem_create>
	ret->produce = 0;
 ed7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 ede:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 ee5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 ee8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 eea:	eb 89                	jmp    e75 <BB_create+0x15>
