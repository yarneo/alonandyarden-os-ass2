
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 14             	sub    $0x14,%esp
       7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       a:	85 db                	test   %ebx,%ebx
       c:	74 05                	je     13 <nulterminate+0x13>
    return 0;
  
  switch(cmd->type){
       e:	83 3b 05             	cmpl   $0x5,(%ebx)
      11:	76 0d                	jbe    20 <nulterminate+0x20>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      13:	89 d8                	mov    %ebx,%eax
      15:	83 c4 14             	add    $0x14,%esp
      18:	5b                   	pop    %ebx
      19:	5d                   	pop    %ebp
      1a:	c3                   	ret    
      1b:	90                   	nop
      1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
  
  switch(cmd->type){
      20:	8b 03                	mov    (%ebx),%eax
      22:	ff 24 85 2c 18 00 00 	jmp    *0x182c(,%eax,4)
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
      30:	8b 43 04             	mov    0x4(%ebx),%eax
      33:	89 04 24             	mov    %eax,(%esp)
      36:	e8 c5 ff ff ff       	call   0 <nulterminate>
    nulterminate(lcmd->right);
      3b:	8b 43 08             	mov    0x8(%ebx),%eax
      3e:	89 04 24             	mov    %eax,(%esp)
      41:	e8 ba ff ff ff       	call   0 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      46:	89 d8                	mov    %ebx,%eax
      48:	83 c4 14             	add    $0x14,%esp
      4b:	5b                   	pop    %ebx
      4c:	5d                   	pop    %ebp
      4d:	c3                   	ret    
      4e:	66 90                	xchg   %ax,%ax
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
      50:	8b 43 04             	mov    0x4(%ebx),%eax
      53:	89 04 24             	mov    %eax,(%esp)
      56:	e8 a5 ff ff ff       	call   0 <nulterminate>
    break;
  }
  return cmd;
}
      5b:	89 d8                	mov    %ebx,%eax
      5d:	83 c4 14             	add    $0x14,%esp
      60:	5b                   	pop    %ebx
      61:	5d                   	pop    %ebp
      62:	c3                   	ret    
      63:	90                   	nop
      64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
      68:	8b 43 04             	mov    0x4(%ebx),%eax
      6b:	89 04 24             	mov    %eax,(%esp)
      6e:	e8 8d ff ff ff       	call   0 <nulterminate>
    *rcmd->efile = 0;
      73:	8b 43 0c             	mov    0xc(%ebx),%eax
      76:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      79:	89 d8                	mov    %ebx,%eax
      7b:	83 c4 14             	add    $0x14,%esp
      7e:	5b                   	pop    %ebx
      7f:	5d                   	pop    %ebp
      80:	c3                   	ret    
      81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      88:	8b 43 04             	mov    0x4(%ebx),%eax
      8b:	85 c0                	test   %eax,%eax
      8d:	74 84                	je     13 <nulterminate+0x13>
      8f:	89 d8                	mov    %ebx,%eax
      91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
      98:	8b 50 2c             	mov    0x2c(%eax),%edx
      9b:	c6 02 00             	movb   $0x0,(%edx)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      9e:	8b 50 08             	mov    0x8(%eax),%edx
      a1:	83 c0 04             	add    $0x4,%eax
      a4:	85 d2                	test   %edx,%edx
      a6:	75 f0                	jne    98 <nulterminate+0x98>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      a8:	89 d8                	mov    %ebx,%eax
      aa:	83 c4 14             	add    $0x14,%esp
      ad:	5b                   	pop    %ebx
      ae:	5d                   	pop    %ebp
      af:	c3                   	ret    

000000b0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	57                   	push   %edi
      b4:	56                   	push   %esi
      b5:	53                   	push   %ebx
      b6:	83 ec 1c             	sub    $0x1c,%esp
      b9:	8b 7d 08             	mov    0x8(%ebp),%edi
      bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;
  
  s = *ps;
      bf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
      c1:	39 f3                	cmp    %esi,%ebx
      c3:	72 0a                	jb     cf <peek+0x1f>
      c5:	eb 1f                	jmp    e6 <peek+0x36>
      c7:	90                   	nop
    s++;
      c8:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
      cb:	39 de                	cmp    %ebx,%esi
      cd:	76 17                	jbe    e6 <peek+0x36>
      cf:	0f be 03             	movsbl (%ebx),%eax
      d2:	c7 04 24 dc 19 00 00 	movl   $0x19dc,(%esp)
      d9:	89 44 24 04          	mov    %eax,0x4(%esp)
      dd:	e8 2e 0c 00 00       	call   d10 <strchr>
      e2:	85 c0                	test   %eax,%eax
      e4:	75 e2                	jne    c8 <peek+0x18>
    s++;
  *ps = s;
      e6:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
      e8:	0f b6 13             	movzbl (%ebx),%edx
      eb:	31 c0                	xor    %eax,%eax
      ed:	84 d2                	test   %dl,%dl
      ef:	75 0f                	jne    100 <peek+0x50>
}
      f1:	83 c4 1c             	add    $0x1c,%esp
      f4:	5b                   	pop    %ebx
      f5:	5e                   	pop    %esi
      f6:	5f                   	pop    %edi
      f7:	5d                   	pop    %ebp
      f8:	c3                   	ret    
      f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     100:	0f be d2             	movsbl %dl,%edx
     103:	89 54 24 04          	mov    %edx,0x4(%esp)
     107:	8b 45 10             	mov    0x10(%ebp),%eax
     10a:	89 04 24             	mov    %eax,(%esp)
     10d:	e8 fe 0b 00 00       	call   d10 <strchr>
     112:	85 c0                	test   %eax,%eax
     114:	0f 95 c0             	setne  %al
}
     117:	83 c4 1c             	add    $0x1c,%esp
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     11a:	0f b6 c0             	movzbl %al,%eax
}
     11d:	5b                   	pop    %ebx
     11e:	5e                   	pop    %esi
     11f:	5f                   	pop    %edi
     120:	5d                   	pop    %ebp
     121:	c3                   	ret    
     122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	57                   	push   %edi
     134:	56                   	push   %esi
     135:	53                   	push   %ebx
     136:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;
  
  s = *ps;
     139:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     13c:	8b 75 0c             	mov    0xc(%ebp),%esi
     13f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;
  
  s = *ps;
     142:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     144:	39 f3                	cmp    %esi,%ebx
     146:	72 0f                	jb     157 <gettoken+0x27>
     148:	eb 24                	jmp    16e <gettoken+0x3e>
     14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     150:	83 c3 01             	add    $0x1,%ebx
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     153:	39 de                	cmp    %ebx,%esi
     155:	76 17                	jbe    16e <gettoken+0x3e>
     157:	0f be 03             	movsbl (%ebx),%eax
     15a:	c7 04 24 dc 19 00 00 	movl   $0x19dc,(%esp)
     161:	89 44 24 04          	mov    %eax,0x4(%esp)
     165:	e8 a6 0b 00 00       	call   d10 <strchr>
     16a:	85 c0                	test   %eax,%eax
     16c:	75 e2                	jne    150 <gettoken+0x20>
    s++;
  if(q)
     16e:	85 ff                	test   %edi,%edi
     170:	74 02                	je     174 <gettoken+0x44>
    *q = s;
     172:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     174:	0f b6 13             	movzbl (%ebx),%edx
     177:	0f be fa             	movsbl %dl,%edi
  switch(*s){
     17a:	80 fa 3c             	cmp    $0x3c,%dl
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     17d:	89 f8                	mov    %edi,%eax
  switch(*s){
     17f:	7f 4f                	jg     1d0 <gettoken+0xa0>
     181:	80 fa 3b             	cmp    $0x3b,%dl
     184:	0f 8c a6 00 00 00    	jl     230 <gettoken+0x100>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     18a:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     18d:	8b 55 14             	mov    0x14(%ebp),%edx
     190:	85 d2                	test   %edx,%edx
     192:	74 05                	je     199 <gettoken+0x69>
    *eq = s;
     194:	8b 45 14             	mov    0x14(%ebp),%eax
     197:	89 18                	mov    %ebx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     199:	39 f3                	cmp    %esi,%ebx
     19b:	72 0a                	jb     1a7 <gettoken+0x77>
     19d:	eb 1f                	jmp    1be <gettoken+0x8e>
     19f:	90                   	nop
    s++;
     1a0:	83 c3 01             	add    $0x1,%ebx
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     1a3:	39 de                	cmp    %ebx,%esi
     1a5:	76 17                	jbe    1be <gettoken+0x8e>
     1a7:	0f be 03             	movsbl (%ebx),%eax
     1aa:	c7 04 24 dc 19 00 00 	movl   $0x19dc,(%esp)
     1b1:	89 44 24 04          	mov    %eax,0x4(%esp)
     1b5:	e8 56 0b 00 00       	call   d10 <strchr>
     1ba:	85 c0                	test   %eax,%eax
     1bc:	75 e2                	jne    1a0 <gettoken+0x70>
    s++;
  *ps = s;
     1be:	8b 45 08             	mov    0x8(%ebp),%eax
     1c1:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     1c3:	83 c4 1c             	add    $0x1c,%esp
     1c6:	89 f8                	mov    %edi,%eax
     1c8:	5b                   	pop    %ebx
     1c9:	5e                   	pop    %esi
     1ca:	5f                   	pop    %edi
     1cb:	5d                   	pop    %ebp
     1cc:	c3                   	ret    
     1cd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     1d0:	80 fa 3e             	cmp    $0x3e,%dl
     1d3:	0f 84 7f 00 00 00    	je     258 <gettoken+0x128>
     1d9:	80 fa 7c             	cmp    $0x7c,%dl
     1dc:	74 ac                	je     18a <gettoken+0x5a>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     1de:	39 de                	cmp    %ebx,%esi
     1e0:	77 2f                	ja     211 <gettoken+0xe1>
     1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1e8:	eb 3b                	jmp    225 <gettoken+0xf5>
     1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1f0:	0f be 03             	movsbl (%ebx),%eax
     1f3:	c7 04 24 e2 19 00 00 	movl   $0x19e2,(%esp)
     1fa:	89 44 24 04          	mov    %eax,0x4(%esp)
     1fe:	e8 0d 0b 00 00       	call   d10 <strchr>
     203:	85 c0                	test   %eax,%eax
     205:	75 1e                	jne    225 <gettoken+0xf5>
      s++;
     207:	83 c3 01             	add    $0x1,%ebx
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     20a:	39 de                	cmp    %ebx,%esi
     20c:	76 17                	jbe    225 <gettoken+0xf5>
     20e:	0f be 03             	movsbl (%ebx),%eax
     211:	89 44 24 04          	mov    %eax,0x4(%esp)
     215:	c7 04 24 dc 19 00 00 	movl   $0x19dc,(%esp)
     21c:	e8 ef 0a 00 00       	call   d10 <strchr>
     221:	85 c0                	test   %eax,%eax
     223:	74 cb                	je     1f0 <gettoken+0xc0>
     225:	bf 61 00 00 00       	mov    $0x61,%edi
     22a:	e9 5e ff ff ff       	jmp    18d <gettoken+0x5d>
     22f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     230:	80 fa 29             	cmp    $0x29,%dl
     233:	7f a9                	jg     1de <gettoken+0xae>
     235:	80 fa 28             	cmp    $0x28,%dl
     238:	0f 8d 4c ff ff ff    	jge    18a <gettoken+0x5a>
     23e:	84 d2                	test   %dl,%dl
     240:	0f 84 47 ff ff ff    	je     18d <gettoken+0x5d>
     246:	80 fa 26             	cmp    $0x26,%dl
     249:	75 93                	jne    1de <gettoken+0xae>
     24b:	90                   	nop
     24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     250:	e9 35 ff ff ff       	jmp    18a <gettoken+0x5a>
     255:	8d 76 00             	lea    0x0(%esi),%esi
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     258:	83 c3 01             	add    $0x1,%ebx
    if(*s == '>'){
     25b:	80 3b 3e             	cmpb   $0x3e,(%ebx)
     25e:	66 90                	xchg   %ax,%ax
     260:	0f 85 27 ff ff ff    	jne    18d <gettoken+0x5d>
      ret = '+';
      s++;
     266:	83 c3 01             	add    $0x1,%ebx
     269:	bf 2b 00 00 00       	mov    $0x2b,%edi
     26e:	66 90                	xchg   %ax,%ax
     270:	e9 18 ff ff ff       	jmp    18d <gettoken+0x5d>
     275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <backcmd>:
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	53                   	push   %ebx
     284:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     287:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     28e:	e8 1d 10 00 00       	call   12b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     293:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     29a:	00 
     29b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2a2:	00 
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2a3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2a5:	89 04 24             	mov    %eax,(%esp)
     2a8:	e8 43 0a 00 00       	call   cf0 <memset>
  cmd->type = BACK;
     2ad:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     2b3:	8b 45 08             	mov    0x8(%ebp),%eax
     2b6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     2b9:	89 d8                	mov    %ebx,%eax
     2bb:	83 c4 14             	add    $0x14,%esp
     2be:	5b                   	pop    %ebx
     2bf:	5d                   	pop    %ebp
     2c0:	c3                   	ret    
     2c1:	eb 0d                	jmp    2d0 <listcmd>
     2c3:	90                   	nop
     2c4:	90                   	nop
     2c5:	90                   	nop
     2c6:	90                   	nop
     2c7:	90                   	nop
     2c8:	90                   	nop
     2c9:	90                   	nop
     2ca:	90                   	nop
     2cb:	90                   	nop
     2cc:	90                   	nop
     2cd:	90                   	nop
     2ce:	90                   	nop
     2cf:	90                   	nop

000002d0 <listcmd>:
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2d0:	55                   	push   %ebp
     2d1:	89 e5                	mov    %esp,%ebp
     2d3:	53                   	push   %ebx
     2d4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2d7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     2de:	e8 cd 0f 00 00       	call   12b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2e3:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     2ea:	00 
     2eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2f2:	00 
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2f5:	89 04 24             	mov    %eax,(%esp)
     2f8:	e8 f3 09 00 00       	call   cf0 <memset>
  cmd->type = LIST;
     2fd:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     303:	8b 45 08             	mov    0x8(%ebp),%eax
     306:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     309:	8b 45 0c             	mov    0xc(%ebp),%eax
     30c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     30f:	89 d8                	mov    %ebx,%eax
     311:	83 c4 14             	add    $0x14,%esp
     314:	5b                   	pop    %ebx
     315:	5d                   	pop    %ebp
     316:	c3                   	ret    
     317:	89 f6                	mov    %esi,%esi
     319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <pipecmd>:
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     327:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     32e:	e8 7d 0f 00 00       	call   12b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     333:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     33a:	00 
     33b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     342:	00 
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     343:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     345:	89 04 24             	mov    %eax,(%esp)
     348:	e8 a3 09 00 00       	call   cf0 <memset>
  cmd->type = PIPE;
     34d:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     353:	8b 45 08             	mov    0x8(%ebp),%eax
     356:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     359:	8b 45 0c             	mov    0xc(%ebp),%eax
     35c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     35f:	89 d8                	mov    %ebx,%eax
     361:	83 c4 14             	add    $0x14,%esp
     364:	5b                   	pop    %ebx
     365:	5d                   	pop    %ebp
     366:	c3                   	ret    
     367:	89 f6                	mov    %esi,%esi
     369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <redircmd>:
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     37e:	e8 2d 0f 00 00       	call   12b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     383:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     38a:	00 
     38b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     392:	00 
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     393:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     395:	89 04 24             	mov    %eax,(%esp)
     398:	e8 53 09 00 00       	call   cf0 <memset>
  cmd->type = REDIR;
     39d:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3a3:	8b 45 08             	mov    0x8(%ebp),%eax
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3af:	8b 45 10             	mov    0x10(%ebp),%eax
     3b2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3b5:	8b 45 14             	mov    0x14(%ebp),%eax
     3b8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3bb:	8b 45 18             	mov    0x18(%ebp),%eax
     3be:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3c1:	89 d8                	mov    %ebx,%eax
     3c3:	83 c4 14             	add    $0x14,%esp
     3c6:	5b                   	pop    %ebx
     3c7:	5d                   	pop    %ebp
     3c8:	c3                   	ret    
     3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <execcmd>:

// Constructors

struct cmd*
execcmd(void)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3de:	e8 cd 0e 00 00       	call   12b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3e3:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3ea:	00 
     3eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3f2:	00 
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f5:	89 04 24             	mov    %eax,(%esp)
     3f8:	e8 f3 08 00 00       	call   cf0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     3fd:	89 d8                	mov    %ebx,%eax
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     3ff:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     405:	83 c4 14             	add    $0x14,%esp
     408:	5b                   	pop    %ebx
     409:	5d                   	pop    %ebp
     40a:	c3                   	ret    
     40b:	90                   	nop
     40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <panic>:
  exit();
}

void
panic(char *s)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     416:	8b 45 08             	mov    0x8(%ebp),%eax
     419:	c7 44 24 04 c5 18 00 	movl   $0x18c5,0x4(%esp)
     420:	00 
     421:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     428:	89 44 24 08          	mov    %eax,0x8(%esp)
     42c:	e8 df 0b 00 00       	call   1010 <printf>
  exit();
     431:	e8 42 0a 00 00       	call   e78 <exit>
     436:	8d 76 00             	lea    0x0(%esi),%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	57                   	push   %edi
     444:	56                   	push   %esi
     445:	53                   	push   %ebx
     446:	83 ec 3c             	sub    $0x3c,%esp
     449:	8b 7d 0c             	mov    0xc(%ebp),%edi
     44c:	8b 75 10             	mov    0x10(%ebp),%esi
     44f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     450:	c7 44 24 08 79 18 00 	movl   $0x1879,0x8(%esp)
     457:	00 
     458:	89 74 24 04          	mov    %esi,0x4(%esp)
     45c:	89 3c 24             	mov    %edi,(%esp)
     45f:	e8 4c fc ff ff       	call   b0 <peek>
     464:	85 c0                	test   %eax,%eax
     466:	0f 84 a4 00 00 00    	je     510 <parseredirs+0xd0>
    tok = gettoken(ps, es, 0, 0);
     46c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     473:	00 
     474:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     47b:	00 
     47c:	89 74 24 04          	mov    %esi,0x4(%esp)
     480:	89 3c 24             	mov    %edi,(%esp)
     483:	e8 a8 fc ff ff       	call   130 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     488:	89 74 24 04          	mov    %esi,0x4(%esp)
     48c:	89 3c 24             	mov    %edi,(%esp)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     48f:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     491:	8d 45 e0             	lea    -0x20(%ebp),%eax
     494:	89 44 24 0c          	mov    %eax,0xc(%esp)
     498:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     49b:	89 44 24 08          	mov    %eax,0x8(%esp)
     49f:	e8 8c fc ff ff       	call   130 <gettoken>
     4a4:	83 f8 61             	cmp    $0x61,%eax
     4a7:	74 0c                	je     4b5 <parseredirs+0x75>
      panic("missing file for redirection");
     4a9:	c7 04 24 5c 18 00 00 	movl   $0x185c,(%esp)
     4b0:	e8 5b ff ff ff       	call   410 <panic>
    switch(tok){
     4b5:	83 fb 3c             	cmp    $0x3c,%ebx
     4b8:	74 3e                	je     4f8 <parseredirs+0xb8>
     4ba:	83 fb 3e             	cmp    $0x3e,%ebx
     4bd:	74 05                	je     4c4 <parseredirs+0x84>
     4bf:	83 fb 2b             	cmp    $0x2b,%ebx
     4c2:	75 8c                	jne    450 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     4c4:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     4cb:	00 
     4cc:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     4d3:	00 
     4d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     4d7:	89 44 24 08          	mov    %eax,0x8(%esp)
     4db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     4de:	89 44 24 04          	mov    %eax,0x4(%esp)
     4e2:	8b 45 08             	mov    0x8(%ebp),%eax
     4e5:	89 04 24             	mov    %eax,(%esp)
     4e8:	e8 83 fe ff ff       	call   370 <redircmd>
     4ed:	89 45 08             	mov    %eax,0x8(%ebp)
     4f0:	e9 5b ff ff ff       	jmp    450 <parseredirs+0x10>
     4f5:	8d 76 00             	lea    0x0(%esi),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     4f8:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     4ff:	00 
     500:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     507:	00 
     508:	eb ca                	jmp    4d4 <parseredirs+0x94>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     510:	8b 45 08             	mov    0x8(%ebp),%eax
     513:	83 c4 3c             	add    $0x3c,%esp
     516:	5b                   	pop    %ebx
     517:	5e                   	pop    %esi
     518:	5f                   	pop    %edi
     519:	5d                   	pop    %ebp
     51a:	c3                   	ret    
     51b:	90                   	nop
     51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000520 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     520:	55                   	push   %ebp
     521:	89 e5                	mov    %esp,%ebp
     523:	57                   	push   %edi
     524:	56                   	push   %esi
     525:	53                   	push   %ebx
     526:	83 ec 3c             	sub    $0x3c,%esp
     529:	8b 75 08             	mov    0x8(%ebp),%esi
     52c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     52f:	c7 44 24 08 7c 18 00 	movl   $0x187c,0x8(%esp)
     536:	00 
     537:	89 34 24             	mov    %esi,(%esp)
     53a:	89 7c 24 04          	mov    %edi,0x4(%esp)
     53e:	e8 6d fb ff ff       	call   b0 <peek>
     543:	85 c0                	test   %eax,%eax
     545:	0f 85 cd 00 00 00    	jne    618 <parseexec+0xf8>
    return parseblock(ps, es);

  ret = execcmd();
     54b:	e8 80 fe ff ff       	call   3d0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     550:	31 db                	xor    %ebx,%ebx
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     552:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     555:	89 7c 24 08          	mov    %edi,0x8(%esp)
     559:	89 74 24 04          	mov    %esi,0x4(%esp)
     55d:	89 04 24             	mov    %eax,(%esp)
     560:	e8 db fe ff ff       	call   440 <parseredirs>
     565:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     568:	eb 1c                	jmp    586 <parseexec+0x66>
     56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     570:	89 7c 24 08          	mov    %edi,0x8(%esp)
     574:	89 74 24 04          	mov    %esi,0x4(%esp)
     578:	8b 45 d0             	mov    -0x30(%ebp),%eax
     57b:	89 04 24             	mov    %eax,(%esp)
     57e:	e8 bd fe ff ff       	call   440 <parseredirs>
     583:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     586:	c7 44 24 08 93 18 00 	movl   $0x1893,0x8(%esp)
     58d:	00 
     58e:	89 7c 24 04          	mov    %edi,0x4(%esp)
     592:	89 34 24             	mov    %esi,(%esp)
     595:	e8 16 fb ff ff       	call   b0 <peek>
     59a:	85 c0                	test   %eax,%eax
     59c:	75 5a                	jne    5f8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     59e:	8d 45 e0             	lea    -0x20(%ebp),%eax
     5a1:	8d 55 e4             	lea    -0x1c(%ebp),%edx
     5a4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5a8:	89 54 24 08          	mov    %edx,0x8(%esp)
     5ac:	89 7c 24 04          	mov    %edi,0x4(%esp)
     5b0:	89 34 24             	mov    %esi,(%esp)
     5b3:	e8 78 fb ff ff       	call   130 <gettoken>
     5b8:	85 c0                	test   %eax,%eax
     5ba:	74 3c                	je     5f8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     5bc:	83 f8 61             	cmp    $0x61,%eax
     5bf:	74 0c                	je     5cd <parseexec+0xad>
      panic("syntax");
     5c1:	c7 04 24 7e 18 00 00 	movl   $0x187e,(%esp)
     5c8:	e8 43 fe ff ff       	call   410 <panic>
    cmd->argv[argc] = q;
     5cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5d0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     5d3:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     5d7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     5da:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     5de:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     5e1:	83 fb 09             	cmp    $0x9,%ebx
     5e4:	7e 8a                	jle    570 <parseexec+0x50>
      panic("too many args");
     5e6:	c7 04 24 85 18 00 00 	movl   $0x1885,(%esp)
     5ed:	e8 1e fe ff ff       	call   410 <panic>
     5f2:	e9 79 ff ff ff       	jmp    570 <parseexec+0x50>
     5f7:	90                   	nop
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     5f8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     5fb:	c7 44 9a 04 00 00 00 	movl   $0x0,0x4(%edx,%ebx,4)
     602:	00 
  cmd->eargv[argc] = 0;
     603:	c7 44 9a 2c 00 00 00 	movl   $0x0,0x2c(%edx,%ebx,4)
     60a:	00 
  return ret;
}
     60b:	8b 45 d0             	mov    -0x30(%ebp),%eax
     60e:	83 c4 3c             	add    $0x3c,%esp
     611:	5b                   	pop    %ebx
     612:	5e                   	pop    %esi
     613:	5f                   	pop    %edi
     614:	5d                   	pop    %ebp
     615:	c3                   	ret    
     616:	66 90                	xchg   %ax,%ax
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);
     618:	89 7c 24 04          	mov    %edi,0x4(%esp)
     61c:	89 34 24             	mov    %esi,(%esp)
     61f:	e8 6c 01 00 00       	call   790 <parseblock>
     624:	89 45 d0             	mov    %eax,-0x30(%ebp)
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     627:	8b 45 d0             	mov    -0x30(%ebp),%eax
     62a:	83 c4 3c             	add    $0x3c,%esp
     62d:	5b                   	pop    %ebx
     62e:	5e                   	pop    %esi
     62f:	5f                   	pop    %edi
     630:	5d                   	pop    %ebp
     631:	c3                   	ret    
     632:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000640 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	83 ec 28             	sub    $0x28,%esp
     646:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     649:	8b 5d 08             	mov    0x8(%ebp),%ebx
     64c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     64f:	8b 75 0c             	mov    0xc(%ebp),%esi
     652:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     655:	89 1c 24             	mov    %ebx,(%esp)
     658:	89 74 24 04          	mov    %esi,0x4(%esp)
     65c:	e8 bf fe ff ff       	call   520 <parseexec>
  if(peek(ps, es, "|")){
     661:	c7 44 24 08 98 18 00 	movl   $0x1898,0x8(%esp)
     668:	00 
     669:	89 74 24 04          	mov    %esi,0x4(%esp)
     66d:	89 1c 24             	mov    %ebx,(%esp)
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     670:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     672:	e8 39 fa ff ff       	call   b0 <peek>
     677:	85 c0                	test   %eax,%eax
     679:	75 15                	jne    690 <parsepipe+0x50>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     67b:	89 f8                	mov    %edi,%eax
     67d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     680:	8b 75 f8             	mov    -0x8(%ebp),%esi
     683:	8b 7d fc             	mov    -0x4(%ebp),%edi
     686:	89 ec                	mov    %ebp,%esp
     688:	5d                   	pop    %ebp
     689:	c3                   	ret    
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     690:	89 74 24 04          	mov    %esi,0x4(%esp)
     694:	89 1c 24             	mov    %ebx,(%esp)
     697:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     69e:	00 
     69f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6a6:	00 
     6a7:	e8 84 fa ff ff       	call   130 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6ac:	89 74 24 04          	mov    %esi,0x4(%esp)
     6b0:	89 1c 24             	mov    %ebx,(%esp)
     6b3:	e8 88 ff ff ff       	call   640 <parsepipe>
  }
  return cmd;
}
     6b8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6bb:	89 7d 08             	mov    %edi,0x8(%ebp)
  }
  return cmd;
}
     6be:	8b 75 f8             	mov    -0x8(%ebp),%esi
     6c1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6c4:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     6c7:	89 ec                	mov    %ebp,%esp
     6c9:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6ca:	e9 51 fc ff ff       	jmp    320 <pipecmd>
     6cf:	90                   	nop

000006d0 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
     6d6:	83 ec 1c             	sub    $0x1c,%esp
     6d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     6df:	89 1c 24             	mov    %ebx,(%esp)
     6e2:	89 74 24 04          	mov    %esi,0x4(%esp)
     6e6:	e8 55 ff ff ff       	call   640 <parsepipe>
     6eb:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     6ed:	eb 27                	jmp    716 <parseline+0x46>
     6ef:	90                   	nop
    gettoken(ps, es, 0, 0);
     6f0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6f7:	00 
     6f8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6ff:	00 
     700:	89 74 24 04          	mov    %esi,0x4(%esp)
     704:	89 1c 24             	mov    %ebx,(%esp)
     707:	e8 24 fa ff ff       	call   130 <gettoken>
    cmd = backcmd(cmd);
     70c:	89 3c 24             	mov    %edi,(%esp)
     70f:	e8 6c fb ff ff       	call   280 <backcmd>
     714:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     716:	c7 44 24 08 9a 18 00 	movl   $0x189a,0x8(%esp)
     71d:	00 
     71e:	89 74 24 04          	mov    %esi,0x4(%esp)
     722:	89 1c 24             	mov    %ebx,(%esp)
     725:	e8 86 f9 ff ff       	call   b0 <peek>
     72a:	85 c0                	test   %eax,%eax
     72c:	75 c2                	jne    6f0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     72e:	c7 44 24 08 96 18 00 	movl   $0x1896,0x8(%esp)
     735:	00 
     736:	89 74 24 04          	mov    %esi,0x4(%esp)
     73a:	89 1c 24             	mov    %ebx,(%esp)
     73d:	e8 6e f9 ff ff       	call   b0 <peek>
     742:	85 c0                	test   %eax,%eax
     744:	75 0a                	jne    750 <parseline+0x80>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     746:	83 c4 1c             	add    $0x1c,%esp
     749:	89 f8                	mov    %edi,%eax
     74b:	5b                   	pop    %ebx
     74c:	5e                   	pop    %esi
     74d:	5f                   	pop    %edi
     74e:	5d                   	pop    %ebp
     74f:	c3                   	ret    
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     750:	89 74 24 04          	mov    %esi,0x4(%esp)
     754:	89 1c 24             	mov    %ebx,(%esp)
     757:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     75e:	00 
     75f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     766:	00 
     767:	e8 c4 f9 ff ff       	call   130 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     76c:	89 74 24 04          	mov    %esi,0x4(%esp)
     770:	89 1c 24             	mov    %ebx,(%esp)
     773:	e8 58 ff ff ff       	call   6d0 <parseline>
     778:	89 7d 08             	mov    %edi,0x8(%ebp)
     77b:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     77e:	83 c4 1c             	add    $0x1c,%esp
     781:	5b                   	pop    %ebx
     782:	5e                   	pop    %esi
     783:	5f                   	pop    %edi
     784:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     785:	e9 46 fb ff ff       	jmp    2d0 <listcmd>
     78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000790 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	83 ec 28             	sub    $0x28,%esp
     796:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     799:	8b 5d 08             	mov    0x8(%ebp),%ebx
     79c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     79f:	8b 75 0c             	mov    0xc(%ebp),%esi
     7a2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     7a5:	c7 44 24 08 7c 18 00 	movl   $0x187c,0x8(%esp)
     7ac:	00 
     7ad:	89 1c 24             	mov    %ebx,(%esp)
     7b0:	89 74 24 04          	mov    %esi,0x4(%esp)
     7b4:	e8 f7 f8 ff ff       	call   b0 <peek>
     7b9:	85 c0                	test   %eax,%eax
     7bb:	0f 84 87 00 00 00    	je     848 <parseblock+0xb8>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     7c1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7c8:	00 
     7c9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7d0:	00 
     7d1:	89 74 24 04          	mov    %esi,0x4(%esp)
     7d5:	89 1c 24             	mov    %ebx,(%esp)
     7d8:	e8 53 f9 ff ff       	call   130 <gettoken>
  cmd = parseline(ps, es);
     7dd:	89 74 24 04          	mov    %esi,0x4(%esp)
     7e1:	89 1c 24             	mov    %ebx,(%esp)
     7e4:	e8 e7 fe ff ff       	call   6d0 <parseline>
  if(!peek(ps, es, ")"))
     7e9:	c7 44 24 08 b8 18 00 	movl   $0x18b8,0x8(%esp)
     7f0:	00 
     7f1:	89 74 24 04          	mov    %esi,0x4(%esp)
     7f5:	89 1c 24             	mov    %ebx,(%esp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     7f8:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     7fa:	e8 b1 f8 ff ff       	call   b0 <peek>
     7ff:	85 c0                	test   %eax,%eax
     801:	75 0c                	jne    80f <parseblock+0x7f>
    panic("syntax - missing )");
     803:	c7 04 24 a7 18 00 00 	movl   $0x18a7,(%esp)
     80a:	e8 01 fc ff ff       	call   410 <panic>
  gettoken(ps, es, 0, 0);
     80f:	89 74 24 04          	mov    %esi,0x4(%esp)
     813:	89 1c 24             	mov    %ebx,(%esp)
     816:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     81d:	00 
     81e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     825:	00 
     826:	e8 05 f9 ff ff       	call   130 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     82b:	89 74 24 08          	mov    %esi,0x8(%esp)
     82f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     833:	89 3c 24             	mov    %edi,(%esp)
     836:	e8 05 fc ff ff       	call   440 <parseredirs>
  return cmd;
}
     83b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     83e:	8b 75 f8             	mov    -0x8(%ebp),%esi
     841:	8b 7d fc             	mov    -0x4(%ebp),%edi
     844:	89 ec                	mov    %ebp,%esp
     846:	5d                   	pop    %ebp
     847:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     848:	c7 04 24 9c 18 00 00 	movl   $0x189c,(%esp)
     84f:	e8 bc fb ff ff       	call   410 <panic>
     854:	e9 68 ff ff ff       	jmp    7c1 <parseblock+0x31>
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000860 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	56                   	push   %esi
     864:	53                   	push   %ebx
     865:	83 ec 10             	sub    $0x10,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     868:	8b 5d 08             	mov    0x8(%ebp),%ebx
     86b:	89 1c 24             	mov    %ebx,(%esp)
     86e:	e8 5d 04 00 00       	call   cd0 <strlen>
     873:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     875:	8d 45 08             	lea    0x8(%ebp),%eax
     878:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     87c:	89 04 24             	mov    %eax,(%esp)
     87f:	e8 4c fe ff ff       	call   6d0 <parseline>
  peek(&s, es, "");
     884:	c7 44 24 08 e7 18 00 	movl   $0x18e7,0x8(%esp)
     88b:	00 
     88c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     890:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     892:	8d 45 08             	lea    0x8(%ebp),%eax
     895:	89 04 24             	mov    %eax,(%esp)
     898:	e8 13 f8 ff ff       	call   b0 <peek>
  if(s != es){
     89d:	8b 45 08             	mov    0x8(%ebp),%eax
     8a0:	39 d8                	cmp    %ebx,%eax
     8a2:	74 24                	je     8c8 <parsecmd+0x68>
    printf(2, "leftovers: %s\n", s);
     8a4:	89 44 24 08          	mov    %eax,0x8(%esp)
     8a8:	c7 44 24 04 ba 18 00 	movl   $0x18ba,0x4(%esp)
     8af:	00 
     8b0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     8b7:	e8 54 07 00 00       	call   1010 <printf>
    panic("syntax");
     8bc:	c7 04 24 7e 18 00 00 	movl   $0x187e,(%esp)
     8c3:	e8 48 fb ff ff       	call   410 <panic>
  }
  nulterminate(cmd);
     8c8:	89 34 24             	mov    %esi,(%esp)
     8cb:	e8 30 f7 ff ff       	call   0 <nulterminate>
  return cmd;
}
     8d0:	83 c4 10             	add    $0x10,%esp
     8d3:	89 f0                	mov    %esi,%eax
     8d5:	5b                   	pop    %ebx
     8d6:	5e                   	pop    %esi
     8d7:	5d                   	pop    %ebp
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <fork1>:
  exit();
}

int
fork1(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
     8e6:	e8 85 05 00 00       	call   e70 <fork>
  if(pid == -1)
     8eb:	83 f8 ff             	cmp    $0xffffffff,%eax
     8ee:	74 08                	je     8f8 <fork1+0x18>
    panic("fork");
  return pid;
}
     8f0:	c9                   	leave  
     8f1:	c3                   	ret    
     8f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int pid;
  
  pid = fork();
  if(pid == -1)
    panic("fork");
     8f8:	c7 04 24 c9 18 00 00 	movl   $0x18c9,(%esp)
     8ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
     902:	e8 09 fb ff ff       	call   410 <panic>
     907:	8b 45 f4             	mov    -0xc(%ebp),%eax
  return pid;
}
     90a:	c9                   	leave  
     90b:	c3                   	ret    
     90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000910 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     910:	55                   	push   %ebp
     911:	89 e5                	mov    %esp,%ebp
     913:	83 ec 18             	sub    $0x18,%esp
     916:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     919:	8b 5d 08             	mov    0x8(%ebp),%ebx
     91c:	89 75 fc             	mov    %esi,-0x4(%ebp)
     91f:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     922:	c7 44 24 04 ce 18 00 	movl   $0x18ce,0x4(%esp)
     929:	00 
     92a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     931:	e8 da 06 00 00       	call   1010 <printf>
  memset(buf, 0, nbuf);
     936:	89 74 24 08          	mov    %esi,0x8(%esp)
     93a:	89 1c 24             	mov    %ebx,(%esp)
     93d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     944:	00 
     945:	e8 a6 03 00 00       	call   cf0 <memset>
  gets(buf, nbuf);
     94a:	89 74 24 04          	mov    %esi,0x4(%esp)
     94e:	89 1c 24             	mov    %ebx,(%esp)
     951:	e8 ba 04 00 00       	call   e10 <gets>
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     956:	8b 75 fc             	mov    -0x4(%ebp),%esi
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     959:	80 3b 01             	cmpb   $0x1,(%ebx)
    return -1;
  return 0;
}
     95c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     95f:	19 c0                	sbb    %eax,%eax
    return -1;
  return 0;
}
     961:	89 ec                	mov    %ebp,%esp
     963:	5d                   	pop    %ebp
     964:	c3                   	ret    
     965:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000970 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     970:	55                   	push   %ebp
     971:	89 e5                	mov    %esp,%ebp
     973:	53                   	push   %ebx
     974:	83 ec 24             	sub    $0x24,%esp
     977:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     97a:	85 db                	test   %ebx,%ebx
     97c:	74 42                	je     9c0 <runcmd+0x50>
    exit();
  
  switch(cmd->type){
     97e:	83 3b 05             	cmpl   $0x5,(%ebx)
     981:	76 45                	jbe    9c8 <runcmd+0x58>
  default:
    panic("runcmd");
     983:	c7 04 24 d1 18 00 00 	movl   $0x18d1,(%esp)
     98a:	e8 81 fa ff ff       	call   410 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     98f:	8b 43 04             	mov    0x4(%ebx),%eax
     992:	85 c0                	test   %eax,%eax
     994:	74 2a                	je     9c0 <runcmd+0x50>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     996:	8d 53 04             	lea    0x4(%ebx),%edx
     999:	89 54 24 04          	mov    %edx,0x4(%esp)
     99d:	89 04 24             	mov    %eax,(%esp)
     9a0:	e8 0b 05 00 00       	call   eb0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     9a5:	8b 43 04             	mov    0x4(%ebx),%eax
     9a8:	c7 44 24 04 d8 18 00 	movl   $0x18d8,0x4(%esp)
     9af:	00 
     9b0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     9b7:	89 44 24 08          	mov    %eax,0x8(%esp)
     9bb:	e8 50 06 00 00       	call   1010 <printf>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     9c0:	e8 b3 04 00 00       	call   e78 <exit>
     9c5:	8d 76 00             	lea    0x0(%esi),%esi
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
  
  switch(cmd->type){
     9c8:	8b 03                	mov    (%ebx),%eax
     9ca:	ff 24 85 44 18 00 00 	jmp    *0x1844(,%eax,4)
     9d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wait();
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     9d8:	e8 03 ff ff ff       	call   8e0 <fork1>
     9dd:	85 c0                	test   %eax,%eax
     9df:	90                   	nop
     9e0:	0f 84 a7 00 00 00    	je     a8d <runcmd+0x11d>
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     9e6:	e8 8d 04 00 00       	call   e78 <exit>
     9eb:	90                   	nop
     9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     9f0:	e8 eb fe ff ff       	call   8e0 <fork1>
     9f5:	85 c0                	test   %eax,%eax
     9f7:	0f 84 a3 00 00 00    	je     aa0 <runcmd+0x130>
     9fd:	8d 76 00             	lea    0x0(%esi),%esi
      runcmd(lcmd->left);
    wait();
     a00:	e8 7b 04 00 00       	call   e80 <wait>
    runcmd(lcmd->right);
     a05:	8b 43 08             	mov    0x8(%ebx),%eax
     a08:	89 04 24             	mov    %eax,(%esp)
     a0b:	e8 60 ff ff ff       	call   970 <runcmd>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     a10:	e8 63 04 00 00       	call   e78 <exit>
     a15:	8d 76 00             	lea    0x0(%esi),%esi
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     a18:	8d 45 f0             	lea    -0x10(%ebp),%eax
     a1b:	89 04 24             	mov    %eax,(%esp)
     a1e:	e8 65 04 00 00       	call   e88 <pipe>
     a23:	85 c0                	test   %eax,%eax
     a25:	0f 88 25 01 00 00    	js     b50 <runcmd+0x1e0>
      panic("pipe");
    if(fork1() == 0){
     a2b:	e8 b0 fe ff ff       	call   8e0 <fork1>
     a30:	85 c0                	test   %eax,%eax
     a32:	0f 84 b8 00 00 00    	je     af0 <runcmd+0x180>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     a38:	e8 a3 fe ff ff       	call   8e0 <fork1>
     a3d:	85 c0                	test   %eax,%eax
     a3f:	90                   	nop
     a40:	74 6e                	je     ab0 <runcmd+0x140>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     a42:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a45:	89 04 24             	mov    %eax,(%esp)
     a48:	e8 53 04 00 00       	call   ea0 <close>
    close(p[1]);
     a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a50:	89 04 24             	mov    %eax,(%esp)
     a53:	e8 48 04 00 00       	call   ea0 <close>
    wait();
     a58:	e8 23 04 00 00       	call   e80 <wait>
    wait();
     a5d:	e8 1e 04 00 00       	call   e80 <wait>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     a62:	e8 11 04 00 00       	call   e78 <exit>
     a67:	90                   	nop
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     a68:	8b 43 14             	mov    0x14(%ebx),%eax
     a6b:	89 04 24             	mov    %eax,(%esp)
     a6e:	e8 2d 04 00 00       	call   ea0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     a73:	8b 43 10             	mov    0x10(%ebx),%eax
     a76:	89 44 24 04          	mov    %eax,0x4(%esp)
     a7a:	8b 43 08             	mov    0x8(%ebx),%eax
     a7d:	89 04 24             	mov    %eax,(%esp)
     a80:	e8 33 04 00 00       	call   eb8 <open>
     a85:	85 c0                	test   %eax,%eax
     a87:	0f 88 a3 00 00 00    	js     b30 <runcmd+0x1c0>
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     a8d:	8b 43 04             	mov    0x4(%ebx),%eax
     a90:	89 04 24             	mov    %eax,(%esp)
     a93:	e8 d8 fe ff ff       	call   970 <runcmd>
    break;
  }
  exit();
     a98:	e8 db 03 00 00       	call   e78 <exit>
     a9d:	8d 76 00             	lea    0x0(%esi),%esi
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
     aa0:	8b 43 04             	mov    0x4(%ebx),%eax
     aa3:	89 04 24             	mov    %eax,(%esp)
     aa6:	e8 c5 fe ff ff       	call   970 <runcmd>
     aab:	e9 4d ff ff ff       	jmp    9fd <runcmd+0x8d>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     ab0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ab7:	e8 e4 03 00 00       	call   ea0 <close>
      dup(p[0]);
     abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     abf:	89 04 24             	mov    %eax,(%esp)
     ac2:	e8 29 04 00 00       	call   ef0 <dup>
      close(p[0]);
     ac7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     aca:	89 04 24             	mov    %eax,(%esp)
     acd:	e8 ce 03 00 00       	call   ea0 <close>
      close(p[1]);
     ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad5:	89 04 24             	mov    %eax,(%esp)
     ad8:	e8 c3 03 00 00       	call   ea0 <close>
      runcmd(pcmd->right);
     add:	8b 43 08             	mov    0x8(%ebx),%eax
     ae0:	89 04 24             	mov    %eax,(%esp)
     ae3:	e8 88 fe ff ff       	call   970 <runcmd>
     ae8:	e9 55 ff ff ff       	jmp    a42 <runcmd+0xd2>
     aed:	8d 76 00             	lea    0x0(%esi),%esi
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     af0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     af7:	e8 a4 03 00 00       	call   ea0 <close>
      dup(p[1]);
     afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aff:	89 04 24             	mov    %eax,(%esp)
     b02:	e8 e9 03 00 00       	call   ef0 <dup>
      close(p[0]);
     b07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b0a:	89 04 24             	mov    %eax,(%esp)
     b0d:	e8 8e 03 00 00       	call   ea0 <close>
      close(p[1]);
     b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b15:	89 04 24             	mov    %eax,(%esp)
     b18:	e8 83 03 00 00       	call   ea0 <close>
      runcmd(pcmd->left);
     b1d:	8b 43 04             	mov    0x4(%ebx),%eax
     b20:	89 04 24             	mov    %eax,(%esp)
     b23:	e8 48 fe ff ff       	call   970 <runcmd>
     b28:	e9 0b ff ff ff       	jmp    a38 <runcmd+0xc8>
     b2d:	8d 76 00             	lea    0x0(%esi),%esi

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     b30:	8b 43 08             	mov    0x8(%ebx),%eax
     b33:	c7 44 24 04 e8 18 00 	movl   $0x18e8,0x4(%esp)
     b3a:	00 
     b3b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     b42:	89 44 24 08          	mov    %eax,0x8(%esp)
     b46:	e8 c5 04 00 00       	call   1010 <printf>
      exit();
     b4b:	e8 28 03 00 00       	call   e78 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     b50:	c7 04 24 f8 18 00 00 	movl   $0x18f8,(%esp)
     b57:	e8 b4 f8 ff ff       	call   410 <panic>
     b5c:	e9 ca fe ff ff       	jmp    a2b <runcmd+0xbb>
     b61:	eb 0d                	jmp    b70 <main>
     b63:	90                   	nop
     b64:	90                   	nop
     b65:	90                   	nop
     b66:	90                   	nop
     b67:	90                   	nop
     b68:	90                   	nop
     b69:	90                   	nop
     b6a:	90                   	nop
     b6b:	90                   	nop
     b6c:	90                   	nop
     b6d:	90                   	nop
     b6e:	90                   	nop
     b6f:	90                   	nop

00000b70 <main>:
  return 0;
}

int
main(void)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	83 e4 f0             	and    $0xfffffff0,%esp
     b76:	83 ec 10             	sub    $0x10,%esp
     b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     b80:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     b87:	00 
     b88:	c7 04 24 fd 18 00 00 	movl   $0x18fd,(%esp)
     b8f:	e8 24 03 00 00       	call   eb8 <open>
     b94:	85 c0                	test   %eax,%eax
     b96:	78 28                	js     bc0 <main+0x50>
    if(fd >= 3){
     b98:	83 f8 02             	cmp    $0x2,%eax
     b9b:	7e e3                	jle    b80 <main+0x10>
      close(fd);
     b9d:	89 04 24             	mov    %eax,(%esp)
     ba0:	e8 fb 02 00 00       	call   ea0 <close>
      break;
     ba5:	eb 19                	jmp    bc0 <main+0x50>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
     ba7:	c7 04 24 00 1a 00 00 	movl   $0x1a00,(%esp)
     bae:	e8 ad fc ff ff       	call   860 <parsecmd>
     bb3:	89 04 24             	mov    %eax,(%esp)
     bb6:	e8 b5 fd ff ff       	call   970 <runcmd>
    wait();
     bbb:	e8 c0 02 00 00       	call   e80 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     bc0:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     bc7:	00 
     bc8:	c7 04 24 00 1a 00 00 	movl   $0x1a00,(%esp)
     bcf:	e8 3c fd ff ff       	call   910 <getcmd>
     bd4:	85 c0                	test   %eax,%eax
     bd6:	78 70                	js     c48 <main+0xd8>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     bd8:	80 3d 00 1a 00 00 63 	cmpb   $0x63,0x1a00
     bdf:	75 09                	jne    bea <main+0x7a>
     be1:	80 3d 01 1a 00 00 64 	cmpb   $0x64,0x1a01
     be8:	74 0e                	je     bf8 <main+0x88>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
     bea:	e8 f1 fc ff ff       	call   8e0 <fork1>
     bef:	85 c0                	test   %eax,%eax
     bf1:	75 c8                	jne    bbb <main+0x4b>
     bf3:	eb b2                	jmp    ba7 <main+0x37>
     bf5:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     bf8:	80 3d 02 1a 00 00 20 	cmpb   $0x20,0x1a02
     bff:	90                   	nop
     c00:	75 e8                	jne    bea <main+0x7a>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     c02:	c7 04 24 00 1a 00 00 	movl   $0x1a00,(%esp)
     c09:	e8 c2 00 00 00       	call   cd0 <strlen>
      if(chdir(buf+3) < 0)
     c0e:	c7 04 24 03 1a 00 00 	movl   $0x1a03,(%esp)
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     c15:	c6 80 ff 19 00 00 00 	movb   $0x0,0x19ff(%eax)
      if(chdir(buf+3) < 0)
     c1c:	e8 c7 02 00 00       	call   ee8 <chdir>
     c21:	85 c0                	test   %eax,%eax
     c23:	79 9b                	jns    bc0 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
     c25:	c7 44 24 08 03 1a 00 	movl   $0x1a03,0x8(%esp)
     c2c:	00 
     c2d:	c7 44 24 04 05 19 00 	movl   $0x1905,0x4(%esp)
     c34:	00 
     c35:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     c3c:	e8 cf 03 00 00       	call   1010 <printf>
     c41:	e9 7a ff ff ff       	jmp    bc0 <main+0x50>
     c46:	66 90                	xchg   %ax,%ax
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     c48:	e8 2b 02 00 00       	call   e78 <exit>
     c4d:	90                   	nop
     c4e:	90                   	nop
     c4f:	90                   	nop

00000c50 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     c50:	55                   	push   %ebp
     c51:	31 d2                	xor    %edx,%edx
     c53:	89 e5                	mov    %esp,%ebp
     c55:	8b 45 08             	mov    0x8(%ebp),%eax
     c58:	53                   	push   %ebx
     c59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c60:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     c64:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c67:	83 c2 01             	add    $0x1,%edx
     c6a:	84 c9                	test   %cl,%cl
     c6c:	75 f2                	jne    c60 <strcpy+0x10>
    ;
  return os;
}
     c6e:	5b                   	pop    %ebx
     c6f:	5d                   	pop    %ebp
     c70:	c3                   	ret    
     c71:	eb 0d                	jmp    c80 <strcmp>
     c73:	90                   	nop
     c74:	90                   	nop
     c75:	90                   	nop
     c76:	90                   	nop
     c77:	90                   	nop
     c78:	90                   	nop
     c79:	90                   	nop
     c7a:	90                   	nop
     c7b:	90                   	nop
     c7c:	90                   	nop
     c7d:	90                   	nop
     c7e:	90                   	nop
     c7f:	90                   	nop

00000c80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	53                   	push   %ebx
     c84:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c87:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     c8a:	0f b6 01             	movzbl (%ecx),%eax
     c8d:	84 c0                	test   %al,%al
     c8f:	75 14                	jne    ca5 <strcmp+0x25>
     c91:	eb 25                	jmp    cb8 <strcmp+0x38>
     c93:	90                   	nop
     c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
     c98:	83 c1 01             	add    $0x1,%ecx
     c9b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     c9e:	0f b6 01             	movzbl (%ecx),%eax
     ca1:	84 c0                	test   %al,%al
     ca3:	74 13                	je     cb8 <strcmp+0x38>
     ca5:	0f b6 1a             	movzbl (%edx),%ebx
     ca8:	38 d8                	cmp    %bl,%al
     caa:	74 ec                	je     c98 <strcmp+0x18>
     cac:	0f b6 db             	movzbl %bl,%ebx
     caf:	0f b6 c0             	movzbl %al,%eax
     cb2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     cb4:	5b                   	pop    %ebx
     cb5:	5d                   	pop    %ebp
     cb6:	c3                   	ret    
     cb7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     cb8:	0f b6 1a             	movzbl (%edx),%ebx
     cbb:	31 c0                	xor    %eax,%eax
     cbd:	0f b6 db             	movzbl %bl,%ebx
     cc0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     cc2:	5b                   	pop    %ebx
     cc3:	5d                   	pop    %ebp
     cc4:	c3                   	ret    
     cc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <strlen>:

uint
strlen(char *s)
{
     cd0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
     cd1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     cd3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
     cd5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     cd7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     cda:	80 39 00             	cmpb   $0x0,(%ecx)
     cdd:	74 0c                	je     ceb <strlen+0x1b>
     cdf:	90                   	nop
     ce0:	83 c2 01             	add    $0x1,%edx
     ce3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ce7:	89 d0                	mov    %edx,%eax
     ce9:	75 f5                	jne    ce0 <strlen+0x10>
    ;
  return n;
}
     ceb:	5d                   	pop    %ebp
     cec:	c3                   	ret    
     ced:	8d 76 00             	lea    0x0(%esi),%esi

00000cf0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	8b 55 08             	mov    0x8(%ebp),%edx
     cf6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     cf7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
     cfd:	89 d7                	mov    %edx,%edi
     cff:	fc                   	cld    
     d00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d02:	89 d0                	mov    %edx,%eax
     d04:	5f                   	pop    %edi
     d05:	5d                   	pop    %ebp
     d06:	c3                   	ret    
     d07:	89 f6                	mov    %esi,%esi
     d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d10 <strchr>:

char*
strchr(const char *s, char c)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	8b 45 08             	mov    0x8(%ebp),%eax
     d16:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d1a:	0f b6 10             	movzbl (%eax),%edx
     d1d:	84 d2                	test   %dl,%dl
     d1f:	75 11                	jne    d32 <strchr+0x22>
     d21:	eb 15                	jmp    d38 <strchr+0x28>
     d23:	90                   	nop
     d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d28:	83 c0 01             	add    $0x1,%eax
     d2b:	0f b6 10             	movzbl (%eax),%edx
     d2e:	84 d2                	test   %dl,%dl
     d30:	74 06                	je     d38 <strchr+0x28>
    if(*s == c)
     d32:	38 ca                	cmp    %cl,%dl
     d34:	75 f2                	jne    d28 <strchr+0x18>
      return (char*) s;
  return 0;
}
     d36:	5d                   	pop    %ebp
     d37:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     d38:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
     d3a:	5d                   	pop    %ebp
     d3b:	90                   	nop
     d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d40:	c3                   	ret    
     d41:	eb 0d                	jmp    d50 <atoi>
     d43:	90                   	nop
     d44:	90                   	nop
     d45:	90                   	nop
     d46:	90                   	nop
     d47:	90                   	nop
     d48:	90                   	nop
     d49:	90                   	nop
     d4a:	90                   	nop
     d4b:	90                   	nop
     d4c:	90                   	nop
     d4d:	90                   	nop
     d4e:	90                   	nop
     d4f:	90                   	nop

00000d50 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     d50:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d51:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
     d53:	89 e5                	mov    %esp,%ebp
     d55:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d58:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d59:	0f b6 11             	movzbl (%ecx),%edx
     d5c:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d5f:	80 fb 09             	cmp    $0x9,%bl
     d62:	77 1c                	ja     d80 <atoi+0x30>
     d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
     d68:	0f be d2             	movsbl %dl,%edx
     d6b:	83 c1 01             	add    $0x1,%ecx
     d6e:	8d 04 80             	lea    (%eax,%eax,4),%eax
     d71:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d75:	0f b6 11             	movzbl (%ecx),%edx
     d78:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d7b:	80 fb 09             	cmp    $0x9,%bl
     d7e:	76 e8                	jbe    d68 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     d80:	5b                   	pop    %ebx
     d81:	5d                   	pop    %ebp
     d82:	c3                   	ret    
     d83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d90 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	56                   	push   %esi
     d94:	8b 45 08             	mov    0x8(%ebp),%eax
     d97:	53                   	push   %ebx
     d98:	8b 5d 10             	mov    0x10(%ebp),%ebx
     d9b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d9e:	85 db                	test   %ebx,%ebx
     da0:	7e 14                	jle    db6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
     da2:	31 d2                	xor    %edx,%edx
     da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     da8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     dac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     daf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     db2:	39 da                	cmp    %ebx,%edx
     db4:	75 f2                	jne    da8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     db6:	5b                   	pop    %ebx
     db7:	5e                   	pop    %esi
     db8:	5d                   	pop    %ebp
     db9:	c3                   	ret    
     dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000dc0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     dc6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
     dc9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     dcc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
     dcf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     dd4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ddb:	00 
     ddc:	89 04 24             	mov    %eax,(%esp)
     ddf:	e8 d4 00 00 00       	call   eb8 <open>
  if(fd < 0)
     de4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     de6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     de8:	78 19                	js     e03 <stat+0x43>
    return -1;
  r = fstat(fd, st);
     dea:	8b 45 0c             	mov    0xc(%ebp),%eax
     ded:	89 1c 24             	mov    %ebx,(%esp)
     df0:	89 44 24 04          	mov    %eax,0x4(%esp)
     df4:	e8 d7 00 00 00       	call   ed0 <fstat>
  close(fd);
     df9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     dfc:	89 c6                	mov    %eax,%esi
  close(fd);
     dfe:	e8 9d 00 00 00       	call   ea0 <close>
  return r;
}
     e03:	89 f0                	mov    %esi,%eax
     e05:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     e08:	8b 75 fc             	mov    -0x4(%ebp),%esi
     e0b:	89 ec                	mov    %ebp,%esp
     e0d:	5d                   	pop    %ebp
     e0e:	c3                   	ret    
     e0f:	90                   	nop

00000e10 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	57                   	push   %edi
     e14:	56                   	push   %esi
     e15:	31 f6                	xor    %esi,%esi
     e17:	53                   	push   %ebx
     e18:	83 ec 2c             	sub    $0x2c,%esp
     e1b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e1e:	eb 06                	jmp    e26 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     e20:	3c 0a                	cmp    $0xa,%al
     e22:	74 39                	je     e5d <gets+0x4d>
     e24:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e26:	8d 5e 01             	lea    0x1(%esi),%ebx
     e29:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e2c:	7d 31                	jge    e5f <gets+0x4f>
    cc = read(0, &c, 1);
     e2e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e31:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e38:	00 
     e39:	89 44 24 04          	mov    %eax,0x4(%esp)
     e3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e44:	e8 47 00 00 00       	call   e90 <read>
    if(cc < 1)
     e49:	85 c0                	test   %eax,%eax
     e4b:	7e 12                	jle    e5f <gets+0x4f>
      break;
    buf[i++] = c;
     e4d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e51:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
     e55:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e59:	3c 0d                	cmp    $0xd,%al
     e5b:	75 c3                	jne    e20 <gets+0x10>
     e5d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     e5f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     e63:	89 f8                	mov    %edi,%eax
     e65:	83 c4 2c             	add    $0x2c,%esp
     e68:	5b                   	pop    %ebx
     e69:	5e                   	pop    %esi
     e6a:	5f                   	pop    %edi
     e6b:	5d                   	pop    %ebp
     e6c:	c3                   	ret    
     e6d:	90                   	nop
     e6e:	90                   	nop
     e6f:	90                   	nop

00000e70 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e70:	b8 01 00 00 00       	mov    $0x1,%eax
     e75:	cd 40                	int    $0x40
     e77:	c3                   	ret    

00000e78 <exit>:
SYSCALL(exit)
     e78:	b8 02 00 00 00       	mov    $0x2,%eax
     e7d:	cd 40                	int    $0x40
     e7f:	c3                   	ret    

00000e80 <wait>:
SYSCALL(wait)
     e80:	b8 03 00 00 00       	mov    $0x3,%eax
     e85:	cd 40                	int    $0x40
     e87:	c3                   	ret    

00000e88 <pipe>:
SYSCALL(pipe)
     e88:	b8 04 00 00 00       	mov    $0x4,%eax
     e8d:	cd 40                	int    $0x40
     e8f:	c3                   	ret    

00000e90 <read>:
SYSCALL(read)
     e90:	b8 06 00 00 00       	mov    $0x6,%eax
     e95:	cd 40                	int    $0x40
     e97:	c3                   	ret    

00000e98 <write>:
SYSCALL(write)
     e98:	b8 05 00 00 00       	mov    $0x5,%eax
     e9d:	cd 40                	int    $0x40
     e9f:	c3                   	ret    

00000ea0 <close>:
SYSCALL(close)
     ea0:	b8 07 00 00 00       	mov    $0x7,%eax
     ea5:	cd 40                	int    $0x40
     ea7:	c3                   	ret    

00000ea8 <kill>:
SYSCALL(kill)
     ea8:	b8 08 00 00 00       	mov    $0x8,%eax
     ead:	cd 40                	int    $0x40
     eaf:	c3                   	ret    

00000eb0 <exec>:
SYSCALL(exec)
     eb0:	b8 09 00 00 00       	mov    $0x9,%eax
     eb5:	cd 40                	int    $0x40
     eb7:	c3                   	ret    

00000eb8 <open>:
SYSCALL(open)
     eb8:	b8 0a 00 00 00       	mov    $0xa,%eax
     ebd:	cd 40                	int    $0x40
     ebf:	c3                   	ret    

00000ec0 <mknod>:
SYSCALL(mknod)
     ec0:	b8 0b 00 00 00       	mov    $0xb,%eax
     ec5:	cd 40                	int    $0x40
     ec7:	c3                   	ret    

00000ec8 <unlink>:
SYSCALL(unlink)
     ec8:	b8 0c 00 00 00       	mov    $0xc,%eax
     ecd:	cd 40                	int    $0x40
     ecf:	c3                   	ret    

00000ed0 <fstat>:
SYSCALL(fstat)
     ed0:	b8 0d 00 00 00       	mov    $0xd,%eax
     ed5:	cd 40                	int    $0x40
     ed7:	c3                   	ret    

00000ed8 <link>:
SYSCALL(link)
     ed8:	b8 0e 00 00 00       	mov    $0xe,%eax
     edd:	cd 40                	int    $0x40
     edf:	c3                   	ret    

00000ee0 <mkdir>:
SYSCALL(mkdir)
     ee0:	b8 0f 00 00 00       	mov    $0xf,%eax
     ee5:	cd 40                	int    $0x40
     ee7:	c3                   	ret    

00000ee8 <chdir>:
SYSCALL(chdir)
     ee8:	b8 10 00 00 00       	mov    $0x10,%eax
     eed:	cd 40                	int    $0x40
     eef:	c3                   	ret    

00000ef0 <dup>:
SYSCALL(dup)
     ef0:	b8 11 00 00 00       	mov    $0x11,%eax
     ef5:	cd 40                	int    $0x40
     ef7:	c3                   	ret    

00000ef8 <getpid>:
SYSCALL(getpid)
     ef8:	b8 12 00 00 00       	mov    $0x12,%eax
     efd:	cd 40                	int    $0x40
     eff:	c3                   	ret    

00000f00 <sbrk>:
SYSCALL(sbrk)
     f00:	b8 13 00 00 00       	mov    $0x13,%eax
     f05:	cd 40                	int    $0x40
     f07:	c3                   	ret    

00000f08 <sleep>:
SYSCALL(sleep)
     f08:	b8 14 00 00 00       	mov    $0x14,%eax
     f0d:	cd 40                	int    $0x40
     f0f:	c3                   	ret    

00000f10 <uptime>:
SYSCALL(uptime)
     f10:	b8 15 00 00 00       	mov    $0x15,%eax
     f15:	cd 40                	int    $0x40
     f17:	c3                   	ret    

00000f18 <thread_create>:
SYSCALL(thread_create)
     f18:	b8 16 00 00 00       	mov    $0x16,%eax
     f1d:	cd 40                	int    $0x40
     f1f:	c3                   	ret    

00000f20 <thread_getid>:
SYSCALL(thread_getid)
     f20:	b8 17 00 00 00       	mov    $0x17,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	ret    

00000f28 <thread_getProcId>:
SYSCALL(thread_getProcId)
     f28:	b8 18 00 00 00       	mov    $0x18,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	ret    

00000f30 <thread_exit>:
SYSCALL(thread_exit)
     f30:	b8 1a 00 00 00       	mov    $0x1a,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	ret    

00000f38 <thread_join>:
SYSCALL(thread_join)
     f38:	b8 19 00 00 00       	mov    $0x19,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	ret    

00000f40 <binary_sem_create>:
SYSCALL(binary_sem_create)
     f40:	b8 1b 00 00 00       	mov    $0x1b,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	ret    

00000f48 <binary_sem_down>:
SYSCALL(binary_sem_down)
     f48:	b8 1c 00 00 00       	mov    $0x1c,%eax
     f4d:	cd 40                	int    $0x40
     f4f:	c3                   	ret    

00000f50 <binary_sem_up>:
SYSCALL(binary_sem_up)
     f50:	b8 1d 00 00 00       	mov    $0x1d,%eax
     f55:	cd 40                	int    $0x40
     f57:	c3                   	ret    

00000f58 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
     f58:	b8 1e 00 00 00       	mov    $0x1e,%eax
     f5d:	cd 40                	int    $0x40
     f5f:	c3                   	ret    

00000f60 <exit_all_threads>:
     f60:	b8 1f 00 00 00       	mov    $0x1f,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	ret    
     f68:	90                   	nop
     f69:	90                   	nop
     f6a:	90                   	nop
     f6b:	90                   	nop
     f6c:	90                   	nop
     f6d:	90                   	nop
     f6e:	90                   	nop
     f6f:	90                   	nop

00000f70 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	57                   	push   %edi
     f74:	89 cf                	mov    %ecx,%edi
     f76:	56                   	push   %esi
     f77:	89 c6                	mov    %eax,%esi
     f79:	53                   	push   %ebx
     f7a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
     f7d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f80:	85 c9                	test   %ecx,%ecx
     f82:	74 04                	je     f88 <printint+0x18>
     f84:	85 d2                	test   %edx,%edx
     f86:	78 70                	js     ff8 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
     f88:	89 d0                	mov    %edx,%eax
     f8a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     f91:	31 c9                	xor    %ecx,%ecx
     f93:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     f96:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
     f98:	31 d2                	xor    %edx,%edx
     f9a:	f7 f7                	div    %edi
     f9c:	0f b6 92 1a 19 00 00 	movzbl 0x191a(%edx),%edx
     fa3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     fa6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
     fa9:	85 c0                	test   %eax,%eax
     fab:	75 eb                	jne    f98 <printint+0x28>
	if(neg)
     fad:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     fb0:	85 c0                	test   %eax,%eax
     fb2:	74 08                	je     fbc <printint+0x4c>
		buf[i++] = '-';
     fb4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
     fb9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
     fbc:	8d 79 ff             	lea    -0x1(%ecx),%edi
     fbf:	01 fb                	add    %edi,%ebx
     fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fc8:	0f b6 03             	movzbl (%ebx),%eax
     fcb:	83 ef 01             	sub    $0x1,%edi
     fce:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     fd1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     fd8:	00 
     fd9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     fdc:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     fdf:	8d 45 e7             	lea    -0x19(%ebp),%eax
     fe2:	89 44 24 04          	mov    %eax,0x4(%esp)
     fe6:	e8 ad fe ff ff       	call   e98 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     feb:	83 ff ff             	cmp    $0xffffffff,%edi
     fee:	75 d8                	jne    fc8 <printint+0x58>
		putc(fd, buf[i]);
}
     ff0:	83 c4 4c             	add    $0x4c,%esp
     ff3:	5b                   	pop    %ebx
     ff4:	5e                   	pop    %esi
     ff5:	5f                   	pop    %edi
     ff6:	5d                   	pop    %ebp
     ff7:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
     ff8:	89 d0                	mov    %edx,%eax
     ffa:	f7 d8                	neg    %eax
     ffc:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    1003:	eb 8c                	jmp    f91 <printint+0x21>
    1005:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001010 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1010:	55                   	push   %ebp
    1011:	89 e5                	mov    %esp,%ebp
    1013:	57                   	push   %edi
    1014:	56                   	push   %esi
    1015:	53                   	push   %ebx
    1016:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
    1019:	8b 45 0c             	mov    0xc(%ebp),%eax
    101c:	0f b6 10             	movzbl (%eax),%edx
    101f:	84 d2                	test   %dl,%dl
    1021:	0f 84 c9 00 00 00    	je     10f0 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
    1027:	8d 4d 10             	lea    0x10(%ebp),%ecx
    102a:	31 ff                	xor    %edi,%edi
    102c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    102f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    1031:	8d 75 e7             	lea    -0x19(%ebp),%esi
    1034:	eb 1e                	jmp    1054 <printf+0x44>
    1036:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
    1038:	83 fa 25             	cmp    $0x25,%edx
    103b:	0f 85 b7 00 00 00    	jne    10f8 <printf+0xe8>
    1041:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
    1045:	83 c3 01             	add    $0x1,%ebx
    1048:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    104c:	84 d2                	test   %dl,%dl
    104e:	0f 84 9c 00 00 00    	je     10f0 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
    1054:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
    1056:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
    1059:	74 dd                	je     1038 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
    105b:	83 ff 25             	cmp    $0x25,%edi
    105e:	75 e5                	jne    1045 <printf+0x35>
			if(c == 'd'){
    1060:	83 fa 64             	cmp    $0x64,%edx
    1063:	0f 84 57 01 00 00    	je     11c0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
    1069:	83 fa 70             	cmp    $0x70,%edx
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1070:	0f 84 aa 00 00 00    	je     1120 <printf+0x110>
    1076:	83 fa 78             	cmp    $0x78,%edx
    1079:	0f 84 a1 00 00 00    	je     1120 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
    107f:	83 fa 73             	cmp    $0x73,%edx
    1082:	0f 84 c0 00 00 00    	je     1148 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    1088:	83 fa 63             	cmp    $0x63,%edx
    108b:	90                   	nop
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1090:	0f 84 52 01 00 00    	je     11e8 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
    1096:	83 fa 25             	cmp    $0x25,%edx
    1099:	0f 84 f9 00 00 00    	je     1198 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    109f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
    10a2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    10a5:	31 ff                	xor    %edi,%edi
    10a7:	89 55 cc             	mov    %edx,-0x34(%ebp)
    10aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10b5:	00 
    10b6:	89 0c 24             	mov    %ecx,(%esp)
    10b9:	89 74 24 04          	mov    %esi,0x4(%esp)
    10bd:	e8 d6 fd ff ff       	call   e98 <write>
    10c2:	8b 55 cc             	mov    -0x34(%ebp),%edx
    10c5:	8b 45 08             	mov    0x8(%ebp),%eax
    10c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10cf:	00 
    10d0:	89 74 24 04          	mov    %esi,0x4(%esp)
    10d4:	88 55 e7             	mov    %dl,-0x19(%ebp)
    10d7:	89 04 24             	mov    %eax,(%esp)
    10da:	e8 b9 fd ff ff       	call   e98 <write>
    10df:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
    10e2:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    10e6:	84 d2                	test   %dl,%dl
    10e8:	0f 85 66 ff ff ff    	jne    1054 <printf+0x44>
    10ee:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
    10f0:	83 c4 3c             	add    $0x3c,%esp
    10f3:	5b                   	pop    %ebx
    10f4:	5e                   	pop    %esi
    10f5:	5f                   	pop    %edi
    10f6:	5d                   	pop    %ebp
    10f7:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    10f8:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
    10fb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    10fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1105:	00 
    1106:	89 74 24 04          	mov    %esi,0x4(%esp)
    110a:	89 04 24             	mov    %eax,(%esp)
    110d:	e8 86 fd ff ff       	call   e98 <write>
    1112:	8b 45 0c             	mov    0xc(%ebp),%eax
    1115:	e9 2b ff ff ff       	jmp    1045 <printf+0x35>
    111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
    1120:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1123:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
    1128:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
    112a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1131:	8b 10                	mov    (%eax),%edx
    1133:	8b 45 08             	mov    0x8(%ebp),%eax
    1136:	e8 35 fe ff ff       	call   f70 <printint>
    113b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
    113e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1142:	e9 fe fe ff ff       	jmp    1045 <printf+0x35>
    1147:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
    1148:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    114b:	8b 3a                	mov    (%edx),%edi
				ap++;
    114d:	83 c2 04             	add    $0x4,%edx
    1150:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
    1153:	85 ff                	test   %edi,%edi
    1155:	0f 84 ba 00 00 00    	je     1215 <printf+0x205>
					s = "(null)";
				while(*s != 0){
    115b:	0f b6 17             	movzbl (%edi),%edx
    115e:	84 d2                	test   %dl,%dl
    1160:	74 2d                	je     118f <printf+0x17f>
    1162:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1165:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
    1168:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
    116b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    116e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1175:	00 
    1176:	89 74 24 04          	mov    %esi,0x4(%esp)
    117a:	89 1c 24             	mov    %ebx,(%esp)
    117d:	e8 16 fd ff ff       	call   e98 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
    1182:	0f b6 17             	movzbl (%edi),%edx
    1185:	84 d2                	test   %dl,%dl
    1187:	75 df                	jne    1168 <printf+0x158>
    1189:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    118c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    118f:	31 ff                	xor    %edi,%edi
    1191:	e9 af fe ff ff       	jmp    1045 <printf+0x35>
    1196:	66 90                	xchg   %ax,%ax
    1198:	8b 55 08             	mov    0x8(%ebp),%edx
    119b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
    119d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    11a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a8:	00 
    11a9:	89 74 24 04          	mov    %esi,0x4(%esp)
    11ad:	89 14 24             	mov    %edx,(%esp)
    11b0:	e8 e3 fc ff ff       	call   e98 <write>
    11b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11b8:	e9 88 fe ff ff       	jmp    1045 <printf+0x35>
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
    11c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    11c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
    11c8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
    11cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d2:	8b 10                	mov    (%eax),%edx
    11d4:	8b 45 08             	mov    0x8(%ebp),%eax
    11d7:	e8 94 fd ff ff       	call   f70 <printint>
    11dc:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
    11df:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    11e3:	e9 5d fe ff ff       	jmp    1045 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    11e8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
    11eb:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    11ed:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    11ef:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11f6:	00 
    11f7:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    11fb:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    11fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1201:	89 04 24             	mov    %eax,(%esp)
    1204:	e8 8f fc ff ff       	call   e98 <write>
    1209:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
    120c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1210:	e9 30 fe ff ff       	jmp    1045 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
    1215:	bf 13 19 00 00       	mov    $0x1913,%edi
    121a:	e9 3c ff ff ff       	jmp    115b <printf+0x14b>
    121f:	90                   	nop

00001220 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1220:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1221:	a1 6c 1a 00 00       	mov    0x1a6c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1226:	89 e5                	mov    %esp,%ebp
    1228:	57                   	push   %edi
    1229:	56                   	push   %esi
    122a:	53                   	push   %ebx
    122b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
    122e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1231:	39 c8                	cmp    %ecx,%eax
    1233:	73 1d                	jae    1252 <free+0x32>
    1235:	8d 76 00             	lea    0x0(%esi),%esi
    1238:	8b 10                	mov    (%eax),%edx
    123a:	39 d1                	cmp    %edx,%ecx
    123c:	72 1a                	jb     1258 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    123e:	39 d0                	cmp    %edx,%eax
    1240:	72 08                	jb     124a <free+0x2a>
    1242:	39 c8                	cmp    %ecx,%eax
    1244:	72 12                	jb     1258 <free+0x38>
    1246:	39 d1                	cmp    %edx,%ecx
    1248:	72 0e                	jb     1258 <free+0x38>
    124a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    124c:	39 c8                	cmp    %ecx,%eax
    124e:	66 90                	xchg   %ax,%ax
    1250:	72 e6                	jb     1238 <free+0x18>
    1252:	8b 10                	mov    (%eax),%edx
    1254:	eb e8                	jmp    123e <free+0x1e>
    1256:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1258:	8b 71 04             	mov    0x4(%ecx),%esi
    125b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    125e:	39 d7                	cmp    %edx,%edi
    1260:	74 19                	je     127b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1262:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1265:	8b 50 04             	mov    0x4(%eax),%edx
    1268:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    126b:	39 ce                	cmp    %ecx,%esi
    126d:	74 23                	je     1292 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    126f:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1271:	a3 6c 1a 00 00       	mov    %eax,0x1a6c
}
    1276:	5b                   	pop    %ebx
    1277:	5e                   	pop    %esi
    1278:	5f                   	pop    %edi
    1279:	5d                   	pop    %ebp
    127a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    127b:	03 72 04             	add    0x4(%edx),%esi
    127e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1281:	8b 10                	mov    (%eax),%edx
    1283:	8b 12                	mov    (%edx),%edx
    1285:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1288:	8b 50 04             	mov    0x4(%eax),%edx
    128b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    128e:	39 ce                	cmp    %ecx,%esi
    1290:	75 dd                	jne    126f <free+0x4f>
    p->s.size += bp->s.size;
    1292:	03 51 04             	add    0x4(%ecx),%edx
    1295:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1298:	8b 53 f8             	mov    -0x8(%ebx),%edx
    129b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
    129d:	a3 6c 1a 00 00       	mov    %eax,0x1a6c
}
    12a2:	5b                   	pop    %ebx
    12a3:	5e                   	pop    %esi
    12a4:	5f                   	pop    %edi
    12a5:	5d                   	pop    %ebp
    12a6:	c3                   	ret    
    12a7:	89 f6                	mov    %esi,%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	57                   	push   %edi
    12b4:	56                   	push   %esi
    12b5:	53                   	push   %ebx
    12b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    12bc:	8b 0d 6c 1a 00 00    	mov    0x1a6c,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    12c2:	83 c3 07             	add    $0x7,%ebx
    12c5:	c1 eb 03             	shr    $0x3,%ebx
    12c8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    12cb:	85 c9                	test   %ecx,%ecx
    12cd:	0f 84 93 00 00 00    	je     1366 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12d3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    12d5:	8b 50 04             	mov    0x4(%eax),%edx
    12d8:	39 d3                	cmp    %edx,%ebx
    12da:	76 1f                	jbe    12fb <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
    12dc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    12e3:	90                   	nop
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
    12e8:	3b 05 6c 1a 00 00    	cmp    0x1a6c,%eax
    12ee:	74 30                	je     1320 <malloc+0x70>
    12f0:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12f2:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    12f4:	8b 50 04             	mov    0x4(%eax),%edx
    12f7:	39 d3                	cmp    %edx,%ebx
    12f9:	77 ed                	ja     12e8 <malloc+0x38>
      if(p->s.size == nunits)
    12fb:	39 d3                	cmp    %edx,%ebx
    12fd:	74 61                	je     1360 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    12ff:	29 da                	sub    %ebx,%edx
    1301:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1304:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1307:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    130a:	89 0d 6c 1a 00 00    	mov    %ecx,0x1a6c
      return (void*) (p + 1);
    1310:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1313:	83 c4 1c             	add    $0x1c,%esp
    1316:	5b                   	pop    %ebx
    1317:	5e                   	pop    %esi
    1318:	5f                   	pop    %edi
    1319:	5d                   	pop    %ebp
    131a:	c3                   	ret    
    131b:	90                   	nop
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1320:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
    1326:	b8 00 80 00 00       	mov    $0x8000,%eax
    132b:	bf 00 10 00 00       	mov    $0x1000,%edi
    1330:	76 04                	jbe    1336 <malloc+0x86>
    1332:	89 f0                	mov    %esi,%eax
    1334:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1336:	89 04 24             	mov    %eax,(%esp)
    1339:	e8 c2 fb ff ff       	call   f00 <sbrk>
  if(p == (char*) -1)
    133e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1341:	74 18                	je     135b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1343:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1346:	83 c0 08             	add    $0x8,%eax
    1349:	89 04 24             	mov    %eax,(%esp)
    134c:	e8 cf fe ff ff       	call   1220 <free>
  return freep;
    1351:	8b 0d 6c 1a 00 00    	mov    0x1a6c,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1357:	85 c9                	test   %ecx,%ecx
    1359:	75 97                	jne    12f2 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    135b:	31 c0                	xor    %eax,%eax
    135d:	eb b4                	jmp    1313 <malloc+0x63>
    135f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1360:	8b 10                	mov    (%eax),%edx
    1362:	89 11                	mov    %edx,(%ecx)
    1364:	eb a4                	jmp    130a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1366:	c7 05 6c 1a 00 00 64 	movl   $0x1a64,0x1a6c
    136d:	1a 00 00 
    base.s.size = 0;
    1370:	b9 64 1a 00 00       	mov    $0x1a64,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1375:	c7 05 64 1a 00 00 64 	movl   $0x1a64,0x1a64
    137c:	1a 00 00 
    base.s.size = 0;
    137f:	c7 05 68 1a 00 00 00 	movl   $0x0,0x1a68
    1386:	00 00 00 
    1389:	e9 45 ff ff ff       	jmp    12d3 <malloc+0x23>
    138e:	90                   	nop
    138f:	90                   	nop

00001390 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	53                   	push   %ebx
    1394:	83 ec 14             	sub    $0x14,%esp
    1397:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
    139a:	8b 03                	mov    (%ebx),%eax
    139c:	89 04 24             	mov    %eax,(%esp)
    139f:	e8 b4 fb ff ff       	call   f58 <binary_sem_clear>
	binary_sem_clear(sem->S2);
    13a4:	8b 43 04             	mov    0x4(%ebx),%eax
    13a7:	89 04 24             	mov    %eax,(%esp)
    13aa:	e8 a9 fb ff ff       	call   f58 <binary_sem_clear>
	free(sem);
    13af:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    13b2:	83 c4 14             	add    $0x14,%esp
    13b5:	5b                   	pop    %ebx
    13b6:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
    13b7:	e9 64 fe ff ff       	jmp    1220 <free>
    13bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013c0 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	83 ec 18             	sub    $0x18,%esp
    13c6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    13c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
    13cf:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
    13d2:	8b 43 04             	mov    0x4(%ebx),%eax
    13d5:	89 04 24             	mov    %eax,(%esp)
    13d8:	e8 6b fb ff ff       	call   f48 <binary_sem_down>
	binary_sem_down(sem->S1);
    13dd:	8b 03                	mov    (%ebx),%eax
    13df:	89 04 24             	mov    %eax,(%esp)
    13e2:	e8 61 fb ff ff       	call   f48 <binary_sem_down>
	sem->value -= num;
    13e7:	8b 43 08             	mov    0x8(%ebx),%eax
    13ea:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
    13ec:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
    13ee:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
    13f1:	74 0b                	je     13fe <sem_downs+0x3e>
		binary_sem_up(sem->S2);
    13f3:	8b 43 04             	mov    0x4(%ebx),%eax
    13f6:	89 04 24             	mov    %eax,(%esp)
    13f9:	e8 52 fb ff ff       	call   f50 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    13fe:	8b 03                	mov    (%ebx),%eax
}
    1400:	8b 75 fc             	mov    -0x4(%ebp),%esi
    1403:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1406:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1409:	89 ec                	mov    %ebp,%esp
    140b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    140c:	e9 3f fb ff ff       	jmp    f50 <binary_sem_up>
    1411:	eb 0d                	jmp    1420 <sem_down>
    1413:	90                   	nop
    1414:	90                   	nop
    1415:	90                   	nop
    1416:	90                   	nop
    1417:	90                   	nop
    1418:	90                   	nop
    1419:	90                   	nop
    141a:	90                   	nop
    141b:	90                   	nop
    141c:	90                   	nop
    141d:	90                   	nop
    141e:	90                   	nop
    141f:	90                   	nop

00001420 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	53                   	push   %ebx
    1424:	83 ec 14             	sub    $0x14,%esp
    1427:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
    142a:	8b 43 04             	mov    0x4(%ebx),%eax
    142d:	89 04 24             	mov    %eax,(%esp)
    1430:	e8 13 fb ff ff       	call   f48 <binary_sem_down>
	binary_sem_down(sem->S1);
    1435:	8b 03                	mov    (%ebx),%eax
    1437:	89 04 24             	mov    %eax,(%esp)
    143a:	e8 09 fb ff ff       	call   f48 <binary_sem_down>
	sem->value--;
    143f:	8b 43 08             	mov    0x8(%ebx),%eax
    1442:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
    1445:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
    1447:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
    144a:	74 0b                	je     1457 <sem_down+0x37>
		binary_sem_up(sem->S2);
    144c:	8b 43 04             	mov    0x4(%ebx),%eax
    144f:	89 04 24             	mov    %eax,(%esp)
    1452:	e8 f9 fa ff ff       	call   f50 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    1457:	8b 03                	mov    (%ebx),%eax
    1459:	89 45 08             	mov    %eax,0x8(%ebp)
}
    145c:	83 c4 14             	add    $0x14,%esp
    145f:	5b                   	pop    %ebx
    1460:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1461:	e9 ea fa ff ff       	jmp    f50 <binary_sem_up>
    1466:	8d 76 00             	lea    0x0(%esi),%esi
    1469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001470 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	83 ec 18             	sub    $0x18,%esp
    1476:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    1479:	8b 5d 08             	mov    0x8(%ebp),%ebx
    147c:	89 75 fc             	mov    %esi,-0x4(%ebp)
    147f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
    1482:	8b 03                	mov    (%ebx),%eax
    1484:	89 04 24             	mov    %eax,(%esp)
    1487:	e8 bc fa ff ff       	call   f48 <binary_sem_down>
	sem->value+= num;
    148c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
    148f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
    1492:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
    1495:	74 19                	je     14b0 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1497:	8b 03                	mov    (%ebx),%eax
}
    1499:	8b 75 fc             	mov    -0x4(%ebp),%esi
    149c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    149f:	89 45 08             	mov    %eax,0x8(%ebp)
}
    14a2:	89 ec                	mov    %ebp,%esp
    14a4:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    14a5:	e9 a6 fa ff ff       	jmp    f50 <binary_sem_up>
    14aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
    14b0:	8b 43 04             	mov    0x4(%ebx),%eax
    14b3:	89 04 24             	mov    %eax,(%esp)
    14b6:	e8 95 fa ff ff       	call   f50 <binary_sem_up>
    14bb:	eb da                	jmp    1497 <sem_ups+0x27>
    14bd:	8d 76 00             	lea    0x0(%esi),%esi

000014c0 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
    14c3:	53                   	push   %ebx
    14c4:	83 ec 14             	sub    $0x14,%esp
    14c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
    14ca:	8b 03                	mov    (%ebx),%eax
    14cc:	89 04 24             	mov    %eax,(%esp)
    14cf:	e8 74 fa ff ff       	call   f48 <binary_sem_down>
	sem->value++;
    14d4:	8b 43 08             	mov    0x8(%ebx),%eax
    14d7:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
    14da:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
    14dd:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
    14e0:	74 16                	je     14f8 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    14e2:	8b 03                	mov    (%ebx),%eax
    14e4:	89 45 08             	mov    %eax,0x8(%ebp)
}
    14e7:	83 c4 14             	add    $0x14,%esp
    14ea:	5b                   	pop    %ebx
    14eb:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    14ec:	e9 5f fa ff ff       	jmp    f50 <binary_sem_up>
    14f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
    14f8:	8b 43 04             	mov    0x4(%ebx),%eax
    14fb:	89 04 24             	mov    %eax,(%esp)
    14fe:	e8 4d fa ff ff       	call   f50 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    1503:	8b 03                	mov    (%ebx),%eax
    1505:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1508:	83 c4 14             	add    $0x14,%esp
    150b:	5b                   	pop    %ebx
    150c:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    150d:	e9 3e fa ff ff       	jmp    f50 <binary_sem_up>
    1512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001520 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    1526:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
    152d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    1530:	89 75 f8             	mov    %esi,-0x8(%ebp)
    1533:	89 7d fc             	mov    %edi,-0x4(%ebp)
    1536:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    1539:	e8 72 fd ff ff       	call   12b0 <malloc>
	ret->value = initial_semaphore_value;
    153e:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    1541:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
    1543:	e8 f8 f9 ff ff       	call   f40 <binary_sem_create>
    1548:	89 03                	mov    %eax,(%ebx)
    154a:	89 c6                	mov    %eax,%esi
    154c:	e8 ef f9 ff ff       	call   f40 <binary_sem_create>
    1551:	01 c6                	add    %eax,%esi
    1553:	89 43 04             	mov    %eax,0x4(%ebx)
    1556:	78 20                	js     1578 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
    1558:	85 ff                	test   %edi,%edi
    155a:	75 08                	jne    1564 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
    155c:	89 04 24             	mov    %eax,(%esp)
    155f:	e8 e4 f9 ff ff       	call   f48 <binary_sem_down>
	}
	return ret;
}
    1564:	89 d8                	mov    %ebx,%eax
    1566:	8b 75 f8             	mov    -0x8(%ebp),%esi
    1569:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    156c:	8b 7d fc             	mov    -0x4(%ebp),%edi
    156f:	89 ec                	mov    %ebp,%esp
    1571:	5d                   	pop    %ebp
    1572:	c3                   	ret    
    1573:	90                   	nop
    1574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
    1578:	c7 44 24 04 2c 19 00 	movl   $0x192c,0x4(%esp)
    157f:	00 
    1580:	31 db                	xor    %ebx,%ebx
    1582:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1589:	e8 82 fa ff ff       	call   1010 <printf>
		return 0;
    158e:	eb d4                	jmp    1564 <semaphore_create+0x44>

00001590 <semaphore_clear>:
	binary_sem_up(bb->mutex);
	sem_up(bb->empty);
	return element;
}

void semaphore_clear(struct BB* bb) {
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	53                   	push   %ebx
    1594:	83 ec 14             	sub    $0x14,%esp
    1597:	8b 5d 08             	mov    0x8(%ebp),%ebx
	free(bb->buffer);
    159a:	8b 43 0c             	mov    0xc(%ebx),%eax
    159d:	89 04 24             	mov    %eax,(%esp)
    15a0:	e8 7b fc ff ff       	call   1220 <free>
	sem_clear(bb->empty);
    15a5:	8b 43 04             	mov    0x4(%ebx),%eax
    15a8:	89 04 24             	mov    %eax,(%esp)
    15ab:	e8 e0 fd ff ff       	call   1390 <sem_clear>
	sem_clear(bb->full);
    15b0:	8b 43 08             	mov    0x8(%ebx),%eax
    15b3:	89 04 24             	mov    %eax,(%esp)
    15b6:	e8 d5 fd ff ff       	call   1390 <sem_clear>
	binary_sem_clear(bb->mutex);
    15bb:	8b 03                	mov    (%ebx),%eax
    15bd:	89 04 24             	mov    %eax,(%esp)
    15c0:	e8 93 f9 ff ff       	call   f58 <binary_sem_clear>
	free(bb);
    15c5:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    15c8:	83 c4 14             	add    $0x14,%esp
    15cb:	5b                   	pop    %ebx
    15cc:	5d                   	pop    %ebp
void semaphore_clear(struct BB* bb) {
	free(bb->buffer);
	sem_clear(bb->empty);
	sem_clear(bb->full);
	binary_sem_clear(bb->mutex);
	free(bb);
    15cd:	e9 4e fc ff ff       	jmp    1220 <free>
    15d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015e0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
    15e6:	8b 45 08             	mov    0x8(%ebp),%eax
    15e9:	8b 00                	mov    (%eax),%eax
    15eb:	89 45 08             	mov    %eax,0x8(%ebp)
}
    15ee:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
    15ef:	e9 5c f9 ff ff       	jmp    f50 <binary_sem_up>
    15f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001600 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
    1600:	55                   	push   %ebp
    1601:	89 e5                	mov    %esp,%ebp
    1603:	56                   	push   %esi
    1604:	53                   	push   %ebx
    1605:	83 ec 10             	sub    $0x10,%esp
    1608:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
    160b:	8b 43 08             	mov    0x8(%ebx),%eax
    160e:	89 04 24             	mov    %eax,(%esp)
    1611:	e8 0a fe ff ff       	call   1420 <sem_down>
	binary_sem_down(bb->mutex);
    1616:	8b 03                	mov    (%ebx),%eax
    1618:	89 04 24             	mov    %eax,(%esp)
    161b:	e8 28 f9 ff ff       	call   f48 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
    1620:	8b 43 14             	mov    0x14(%ebx),%eax
    1623:	c1 e0 02             	shl    $0x2,%eax
    1626:	03 43 0c             	add    0xc(%ebx),%eax
    1629:	8b 30                	mov    (%eax),%esi
    162b:	85 f6                	test   %esi,%esi
    162d:	74 42                	je     1671 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
    162f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
    1635:	8b 53 18             	mov    0x18(%ebx),%edx
    1638:	8b 43 14             	mov    0x14(%ebx),%eax
    163b:	83 ea 01             	sub    $0x1,%edx
    163e:	39 d0                	cmp    %edx,%eax
    1640:	74 26                	je     1668 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
    1642:	83 c0 01             	add    $0x1,%eax
    1645:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
    1648:	8b 03                	mov    (%ebx),%eax
    164a:	89 04 24             	mov    %eax,(%esp)
    164d:	e8 fe f8 ff ff       	call   f50 <binary_sem_up>
	sem_up(bb->empty);
    1652:	8b 43 04             	mov    0x4(%ebx),%eax
    1655:	89 04 24             	mov    %eax,(%esp)
    1658:	e8 63 fe ff ff       	call   14c0 <sem_up>
	return element;
}
    165d:	83 c4 10             	add    $0x10,%esp
    1660:	89 f0                	mov    %esi,%eax
    1662:	5b                   	pop    %ebx
    1663:	5e                   	pop    %esi
    1664:	5d                   	pop    %ebp
    1665:	c3                   	ret    
    1666:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
    1668:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    166f:	eb d7                	jmp    1648 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
    1671:	c7 44 24 04 54 19 00 	movl   $0x1954,0x4(%esp)
    1678:	00 
    1679:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1680:	e8 8b f9 ff ff       	call   1010 <printf>
    1685:	eb c1                	jmp    1648 <semaphore_pop+0x48>
    1687:	89 f6                	mov    %esi,%esi
    1689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001690 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
    1690:	55                   	push   %ebp
    1691:	89 e5                	mov    %esp,%ebp
    1693:	56                   	push   %esi
    1694:	53                   	push   %ebx
    1695:	83 ec 10             	sub    $0x10,%esp
    1698:	8b 5d 08             	mov    0x8(%ebp),%ebx
    169b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    169e:	8b 43 04             	mov    0x4(%ebx),%eax
    16a1:	89 04 24             	mov    %eax,(%esp)
    16a4:	e8 77 fd ff ff       	call   1420 <sem_down>
	binary_sem_down(bb->mutex);
    16a9:	8b 03                	mov    (%ebx),%eax
    16ab:	89 04 24             	mov    %eax,(%esp)
    16ae:	e8 95 f8 ff ff       	call   f48 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    16b3:	8b 43 10             	mov    0x10(%ebx),%eax
    16b6:	c1 e0 02             	shl    $0x2,%eax
    16b9:	03 43 0c             	add    0xc(%ebx),%eax
    16bc:	8b 10                	mov    (%eax),%edx
    16be:	85 d2                	test   %edx,%edx
    16c0:	74 26                	je     16e8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    16c2:	c7 44 24 04 98 19 00 	movl   $0x1998,0x4(%esp)
    16c9:	00 
    16ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    16d1:	e8 3a f9 ff ff       	call   1010 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    16d6:	8b 43 08             	mov    0x8(%ebx),%eax
    16d9:	89 45 08             	mov    %eax,0x8(%ebp)
}
    16dc:	83 c4 10             	add    $0x10,%esp
    16df:	5b                   	pop    %ebx
    16e0:	5e                   	pop    %esi
    16e1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    16e2:	e9 d9 fd ff ff       	jmp    14c0 <sem_up>
    16e7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    16e8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    16ea:	8b 53 18             	mov    0x18(%ebx),%edx
    16ed:	8b 43 10             	mov    0x10(%ebx),%eax
    16f0:	83 ea 01             	sub    $0x1,%edx
    16f3:	39 d0                	cmp    %edx,%eax
    16f5:	74 09                	je     1700 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    16f7:	83 c0 01             	add    $0x1,%eax
    16fa:	89 43 10             	mov    %eax,0x10(%ebx)
    16fd:	eb d7                	jmp    16d6 <semaphore_put_atomic+0x46>
    16ff:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    1700:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    1707:	eb cd                	jmp    16d6 <semaphore_put_atomic+0x46>
    1709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001710 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
    1710:	55                   	push   %ebp
    1711:	89 e5                	mov    %esp,%ebp
    1713:	56                   	push   %esi
    1714:	53                   	push   %ebx
    1715:	83 ec 10             	sub    $0x10,%esp
    1718:	8b 5d 08             	mov    0x8(%ebp),%ebx
    171b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    171e:	8b 43 04             	mov    0x4(%ebx),%eax
    1721:	89 04 24             	mov    %eax,(%esp)
    1724:	e8 f7 fc ff ff       	call   1420 <sem_down>
	binary_sem_down(bb->mutex);
    1729:	8b 03                	mov    (%ebx),%eax
    172b:	89 04 24             	mov    %eax,(%esp)
    172e:	e8 15 f8 ff ff       	call   f48 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    1733:	8b 43 10             	mov    0x10(%ebx),%eax
    1736:	c1 e0 02             	shl    $0x2,%eax
    1739:	03 43 0c             	add    0xc(%ebx),%eax
    173c:	8b 08                	mov    (%eax),%ecx
    173e:	85 c9                	test   %ecx,%ecx
    1740:	74 36                	je     1778 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    1742:	c7 44 24 04 98 19 00 	movl   $0x1998,0x4(%esp)
    1749:	00 
    174a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1751:	e8 ba f8 ff ff       	call   1010 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
    1756:	8b 03                	mov    (%ebx),%eax
    1758:	89 04 24             	mov    %eax,(%esp)
    175b:	e8 f0 f7 ff ff       	call   f50 <binary_sem_up>
	sem_up(bb->full);
    1760:	8b 43 08             	mov    0x8(%ebx),%eax
    1763:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1766:	83 c4 10             	add    $0x10,%esp
    1769:	5b                   	pop    %ebx
    176a:	5e                   	pop    %esi
    176b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
    176c:	e9 4f fd ff ff       	jmp    14c0 <sem_up>
    1771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    1778:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    177a:	8b 53 18             	mov    0x18(%ebx),%edx
    177d:	8b 43 10             	mov    0x10(%ebx),%eax
    1780:	83 ea 01             	sub    $0x1,%edx
    1783:	39 d0                	cmp    %edx,%eax
    1785:	74 09                	je     1790 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    1787:	83 c0 01             	add    $0x1,%eax
    178a:	89 43 10             	mov    %eax,0x10(%ebx)
    178d:	eb c7                	jmp    1756 <semaphore_put+0x46>
    178f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    1790:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    1797:	eb bd                	jmp    1756 <semaphore_put+0x46>
    1799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000017a0 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	83 ec 18             	sub    $0x18,%esp
    17a6:	89 75 fc             	mov    %esi,-0x4(%ebp)
    17a9:	8b 75 08             	mov    0x8(%ebp),%esi
    17ac:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
    17af:	85 f6                	test   %esi,%esi
    17b1:	79 15                	jns    17c8 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    17b3:	31 db                	xor    %ebx,%ebx
}
    17b5:	89 d8                	mov    %ebx,%eax
    17b7:	8b 75 fc             	mov    -0x4(%ebp),%esi
    17ba:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    17bd:	89 ec                	mov    %ebp,%esp
    17bf:	5d                   	pop    %ebp
    17c0:	c3                   	ret    
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
    17c8:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
    17cf:	e8 dc fa ff ff       	call   12b0 <malloc>
    17d4:	85 c0                	test   %eax,%eax
    17d6:	89 c3                	mov    %eax,%ebx
    17d8:	74 db                	je     17b5 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
    17da:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
    17e1:	89 04 24             	mov    %eax,(%esp)
    17e4:	e8 c7 fa ff ff       	call   12b0 <malloc>
    17e9:	85 c0                	test   %eax,%eax
    17eb:	89 43 0c             	mov    %eax,0xc(%ebx)
    17ee:	74 c3                	je     17b3 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
    17f0:	89 34 24             	mov    %esi,(%esp)
    17f3:	e8 28 fd ff ff       	call   1520 <semaphore_create>
    17f8:	85 c0                	test   %eax,%eax
    17fa:	89 43 04             	mov    %eax,0x4(%ebx)
    17fd:	74 b4                	je     17b3 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
    17ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1806:	e8 15 fd ff ff       	call   1520 <semaphore_create>
    180b:	85 c0                	test   %eax,%eax
    180d:	89 43 08             	mov    %eax,0x8(%ebx)
    1810:	74 a1                	je     17b3 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
    1812:	e8 29 f7 ff ff       	call   f40 <binary_sem_create>
	ret->produce = 0;
    1817:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
    181e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
    1825:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
    1828:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    182a:	eb 89                	jmp    17b5 <BB_create+0x15>
