
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  18:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1c:	89 3c 24             	mov    %edi,(%esp)
  1f:	e8 3c 00 00 00       	call   60 <matchhere>
  24:	85 c0                	test   %eax,%eax
  26:	75 20                	jne    48 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  28:	0f b6 03             	movzbl (%ebx),%eax
  2b:	84 c0                	test   %al,%al
  2d:	74 0f                	je     3e <matchstar+0x3e>
  2f:	0f be c0             	movsbl %al,%eax
  32:	83 c3 01             	add    $0x1,%ebx
  35:	39 f0                	cmp    %esi,%eax
  37:	74 df                	je     18 <matchstar+0x18>
  39:	83 fe 2e             	cmp    $0x2e,%esi
  3c:	74 da                	je     18 <matchstar+0x18>
  return 0;
}
  3e:	83 c4 1c             	add    $0x1c,%esp
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  41:	31 c0                	xor    %eax,%eax
  return 0;
}
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    
  48:	83 c4 1c             	add    $0x1c,%esp

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  4b:	b8 01 00 00 00       	mov    $0x1,%eax
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5f                   	pop    %edi
  53:	5d                   	pop    %ebp
  54:	c3                   	ret    
  55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000060 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	83 ec 10             	sub    $0x10,%esp
  68:	8b 55 08             	mov    0x8(%ebp),%edx
  6b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
  6e:	0f b6 02             	movzbl (%edx),%eax
  71:	84 c0                	test   %al,%al
  73:	75 1c                	jne    91 <matchhere+0x31>
  75:	eb 51                	jmp    c8 <matchhere+0x68>
  77:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  78:	0f b6 19             	movzbl (%ecx),%ebx
  7b:	84 db                	test   %bl,%bl
  7d:	74 39                	je     b8 <matchhere+0x58>
  7f:	3c 2e                	cmp    $0x2e,%al
  81:	74 04                	je     87 <matchhere+0x27>
  83:	38 d8                	cmp    %bl,%al
  85:	75 31                	jne    b8 <matchhere+0x58>
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  87:	0f b6 02             	movzbl (%edx),%eax
  8a:	84 c0                	test   %al,%al
  8c:	74 3a                	je     c8 <matchhere+0x68>
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  8e:	83 c1 01             	add    $0x1,%ecx
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
  91:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  95:	8d 72 01             	lea    0x1(%edx),%esi
  98:	80 fb 2a             	cmp    $0x2a,%bl
  9b:	74 3b                	je     d8 <matchhere+0x78>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
  9d:	3c 24                	cmp    $0x24,%al
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  9f:	89 f2                	mov    %esi,%edx
  if(re[0] == '$' && re[1] == '\0')
  a1:	75 d5                	jne    78 <matchhere+0x18>
  a3:	84 db                	test   %bl,%bl
  a5:	75 d1                	jne    78 <matchhere+0x18>
    return *text == '\0';
  a7:	31 c0                	xor    %eax,%eax
  a9:	80 39 00             	cmpb   $0x0,(%ecx)
  ac:	0f 94 c0             	sete   %al
  af:	eb 09                	jmp    ba <matchhere+0x5a>
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  b8:	31 c0                	xor    %eax,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	5b                   	pop    %ebx
  be:	5e                   	pop    %esi
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    
  c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  c8:	83 c4 10             	add    $0x10,%esp
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  cb:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  d0:	5b                   	pop    %ebx
  d1:	5e                   	pop    %esi
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  d8:	83 c2 02             	add    $0x2,%edx
  db:	0f be c0             	movsbl %al,%eax
  de:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  e2:	89 54 24 04          	mov    %edx,0x4(%esp)
  e6:	89 04 24             	mov    %eax,(%esp)
  e9:	e8 12 ff ff ff       	call   0 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  ee:	83 c4 10             	add    $0x10,%esp
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	56                   	push   %esi
 104:	53                   	push   %ebx
 105:	83 ec 10             	sub    $0x10,%esp
 108:	8b 75 08             	mov    0x8(%ebp),%esi
 10b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 10e:	80 3e 5e             	cmpb   $0x5e,(%esi)
 111:	75 08                	jne    11b <match+0x1b>
 113:	eb 2f                	jmp    144 <match+0x44>
 115:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 118:	83 c3 01             	add    $0x1,%ebx
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 11b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 11f:	89 34 24             	mov    %esi,(%esp)
 122:	e8 39 ff ff ff       	call   60 <matchhere>
 127:	85 c0                	test   %eax,%eax
 129:	75 0d                	jne    138 <match+0x38>
      return 1;
  }while(*text++ != '\0');
 12b:	80 3b 00             	cmpb   $0x0,(%ebx)
 12e:	75 e8                	jne    118 <match+0x18>
  return 0;
}
 130:	83 c4 10             	add    $0x10,%esp
 133:	5b                   	pop    %ebx
 134:	5e                   	pop    %esi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	90                   	nop
 138:	83 c4 10             	add    $0x10,%esp
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 13b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 144:	83 c6 01             	add    $0x1,%esi
 147:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 150:	e9 0b ff ff ff       	jmp    60 <matchhere>
 155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	83 ec 2c             	sub    $0x2c,%esp
 169:	8b 7d 08             	mov    0x8(%ebp),%edi
 16c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 173:	90                   	nop
 174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 178:	b8 00 04 00 00       	mov    $0x400,%eax
 17d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 180:	89 44 24 08          	mov    %eax,0x8(%esp)
 184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 187:	05 e0 0f 00 00       	add    $0xfe0,%eax
 18c:	89 44 24 04          	mov    %eax,0x4(%esp)
 190:	8b 45 0c             	mov    0xc(%ebp),%eax
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 d5 03 00 00       	call   570 <read>
 19b:	85 c0                	test   %eax,%eax
 19d:	89 45 e0             	mov    %eax,-0x20(%ebp)
 1a0:	0f 8e ae 00 00 00    	jle    254 <grep+0xf4>
 1a6:	be e0 0f 00 00       	mov    $0xfe0,%esi
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 1b0:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 1b7:	00 
 1b8:	89 34 24             	mov    %esi,(%esp)
 1bb:	e8 30 02 00 00       	call   3f0 <strchr>
 1c0:	85 c0                	test   %eax,%eax
 1c2:	89 c3                	mov    %eax,%ebx
 1c4:	74 42                	je     208 <grep+0xa8>
      *q = 0;
 1c6:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 1c9:	89 74 24 04          	mov    %esi,0x4(%esp)
 1cd:	89 3c 24             	mov    %edi,(%esp)
 1d0:	e8 2b ff ff ff       	call   100 <match>
 1d5:	85 c0                	test   %eax,%eax
 1d7:	75 07                	jne    1e0 <grep+0x80>
 1d9:	83 c3 01             	add    $0x1,%ebx
        *q = '\n';
        write(1, p, q+1 - p);
 1dc:	89 de                	mov    %ebx,%esi
 1de:	eb d0                	jmp    1b0 <grep+0x50>
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
      if(match(pattern, p)){
        *q = '\n';
 1e0:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 1e3:	83 c3 01             	add    $0x1,%ebx
 1e6:	89 d8                	mov    %ebx,%eax
 1e8:	29 f0                	sub    %esi,%eax
 1ea:	89 74 24 04          	mov    %esi,0x4(%esp)
 1ee:	89 de                	mov    %ebx,%esi
 1f0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fb:	e8 78 03 00 00       	call   578 <write>
 200:	eb ae                	jmp    1b0 <grep+0x50>
 202:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
 208:	81 fe e0 0f 00 00    	cmp    $0xfe0,%esi
 20e:	74 38                	je     248 <grep+0xe8>
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
 210:	8b 45 e0             	mov    -0x20(%ebp),%eax
 213:	01 45 e4             	add    %eax,-0x1c(%ebp)
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
 216:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 219:	85 c0                	test   %eax,%eax
 21b:	0f 8e 57 ff ff ff    	jle    178 <grep+0x18>
      m -= p - buf;
 221:	81 45 e4 e0 0f 00 00 	addl   $0xfe0,-0x1c(%ebp)
 228:	29 75 e4             	sub    %esi,-0x1c(%ebp)
      memmove(buf, p, m);
 22b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 22e:	89 74 24 04          	mov    %esi,0x4(%esp)
 232:	c7 04 24 e0 0f 00 00 	movl   $0xfe0,(%esp)
 239:	89 44 24 08          	mov    %eax,0x8(%esp)
 23d:	e8 2e 02 00 00       	call   470 <memmove>
 242:	e9 31 ff ff ff       	jmp    178 <grep+0x18>
 247:	90                   	nop
 248:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 24f:	e9 24 ff ff ff       	jmp    178 <grep+0x18>
    }
  }
}
 254:	83 c4 2c             	add    $0x2c,%esp
 257:	5b                   	pop    %ebx
 258:	5e                   	pop    %esi
 259:	5f                   	pop    %edi
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <main>:

int
main(int argc, char *argv[])
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 e4 f0             	and    $0xfffffff0,%esp
 266:	57                   	push   %edi
 267:	56                   	push   %esi
 268:	53                   	push   %ebx
 269:	83 ec 24             	sub    $0x24,%esp
 26c:	8b 7d 08             	mov    0x8(%ebp),%edi
 26f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 272:	83 ff 01             	cmp    $0x1,%edi
 275:	0f 8e 95 00 00 00    	jle    310 <main+0xb0>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
 27b:	8b 43 04             	mov    0x4(%ebx),%eax
  
  if(argc <= 2){
 27e:	83 ff 02             	cmp    $0x2,%edi
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
 281:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  
  if(argc <= 2){
 285:	74 71                	je     2f8 <main+0x98>
    grep(pattern, 0);
    exit();
 287:	83 c3 08             	add    $0x8,%ebx
 28a:	be 02 00 00 00       	mov    $0x2,%esi
 28f:	90                   	nop
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 290:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 297:	00 
 298:	8b 03                	mov    (%ebx),%eax
 29a:	89 04 24             	mov    %eax,(%esp)
 29d:	e8 f6 02 00 00       	call   598 <open>
 2a2:	85 c0                	test   %eax,%eax
 2a4:	78 32                	js     2d8 <main+0x78>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
 2a6:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 2aa:	83 c6 01             	add    $0x1,%esi
 2ad:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
 2b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b4:	89 44 24 18          	mov    %eax,0x18(%esp)
 2b8:	89 14 24             	mov    %edx,(%esp)
 2bb:	e8 a0 fe ff ff       	call   160 <grep>
    close(fd);
 2c0:	8b 44 24 18          	mov    0x18(%esp),%eax
 2c4:	89 04 24             	mov    %eax,(%esp)
 2c7:	e8 b4 02 00 00       	call   580 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 2cc:	39 f7                	cmp    %esi,%edi
 2ce:	7f c0                	jg     290 <main+0x30>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 2d0:	e8 83 02 00 00       	call   558 <exit>
 2d5:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
 2d8:	8b 03                	mov    (%ebx),%eax
 2da:	c7 44 24 04 dc 0e 00 	movl   $0xedc,0x4(%esp)
 2e1:	00 
 2e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ed:	e8 fe 03 00 00       	call   6f0 <printf>
      exit();
 2f2:	e8 61 02 00 00       	call   558 <exit>
 2f7:	90                   	nop
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
    grep(pattern, 0);
 2f8:	89 04 24             	mov    %eax,(%esp)
 2fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 302:	00 
 303:	e8 58 fe ff ff       	call   160 <grep>
    exit();
 308:	e8 4b 02 00 00       	call   558 <exit>
 30d:	8d 76 00             	lea    0x0(%esi),%esi
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
 310:	c7 44 24 04 bc 0e 00 	movl   $0xebc,0x4(%esp)
 317:	00 
 318:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 31f:	e8 cc 03 00 00       	call   6f0 <printf>
    exit();
 324:	e8 2f 02 00 00       	call   558 <exit>
 329:	90                   	nop
 32a:	90                   	nop
 32b:	90                   	nop
 32c:	90                   	nop
 32d:	90                   	nop
 32e:	90                   	nop
 32f:	90                   	nop

00000330 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 330:	55                   	push   %ebp
 331:	31 d2                	xor    %edx,%edx
 333:	89 e5                	mov    %esp,%ebp
 335:	8b 45 08             	mov    0x8(%ebp),%eax
 338:	53                   	push   %ebx
 339:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 340:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 344:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 347:	83 c2 01             	add    $0x1,%edx
 34a:	84 c9                	test   %cl,%cl
 34c:	75 f2                	jne    340 <strcpy+0x10>
    ;
  return os;
}
 34e:	5b                   	pop    %ebx
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    
 351:	eb 0d                	jmp    360 <strcmp>
 353:	90                   	nop
 354:	90                   	nop
 355:	90                   	nop
 356:	90                   	nop
 357:	90                   	nop
 358:	90                   	nop
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 4d 08             	mov    0x8(%ebp),%ecx
 367:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 36a:	0f b6 01             	movzbl (%ecx),%eax
 36d:	84 c0                	test   %al,%al
 36f:	75 14                	jne    385 <strcmp+0x25>
 371:	eb 25                	jmp    398 <strcmp+0x38>
 373:	90                   	nop
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 378:	83 c1 01             	add    $0x1,%ecx
 37b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	84 c0                	test   %al,%al
 383:	74 13                	je     398 <strcmp+0x38>
 385:	0f b6 1a             	movzbl (%edx),%ebx
 388:	38 d8                	cmp    %bl,%al
 38a:	74 ec                	je     378 <strcmp+0x18>
 38c:	0f b6 db             	movzbl %bl,%ebx
 38f:	0f b6 c0             	movzbl %al,%eax
 392:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 394:	5b                   	pop    %ebx
 395:	5d                   	pop    %ebp
 396:	c3                   	ret    
 397:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 398:	0f b6 1a             	movzbl (%edx),%ebx
 39b:	31 c0                	xor    %eax,%eax
 39d:	0f b6 db             	movzbl %bl,%ebx
 3a0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3a2:	5b                   	pop    %ebx
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    
 3a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <strlen>:

uint
strlen(char *s)
{
 3b0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 3b1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3b3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 3b5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ba:	80 39 00             	cmpb   $0x0,(%ecx)
 3bd:	74 0c                	je     3cb <strlen+0x1b>
 3bf:	90                   	nop
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c7:	89 d0                	mov    %edx,%eax
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 55 08             	mov    0x8(%ebp),%edx
 3d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	89 d7                	mov    %edx,%edi
 3df:	fc                   	cld    
 3e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e2:	89 d0                	mov    %edx,%eax
 3e4:	5f                   	pop    %edi
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <strchr>:

char*
strchr(const char *s, char c)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3fa:	0f b6 10             	movzbl (%eax),%edx
 3fd:	84 d2                	test   %dl,%dl
 3ff:	75 11                	jne    412 <strchr+0x22>
 401:	eb 15                	jmp    418 <strchr+0x28>
 403:	90                   	nop
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 408:	83 c0 01             	add    $0x1,%eax
 40b:	0f b6 10             	movzbl (%eax),%edx
 40e:	84 d2                	test   %dl,%dl
 410:	74 06                	je     418 <strchr+0x28>
    if(*s == c)
 412:	38 ca                	cmp    %cl,%dl
 414:	75 f2                	jne    408 <strchr+0x18>
      return (char*) s;
  return 0;
}
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 418:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
 41a:	5d                   	pop    %ebp
 41b:	90                   	nop
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 420:	c3                   	ret    
 421:	eb 0d                	jmp    430 <atoi>
 423:	90                   	nop
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 430:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 431:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 433:	89 e5                	mov    %esp,%ebp
 435:	8b 4d 08             	mov    0x8(%ebp),%ecx
 438:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 439:	0f b6 11             	movzbl (%ecx),%edx
 43c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 43f:	80 fb 09             	cmp    $0x9,%bl
 442:	77 1c                	ja     460 <atoi+0x30>
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 448:	0f be d2             	movsbl %dl,%edx
 44b:	83 c1 01             	add    $0x1,%ecx
 44e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 451:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 455:	0f b6 11             	movzbl (%ecx),%edx
 458:	8d 5a d0             	lea    -0x30(%edx),%ebx
 45b:	80 fb 09             	cmp    $0x9,%bl
 45e:	76 e8                	jbe    448 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 460:	5b                   	pop    %ebx
 461:	5d                   	pop    %ebp
 462:	c3                   	ret    
 463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000470 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	56                   	push   %esi
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	53                   	push   %ebx
 478:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 47e:	85 db                	test   %ebx,%ebx
 480:	7e 14                	jle    496 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 482:	31 d2                	xor    %edx,%edx
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 488:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 48c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 48f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 492:	39 da                	cmp    %ebx,%edx
 494:	75 f2                	jne    488 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4a9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 4af:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4bb:	00 
 4bc:	89 04 24             	mov    %eax,(%esp)
 4bf:	e8 d4 00 00 00       	call   598 <open>
  if(fd < 0)
 4c4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4c8:	78 19                	js     4e3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	89 1c 24             	mov    %ebx,(%esp)
 4d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d4:	e8 d7 00 00 00       	call   5b0 <fstat>
  close(fd);
 4d9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 4dc:	89 c6                	mov    %eax,%esi
  close(fd);
 4de:	e8 9d 00 00 00       	call   580 <close>
  return r;
}
 4e3:	89 f0                	mov    %esi,%eax
 4e5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 4e8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 4eb:	89 ec                	mov    %ebp,%esp
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    
 4ef:	90                   	nop

000004f0 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	31 f6                	xor    %esi,%esi
 4f7:	53                   	push   %ebx
 4f8:	83 ec 2c             	sub    $0x2c,%esp
 4fb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4fe:	eb 06                	jmp    506 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 500:	3c 0a                	cmp    $0xa,%al
 502:	74 39                	je     53d <gets+0x4d>
 504:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 506:	8d 5e 01             	lea    0x1(%esi),%ebx
 509:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 50c:	7d 31                	jge    53f <gets+0x4f>
    cc = read(0, &c, 1);
 50e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 511:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 518:	00 
 519:	89 44 24 04          	mov    %eax,0x4(%esp)
 51d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 524:	e8 47 00 00 00       	call   570 <read>
    if(cc < 1)
 529:	85 c0                	test   %eax,%eax
 52b:	7e 12                	jle    53f <gets+0x4f>
      break;
    buf[i++] = c;
 52d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 531:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 535:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 539:	3c 0d                	cmp    $0xd,%al
 53b:	75 c3                	jne    500 <gets+0x10>
 53d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 53f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 543:	89 f8                	mov    %edi,%eax
 545:	83 c4 2c             	add    $0x2c,%esp
 548:	5b                   	pop    %ebx
 549:	5e                   	pop    %esi
 54a:	5f                   	pop    %edi
 54b:	5d                   	pop    %ebp
 54c:	c3                   	ret    
 54d:	90                   	nop
 54e:	90                   	nop
 54f:	90                   	nop

00000550 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 550:	b8 01 00 00 00       	mov    $0x1,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <exit>:
SYSCALL(exit)
 558:	b8 02 00 00 00       	mov    $0x2,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <wait>:
SYSCALL(wait)
 560:	b8 03 00 00 00       	mov    $0x3,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <pipe>:
SYSCALL(pipe)
 568:	b8 04 00 00 00       	mov    $0x4,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <read>:
SYSCALL(read)
 570:	b8 06 00 00 00       	mov    $0x6,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <write>:
SYSCALL(write)
 578:	b8 05 00 00 00       	mov    $0x5,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <close>:
SYSCALL(close)
 580:	b8 07 00 00 00       	mov    $0x7,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <kill>:
SYSCALL(kill)
 588:	b8 08 00 00 00       	mov    $0x8,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <exec>:
SYSCALL(exec)
 590:	b8 09 00 00 00       	mov    $0x9,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <open>:
SYSCALL(open)
 598:	b8 0a 00 00 00       	mov    $0xa,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <mknod>:
SYSCALL(mknod)
 5a0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <unlink>:
SYSCALL(unlink)
 5a8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <fstat>:
SYSCALL(fstat)
 5b0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <link>:
SYSCALL(link)
 5b8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <mkdir>:
SYSCALL(mkdir)
 5c0:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <chdir>:
SYSCALL(chdir)
 5c8:	b8 10 00 00 00       	mov    $0x10,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <dup>:
SYSCALL(dup)
 5d0:	b8 11 00 00 00       	mov    $0x11,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <getpid>:
SYSCALL(getpid)
 5d8:	b8 12 00 00 00       	mov    $0x12,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <sbrk>:
SYSCALL(sbrk)
 5e0:	b8 13 00 00 00       	mov    $0x13,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <sleep>:
SYSCALL(sleep)
 5e8:	b8 14 00 00 00       	mov    $0x14,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <uptime>:
SYSCALL(uptime)
 5f0:	b8 15 00 00 00       	mov    $0x15,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <thread_create>:
SYSCALL(thread_create)
 5f8:	b8 16 00 00 00       	mov    $0x16,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <thread_getid>:
SYSCALL(thread_getid)
 600:	b8 17 00 00 00       	mov    $0x17,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <thread_getProcid>:
SYSCALL(thread_getProcid)
 608:	b8 18 00 00 00       	mov    $0x18,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <thread_exit>:
SYSCALL(thread_exit)
 610:	b8 1a 00 00 00       	mov    $0x1a,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <thread_join>:
SYSCALL(thread_join)
 618:	b8 19 00 00 00       	mov    $0x19,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <binary_sem_create>:
SYSCALL(binary_sem_create)
 620:	b8 1b 00 00 00       	mov    $0x1b,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <binary_sem_down>:
SYSCALL(binary_sem_down)
 628:	b8 1c 00 00 00       	mov    $0x1c,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <binary_sem_up>:
SYSCALL(binary_sem_up)
 630:	b8 1d 00 00 00       	mov    $0x1d,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
 638:	b8 1e 00 00 00       	mov    $0x1e,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <exit_all_threads>:
 640:	b8 1f 00 00 00       	mov    $0x1f,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    
 648:	90                   	nop
 649:	90                   	nop
 64a:	90                   	nop
 64b:	90                   	nop
 64c:	90                   	nop
 64d:	90                   	nop
 64e:	90                   	nop
 64f:	90                   	nop

00000650 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	89 cf                	mov    %ecx,%edi
 656:	56                   	push   %esi
 657:	89 c6                	mov    %eax,%esi
 659:	53                   	push   %ebx
 65a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
 65d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 660:	85 c9                	test   %ecx,%ecx
 662:	74 04                	je     668 <printint+0x18>
 664:	85 d2                	test   %edx,%edx
 666:	78 70                	js     6d8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
 668:	89 d0                	mov    %edx,%eax
 66a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 671:	31 c9                	xor    %ecx,%ecx
 673:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 676:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
 678:	31 d2                	xor    %edx,%edx
 67a:	f7 f7                	div    %edi
 67c:	0f b6 92 f9 0e 00 00 	movzbl 0xef9(%edx),%edx
 683:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 686:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
 689:	85 c0                	test   %eax,%eax
 68b:	75 eb                	jne    678 <printint+0x28>
	if(neg)
 68d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 690:	85 c0                	test   %eax,%eax
 692:	74 08                	je     69c <printint+0x4c>
		buf[i++] = '-';
 694:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 699:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
 69c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 69f:	01 fb                	add    %edi,%ebx
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	0f b6 03             	movzbl (%ebx),%eax
 6ab:	83 ef 01             	sub    $0x1,%edi
 6ae:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b8:	00 
 6b9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 6bc:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 6bf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c6:	e8 ad fe ff ff       	call   578 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
 6cb:	83 ff ff             	cmp    $0xffffffff,%edi
 6ce:	75 d8                	jne    6a8 <printint+0x58>
		putc(fd, buf[i]);
}
 6d0:	83 c4 4c             	add    $0x4c,%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
 6d8:	89 d0                	mov    %edx,%eax
 6da:	f7 d8                	neg    %eax
 6dc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 6e3:	eb 8c                	jmp    671 <printint+0x21>
 6e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 6f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fc:	0f b6 10             	movzbl (%eax),%edx
 6ff:	84 d2                	test   %dl,%dl
 701:	0f 84 c9 00 00 00    	je     7d0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
 707:	8d 4d 10             	lea    0x10(%ebp),%ecx
 70a:	31 ff                	xor    %edi,%edi
 70c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 70f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 711:	8d 75 e7             	lea    -0x19(%ebp),%esi
 714:	eb 1e                	jmp    734 <printf+0x44>
 716:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 718:	83 fa 25             	cmp    $0x25,%edx
 71b:	0f 85 b7 00 00 00    	jne    7d8 <printf+0xe8>
 721:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 725:	83 c3 01             	add    $0x1,%ebx
 728:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 72c:	84 d2                	test   %dl,%dl
 72e:	0f 84 9c 00 00 00    	je     7d0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
 734:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
 736:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
 739:	74 dd                	je     718 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
 73b:	83 ff 25             	cmp    $0x25,%edi
 73e:	75 e5                	jne    725 <printf+0x35>
			if(c == 'd'){
 740:	83 fa 64             	cmp    $0x64,%edx
 743:	0f 84 57 01 00 00    	je     8a0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
 749:	83 fa 70             	cmp    $0x70,%edx
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 750:	0f 84 aa 00 00 00    	je     800 <printf+0x110>
 756:	83 fa 78             	cmp    $0x78,%edx
 759:	0f 84 a1 00 00 00    	je     800 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
 75f:	83 fa 73             	cmp    $0x73,%edx
 762:	0f 84 c0 00 00 00    	je     828 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 768:	83 fa 63             	cmp    $0x63,%edx
 76b:	90                   	nop
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 770:	0f 84 52 01 00 00    	je     8c8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 776:	83 fa 25             	cmp    $0x25,%edx
 779:	0f 84 f9 00 00 00    	je     878 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 77f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 782:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 785:	31 ff                	xor    %edi,%edi
 787:	89 55 cc             	mov    %edx,-0x34(%ebp)
 78a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 78e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 795:	00 
 796:	89 0c 24             	mov    %ecx,(%esp)
 799:	89 74 24 04          	mov    %esi,0x4(%esp)
 79d:	e8 d6 fd ff ff       	call   578 <write>
 7a2:	8b 55 cc             	mov    -0x34(%ebp),%edx
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7af:	00 
 7b0:	89 74 24 04          	mov    %esi,0x4(%esp)
 7b4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 b9 fd ff ff       	call   578 <write>
 7bf:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
 7c2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 7c6:	84 d2                	test   %dl,%dl
 7c8:	0f 85 66 ff ff ff    	jne    734 <printf+0x44>
 7ce:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
 7d0:	83 c4 3c             	add    $0x3c,%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
 7db:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 7de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7e5:	00 
 7e6:	89 74 24 04          	mov    %esi,0x4(%esp)
 7ea:	89 04 24             	mov    %eax,(%esp)
 7ed:	e8 86 fd ff ff       	call   578 <write>
 7f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f5:	e9 2b ff ff ff       	jmp    725 <printf+0x35>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 800:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 803:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
 808:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
 80a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 811:	8b 10                	mov    (%eax),%edx
 813:	8b 45 08             	mov    0x8(%ebp),%eax
 816:	e8 35 fe ff ff       	call   650 <printint>
 81b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 81e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 822:	e9 fe fe ff ff       	jmp    725 <printf+0x35>
 827:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
 828:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 82b:	8b 3a                	mov    (%edx),%edi
				ap++;
 82d:	83 c2 04             	add    $0x4,%edx
 830:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
 833:	85 ff                	test   %edi,%edi
 835:	0f 84 ba 00 00 00    	je     8f5 <printf+0x205>
					s = "(null)";
				while(*s != 0){
 83b:	0f b6 17             	movzbl (%edi),%edx
 83e:	84 d2                	test   %dl,%dl
 840:	74 2d                	je     86f <printf+0x17f>
 842:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 845:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
 848:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 84b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 84e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 855:	00 
 856:	89 74 24 04          	mov    %esi,0x4(%esp)
 85a:	89 1c 24             	mov    %ebx,(%esp)
 85d:	e8 16 fd ff ff       	call   578 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
 862:	0f b6 17             	movzbl (%edi),%edx
 865:	84 d2                	test   %dl,%dl
 867:	75 df                	jne    848 <printf+0x158>
 869:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 86c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 86f:	31 ff                	xor    %edi,%edi
 871:	e9 af fe ff ff       	jmp    725 <printf+0x35>
 876:	66 90                	xchg   %ax,%ax
 878:	8b 55 08             	mov    0x8(%ebp),%edx
 87b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
 87d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 881:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 888:	00 
 889:	89 74 24 04          	mov    %esi,0x4(%esp)
 88d:	89 14 24             	mov    %edx,(%esp)
 890:	e8 e3 fc ff ff       	call   578 <write>
 895:	8b 45 0c             	mov    0xc(%ebp),%eax
 898:	e9 88 fe ff ff       	jmp    725 <printf+0x35>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 8a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
 8a8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
 8ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8b2:	8b 10                	mov    (%eax),%edx
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	e8 94 fd ff ff       	call   650 <printint>
 8bc:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
 8bf:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8c3:	e9 5d fe ff ff       	jmp    725 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 8c8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
 8cb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 8cd:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8cf:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8d6:	00 
 8d7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
 8db:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	89 04 24             	mov    %eax,(%esp)
 8e4:	e8 8f fc ff ff       	call   578 <write>
 8e9:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
 8ec:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8f0:	e9 30 fe ff ff       	jmp    725 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
 8f5:	bf f2 0e 00 00       	mov    $0xef2,%edi
 8fa:	e9 3c ff ff ff       	jmp    83b <printf+0x14b>
 8ff:	90                   	nop

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 c8 0f 00 00       	mov    0xfc8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
 90e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 911:	39 c8                	cmp    %ecx,%eax
 913:	73 1d                	jae    932 <free+0x32>
 915:	8d 76 00             	lea    0x0(%esi),%esi
 918:	8b 10                	mov    (%eax),%edx
 91a:	39 d1                	cmp    %edx,%ecx
 91c:	72 1a                	jb     938 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 91e:	39 d0                	cmp    %edx,%eax
 920:	72 08                	jb     92a <free+0x2a>
 922:	39 c8                	cmp    %ecx,%eax
 924:	72 12                	jb     938 <free+0x38>
 926:	39 d1                	cmp    %edx,%ecx
 928:	72 0e                	jb     938 <free+0x38>
 92a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92c:	39 c8                	cmp    %ecx,%eax
 92e:	66 90                	xchg   %ax,%ax
 930:	72 e6                	jb     918 <free+0x18>
 932:	8b 10                	mov    (%eax),%edx
 934:	eb e8                	jmp    91e <free+0x1e>
 936:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 938:	8b 71 04             	mov    0x4(%ecx),%esi
 93b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 93e:	39 d7                	cmp    %edx,%edi
 940:	74 19                	je     95b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 942:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 945:	8b 50 04             	mov    0x4(%eax),%edx
 948:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 94b:	39 ce                	cmp    %ecx,%esi
 94d:	74 23                	je     972 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 94f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 951:	a3 c8 0f 00 00       	mov    %eax,0xfc8
}
 956:	5b                   	pop    %ebx
 957:	5e                   	pop    %esi
 958:	5f                   	pop    %edi
 959:	5d                   	pop    %ebp
 95a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 95b:	03 72 04             	add    0x4(%edx),%esi
 95e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 961:	8b 10                	mov    (%eax),%edx
 963:	8b 12                	mov    (%edx),%edx
 965:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 968:	8b 50 04             	mov    0x4(%eax),%edx
 96b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 96e:	39 ce                	cmp    %ecx,%esi
 970:	75 dd                	jne    94f <free+0x4f>
    p->s.size += bp->s.size;
 972:	03 51 04             	add    0x4(%ecx),%edx
 975:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 978:	8b 53 f8             	mov    -0x8(%ebx),%edx
 97b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 97d:	a3 c8 0f 00 00       	mov    %eax,0xfc8
}
 982:	5b                   	pop    %ebx
 983:	5e                   	pop    %esi
 984:	5f                   	pop    %edi
 985:	5d                   	pop    %ebp
 986:	c3                   	ret    
 987:	89 f6                	mov    %esi,%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 999:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 99c:	8b 0d c8 0f 00 00    	mov    0xfc8,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	83 c3 07             	add    $0x7,%ebx
 9a5:	c1 eb 03             	shr    $0x3,%ebx
 9a8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9ab:	85 c9                	test   %ecx,%ecx
 9ad:	0f 84 93 00 00 00    	je     a46 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 9b5:	8b 50 04             	mov    0x4(%eax),%edx
 9b8:	39 d3                	cmp    %edx,%ebx
 9ba:	76 1f                	jbe    9db <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
 9bc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9c3:	90                   	nop
 9c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
 9c8:	3b 05 c8 0f 00 00    	cmp    0xfc8,%eax
 9ce:	74 30                	je     a00 <malloc+0x70>
 9d0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 9d4:	8b 50 04             	mov    0x4(%eax),%edx
 9d7:	39 d3                	cmp    %edx,%ebx
 9d9:	77 ed                	ja     9c8 <malloc+0x38>
      if(p->s.size == nunits)
 9db:	39 d3                	cmp    %edx,%ebx
 9dd:	74 61                	je     a40 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9df:	29 da                	sub    %ebx,%edx
 9e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9e4:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9e7:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9ea:	89 0d c8 0f 00 00    	mov    %ecx,0xfc8
      return (void*) (p + 1);
 9f0:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f3:	83 c4 1c             	add    $0x1c,%esp
 9f6:	5b                   	pop    %ebx
 9f7:	5e                   	pop    %esi
 9f8:	5f                   	pop    %edi
 9f9:	5d                   	pop    %ebp
 9fa:	c3                   	ret    
 9fb:	90                   	nop
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 a00:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
 a06:	b8 00 80 00 00       	mov    $0x8000,%eax
 a0b:	bf 00 10 00 00       	mov    $0x1000,%edi
 a10:	76 04                	jbe    a16 <malloc+0x86>
 a12:	89 f0                	mov    %esi,%eax
 a14:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 a16:	89 04 24             	mov    %eax,(%esp)
 a19:	e8 c2 fb ff ff       	call   5e0 <sbrk>
  if(p == (char*) -1)
 a1e:	83 f8 ff             	cmp    $0xffffffff,%eax
 a21:	74 18                	je     a3b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a23:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 a26:	83 c0 08             	add    $0x8,%eax
 a29:	89 04 24             	mov    %eax,(%esp)
 a2c:	e8 cf fe ff ff       	call   900 <free>
  return freep;
 a31:	8b 0d c8 0f 00 00    	mov    0xfc8,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 a37:	85 c9                	test   %ecx,%ecx
 a39:	75 97                	jne    9d2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a3b:	31 c0                	xor    %eax,%eax
 a3d:	eb b4                	jmp    9f3 <malloc+0x63>
 a3f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 a40:	8b 10                	mov    (%eax),%edx
 a42:	89 11                	mov    %edx,(%ecx)
 a44:	eb a4                	jmp    9ea <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a46:	c7 05 c8 0f 00 00 c0 	movl   $0xfc0,0xfc8
 a4d:	0f 00 00 
    base.s.size = 0;
 a50:	b9 c0 0f 00 00       	mov    $0xfc0,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a55:	c7 05 c0 0f 00 00 c0 	movl   $0xfc0,0xfc0
 a5c:	0f 00 00 
    base.s.size = 0;
 a5f:	c7 05 c4 0f 00 00 00 	movl   $0x0,0xfc4
 a66:	00 00 00 
 a69:	e9 45 ff ff ff       	jmp    9b3 <malloc+0x23>
 a6e:	90                   	nop
 a6f:	90                   	nop

00000a70 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	53                   	push   %ebx
 a74:	83 ec 14             	sub    $0x14,%esp
 a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
 a7a:	8b 03                	mov    (%ebx),%eax
 a7c:	89 04 24             	mov    %eax,(%esp)
 a7f:	e8 b4 fb ff ff       	call   638 <binary_sem_clear>
	binary_sem_clear(sem->S2);
 a84:	8b 43 04             	mov    0x4(%ebx),%eax
 a87:	89 04 24             	mov    %eax,(%esp)
 a8a:	e8 a9 fb ff ff       	call   638 <binary_sem_clear>
	free(sem);
 a8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 a92:	83 c4 14             	add    $0x14,%esp
 a95:	5b                   	pop    %ebx
 a96:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
 a97:	e9 64 fe ff ff       	jmp    900 <free>
 a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	83 ec 18             	sub    $0x18,%esp
 aa6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 aa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 aac:	89 75 fc             	mov    %esi,-0x4(%ebp)
 aaf:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
 ab2:	8b 43 04             	mov    0x4(%ebx),%eax
 ab5:	89 04 24             	mov    %eax,(%esp)
 ab8:	e8 6b fb ff ff       	call   628 <binary_sem_down>
	binary_sem_down(sem->S1);
 abd:	8b 03                	mov    (%ebx),%eax
 abf:	89 04 24             	mov    %eax,(%esp)
 ac2:	e8 61 fb ff ff       	call   628 <binary_sem_down>
	sem->value -= num;
 ac7:	8b 43 08             	mov    0x8(%ebx),%eax
 aca:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
 acc:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
 ace:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 ad1:	74 0b                	je     ade <sem_downs+0x3e>
		binary_sem_up(sem->S2);
 ad3:	8b 43 04             	mov    0x4(%ebx),%eax
 ad6:	89 04 24             	mov    %eax,(%esp)
 ad9:	e8 52 fb ff ff       	call   630 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 ade:	8b 03                	mov    (%ebx),%eax
}
 ae0:	8b 75 fc             	mov    -0x4(%ebp),%esi
 ae3:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 ae6:	89 45 08             	mov    %eax,0x8(%ebp)
}
 ae9:	89 ec                	mov    %ebp,%esp
 aeb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 aec:	e9 3f fb ff ff       	jmp    630 <binary_sem_up>
 af1:	eb 0d                	jmp    b00 <sem_down>
 af3:	90                   	nop
 af4:	90                   	nop
 af5:	90                   	nop
 af6:	90                   	nop
 af7:	90                   	nop
 af8:	90                   	nop
 af9:	90                   	nop
 afa:	90                   	nop
 afb:	90                   	nop
 afc:	90                   	nop
 afd:	90                   	nop
 afe:	90                   	nop
 aff:	90                   	nop

00000b00 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	53                   	push   %ebx
 b04:	83 ec 14             	sub    $0x14,%esp
 b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
 b0a:	8b 43 04             	mov    0x4(%ebx),%eax
 b0d:	89 04 24             	mov    %eax,(%esp)
 b10:	e8 13 fb ff ff       	call   628 <binary_sem_down>
	binary_sem_down(sem->S1);
 b15:	8b 03                	mov    (%ebx),%eax
 b17:	89 04 24             	mov    %eax,(%esp)
 b1a:	e8 09 fb ff ff       	call   628 <binary_sem_down>
	sem->value--;
 b1f:	8b 43 08             	mov    0x8(%ebx),%eax
 b22:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
 b25:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
 b27:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
 b2a:	74 0b                	je     b37 <sem_down+0x37>
		binary_sem_up(sem->S2);
 b2c:	8b 43 04             	mov    0x4(%ebx),%eax
 b2f:	89 04 24             	mov    %eax,(%esp)
 b32:	e8 f9 fa ff ff       	call   630 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 b37:	8b 03                	mov    (%ebx),%eax
 b39:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b3c:	83 c4 14             	add    $0x14,%esp
 b3f:	5b                   	pop    %ebx
 b40:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b41:	e9 ea fa ff ff       	jmp    630 <binary_sem_up>
 b46:	8d 76 00             	lea    0x0(%esi),%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	83 ec 18             	sub    $0x18,%esp
 b56:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 b59:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b5c:	89 75 fc             	mov    %esi,-0x4(%ebp)
 b5f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
 b62:	8b 03                	mov    (%ebx),%eax
 b64:	89 04 24             	mov    %eax,(%esp)
 b67:	e8 bc fa ff ff       	call   628 <binary_sem_down>
	sem->value+= num;
 b6c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
 b6f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
 b72:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
 b75:	74 19                	je     b90 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b77:	8b 03                	mov    (%ebx),%eax
}
 b79:	8b 75 fc             	mov    -0x4(%ebp),%esi
 b7c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b7f:	89 45 08             	mov    %eax,0x8(%ebp)
}
 b82:	89 ec                	mov    %ebp,%esp
 b84:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 b85:	e9 a6 fa ff ff       	jmp    630 <binary_sem_up>
 b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 b90:	8b 43 04             	mov    0x4(%ebx),%eax
 b93:	89 04 24             	mov    %eax,(%esp)
 b96:	e8 95 fa ff ff       	call   630 <binary_sem_up>
 b9b:	eb da                	jmp    b77 <sem_ups+0x27>
 b9d:	8d 76 00             	lea    0x0(%esi),%esi

00000ba0 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	53                   	push   %ebx
 ba4:	83 ec 14             	sub    $0x14,%esp
 ba7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
 baa:	8b 03                	mov    (%ebx),%eax
 bac:	89 04 24             	mov    %eax,(%esp)
 baf:	e8 74 fa ff ff       	call   628 <binary_sem_down>
	sem->value++;
 bb4:	8b 43 08             	mov    0x8(%ebx),%eax
 bb7:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
 bba:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
 bbd:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
 bc0:	74 16                	je     bd8 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bc2:	8b 03                	mov    (%ebx),%eax
 bc4:	89 45 08             	mov    %eax,0x8(%ebp)
}
 bc7:	83 c4 14             	add    $0x14,%esp
 bca:	5b                   	pop    %ebx
 bcb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bcc:	e9 5f fa ff ff       	jmp    630 <binary_sem_up>
 bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
 bd8:	8b 43 04             	mov    0x4(%ebx),%eax
 bdb:	89 04 24             	mov    %eax,(%esp)
 bde:	e8 4d fa ff ff       	call   630 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
 be3:	8b 03                	mov    (%ebx),%eax
 be5:	89 45 08             	mov    %eax,0x8(%ebp)
}
 be8:	83 c4 14             	add    $0x14,%esp
 beb:	5b                   	pop    %ebx
 bec:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
 bed:	e9 3e fa ff ff       	jmp    630 <binary_sem_up>
 bf2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c00 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 c00:	55                   	push   %ebp
 c01:	89 e5                	mov    %esp,%ebp
 c03:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c06:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
 c0d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
 c10:	89 75 f8             	mov    %esi,-0x8(%ebp)
 c13:	89 7d fc             	mov    %edi,-0x4(%ebp)
 c16:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c19:	e8 72 fd ff ff       	call   990 <malloc>
	ret->value = initial_semaphore_value;
 c1e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
 c21:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
 c23:	e8 f8 f9 ff ff       	call   620 <binary_sem_create>
 c28:	89 03                	mov    %eax,(%ebx)
 c2a:	89 c6                	mov    %eax,%esi
 c2c:	e8 ef f9 ff ff       	call   620 <binary_sem_create>
 c31:	01 c6                	add    %eax,%esi
 c33:	89 43 04             	mov    %eax,0x4(%ebx)
 c36:	78 20                	js     c58 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
 c38:	85 ff                	test   %edi,%edi
 c3a:	75 08                	jne    c44 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
 c3c:	89 04 24             	mov    %eax,(%esp)
 c3f:	e8 e4 f9 ff ff       	call   628 <binary_sem_down>
	}
	return ret;
}
 c44:	89 d8                	mov    %ebx,%eax
 c46:	8b 75 f8             	mov    -0x8(%ebp),%esi
 c49:	8b 5d f4             	mov    -0xc(%ebp),%ebx
 c4c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 c4f:	89 ec                	mov    %ebp,%esp
 c51:	5d                   	pop    %ebp
 c52:	c3                   	ret    
 c53:	90                   	nop
 c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
 c58:	c7 44 24 04 0c 0f 00 	movl   $0xf0c,0x4(%esp)
 c5f:	00 
 c60:	31 db                	xor    %ebx,%ebx
 c62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 c69:	e8 82 fa ff ff       	call   6f0 <printf>
		return 0;
 c6e:	eb d4                	jmp    c44 <semaphore_create+0x44>

00000c70 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
 c70:	55                   	push   %ebp
 c71:	89 e5                	mov    %esp,%ebp
 c73:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
 c76:	8b 45 08             	mov    0x8(%ebp),%eax
 c79:	8b 00                	mov    (%eax),%eax
 c7b:	89 45 08             	mov    %eax,0x8(%ebp)
}
 c7e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
 c7f:	e9 ac f9 ff ff       	jmp    630 <binary_sem_up>
 c84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 c8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c90 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
 c90:	55                   	push   %ebp
 c91:	89 e5                	mov    %esp,%ebp
 c93:	56                   	push   %esi
 c94:	53                   	push   %ebx
 c95:	83 ec 10             	sub    $0x10,%esp
 c98:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
 c9b:	8b 43 08             	mov    0x8(%ebx),%eax
 c9e:	89 04 24             	mov    %eax,(%esp)
 ca1:	e8 5a fe ff ff       	call   b00 <sem_down>
	binary_sem_down(bb->mutex);
 ca6:	8b 03                	mov    (%ebx),%eax
 ca8:	89 04 24             	mov    %eax,(%esp)
 cab:	e8 78 f9 ff ff       	call   628 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
 cb0:	8b 43 14             	mov    0x14(%ebx),%eax
 cb3:	c1 e0 02             	shl    $0x2,%eax
 cb6:	03 43 0c             	add    0xc(%ebx),%eax
 cb9:	8b 30                	mov    (%eax),%esi
 cbb:	85 f6                	test   %esi,%esi
 cbd:	74 42                	je     d01 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
 cbf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
 cc5:	8b 53 18             	mov    0x18(%ebx),%edx
 cc8:	8b 43 14             	mov    0x14(%ebx),%eax
 ccb:	83 ea 01             	sub    $0x1,%edx
 cce:	39 d0                	cmp    %edx,%eax
 cd0:	74 26                	je     cf8 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
 cd2:	83 c0 01             	add    $0x1,%eax
 cd5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
 cd8:	8b 03                	mov    (%ebx),%eax
 cda:	89 04 24             	mov    %eax,(%esp)
 cdd:	e8 4e f9 ff ff       	call   630 <binary_sem_up>
	sem_up(bb->empty);
 ce2:	8b 43 04             	mov    0x4(%ebx),%eax
 ce5:	89 04 24             	mov    %eax,(%esp)
 ce8:	e8 b3 fe ff ff       	call   ba0 <sem_up>
	return element;
}
 ced:	83 c4 10             	add    $0x10,%esp
 cf0:	89 f0                	mov    %esi,%eax
 cf2:	5b                   	pop    %ebx
 cf3:	5e                   	pop    %esi
 cf4:	5d                   	pop    %ebp
 cf5:	c3                   	ret    
 cf6:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
 cf8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
 cff:	eb d7                	jmp    cd8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
 d01:	c7 44 24 04 34 0f 00 	movl   $0xf34,0x4(%esp)
 d08:	00 
 d09:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d10:	e8 db f9 ff ff       	call   6f0 <printf>
 d15:	eb c1                	jmp    cd8 <semaphore_pop+0x48>
 d17:	89 f6                	mov    %esi,%esi
 d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d20 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
 d20:	55                   	push   %ebp
 d21:	89 e5                	mov    %esp,%ebp
 d23:	56                   	push   %esi
 d24:	53                   	push   %ebx
 d25:	83 ec 10             	sub    $0x10,%esp
 d28:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d2b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 d2e:	8b 43 04             	mov    0x4(%ebx),%eax
 d31:	89 04 24             	mov    %eax,(%esp)
 d34:	e8 c7 fd ff ff       	call   b00 <sem_down>
	binary_sem_down(bb->mutex);
 d39:	8b 03                	mov    (%ebx),%eax
 d3b:	89 04 24             	mov    %eax,(%esp)
 d3e:	e8 e5 f8 ff ff       	call   628 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 d43:	8b 43 10             	mov    0x10(%ebx),%eax
 d46:	c1 e0 02             	shl    $0x2,%eax
 d49:	03 43 0c             	add    0xc(%ebx),%eax
 d4c:	8b 10                	mov    (%eax),%edx
 d4e:	85 d2                	test   %edx,%edx
 d50:	74 26                	je     d78 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 d52:	c7 44 24 04 78 0f 00 	movl   $0xf78,0x4(%esp)
 d59:	00 
 d5a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 d61:	e8 8a f9 ff ff       	call   6f0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 d66:	8b 43 08             	mov    0x8(%ebx),%eax
 d69:	89 45 08             	mov    %eax,0x8(%ebp)
}
 d6c:	83 c4 10             	add    $0x10,%esp
 d6f:	5b                   	pop    %ebx
 d70:	5e                   	pop    %esi
 d71:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
 d72:	e9 29 fe ff ff       	jmp    ba0 <sem_up>
 d77:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 d78:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 d7a:	8b 53 18             	mov    0x18(%ebx),%edx
 d7d:	8b 43 10             	mov    0x10(%ebx),%eax
 d80:	83 ea 01             	sub    $0x1,%edx
 d83:	39 d0                	cmp    %edx,%eax
 d85:	74 09                	je     d90 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 d87:	83 c0 01             	add    $0x1,%eax
 d8a:	89 43 10             	mov    %eax,0x10(%ebx)
 d8d:	eb d7                	jmp    d66 <semaphore_put_atomic+0x46>
 d8f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 d90:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 d97:	eb cd                	jmp    d66 <semaphore_put_atomic+0x46>
 d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000da0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
 da0:	55                   	push   %ebp
 da1:	89 e5                	mov    %esp,%ebp
 da3:	56                   	push   %esi
 da4:	53                   	push   %ebx
 da5:	83 ec 10             	sub    $0x10,%esp
 da8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 dab:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
 dae:	8b 43 04             	mov    0x4(%ebx),%eax
 db1:	89 04 24             	mov    %eax,(%esp)
 db4:	e8 47 fd ff ff       	call   b00 <sem_down>
	binary_sem_down(bb->mutex);
 db9:	8b 03                	mov    (%ebx),%eax
 dbb:	89 04 24             	mov    %eax,(%esp)
 dbe:	e8 65 f8 ff ff       	call   628 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
 dc3:	8b 43 10             	mov    0x10(%ebx),%eax
 dc6:	c1 e0 02             	shl    $0x2,%eax
 dc9:	03 43 0c             	add    0xc(%ebx),%eax
 dcc:	8b 08                	mov    (%eax),%ecx
 dce:	85 c9                	test   %ecx,%ecx
 dd0:	74 36                	je     e08 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
 dd2:	c7 44 24 04 78 0f 00 	movl   $0xf78,0x4(%esp)
 dd9:	00 
 dda:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 de1:	e8 0a f9 ff ff       	call   6f0 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
 de6:	8b 03                	mov    (%ebx),%eax
 de8:	89 04 24             	mov    %eax,(%esp)
 deb:	e8 40 f8 ff ff       	call   630 <binary_sem_up>
	sem_up(bb->full);
 df0:	8b 43 08             	mov    0x8(%ebx),%eax
 df3:	89 45 08             	mov    %eax,0x8(%ebp)
}
 df6:	83 c4 10             	add    $0x10,%esp
 df9:	5b                   	pop    %ebx
 dfa:	5e                   	pop    %esi
 dfb:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
 dfc:	e9 9f fd ff ff       	jmp    ba0 <sem_up>
 e01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
 e08:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
 e0a:	8b 53 18             	mov    0x18(%ebx),%edx
 e0d:	8b 43 10             	mov    0x10(%ebx),%eax
 e10:	83 ea 01             	sub    $0x1,%edx
 e13:	39 d0                	cmp    %edx,%eax
 e15:	74 09                	je     e20 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
 e17:	83 c0 01             	add    $0x1,%eax
 e1a:	89 43 10             	mov    %eax,0x10(%ebx)
 e1d:	eb c7                	jmp    de6 <semaphore_put+0x46>
 e1f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
 e20:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
 e27:	eb bd                	jmp    de6 <semaphore_put+0x46>
 e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e30 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
 e30:	55                   	push   %ebp
 e31:	89 e5                	mov    %esp,%ebp
 e33:	83 ec 18             	sub    $0x18,%esp
 e36:	89 75 fc             	mov    %esi,-0x4(%ebp)
 e39:	8b 75 08             	mov    0x8(%ebp),%esi
 e3c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
 e3f:	85 f6                	test   %esi,%esi
 e41:	79 15                	jns    e58 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 e43:	31 db                	xor    %ebx,%ebx
}
 e45:	89 d8                	mov    %ebx,%eax
 e47:	8b 75 fc             	mov    -0x4(%ebp),%esi
 e4a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 e4d:	89 ec                	mov    %ebp,%esp
 e4f:	5d                   	pop    %ebp
 e50:	c3                   	ret    
 e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
 e58:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 e5f:	e8 2c fb ff ff       	call   990 <malloc>
 e64:	85 c0                	test   %eax,%eax
 e66:	89 c3                	mov    %eax,%ebx
 e68:	74 db                	je     e45 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
 e6a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
 e71:	89 04 24             	mov    %eax,(%esp)
 e74:	e8 17 fb ff ff       	call   990 <malloc>
 e79:	85 c0                	test   %eax,%eax
 e7b:	89 43 0c             	mov    %eax,0xc(%ebx)
 e7e:	74 c3                	je     e43 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
 e80:	89 34 24             	mov    %esi,(%esp)
 e83:	e8 78 fd ff ff       	call   c00 <semaphore_create>
 e88:	85 c0                	test   %eax,%eax
 e8a:	89 43 04             	mov    %eax,0x4(%ebx)
 e8d:	74 b4                	je     e43 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
 e8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 e96:	e8 65 fd ff ff       	call   c00 <semaphore_create>
 e9b:	85 c0                	test   %eax,%eax
 e9d:	89 43 08             	mov    %eax,0x8(%ebx)
 ea0:	74 a1                	je     e43 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
 ea2:	e8 79 f7 ff ff       	call   620 <binary_sem_create>
	ret->produce = 0;
 ea7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
 eae:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
 eb5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
 eb8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
 eba:	eb 89                	jmp    e45 <BB_create+0x15>
