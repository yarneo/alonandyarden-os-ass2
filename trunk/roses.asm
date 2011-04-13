
_roses:     file format elf32-i386


Disassembly of section .text:

00000000 <charCat>:
	}
}


void
charCat(char* str, char c) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
	char* point = str;
	while((*point) != '\0') {
       3:	8b 45 08             	mov    0x8(%ebp),%eax
	}
}


void
charCat(char* str, char c) {
       6:	0f b6 55 0c          	movzbl 0xc(%ebp),%edx
	char* point = str;
	while((*point) != '\0') {
       a:	80 38 00             	cmpb   $0x0,(%eax)
       d:	74 09                	je     18 <charCat+0x18>
       f:	90                   	nop
		point++;
      10:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
      13:	80 38 00             	cmpb   $0x0,(%eax)
      16:	75 f8                	jne    10 <charCat+0x10>
		point++;
	}
	(*point) = c;
      18:	88 10                	mov    %dl,(%eax)
	point++;
	(*point) = '\0';
      1a:	c6 40 01 00          	movb   $0x0,0x1(%eax)
}
      1e:	5d                   	pop    %ebp
      1f:	c3                   	ret    

00000020 <addNewRequest>:
		return -1;
	}
	return 0;
}

void addNewRequest( Request* newReq) {
      20:	55                   	push   %ebp
      21:	89 e5                	mov    %esp,%ebp
      23:	83 ec 18             	sub    $0x18,%esp
	semaphore_put(RBB,(void*)newReq);
      26:	8b 45 08             	mov    0x8(%ebp),%eax
      29:	89 44 24 04          	mov    %eax,0x4(%esp)
      2d:	a1 f4 18 00 00       	mov    0x18f4,%eax
      32:	89 04 24             	mov    %eax,(%esp)
      35:	e8 56 15 00 00       	call   1590 <semaphore_put>
}
      3a:	c9                   	leave  
      3b:	c3                   	ret    
      3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <readFromFile>:
	(*point) = '\0';
}

void
readFromFile()
{
      40:	55                   	push   %ebp
      41:	89 e5                	mov    %esp,%ebp
      43:	57                   	push   %edi
      44:	56                   	push   %esi
      45:	53                   	push   %ebx
      46:	83 ec 7c             	sub    $0x7c,%esp
	int counter = 0;
	int flag = 0;
	char Bstr[11] = "\0";
      49:	0f b7 05 15 17 00 00 	movzwl 0x1715,%eax
      50:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
      57:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
      5e:	c6 45 e6 00          	movb   $0x0,-0x1a(%ebp)
      62:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	char Hstr[11] = "\0";;
      66:	66 89 45 d1          	mov    %ax,-0x2f(%ebp)
      6a:	c7 45 d3 00 00 00 00 	movl   $0x0,-0x2d(%ebp)
      71:	c7 45 d7 00 00 00 00 	movl   $0x0,-0x29(%ebp)
      78:	c6 45 db 00          	movb   $0x0,-0x25(%ebp)
	char Rstr[11] = "\0";;
      7c:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
      80:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
      87:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
      8e:	c6 45 d0 00          	movb   $0x0,-0x30(%ebp)
	char Cstr[11] = "\0";;
      92:	66 89 45 bb          	mov    %ax,-0x45(%ebp)
      96:	c7 45 bd 00 00 00 00 	movl   $0x0,-0x43(%ebp)
      9d:	c7 45 c1 00 00 00 00 	movl   $0x0,-0x3f(%ebp)
      a4:	c6 45 c5 00          	movb   $0x0,-0x3b(%ebp)
	char totalRequestsstr[11];
	int fd = open("configuration.conf",O_RDONLY);
      a8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      af:	00 
      b0:	c7 04 24 b0 16 00 00 	movl   $0x16b0,(%esp)
      b7:	e8 7c 0c 00 00       	call   d38 <open>
	if(fd < 0) {
      bc:	85 c0                	test   %eax,%eax
	char Bstr[11] = "\0";
	char Hstr[11] = "\0";;
	char Rstr[11] = "\0";;
	char Cstr[11] = "\0";;
	char totalRequestsstr[11];
	int fd = open("configuration.conf",O_RDONLY);
      be:	89 c6                	mov    %eax,%esi
	if(fd < 0) {
      c0:	0f 88 05 02 00 00    	js     2cb <readFromFile+0x28b>
      c6:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
      cd:	8d 7d e7             	lea    -0x19(%ebp),%edi
		printf(2,"problem opening file");
		exit();
	}
	char readbuf;
	while(read(fd,&readbuf,1) > 0)
      d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
      d7:	00 
      d8:	89 7c 24 04          	mov    %edi,0x4(%esp)
      dc:	89 34 24             	mov    %esi,(%esp)
      df:	e8 2c 0c 00 00       	call   d10 <read>
      e4:	85 c0                	test   %eax,%eax
      e6:	0f 8e bc 00 00 00    	jle    1a8 <readFromFile+0x168>
	{
		if(readbuf == 'B') {
      ec:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
      f0:	80 fa 42             	cmp    $0x42,%dl
      f3:	0f 84 af 01 00 00    	je     2a8 <readFromFile+0x268>
			flag = 1;
			counter++;
		}
		if(readbuf == 'H') {
      f9:	80 fa 48             	cmp    $0x48,%dl
      fc:	0f 84 96 01 00 00    	je     298 <readFromFile+0x258>
			flag = 2;
			counter++;
		}
		if(readbuf == 'R') {
     102:	80 fa 52             	cmp    $0x52,%dl
     105:	0f 85 ad 01 00 00    	jne    2b8 <readFromFile+0x278>
			flag = 3;
			counter++;
     10b:	83 45 94 01          	addl   $0x1,-0x6c(%ebp)
     10f:	bb 03 00 00 00       	mov    $0x3,%ebx
     114:	eb 06                	jmp    11c <readFromFile+0xdc>
     116:	66 90                	xchg   %ax,%ax
				counter++;
			}
		}
		if(flag > 0) { //if one of the conditions above apply, we need to extract the number
			while((readbuf < '0') || (readbuf > '9')) { //read untill we reach a number
				if(read(fd,&readbuf,1) <= 0)
     118:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
				flag = 5;
				counter++;
			}
		}
		if(flag > 0) { //if one of the conditions above apply, we need to extract the number
			while((readbuf < '0') || (readbuf > '9')) { //read untill we reach a number
     11c:	8d 42 d0             	lea    -0x30(%edx),%eax
     11f:	3c 09                	cmp    $0x9,%al
     121:	76 21                	jbe    144 <readFromFile+0x104>
				if(read(fd,&readbuf,1) <= 0)
     123:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     12a:	00 
     12b:	89 7c 24 04          	mov    %edi,0x4(%esp)
     12f:	89 34 24             	mov    %esi,(%esp)
     132:	e8 d9 0b 00 00       	call   d10 <read>
     137:	85 c0                	test   %eax,%eax
     139:	7f dd                	jg     118 <readFromFile+0xd8>
     13b:	90                   	nop
     13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
				if(flag == 4)
					charCat(Cstr,readbuf);
				if(flag == 5)
					charCat(totalRequestsstr,readbuf);

				if(read(fd,&readbuf,1) <= 0)
     140:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
		if(flag > 0) { //if one of the conditions above apply, we need to extract the number
			while((readbuf < '0') || (readbuf > '9')) { //read untill we reach a number
				if(read(fd,&readbuf,1) <= 0)
					break;
			}
			while((readbuf >= '0') && (readbuf <= '9')) { //when we reach an number, we read it and concat it to a string
     144:	8d 42 d0             	lea    -0x30(%edx),%eax
     147:	3c 09                	cmp    $0x9,%al
     149:	77 53                	ja     19e <readFromFile+0x15e>
				if(flag == 1)
     14b:	83 fb 01             	cmp    $0x1,%ebx
     14e:	0f 84 d4 00 00 00    	je     228 <readFromFile+0x1e8>
					charCat(Bstr,readbuf);
				if(flag == 2)
     154:	83 fb 02             	cmp    $0x2,%ebx
     157:	0f 84 ab 00 00 00    	je     208 <readFromFile+0x1c8>
					charCat(Hstr,readbuf);
				if(flag == 3)
     15d:	83 fb 03             	cmp    $0x3,%ebx
     160:	0f 85 e2 00 00 00    	jne    248 <readFromFile+0x208>


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     166:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
     16a:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     16d:	8d 76 00             	lea    0x0(%esi),%esi
     170:	74 0e                	je     180 <readFromFile+0x140>
     172:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		point++;
     178:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     17b:	80 38 00             	cmpb   $0x0,(%eax)
     17e:	75 f8                	jne    178 <readFromFile+0x138>
		point++;
	}
	(*point) = c;
     180:	88 10                	mov    %dl,(%eax)
	point++;
	(*point) = '\0';
     182:	c6 40 01 00          	movb   $0x0,0x1(%eax)
				if(flag == 4)
					charCat(Cstr,readbuf);
				if(flag == 5)
					charCat(totalRequestsstr,readbuf);

				if(read(fd,&readbuf,1) <= 0)
     186:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     18d:	00 
     18e:	89 7c 24 04          	mov    %edi,0x4(%esp)
     192:	89 34 24             	mov    %esi,(%esp)
     195:	e8 76 0b 00 00       	call   d10 <read>
     19a:	85 c0                	test   %eax,%eax
     19c:	7f a2                	jg     140 <readFromFile+0x100>
					break;
			}
			flag = 0;
		}
		if(counter >=5) {//if we read all 5 numbers we stop
     19e:	83 7d 94 04          	cmpl   $0x4,-0x6c(%ebp)
     1a2:	0f 8e 28 ff ff ff    	jle    d0 <readFromFile+0x90>
			break;
		}
	}
	B = atoi(Bstr);
     1a8:	8d 45 dc             	lea    -0x24(%ebp),%eax
     1ab:	89 04 24             	mov    %eax,(%esp)
     1ae:	e8 1d 0a 00 00       	call   bd0 <atoi>
     1b3:	a3 0c 19 00 00       	mov    %eax,0x190c
	H = atoi(Hstr);
     1b8:	8d 45 d1             	lea    -0x2f(%ebp),%eax
     1bb:	89 04 24             	mov    %eax,(%esp)
     1be:	e8 0d 0a 00 00       	call   bd0 <atoi>
     1c3:	a3 18 19 00 00       	mov    %eax,0x1918
	R = atoi(Rstr);
     1c8:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     1cb:	89 04 24             	mov    %eax,(%esp)
     1ce:	e8 fd 09 00 00       	call   bd0 <atoi>
     1d3:	a3 1c 19 00 00       	mov    %eax,0x191c
	C = atoi(Cstr);
     1d8:	8d 45 bb             	lea    -0x45(%ebp),%eax
     1db:	89 04 24             	mov    %eax,(%esp)
     1de:	e8 ed 09 00 00       	call   bd0 <atoi>
     1e3:	a3 14 19 00 00       	mov    %eax,0x1914
	totalRequests = atoi(totalRequestsstr);
     1e8:	8d 45 b0             	lea    -0x50(%ebp),%eax
     1eb:	89 04 24             	mov    %eax,(%esp)
     1ee:	e8 dd 09 00 00       	call   bd0 <atoi>
	close(fd);
     1f3:	89 34 24             	mov    %esi,(%esp)
	}
	B = atoi(Bstr);
	H = atoi(Hstr);
	R = atoi(Rstr);
	C = atoi(Cstr);
	totalRequests = atoi(totalRequestsstr);
     1f6:	a3 f0 18 00 00       	mov    %eax,0x18f0
	close(fd);
     1fb:	e8 20 0b 00 00       	call   d20 <close>
}
     200:	83 c4 7c             	add    $0x7c,%esp
     203:	5b                   	pop    %ebx
     204:	5e                   	pop    %esi
     205:	5f                   	pop    %edi
     206:	5d                   	pop    %ebp
     207:	c3                   	ret    


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     208:	80 7d d1 00          	cmpb   $0x0,-0x2f(%ebp)
     20c:	8d 45 d1             	lea    -0x2f(%ebp),%eax
     20f:	0f 84 6b ff ff ff    	je     180 <readFromFile+0x140>
     215:	8d 76 00             	lea    0x0(%esi),%esi
		point++;
     218:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     21b:	80 38 00             	cmpb   $0x0,(%eax)
     21e:	75 f8                	jne    218 <readFromFile+0x1d8>
     220:	e9 5b ff ff ff       	jmp    180 <readFromFile+0x140>
     225:	8d 76 00             	lea    0x0(%esi),%esi
     228:	80 7d dc 00          	cmpb   $0x0,-0x24(%ebp)
     22c:	8d 45 dc             	lea    -0x24(%ebp),%eax
     22f:	90                   	nop
     230:	0f 84 4a ff ff ff    	je     180 <readFromFile+0x140>
     236:	66 90                	xchg   %ax,%ax
		point++;
     238:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     23b:	80 38 00             	cmpb   $0x0,(%eax)
     23e:	66 90                	xchg   %ax,%ax
     240:	75 f6                	jne    238 <readFromFile+0x1f8>
     242:	e9 39 ff ff ff       	jmp    180 <readFromFile+0x140>
     247:	90                   	nop
					charCat(Bstr,readbuf);
				if(flag == 2)
					charCat(Hstr,readbuf);
				if(flag == 3)
					charCat(Rstr,readbuf);
				if(flag == 4)
     248:	83 fb 04             	cmp    $0x4,%ebx
     24b:	90                   	nop
     24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     250:	75 1b                	jne    26d <readFromFile+0x22d>


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     252:	80 7d bb 00          	cmpb   $0x0,-0x45(%ebp)
     256:	8d 45 bb             	lea    -0x45(%ebp),%eax
     259:	0f 84 21 ff ff ff    	je     180 <readFromFile+0x140>
     25f:	90                   	nop
		point++;
     260:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     263:	80 38 00             	cmpb   $0x0,(%eax)
     266:	75 f8                	jne    260 <readFromFile+0x220>
     268:	e9 13 ff ff ff       	jmp    180 <readFromFile+0x140>
					charCat(Hstr,readbuf);
				if(flag == 3)
					charCat(Rstr,readbuf);
				if(flag == 4)
					charCat(Cstr,readbuf);
				if(flag == 5)
     26d:	83 fb 05             	cmp    $0x5,%ebx
     270:	0f 85 10 ff ff ff    	jne    186 <readFromFile+0x146>


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     276:	80 7d b0 00          	cmpb   $0x0,-0x50(%ebp)
     27a:	8d 45 b0             	lea    -0x50(%ebp),%eax
     27d:	8d 76 00             	lea    0x0(%esi),%esi
     280:	0f 84 fa fe ff ff    	je     180 <readFromFile+0x140>
     286:	66 90                	xchg   %ax,%ax
		point++;
     288:	83 c0 01             	add    $0x1,%eax


void
charCat(char* str, char c) {
	char* point = str;
	while((*point) != '\0') {
     28b:	80 38 00             	cmpb   $0x0,(%eax)
     28e:	75 f8                	jne    288 <readFromFile+0x248>
     290:	e9 eb fe ff ff       	jmp    180 <readFromFile+0x140>
     295:	8d 76 00             	lea    0x0(%esi),%esi
			flag = 1;
			counter++;
		}
		if(readbuf == 'H') {
			flag = 2;
			counter++;
     298:	83 45 94 01          	addl   $0x1,-0x6c(%ebp)
     29c:	bb 02 00 00 00       	mov    $0x2,%ebx
     2a1:	e9 72 fe ff ff       	jmp    118 <readFromFile+0xd8>
     2a6:	66 90                	xchg   %ax,%ax
	char readbuf;
	while(read(fd,&readbuf,1) > 0)
	{
		if(readbuf == 'B') {
			flag = 1;
			counter++;
     2a8:	83 45 94 01          	addl   $0x1,-0x6c(%ebp)
     2ac:	bb 01 00 00 00       	mov    $0x1,%ebx
     2b1:	e9 62 fe ff ff       	jmp    118 <readFromFile+0xd8>
     2b6:	66 90                	xchg   %ax,%ax
		}
		if(readbuf == 'R') {
			flag = 3;
			counter++;
		}
		if(readbuf == 'C') {
     2b8:	80 fa 43             	cmp    $0x43,%dl
     2bb:	75 27                	jne    2e4 <readFromFile+0x2a4>
			flag = 4;
			counter++;
     2bd:	83 45 94 01          	addl   $0x1,-0x6c(%ebp)
     2c1:	bb 04 00 00 00       	mov    $0x4,%ebx
     2c6:	e9 51 fe ff ff       	jmp    11c <readFromFile+0xdc>
	char Rstr[11] = "\0";;
	char Cstr[11] = "\0";;
	char totalRequestsstr[11];
	int fd = open("configuration.conf",O_RDONLY);
	if(fd < 0) {
		printf(2,"problem opening file");
     2cb:	c7 44 24 04 c3 16 00 	movl   $0x16c3,0x4(%esp)
     2d2:	00 
     2d3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2da:	e8 b1 0b 00 00       	call   e90 <printf>
		exit();
     2df:	e8 14 0a 00 00       	call   cf8 <exit>
		}
		if(readbuf == 'C') {
			flag = 4;
			counter++;
		}
		if(readbuf == 't') {
     2e4:	80 fa 74             	cmp    $0x74,%dl
     2e7:	0f 85 b1 fe ff ff    	jne    19e <readFromFile+0x15e>
			char teststr[12];
			read(fd,teststr,12);
     2ed:	8d 45 a4             	lea    -0x5c(%ebp),%eax
     2f0:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     2f7:	00 
     2f8:	89 44 24 04          	mov    %eax,0x4(%esp)
     2fc:	89 34 24             	mov    %esi,(%esp)
     2ff:	e8 0c 0a 00 00       	call   d10 <read>
			if(strcmp(teststr, "otalRequests")==0) {
     304:	8d 45 a4             	lea    -0x5c(%ebp),%eax
     307:	c7 44 24 04 d8 16 00 	movl   $0x16d8,0x4(%esp)
     30e:	00 
     30f:	89 04 24             	mov    %eax,(%esp)
     312:	e8 e9 07 00 00       	call   b00 <strcmp>
     317:	85 c0                	test   %eax,%eax
     319:	0f 85 7f fe ff ff    	jne    19e <readFromFile+0x15e>
				flag = 5;
				counter++;
     31f:	83 45 94 01          	addl   $0x1,-0x6c(%ebp)
     323:	bb 05 00 00 00       	mov    $0x5,%ebx
     328:	0f b6 55 e7          	movzbl -0x19(%ebp),%edx
     32c:	e9 eb fd ff ff       	jmp    11c <readFromFile+0xdc>
     331:	eb 0d                	jmp    340 <main>
     333:	90                   	nop
     334:	90                   	nop
     335:	90                   	nop
     336:	90                   	nop
     337:	90                   	nop
     338:	90                   	nop
     339:	90                   	nop
     33a:	90                   	nop
     33b:	90                   	nop
     33c:	90                   	nop
     33d:	90                   	nop
     33e:	90                   	nop
     33f:	90                   	nop

00000340 <main>:
	C = atoi(Cstr);
	totalRequests = atoi(totalRequestsstr);
	close(fd);
}

int main() {
     340:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     344:	83 e4 f0             	and    $0xfffffff0,%esp
     347:	ff 71 fc             	pushl  -0x4(%ecx)
     34a:	55                   	push   %ebp
     34b:	89 e5                	mov    %esp,%ebp
     34d:	56                   	push   %esi
     34e:	53                   	push   %ebx
     34f:	51                   	push   %ecx
     350:	83 ec 1c             	sub    $0x1c,%esp
	int i;
	void* ustack;
	readFromFile();
     353:	e8 e8 fc ff ff       	call   40 <readFromFile>
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ass2_log.txt",(O_WRONLY | O_CREATE));
     358:	c7 44 24 04 01 02 00 	movl   $0x201,0x4(%esp)
     35f:	00 
     360:	c7 04 24 e5 16 00 00 	movl   $0x16e5,(%esp)
     367:	e8 cc 09 00 00       	call   d38 <open>
	if(filedes < 0) {
     36c:	85 c0                	test   %eax,%eax
int main() {
	int i;
	void* ustack;
	readFromFile();
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ass2_log.txt",(O_WRONLY | O_CREATE));
     36e:	a3 e4 18 00 00       	mov    %eax,0x18e4
	if(filedes < 0) {
     373:	0f 88 37 02 00 00    	js     5b0 <main+0x270>
		printf(2,"problem opening file\n");
		exit();
	}

	RBB = BB_create(R);
     379:	a1 1c 19 00 00       	mov    0x191c,%eax
     37e:	89 04 24             	mov    %eax,(%esp)
     381:	e8 9a 12 00 00       	call   1620 <BB_create>
     386:	a3 f4 18 00 00       	mov    %eax,0x18f4
	CBB = BB_create(C);
     38b:	a1 14 19 00 00       	mov    0x1914,%eax
     390:	89 04 24             	mov    %eax,(%esp)
     393:	e8 88 12 00 00       	call   1620 <BB_create>
	dirtyCups = 0;
     398:	c7 05 f8 18 00 00 00 	movl   $0x0,0x18f8
     39f:	00 00 00 
	requests = 0;
     3a2:	c7 05 04 19 00 00 00 	movl   $0x0,0x1904
     3a9:	00 00 00 
		printf(2,"problem opening file\n");
		exit();
	}

	RBB = BB_create(R);
	CBB = BB_create(C);
     3ac:	a3 20 19 00 00       	mov    %eax,0x1920
	dirtyCups = 0;
	requests = 0;

	binsem_counter_dirty_cups = binary_sem_create();
     3b1:	e8 0a 0a 00 00       	call   dc0 <binary_sem_create>
     3b6:	a3 e8 18 00 00       	mov    %eax,0x18e8
	binsem_counter_requests = binary_sem_create();
     3bb:	e8 00 0a 00 00       	call   dc0 <binary_sem_create>
     3c0:	a3 ec 18 00 00       	mov    %eax,0x18ec
	binsem_wake_busboy = binary_sem_create();
     3c5:	e8 f6 09 00 00       	call   dc0 <binary_sem_create>
     3ca:	a3 fc 18 00 00       	mov    %eax,0x18fc
	binsem_on_cups_array = binary_sem_create();
     3cf:	e8 ec 09 00 00       	call   dc0 <binary_sem_create>
     3d4:	a3 00 19 00 00       	mov    %eax,0x1900
	binsem_printing = binary_sem_create();
     3d9:	e8 e2 09 00 00       	call   dc0 <binary_sem_create>
     3de:	a3 08 19 00 00       	mov    %eax,0x1908
	binary_sem_down(binsem_wake_busboy);
     3e3:	a1 fc 18 00 00       	mov    0x18fc,%eax
     3e8:	89 04 24             	mov    %eax,(%esp)
     3eb:	e8 d8 09 00 00       	call   dc8 <binary_sem_down>

	cups = malloc(sizeof(Cup) * C);
     3f0:	a1 14 19 00 00       	mov    0x1914,%eax
     3f5:	c1 e0 02             	shl    $0x2,%eax
     3f8:	89 04 24             	mov    %eax,(%esp)
     3fb:	e8 30 0d 00 00       	call   1130 <malloc>
	for(i=0;i<C;i++) {
     400:	8b 15 14 19 00 00    	mov    0x1914,%edx
     406:	85 d2                	test   %edx,%edx
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binsem_printing = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
     408:	a3 10 19 00 00       	mov    %eax,0x1910
	for(i=0;i<C;i++) {
     40d:	7e 3e                	jle    44d <main+0x10d>
     40f:	31 db                	xor    %ebx,%ebx
     411:	eb 0a                	jmp    41d <main+0xdd>
     413:	90                   	nop
     414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     418:	a1 10 19 00 00       	mov    0x1910,%eax
		cups[i].clean = 1;
     41d:	c7 04 98 01 00 00 00 	movl   $0x1,(%eax,%ebx,4)
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     424:	a1 20 19 00 00       	mov    0x1920,%eax
	binsem_on_cups_array = binary_sem_create();
	binsem_printing = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     429:	8d 14 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edx
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     430:	03 15 10 19 00 00    	add    0x1910,%edx
	binsem_on_cups_array = binary_sem_create();
	binsem_printing = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     436:	83 c3 01             	add    $0x1,%ebx
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     439:	89 54 24 04          	mov    %edx,0x4(%esp)
     43d:	89 04 24             	mov    %eax,(%esp)
     440:	e8 4b 11 00 00       	call   1590 <semaphore_put>
	binsem_on_cups_array = binary_sem_create();
	binsem_printing = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     445:	39 1d 14 19 00 00    	cmp    %ebx,0x1914
     44b:	7f cb                	jg     418 <main+0xd8>
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
	}

	int tid[B+H+2];
     44d:	a1 0c 19 00 00       	mov    0x190c,%eax
     452:	03 05 18 19 00 00    	add    0x1918,%eax
     458:	8d 14 85 26 00 00 00 	lea    0x26(,%eax,4),%edx
     45f:	83 e2 f0             	and    $0xfffffff0,%edx
     462:	29 d4                	sub    %edx,%esp
     464:	8d 74 24 1b          	lea    0x1b(%esp),%esi
     468:	83 e6 f0             	and    $0xfffffff0,%esi
	for(i=0;i<(B+H+2);i++) {
     46b:	83 f8 ff             	cmp    $0xffffffff,%eax
     46e:	0f 8c f4 00 00 00    	jl     568 <main+0x228>
     474:	31 db                	xor    %ebx,%ebx
     476:	eb 44                	jmp    4bc <main+0x17c>
		}
		else {
			if(i<B) {
				tid[i] = thread_create(bartender, ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
     478:	03 15 18 19 00 00    	add    0x1918,%edx
     47e:	39 da                	cmp    %ebx,%edx
     480:	0f 8f 92 00 00 00    	jg     518 <main+0x1d8>
				tid[i] = thread_create(hostess, ustack, STK_SIZE);
			}
			else if(i==(B+H)){
     486:	74 70                	je     4f8 <main+0x1b8>
				tid[i] = thread_create(busboy, ustack, STK_SIZE);
			}
			else {
				tid[i] = thread_create(printout, ustack, STK_SIZE);
     488:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     48f:	00 
     490:	89 44 24 04          	mov    %eax,0x4(%esp)
     494:	c7 04 24 d0 05 00 00 	movl   $0x5d0,(%esp)
     49b:	e8 f8 08 00 00       	call   d98 <thread_create>
     4a0:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
	}

	int tid[B+H+2];
	for(i=0;i<(B+H+2);i++) {
     4a3:	a1 18 19 00 00       	mov    0x1918,%eax
     4a8:	83 c3 01             	add    $0x1,%ebx
     4ab:	03 05 0c 19 00 00    	add    0x190c,%eax
     4b1:	8d 50 01             	lea    0x1(%eax),%edx
     4b4:	39 da                	cmp    %ebx,%edx
     4b6:	0f 8c 7c 00 00 00    	jl     538 <main+0x1f8>
		if((ustack = malloc(STK_SIZE)) <= 0) {
     4bc:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
     4c3:	e8 68 0c 00 00       	call   1130 <malloc>
     4c8:	85 c0                	test   %eax,%eax
     4ca:	0f 84 c0 00 00 00    	je     590 <main+0x250>
			printf(2,"cant malloc the stack for the thread\n");
			exit();
		}
		else {
			if(i<B) {
     4d0:	8b 15 0c 19 00 00    	mov    0x190c,%edx
     4d6:	39 da                	cmp    %ebx,%edx
     4d8:	7e 9e                	jle    478 <main+0x138>
				tid[i] = thread_create(bartender, ustack, STK_SIZE);
     4da:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     4e1:	00 
     4e2:	89 44 24 04          	mov    %eax,0x4(%esp)
     4e6:	c7 04 24 60 09 00 00 	movl   $0x960,(%esp)
     4ed:	e8 a6 08 00 00       	call   d98 <thread_create>
     4f2:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
     4f5:	eb ac                	jmp    4a3 <main+0x163>
     4f7:	90                   	nop
			}
			else if((i>=B) && (i<(B+H))) {
				tid[i] = thread_create(hostess, ustack, STK_SIZE);
			}
			else if(i==(B+H)){
				tid[i] = thread_create(busboy, ustack, STK_SIZE);
     4f8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     4ff:	00 
     500:	89 44 24 04          	mov    %eax,0x4(%esp)
     504:	c7 04 24 90 07 00 00 	movl   $0x790,(%esp)
     50b:	e8 88 08 00 00       	call   d98 <thread_create>
     510:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
     513:	eb 8e                	jmp    4a3 <main+0x163>
     515:	8d 76 00             	lea    0x0(%esi),%esi
		else {
			if(i<B) {
				tid[i] = thread_create(bartender, ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
				tid[i] = thread_create(hostess, ustack, STK_SIZE);
     518:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     51f:	00 
     520:	89 44 24 04          	mov    %eax,0x4(%esp)
     524:	c7 04 24 30 08 00 00 	movl   $0x830,(%esp)
     52b:	e8 68 08 00 00       	call   d98 <thread_create>
     530:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
		}
		else {
			if(i<B) {
				tid[i] = thread_create(bartender, ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
     533:	e9 6b ff ff ff       	jmp    4a3 <main+0x163>
			else {
				tid[i] = thread_create(printout, ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+2);i++) {
     538:	83 f8 ff             	cmp    $0xffffffff,%eax
     53b:	7c 2b                	jl     568 <main+0x228>
     53d:	31 db                	xor    %ebx,%ebx
     53f:	90                   	nop
		thread_join(tid[i],0);
     540:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     547:	00 
     548:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
			else {
				tid[i] = thread_create(printout, ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+2);i++) {
     54b:	83 c3 01             	add    $0x1,%ebx
		thread_join(tid[i],0);
     54e:	89 04 24             	mov    %eax,(%esp)
     551:	e8 62 08 00 00       	call   db8 <thread_join>
			else {
				tid[i] = thread_create(printout, ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+2);i++) {
     556:	a1 0c 19 00 00       	mov    0x190c,%eax
     55b:	03 05 18 19 00 00    	add    0x1918,%eax
     561:	83 c0 01             	add    $0x1,%eax
     564:	39 d8                	cmp    %ebx,%eax
     566:	7d d8                	jge    540 <main+0x200>
		thread_join(tid[i],0);
	}
	close(filedes);
     568:	a1 e4 18 00 00       	mov    0x18e4,%eax
     56d:	89 04 24             	mov    %eax,(%esp)
     570:	e8 ab 07 00 00       	call   d20 <close>
	printf(1,"\n");
     575:	c7 44 24 04 06 17 00 	movl   $0x1706,0x4(%esp)
     57c:	00 
     57d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     584:	e8 07 09 00 00       	call   e90 <printf>
	exit();
     589:	e8 6a 07 00 00       	call   cf8 <exit>
     58e:	66 90                	xchg   %ax,%ax
	}

	int tid[B+H+2];
	for(i=0;i<(B+H+2);i++) {
		if((ustack = malloc(STK_SIZE)) <= 0) {
			printf(2,"cant malloc the stack for the thread\n");
     590:	c7 44 24 04 20 17 00 	movl   $0x1720,0x4(%esp)
     597:	00 
     598:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     59f:	e8 ec 08 00 00       	call   e90 <printf>
			exit();
     5a4:	e8 4f 07 00 00       	call   cf8 <exit>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	void* ustack;
	readFromFile();
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ass2_log.txt",(O_WRONLY | O_CREATE));
	if(filedes < 0) {
		printf(2,"problem opening file\n");
     5b0:	c7 44 24 04 f2 16 00 	movl   $0x16f2,0x4(%esp)
     5b7:	00 
     5b8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     5bf:	e8 cc 08 00 00       	call   e90 <printf>
		exit();
     5c4:	e8 2f 07 00 00       	call   cf8 <exit>
     5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000005d0 <printout>:
		binary_sem_up(binsem_printing);
	}
}

void*
printout() {
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	83 ec 18             	sub    $0x18,%esp
	printf(1,"Processing");
     5d6:	c7 44 24 04 08 17 00 	movl   $0x1708,0x4(%esp)
     5dd:	00 
     5de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5e5:	e8 a6 08 00 00       	call   e90 <printf>
     5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	while(1) {
		printf(1,".");
     5f0:	c7 44 24 04 13 17 00 	movl   $0x1713,0x4(%esp)
     5f7:	00 
     5f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5ff:	e8 8c 08 00 00       	call   e90 <printf>
		sleep(50);
     604:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
     60b:	e8 78 07 00 00       	call   d88 <sleep>
     610:	eb de                	jmp    5f0 <printout+0x20>
     612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000620 <washCups>:

Cup* getCleanCup() {
	return (Cup*)semaphore_pop(CBB);
}

int washCups() {
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
     626:	83 ec 3c             	sub    $0x3c,%esp
	int i;
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     629:	a1 14 19 00 00       	mov    0x1914,%eax
     62e:	85 c0                	test   %eax,%eax
     630:	0f 8e fa 00 00 00    	jle    730 <washCups+0x110>
     636:	d9 7d e2             	fnstcw -0x1e(%ebp)
     639:	31 ff                	xor    %edi,%edi
     63b:	31 db                	xor    %ebx,%ebx
     63d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     640:	db 45 e4             	fildl  -0x1c(%ebp)
     643:	dd 05 08 18 00 00    	fldl   0x1808
     649:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
     64d:	dc c9                	fmul   %st,%st(1)
     64f:	d9 c9                	fxch   %st(1)
     651:	b6 0c                	mov    $0xc,%dh
     653:	66 89 55 e0          	mov    %dx,-0x20(%ebp)
     657:	d9 6d e0             	fldcw  -0x20(%ebp)
     65a:	db 5d e4             	fistpl -0x1c(%ebp)
     65d:	d9 6d e2             	fldcw  -0x1e(%ebp)
     660:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     663:	85 d2                	test   %edx,%edx
     665:	7f 25                	jg     68c <washCups+0x6c>
     667:	dd d8                	fstp   %st(0)
     669:	e9 b4 00 00 00       	jmp    722 <washCups+0x102>
     66e:	66 90                	xchg   %ax,%ax
     670:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     673:	db 45 e4             	fildl  -0x1c(%ebp)
     676:	d8 c9                	fmul   %st(1),%st
     678:	d9 6d e0             	fldcw  -0x20(%ebp)
     67b:	db 5d e4             	fistpl -0x1c(%ebp)
     67e:	d9 6d e2             	fldcw  -0x1e(%ebp)
     681:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     684:	39 d7                	cmp    %edx,%edi
     686:	0f 8d 94 00 00 00    	jge    720 <washCups+0x100>
		if(cups[i].clean != 1) {
     68c:	8b 15 10 19 00 00    	mov    0x1910,%edx
}

int washCups() {
	int i;
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     692:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
		if(cups[i].clean != 1) {
     699:	01 f2                	add    %esi,%edx
     69b:	83 3a 01             	cmpl   $0x1,(%edx)
     69e:	74 59                	je     6f9 <washCups+0xd9>
			cups[i].clean = 1;
     6a0:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
			binary_sem_down(binsem_counter_dirty_cups);
     6a6:	a1 e8 18 00 00       	mov    0x18e8,%eax
     6ab:	dd 5d c8             	fstpl  -0x38(%ebp)
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
			counter++;
     6ae:	83 c7 01             	add    $0x1,%edi
	int i;
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
		if(cups[i].clean != 1) {
			cups[i].clean = 1;
			binary_sem_down(binsem_counter_dirty_cups);
     6b1:	89 04 24             	mov    %eax,(%esp)
     6b4:	e8 0f 07 00 00       	call   dc8 <binary_sem_down>
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
     6b9:	a1 e8 18 00 00       	mov    0x18e8,%eax
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
		if(cups[i].clean != 1) {
			cups[i].clean = 1;
			binary_sem_down(binsem_counter_dirty_cups);
			dirtyCups--;
     6be:	83 2d f8 18 00 00 01 	subl   $0x1,0x18f8
			binary_sem_up(binsem_counter_dirty_cups);
     6c5:	89 04 24             	mov    %eax,(%esp)
     6c8:	e8 03 07 00 00       	call   dd0 <binary_sem_up>
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
     6cd:	a1 20 19 00 00       	mov    0x1920,%eax
     6d2:	03 35 10 19 00 00    	add    0x1910,%esi
     6d8:	89 04 24             	mov    %eax,(%esp)
     6db:	89 74 24 04          	mov    %esi,0x4(%esp)
     6df:	e8 ac 0e 00 00       	call   1590 <semaphore_put>
     6e4:	a1 14 19 00 00       	mov    0x1914,%eax
     6e9:	d9 7d e2             	fnstcw -0x1e(%ebp)
     6ec:	dd 45 c8             	fldl   -0x38(%ebp)
     6ef:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
     6f3:	b6 0c                	mov    $0xc,%dh
     6f5:	66 89 55 e0          	mov    %dx,-0x20(%ebp)
}

int washCups() {
	int i;
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     6f9:	83 c3 01             	add    $0x1,%ebx
     6fc:	39 d8                	cmp    %ebx,%eax
     6fe:	0f 8f 6c ff ff ff    	jg     670 <washCups+0x50>
     704:	dd d8                	fstp   %st(0)
     706:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     709:	db 45 e4             	fildl  -0x1c(%ebp)
     70c:	dc 0d 08 18 00 00    	fmull  0x1808
     712:	d9 6d e0             	fldcw  -0x20(%ebp)
     715:	db 5d e4             	fistpl -0x1c(%ebp)
     718:	d9 6d e2             	fldcw  -0x1e(%ebp)
     71b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     71e:	eb 02                	jmp    722 <washCups+0x102>
     720:	dd d8                	fstp   %st(0)
			binary_sem_up(binsem_counter_dirty_cups);
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
		}
	}
	if(counter != ((int)(C*0.85))) {
     722:	31 c0                	xor    %eax,%eax
     724:	39 d7                	cmp    %edx,%edi
     726:	75 31                	jne    759 <washCups+0x139>
		printf(2,"less or more than 85% cups!! percentage is: %d",((int)(counter*0.85)));
		return -1;
	}
	return 0;
}
     728:	83 c4 3c             	add    $0x3c,%esp
     72b:	5b                   	pop    %ebx
     72c:	5e                   	pop    %esi
     72d:	5f                   	pop    %edi
     72e:	5d                   	pop    %ebp
     72f:	c3                   	ret    
}

int washCups() {
	int i;
	int counter = 0;
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     730:	d9 7d e2             	fnstcw -0x1e(%ebp)
     733:	31 ff                	xor    %edi,%edi
     735:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     738:	db 45 e4             	fildl  -0x1c(%ebp)
     73b:	dc 0d 08 18 00 00    	fmull  0x1808
     741:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
     745:	b4 0c                	mov    $0xc,%ah
     747:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
     74b:	d9 6d e0             	fldcw  -0x20(%ebp)
     74e:	db 5d e4             	fistpl -0x1c(%ebp)
     751:	d9 6d e2             	fldcw  -0x1e(%ebp)
     754:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     757:	eb c9                	jmp    722 <washCups+0x102>
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
		}
	}
	if(counter != ((int)(C*0.85))) {
		printf(2,"less or more than 85% cups!! percentage is: %d",((int)(counter*0.85)));
     759:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     75c:	db 45 e4             	fildl  -0x1c(%ebp)
     75f:	dc 0d 08 18 00 00    	fmull  0x1808
     765:	c7 44 24 04 48 17 00 	movl   $0x1748,0x4(%esp)
     76c:	00 
     76d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     774:	d9 6d e0             	fldcw  -0x20(%ebp)
     777:	db 5c 24 08          	fistpl 0x8(%esp)
     77b:	d9 6d e2             	fldcw  -0x1e(%ebp)
     77e:	e8 0d 07 00 00       	call   e90 <printf>
     783:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
		return -1;
     788:	eb 9e                	jmp    728 <washCups+0x108>
     78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000790 <busboy>:
	thread_exit(0);
	return 0;
}

void*
busboy() {
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	53                   	push   %ebx
     794:	83 ec 24             	sub    $0x24,%esp
     797:	eb 68                	jmp    801 <busboy+0x71>
     799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		binary_sem_down(binsem_wake_busboy);
		if(washCups() < 0) {
			printf(2,"problem with the washing of cups");
			exit();
		}
		binary_sem_down(binsem_printing);
     7a0:	a1 08 19 00 00       	mov    0x1908,%eax
     7a5:	89 04 24             	mov    %eax,(%esp)
     7a8:	e8 1b 06 00 00       	call   dc8 <binary_sem_down>
		printf(filedes,"Busboy %d added %d clean cups.\n",thread_getid(),(int)(C*0.85));
     7ad:	d9 7d f6             	fnstcw -0xa(%ebp)
     7b0:	db 05 14 19 00 00    	fildl  0x1914
     7b6:	dc 0d 08 18 00 00    	fmull  0x1808
     7bc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     7c0:	b4 0c                	mov    $0xc,%ah
     7c2:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
     7c6:	d9 6d f4             	fldcw  -0xc(%ebp)
     7c9:	db 5d f0             	fistpl -0x10(%ebp)
     7cc:	d9 6d f6             	fldcw  -0xa(%ebp)
     7cf:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     7d2:	e8 c9 05 00 00       	call   da0 <thread_getid>
     7d7:	c7 44 24 04 9c 17 00 	movl   $0x179c,0x4(%esp)
     7de:	00 
     7df:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     7e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     7e7:	a1 e4 18 00 00       	mov    0x18e4,%eax
     7ec:	89 04 24             	mov    %eax,(%esp)
     7ef:	e8 9c 06 00 00       	call   e90 <printf>
		binary_sem_up(binsem_printing);
     7f4:	a1 08 19 00 00       	mov    0x1908,%eax
     7f9:	89 04 24             	mov    %eax,(%esp)
     7fc:	e8 cf 05 00 00       	call   dd0 <binary_sem_up>
}

void*
busboy() {
	while(1) {
		binary_sem_down(binsem_wake_busboy);
     801:	a1 fc 18 00 00       	mov    0x18fc,%eax
     806:	89 04 24             	mov    %eax,(%esp)
     809:	e8 ba 05 00 00       	call   dc8 <binary_sem_down>
		if(washCups() < 0) {
     80e:	e8 0d fe ff ff       	call   620 <washCups>
     813:	85 c0                	test   %eax,%eax
     815:	79 89                	jns    7a0 <busboy+0x10>
			printf(2,"problem with the washing of cups");
     817:	c7 44 24 04 78 17 00 	movl   $0x1778,0x4(%esp)
     81e:	00 
     81f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     826:	e8 65 06 00 00       	call   e90 <printf>
			exit();
     82b:	e8 c8 04 00 00       	call   cf8 <exit>

00000830 <hostess>:
		sleep(10);
	}
}

void*
hostess() {
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	56                   	push   %esi
     834:	53                   	push   %ebx
     835:	83 ec 10             	sub    $0x10,%esp
	while(requests < totalRequests) {
     838:	a1 04 19 00 00       	mov    0x1904,%eax
     83d:	3b 05 f0 18 00 00    	cmp    0x18f0,%eax
     843:	7c 35                	jl     87a <hostess+0x4a>
     845:	e9 b6 00 00 00       	jmp    900 <hostess+0xd0>
     84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		binary_sem_down(binsem_printing);
		printf(filedes,"Hostess %d added a new request #%d\n",thread_getid(),req->id);
		binary_sem_up(binsem_printing);
		addNewRequest(req);
		}
		binary_sem_up(binsem_counter_requests);
     850:	a1 ec 18 00 00       	mov    0x18ec,%eax
     855:	89 04 24             	mov    %eax,(%esp)
     858:	e8 73 05 00 00       	call   dd0 <binary_sem_up>
		sleep(10);
     85d:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
     864:	e8 1f 05 00 00       	call   d88 <sleep>
	}
}

void*
hostess() {
	while(requests < totalRequests) {
     869:	a1 04 19 00 00       	mov    0x1904,%eax
     86e:	3b 05 f0 18 00 00    	cmp    0x18f0,%eax
     874:	0f 8d 86 00 00 00    	jge    900 <hostess+0xd0>
		binary_sem_down(binsem_counter_requests);
     87a:	a1 ec 18 00 00       	mov    0x18ec,%eax
     87f:	89 04 24             	mov    %eax,(%esp)
     882:	e8 41 05 00 00       	call   dc8 <binary_sem_down>
		if(requests < totalRequests) {
     887:	a1 04 19 00 00       	mov    0x1904,%eax
     88c:	3b 05 f0 18 00 00    	cmp    0x18f0,%eax
     892:	7d bc                	jge    850 <hostess+0x20>
		Request* req = malloc(sizeof(Request));
     894:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     89b:	e8 90 08 00 00       	call   1130 <malloc>
     8a0:	89 c3                	mov    %eax,%ebx
		requests++;
     8a2:	a1 04 19 00 00       	mov    0x1904,%eax
     8a7:	83 c0 01             	add    $0x1,%eax
     8aa:	a3 04 19 00 00       	mov    %eax,0x1904
		req->id = requests;
     8af:	89 03                	mov    %eax,(%ebx)
		binary_sem_down(binsem_printing);
     8b1:	a1 08 19 00 00       	mov    0x1908,%eax
     8b6:	89 04 24             	mov    %eax,(%esp)
     8b9:	e8 0a 05 00 00       	call   dc8 <binary_sem_down>
		printf(filedes,"Hostess %d added a new request #%d\n",thread_getid(),req->id);
     8be:	8b 33                	mov    (%ebx),%esi
     8c0:	e8 db 04 00 00       	call   da0 <thread_getid>
     8c5:	c7 44 24 04 bc 17 00 	movl   $0x17bc,0x4(%esp)
     8cc:	00 
     8cd:	89 74 24 0c          	mov    %esi,0xc(%esp)
     8d1:	89 44 24 08          	mov    %eax,0x8(%esp)
     8d5:	a1 e4 18 00 00       	mov    0x18e4,%eax
     8da:	89 04 24             	mov    %eax,(%esp)
     8dd:	e8 ae 05 00 00       	call   e90 <printf>
		binary_sem_up(binsem_printing);
     8e2:	a1 08 19 00 00       	mov    0x1908,%eax
     8e7:	89 04 24             	mov    %eax,(%esp)
     8ea:	e8 e1 04 00 00       	call   dd0 <binary_sem_up>
		addNewRequest(req);
     8ef:	89 1c 24             	mov    %ebx,(%esp)
     8f2:	e8 29 f7 ff ff       	call   20 <addNewRequest>
     8f7:	e9 54 ff ff ff       	jmp    850 <hostess+0x20>
     8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		}
		binary_sem_up(binsem_counter_requests);
		sleep(10);
	}
	//printf(1,"exit hostess\n");
	thread_exit(0);
     900:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     907:	e8 a4 04 00 00       	call   db0 <thread_exit>
	return 0;
}
     90c:	83 c4 10             	add    $0x10,%esp
     90f:	31 c0                	xor    %eax,%eax
     911:	5b                   	pop    %ebx
     912:	5e                   	pop    %esi
     913:	5d                   	pop    %ebp
     914:	c3                   	ret    
     915:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <getRequest>:

void addNewRequest( Request* newReq) {
	semaphore_put(RBB,(void*)newReq);
}

Request* getRequest() {
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	83 ec 18             	sub    $0x18,%esp
	return (Request*)semaphore_pop(RBB);
     926:	a1 f4 18 00 00       	mov    0x18f4,%eax
     92b:	89 04 24             	mov    %eax,(%esp)
     92e:	e8 4d 0b 00 00       	call   1480 <semaphore_pop>
}
     933:	c9                   	leave  
     934:	c3                   	ret    
     935:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000940 <getCleanCup>:
int binsem_wake_busboy; //lock on the waking and sleeping of the busboy to clean the cups
int binsem_on_cups_array; //lock on the array of cups
int filedes; //file descriptor of the log file
int binsem_printing; //synchronizing the print

Cup* getCleanCup() {
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	83 ec 18             	sub    $0x18,%esp
	return (Cup*)semaphore_pop(CBB);
     946:	a1 20 19 00 00       	mov    0x1920,%eax
     94b:	89 04 24             	mov    %eax,(%esp)
     94e:	e8 2d 0b 00 00       	call   1480 <semaphore_pop>
}
     953:	c9                   	leave  
     954:	c3                   	ret    
     955:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <bartender>:
Request* getRequest() {
	return (Request*)semaphore_pop(RBB);
}

void*
bartender() {
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	56                   	push   %esi
     964:	53                   	push   %ebx
     965:	83 ec 20             	sub    $0x20,%esp
     968:	eb 73                	jmp    9dd <bartender+0x7d>
     96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		dirtyCups++;
		cup->clean = 0;
		if(dirtyCups == ((int)(C*0.85))) {
			binary_sem_up(binsem_wake_busboy);
		}
		binary_sem_up(binsem_counter_dirty_cups);
     970:	a1 e8 18 00 00       	mov    0x18e8,%eax
     975:	89 04 24             	mov    %eax,(%esp)
     978:	e8 53 04 00 00       	call   dd0 <binary_sem_up>
		binary_sem_down(binsem_printing);
     97d:	a1 08 19 00 00       	mov    0x1908,%eax
     982:	89 04 24             	mov    %eax,(%esp)
     985:	e8 3e 04 00 00       	call   dc8 <binary_sem_down>
		printf(filedes,"Bartender %d completed request #%d\n",thread_getid(),req->id);
     98a:	8b 33                	mov    (%ebx),%esi
     98c:	e8 0f 04 00 00       	call   da0 <thread_getid>
     991:	c7 44 24 04 e0 17 00 	movl   $0x17e0,0x4(%esp)
     998:	00 
     999:	89 74 24 0c          	mov    %esi,0xc(%esp)
     99d:	89 44 24 08          	mov    %eax,0x8(%esp)
     9a1:	a1 e4 18 00 00       	mov    0x18e4,%eax
     9a6:	89 04 24             	mov    %eax,(%esp)
     9a9:	e8 e2 04 00 00       	call   e90 <printf>
		binary_sem_up(binsem_printing);
     9ae:	a1 08 19 00 00       	mov    0x1908,%eax
     9b3:	89 04 24             	mov    %eax,(%esp)
     9b6:	e8 15 04 00 00       	call   dd0 <binary_sem_up>
		if(req->id == totalRequests) {
     9bb:	8b 03                	mov    (%ebx),%eax
     9bd:	3b 05 f0 18 00 00    	cmp    0x18f0,%eax
     9c3:	0f 84 7f 00 00 00    	je     a48 <bartender+0xe8>
			binary_sem_clear(binsem_on_cups_array);
			binary_sem_clear(binsem_printing);
			//
                    exit_all_threads();//need to leave the main process on so he can do thread_join
		}
		free(req);
     9c9:	89 1c 24             	mov    %ebx,(%esp)
     9cc:	e8 cf 06 00 00       	call   10a0 <free>
		sleep(10);
     9d1:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
     9d8:	e8 ab 03 00 00       	call   d88 <sleep>
}

void*
bartender() {
	while(1) {
		Request* req = getRequest();
     9dd:	e8 3e ff ff ff       	call   920 <getRequest>
     9e2:	89 c3                	mov    %eax,%ebx

		binary_sem_down(binsem_counter_dirty_cups);
     9e4:	a1 e8 18 00 00       	mov    0x18e8,%eax
     9e9:	89 04 24             	mov    %eax,(%esp)
     9ec:	e8 d7 03 00 00       	call   dc8 <binary_sem_down>
		Cup* cup = getCleanCup();
     9f1:	e8 4a ff ff ff       	call   940 <getCleanCup>
		dirtyCups++;
     9f6:	83 05 f8 18 00 00 01 	addl   $0x1,0x18f8
		cup->clean = 0;
     9fd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(dirtyCups == ((int)(C*0.85))) {
     a03:	d9 7d f6             	fnstcw -0xa(%ebp)
     a06:	db 05 14 19 00 00    	fildl  0x1914
     a0c:	dc 0d 08 18 00 00    	fmull  0x1808
     a12:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     a16:	b4 0c                	mov    $0xc,%ah
     a18:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
     a1c:	d9 6d f4             	fldcw  -0xc(%ebp)
     a1f:	db 5d f0             	fistpl -0x10(%ebp)
     a22:	d9 6d f6             	fldcw  -0xa(%ebp)
     a25:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a28:	3b 05 f8 18 00 00    	cmp    0x18f8,%eax
     a2e:	0f 85 3c ff ff ff    	jne    970 <bartender+0x10>
			binary_sem_up(binsem_wake_busboy);
     a34:	a1 fc 18 00 00       	mov    0x18fc,%eax
     a39:	89 04 24             	mov    %eax,(%esp)
     a3c:	e8 8f 03 00 00       	call   dd0 <binary_sem_up>
     a41:	e9 2a ff ff ff       	jmp    970 <bartender+0x10>
     a46:	66 90                	xchg   %ax,%ax
		binary_sem_down(binsem_printing);
		printf(filedes,"Bartender %d completed request #%d\n",thread_getid(),req->id);
		binary_sem_up(binsem_printing);
		if(req->id == totalRequests) {
			//clean all of it!
			free(req);
     a48:	89 1c 24             	mov    %ebx,(%esp)
     a4b:	e8 50 06 00 00       	call   10a0 <free>
			free(cups);
     a50:	a1 10 19 00 00       	mov    0x1910,%eax
     a55:	89 04 24             	mov    %eax,(%esp)
     a58:	e8 43 06 00 00       	call   10a0 <free>
			semaphore_clear(RBB);
     a5d:	a1 f4 18 00 00       	mov    0x18f4,%eax
     a62:	89 04 24             	mov    %eax,(%esp)
     a65:	e8 a6 09 00 00       	call   1410 <semaphore_clear>
			semaphore_clear(CBB);
     a6a:	a1 20 19 00 00       	mov    0x1920,%eax
     a6f:	89 04 24             	mov    %eax,(%esp)
     a72:	e8 99 09 00 00       	call   1410 <semaphore_clear>
			binary_sem_clear(binsem_counter_dirty_cups);
     a77:	a1 e8 18 00 00       	mov    0x18e8,%eax
     a7c:	89 04 24             	mov    %eax,(%esp)
     a7f:	e8 54 03 00 00       	call   dd8 <binary_sem_clear>
			binary_sem_clear(binsem_counter_requests);
     a84:	a1 ec 18 00 00       	mov    0x18ec,%eax
     a89:	89 04 24             	mov    %eax,(%esp)
     a8c:	e8 47 03 00 00       	call   dd8 <binary_sem_clear>
			binary_sem_clear(binsem_wake_busboy);
     a91:	a1 fc 18 00 00       	mov    0x18fc,%eax
     a96:	89 04 24             	mov    %eax,(%esp)
     a99:	e8 3a 03 00 00       	call   dd8 <binary_sem_clear>
			binary_sem_clear(binsem_on_cups_array);
     a9e:	a1 00 19 00 00       	mov    0x1900,%eax
     aa3:	89 04 24             	mov    %eax,(%esp)
     aa6:	e8 2d 03 00 00       	call   dd8 <binary_sem_clear>
			binary_sem_clear(binsem_printing);
     aab:	a1 08 19 00 00       	mov    0x1908,%eax
     ab0:	89 04 24             	mov    %eax,(%esp)
     ab3:	e8 20 03 00 00       	call   dd8 <binary_sem_clear>
			//
                    exit_all_threads();//need to leave the main process on so he can do thread_join
     ab8:	e8 23 03 00 00       	call   de0 <exit_all_threads>
     abd:	e9 07 ff ff ff       	jmp    9c9 <bartender+0x69>
     ac2:	90                   	nop
     ac3:	90                   	nop
     ac4:	90                   	nop
     ac5:	90                   	nop
     ac6:	90                   	nop
     ac7:	90                   	nop
     ac8:	90                   	nop
     ac9:	90                   	nop
     aca:	90                   	nop
     acb:	90                   	nop
     acc:	90                   	nop
     acd:	90                   	nop
     ace:	90                   	nop
     acf:	90                   	nop

00000ad0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     ad0:	55                   	push   %ebp
     ad1:	31 d2                	xor    %edx,%edx
     ad3:	89 e5                	mov    %esp,%ebp
     ad5:	8b 45 08             	mov    0x8(%ebp),%eax
     ad8:	53                   	push   %ebx
     ad9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     ae0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     ae4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     ae7:	83 c2 01             	add    $0x1,%edx
     aea:	84 c9                	test   %cl,%cl
     aec:	75 f2                	jne    ae0 <strcpy+0x10>
    ;
  return os;
}
     aee:	5b                   	pop    %ebx
     aef:	5d                   	pop    %ebp
     af0:	c3                   	ret    
     af1:	eb 0d                	jmp    b00 <strcmp>
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

00000b00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	53                   	push   %ebx
     b04:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b07:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     b0a:	0f b6 01             	movzbl (%ecx),%eax
     b0d:	84 c0                	test   %al,%al
     b0f:	75 14                	jne    b25 <strcmp+0x25>
     b11:	eb 25                	jmp    b38 <strcmp+0x38>
     b13:	90                   	nop
     b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
     b18:	83 c1 01             	add    $0x1,%ecx
     b1b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b1e:	0f b6 01             	movzbl (%ecx),%eax
     b21:	84 c0                	test   %al,%al
     b23:	74 13                	je     b38 <strcmp+0x38>
     b25:	0f b6 1a             	movzbl (%edx),%ebx
     b28:	38 d8                	cmp    %bl,%al
     b2a:	74 ec                	je     b18 <strcmp+0x18>
     b2c:	0f b6 db             	movzbl %bl,%ebx
     b2f:	0f b6 c0             	movzbl %al,%eax
     b32:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     b34:	5b                   	pop    %ebx
     b35:	5d                   	pop    %ebp
     b36:	c3                   	ret    
     b37:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b38:	0f b6 1a             	movzbl (%edx),%ebx
     b3b:	31 c0                	xor    %eax,%eax
     b3d:	0f b6 db             	movzbl %bl,%ebx
     b40:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     b42:	5b                   	pop    %ebx
     b43:	5d                   	pop    %ebp
     b44:	c3                   	ret    
     b45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <strlen>:

uint
strlen(char *s)
{
     b50:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
     b51:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     b53:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
     b55:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     b57:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b5a:	80 39 00             	cmpb   $0x0,(%ecx)
     b5d:	74 0c                	je     b6b <strlen+0x1b>
     b5f:	90                   	nop
     b60:	83 c2 01             	add    $0x1,%edx
     b63:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b67:	89 d0                	mov    %edx,%eax
     b69:	75 f5                	jne    b60 <strlen+0x10>
    ;
  return n;
}
     b6b:	5d                   	pop    %ebp
     b6c:	c3                   	ret    
     b6d:	8d 76 00             	lea    0x0(%esi),%esi

00000b70 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	8b 55 08             	mov    0x8(%ebp),%edx
     b76:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b7d:	89 d7                	mov    %edx,%edi
     b7f:	fc                   	cld    
     b80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b82:	89 d0                	mov    %edx,%eax
     b84:	5f                   	pop    %edi
     b85:	5d                   	pop    %ebp
     b86:	c3                   	ret    
     b87:	89 f6                	mov    %esi,%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <strchr>:

char*
strchr(const char *s, char c)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	8b 45 08             	mov    0x8(%ebp),%eax
     b96:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     b9a:	0f b6 10             	movzbl (%eax),%edx
     b9d:	84 d2                	test   %dl,%dl
     b9f:	75 11                	jne    bb2 <strchr+0x22>
     ba1:	eb 15                	jmp    bb8 <strchr+0x28>
     ba3:	90                   	nop
     ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ba8:	83 c0 01             	add    $0x1,%eax
     bab:	0f b6 10             	movzbl (%eax),%edx
     bae:	84 d2                	test   %dl,%dl
     bb0:	74 06                	je     bb8 <strchr+0x28>
    if(*s == c)
     bb2:	38 ca                	cmp    %cl,%dl
     bb4:	75 f2                	jne    ba8 <strchr+0x18>
      return (char*) s;
  return 0;
}
     bb6:	5d                   	pop    %ebp
     bb7:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     bb8:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
     bba:	5d                   	pop    %ebp
     bbb:	90                   	nop
     bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bc0:	c3                   	ret    
     bc1:	eb 0d                	jmp    bd0 <atoi>
     bc3:	90                   	nop
     bc4:	90                   	nop
     bc5:	90                   	nop
     bc6:	90                   	nop
     bc7:	90                   	nop
     bc8:	90                   	nop
     bc9:	90                   	nop
     bca:	90                   	nop
     bcb:	90                   	nop
     bcc:	90                   	nop
     bcd:	90                   	nop
     bce:	90                   	nop
     bcf:	90                   	nop

00000bd0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     bd0:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     bd1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bd8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     bd9:	0f b6 11             	movzbl (%ecx),%edx
     bdc:	8d 5a d0             	lea    -0x30(%edx),%ebx
     bdf:	80 fb 09             	cmp    $0x9,%bl
     be2:	77 1c                	ja     c00 <atoi+0x30>
     be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
     be8:	0f be d2             	movsbl %dl,%edx
     beb:	83 c1 01             	add    $0x1,%ecx
     bee:	8d 04 80             	lea    (%eax,%eax,4),%eax
     bf1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     bf5:	0f b6 11             	movzbl (%ecx),%edx
     bf8:	8d 5a d0             	lea    -0x30(%edx),%ebx
     bfb:	80 fb 09             	cmp    $0x9,%bl
     bfe:	76 e8                	jbe    be8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     c00:	5b                   	pop    %ebx
     c01:	5d                   	pop    %ebp
     c02:	c3                   	ret    
     c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c10 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	56                   	push   %esi
     c14:	8b 45 08             	mov    0x8(%ebp),%eax
     c17:	53                   	push   %ebx
     c18:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c1b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c1e:	85 db                	test   %ebx,%ebx
     c20:	7e 14                	jle    c36 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
     c22:	31 d2                	xor    %edx,%edx
     c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     c28:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     c2c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c2f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c32:	39 da                	cmp    %ebx,%edx
     c34:	75 f2                	jne    c28 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     c36:	5b                   	pop    %ebx
     c37:	5e                   	pop    %esi
     c38:	5d                   	pop    %ebp
     c39:	c3                   	ret    
     c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c40 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c46:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
     c49:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     c4c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
     c4f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c54:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     c5b:	00 
     c5c:	89 04 24             	mov    %eax,(%esp)
     c5f:	e8 d4 00 00 00       	call   d38 <open>
  if(fd < 0)
     c64:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c66:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     c68:	78 19                	js     c83 <stat+0x43>
    return -1;
  r = fstat(fd, st);
     c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6d:	89 1c 24             	mov    %ebx,(%esp)
     c70:	89 44 24 04          	mov    %eax,0x4(%esp)
     c74:	e8 d7 00 00 00       	call   d50 <fstat>
  close(fd);
     c79:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     c7c:	89 c6                	mov    %eax,%esi
  close(fd);
     c7e:	e8 9d 00 00 00       	call   d20 <close>
  return r;
}
     c83:	89 f0                	mov    %esi,%eax
     c85:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     c88:	8b 75 fc             	mov    -0x4(%ebp),%esi
     c8b:	89 ec                	mov    %ebp,%esp
     c8d:	5d                   	pop    %ebp
     c8e:	c3                   	ret    
     c8f:	90                   	nop

00000c90 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	56                   	push   %esi
     c95:	31 f6                	xor    %esi,%esi
     c97:	53                   	push   %ebx
     c98:	83 ec 2c             	sub    $0x2c,%esp
     c9b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c9e:	eb 06                	jmp    ca6 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     ca0:	3c 0a                	cmp    $0xa,%al
     ca2:	74 39                	je     cdd <gets+0x4d>
     ca4:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ca6:	8d 5e 01             	lea    0x1(%esi),%ebx
     ca9:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     cac:	7d 31                	jge    cdf <gets+0x4f>
    cc = read(0, &c, 1);
     cae:	8d 45 e7             	lea    -0x19(%ebp),%eax
     cb1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     cb8:	00 
     cb9:	89 44 24 04          	mov    %eax,0x4(%esp)
     cbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cc4:	e8 47 00 00 00       	call   d10 <read>
    if(cc < 1)
     cc9:	85 c0                	test   %eax,%eax
     ccb:	7e 12                	jle    cdf <gets+0x4f>
      break;
    buf[i++] = c;
     ccd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cd1:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
     cd5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cd9:	3c 0d                	cmp    $0xd,%al
     cdb:	75 c3                	jne    ca0 <gets+0x10>
     cdd:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     cdf:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     ce3:	89 f8                	mov    %edi,%eax
     ce5:	83 c4 2c             	add    $0x2c,%esp
     ce8:	5b                   	pop    %ebx
     ce9:	5e                   	pop    %esi
     cea:	5f                   	pop    %edi
     ceb:	5d                   	pop    %ebp
     cec:	c3                   	ret    
     ced:	90                   	nop
     cee:	90                   	nop
     cef:	90                   	nop

00000cf0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     cf0:	b8 01 00 00 00       	mov    $0x1,%eax
     cf5:	cd 40                	int    $0x40
     cf7:	c3                   	ret    

00000cf8 <exit>:
SYSCALL(exit)
     cf8:	b8 02 00 00 00       	mov    $0x2,%eax
     cfd:	cd 40                	int    $0x40
     cff:	c3                   	ret    

00000d00 <wait>:
SYSCALL(wait)
     d00:	b8 03 00 00 00       	mov    $0x3,%eax
     d05:	cd 40                	int    $0x40
     d07:	c3                   	ret    

00000d08 <pipe>:
SYSCALL(pipe)
     d08:	b8 04 00 00 00       	mov    $0x4,%eax
     d0d:	cd 40                	int    $0x40
     d0f:	c3                   	ret    

00000d10 <read>:
SYSCALL(read)
     d10:	b8 06 00 00 00       	mov    $0x6,%eax
     d15:	cd 40                	int    $0x40
     d17:	c3                   	ret    

00000d18 <write>:
SYSCALL(write)
     d18:	b8 05 00 00 00       	mov    $0x5,%eax
     d1d:	cd 40                	int    $0x40
     d1f:	c3                   	ret    

00000d20 <close>:
SYSCALL(close)
     d20:	b8 07 00 00 00       	mov    $0x7,%eax
     d25:	cd 40                	int    $0x40
     d27:	c3                   	ret    

00000d28 <kill>:
SYSCALL(kill)
     d28:	b8 08 00 00 00       	mov    $0x8,%eax
     d2d:	cd 40                	int    $0x40
     d2f:	c3                   	ret    

00000d30 <exec>:
SYSCALL(exec)
     d30:	b8 09 00 00 00       	mov    $0x9,%eax
     d35:	cd 40                	int    $0x40
     d37:	c3                   	ret    

00000d38 <open>:
SYSCALL(open)
     d38:	b8 0a 00 00 00       	mov    $0xa,%eax
     d3d:	cd 40                	int    $0x40
     d3f:	c3                   	ret    

00000d40 <mknod>:
SYSCALL(mknod)
     d40:	b8 0b 00 00 00       	mov    $0xb,%eax
     d45:	cd 40                	int    $0x40
     d47:	c3                   	ret    

00000d48 <unlink>:
SYSCALL(unlink)
     d48:	b8 0c 00 00 00       	mov    $0xc,%eax
     d4d:	cd 40                	int    $0x40
     d4f:	c3                   	ret    

00000d50 <fstat>:
SYSCALL(fstat)
     d50:	b8 0d 00 00 00       	mov    $0xd,%eax
     d55:	cd 40                	int    $0x40
     d57:	c3                   	ret    

00000d58 <link>:
SYSCALL(link)
     d58:	b8 0e 00 00 00       	mov    $0xe,%eax
     d5d:	cd 40                	int    $0x40
     d5f:	c3                   	ret    

00000d60 <mkdir>:
SYSCALL(mkdir)
     d60:	b8 0f 00 00 00       	mov    $0xf,%eax
     d65:	cd 40                	int    $0x40
     d67:	c3                   	ret    

00000d68 <chdir>:
SYSCALL(chdir)
     d68:	b8 10 00 00 00       	mov    $0x10,%eax
     d6d:	cd 40                	int    $0x40
     d6f:	c3                   	ret    

00000d70 <dup>:
SYSCALL(dup)
     d70:	b8 11 00 00 00       	mov    $0x11,%eax
     d75:	cd 40                	int    $0x40
     d77:	c3                   	ret    

00000d78 <getpid>:
SYSCALL(getpid)
     d78:	b8 12 00 00 00       	mov    $0x12,%eax
     d7d:	cd 40                	int    $0x40
     d7f:	c3                   	ret    

00000d80 <sbrk>:
SYSCALL(sbrk)
     d80:	b8 13 00 00 00       	mov    $0x13,%eax
     d85:	cd 40                	int    $0x40
     d87:	c3                   	ret    

00000d88 <sleep>:
SYSCALL(sleep)
     d88:	b8 14 00 00 00       	mov    $0x14,%eax
     d8d:	cd 40                	int    $0x40
     d8f:	c3                   	ret    

00000d90 <uptime>:
SYSCALL(uptime)
     d90:	b8 15 00 00 00       	mov    $0x15,%eax
     d95:	cd 40                	int    $0x40
     d97:	c3                   	ret    

00000d98 <thread_create>:
SYSCALL(thread_create)
     d98:	b8 16 00 00 00       	mov    $0x16,%eax
     d9d:	cd 40                	int    $0x40
     d9f:	c3                   	ret    

00000da0 <thread_getid>:
SYSCALL(thread_getid)
     da0:	b8 17 00 00 00       	mov    $0x17,%eax
     da5:	cd 40                	int    $0x40
     da7:	c3                   	ret    

00000da8 <thread_getProcId>:
SYSCALL(thread_getProcId)
     da8:	b8 18 00 00 00       	mov    $0x18,%eax
     dad:	cd 40                	int    $0x40
     daf:	c3                   	ret    

00000db0 <thread_exit>:
SYSCALL(thread_exit)
     db0:	b8 1a 00 00 00       	mov    $0x1a,%eax
     db5:	cd 40                	int    $0x40
     db7:	c3                   	ret    

00000db8 <thread_join>:
SYSCALL(thread_join)
     db8:	b8 19 00 00 00       	mov    $0x19,%eax
     dbd:	cd 40                	int    $0x40
     dbf:	c3                   	ret    

00000dc0 <binary_sem_create>:
SYSCALL(binary_sem_create)
     dc0:	b8 1b 00 00 00       	mov    $0x1b,%eax
     dc5:	cd 40                	int    $0x40
     dc7:	c3                   	ret    

00000dc8 <binary_sem_down>:
SYSCALL(binary_sem_down)
     dc8:	b8 1c 00 00 00       	mov    $0x1c,%eax
     dcd:	cd 40                	int    $0x40
     dcf:	c3                   	ret    

00000dd0 <binary_sem_up>:
SYSCALL(binary_sem_up)
     dd0:	b8 1d 00 00 00       	mov    $0x1d,%eax
     dd5:	cd 40                	int    $0x40
     dd7:	c3                   	ret    

00000dd8 <binary_sem_clear>:
SYSCALL(binary_sem_clear)
     dd8:	b8 1e 00 00 00       	mov    $0x1e,%eax
     ddd:	cd 40                	int    $0x40
     ddf:	c3                   	ret    

00000de0 <exit_all_threads>:
     de0:	b8 1f 00 00 00       	mov    $0x1f,%eax
     de5:	cd 40                	int    $0x40
     de7:	c3                   	ret    
     de8:	90                   	nop
     de9:	90                   	nop
     dea:	90                   	nop
     deb:	90                   	nop
     dec:	90                   	nop
     ded:	90                   	nop
     dee:	90                   	nop
     def:	90                   	nop

00000df0 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	89 cf                	mov    %ecx,%edi
     df6:	56                   	push   %esi
     df7:	89 c6                	mov    %eax,%esi
     df9:	53                   	push   %ebx
     dfa:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
     dfd:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e00:	85 c9                	test   %ecx,%ecx
     e02:	74 04                	je     e08 <printint+0x18>
     e04:	85 d2                	test   %edx,%edx
     e06:	78 70                	js     e78 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
     e08:	89 d0                	mov    %edx,%eax
     e0a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e11:	31 c9                	xor    %ecx,%ecx
     e13:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     e16:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
     e18:	31 d2                	xor    %edx,%edx
     e1a:	f7 f7                	div    %edi
     e1c:	0f b6 92 17 18 00 00 	movzbl 0x1817(%edx),%edx
     e23:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     e26:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
     e29:	85 c0                	test   %eax,%eax
     e2b:	75 eb                	jne    e18 <printint+0x28>
	if(neg)
     e2d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e30:	85 c0                	test   %eax,%eax
     e32:	74 08                	je     e3c <printint+0x4c>
		buf[i++] = '-';
     e34:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
     e39:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
     e3c:	8d 79 ff             	lea    -0x1(%ecx),%edi
     e3f:	01 fb                	add    %edi,%ebx
     e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e48:	0f b6 03             	movzbl (%ebx),%eax
     e4b:	83 ef 01             	sub    $0x1,%edi
     e4e:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     e51:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e58:	00 
     e59:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     e5c:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     e5f:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e62:	89 44 24 04          	mov    %eax,0x4(%esp)
     e66:	e8 ad fe ff ff       	call   d18 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     e6b:	83 ff ff             	cmp    $0xffffffff,%edi
     e6e:	75 d8                	jne    e48 <printint+0x58>
		putc(fd, buf[i]);
}
     e70:	83 c4 4c             	add    $0x4c,%esp
     e73:	5b                   	pop    %ebx
     e74:	5e                   	pop    %esi
     e75:	5f                   	pop    %edi
     e76:	5d                   	pop    %ebp
     e77:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
     e78:	89 d0                	mov    %edx,%eax
     e7a:	f7 d8                	neg    %eax
     e7c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     e83:	eb 8c                	jmp    e11 <printint+0x21>
     e85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e90 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	57                   	push   %edi
     e94:	56                   	push   %esi
     e95:	53                   	push   %ebx
     e96:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     e99:	8b 45 0c             	mov    0xc(%ebp),%eax
     e9c:	0f b6 10             	movzbl (%eax),%edx
     e9f:	84 d2                	test   %dl,%dl
     ea1:	0f 84 c9 00 00 00    	je     f70 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
     ea7:	8d 4d 10             	lea    0x10(%ebp),%ecx
     eaa:	31 ff                	xor    %edi,%edi
     eac:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     eaf:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     eb1:	8d 75 e7             	lea    -0x19(%ebp),%esi
     eb4:	eb 1e                	jmp    ed4 <printf+0x44>
     eb6:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
     eb8:	83 fa 25             	cmp    $0x25,%edx
     ebb:	0f 85 b7 00 00 00    	jne    f78 <printf+0xe8>
     ec1:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     ec5:	83 c3 01             	add    $0x1,%ebx
     ec8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     ecc:	84 d2                	test   %dl,%dl
     ece:	0f 84 9c 00 00 00    	je     f70 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
     ed4:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
     ed6:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
     ed9:	74 dd                	je     eb8 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
     edb:	83 ff 25             	cmp    $0x25,%edi
     ede:	75 e5                	jne    ec5 <printf+0x35>
			if(c == 'd'){
     ee0:	83 fa 64             	cmp    $0x64,%edx
     ee3:	0f 84 57 01 00 00    	je     1040 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
     ee9:	83 fa 70             	cmp    $0x70,%edx
     eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ef0:	0f 84 aa 00 00 00    	je     fa0 <printf+0x110>
     ef6:	83 fa 78             	cmp    $0x78,%edx
     ef9:	0f 84 a1 00 00 00    	je     fa0 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
     eff:	83 fa 73             	cmp    $0x73,%edx
     f02:	0f 84 c0 00 00 00    	je     fc8 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
     f08:	83 fa 63             	cmp    $0x63,%edx
     f0b:	90                   	nop
     f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f10:	0f 84 52 01 00 00    	je     1068 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
     f16:	83 fa 25             	cmp    $0x25,%edx
     f19:	0f 84 f9 00 00 00    	je     1018 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     f22:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f25:	31 ff                	xor    %edi,%edi
     f27:	89 55 cc             	mov    %edx,-0x34(%ebp)
     f2a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f2e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f35:	00 
     f36:	89 0c 24             	mov    %ecx,(%esp)
     f39:	89 74 24 04          	mov    %esi,0x4(%esp)
     f3d:	e8 d6 fd ff ff       	call   d18 <write>
     f42:	8b 55 cc             	mov    -0x34(%ebp),%edx
     f45:	8b 45 08             	mov    0x8(%ebp),%eax
     f48:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f4f:	00 
     f50:	89 74 24 04          	mov    %esi,0x4(%esp)
     f54:	88 55 e7             	mov    %dl,-0x19(%ebp)
     f57:	89 04 24             	mov    %eax,(%esp)
     f5a:	e8 b9 fd ff ff       	call   d18 <write>
     f5f:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     f62:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     f66:	84 d2                	test   %dl,%dl
     f68:	0f 85 66 ff ff ff    	jne    ed4 <printf+0x44>
     f6e:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
     f70:	83 c4 3c             	add    $0x3c,%esp
     f73:	5b                   	pop    %ebx
     f74:	5e                   	pop    %esi
     f75:	5f                   	pop    %edi
     f76:	5d                   	pop    %ebp
     f77:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f78:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
     f7b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f7e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f85:	00 
     f86:	89 74 24 04          	mov    %esi,0x4(%esp)
     f8a:	89 04 24             	mov    %eax,(%esp)
     f8d:	e8 86 fd ff ff       	call   d18 <write>
     f92:	8b 45 0c             	mov    0xc(%ebp),%eax
     f95:	e9 2b ff ff ff       	jmp    ec5 <printf+0x35>
     f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
     fa0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     fa3:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
     fa8:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
     faa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fb1:	8b 10                	mov    (%eax),%edx
     fb3:	8b 45 08             	mov    0x8(%ebp),%eax
     fb6:	e8 35 fe ff ff       	call   df0 <printint>
     fbb:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
     fbe:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     fc2:	e9 fe fe ff ff       	jmp    ec5 <printf+0x35>
     fc7:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
     fc8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fcb:	8b 3a                	mov    (%edx),%edi
				ap++;
     fcd:	83 c2 04             	add    $0x4,%edx
     fd0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
     fd3:	85 ff                	test   %edi,%edi
     fd5:	0f 84 ba 00 00 00    	je     1095 <printf+0x205>
					s = "(null)";
				while(*s != 0){
     fdb:	0f b6 17             	movzbl (%edi),%edx
     fde:	84 d2                	test   %dl,%dl
     fe0:	74 2d                	je     100f <printf+0x17f>
     fe2:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     fe5:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
     fe8:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
     feb:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     fee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ff5:	00 
     ff6:	89 74 24 04          	mov    %esi,0x4(%esp)
     ffa:	89 1c 24             	mov    %ebx,(%esp)
     ffd:	e8 16 fd ff ff       	call   d18 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
    1002:	0f b6 17             	movzbl (%edi),%edx
    1005:	84 d2                	test   %dl,%dl
    1007:	75 df                	jne    fe8 <printf+0x158>
    1009:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    100c:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    100f:	31 ff                	xor    %edi,%edi
    1011:	e9 af fe ff ff       	jmp    ec5 <printf+0x35>
    1016:	66 90                	xchg   %ax,%ax
    1018:	8b 55 08             	mov    0x8(%ebp),%edx
    101b:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
    101d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    1021:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1028:	00 
    1029:	89 74 24 04          	mov    %esi,0x4(%esp)
    102d:	89 14 24             	mov    %edx,(%esp)
    1030:	e8 e3 fc ff ff       	call   d18 <write>
    1035:	8b 45 0c             	mov    0xc(%ebp),%eax
    1038:	e9 88 fe ff ff       	jmp    ec5 <printf+0x35>
    103d:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
    1040:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1043:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
    1048:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
    104b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1052:	8b 10                	mov    (%eax),%edx
    1054:	8b 45 08             	mov    0x8(%ebp),%eax
    1057:	e8 94 fd ff ff       	call   df0 <printint>
    105c:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
    105f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1063:	e9 5d fe ff ff       	jmp    ec5 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    1068:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
    106b:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    106d:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    106f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1076:	00 
    1077:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
    107b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
    107e:	8b 45 08             	mov    0x8(%ebp),%eax
    1081:	89 04 24             	mov    %eax,(%esp)
    1084:	e8 8f fc ff ff       	call   d18 <write>
    1089:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
    108c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1090:	e9 30 fe ff ff       	jmp    ec5 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
    1095:	bf 10 18 00 00       	mov    $0x1810,%edi
    109a:	e9 3c ff ff ff       	jmp    fdb <printf+0x14b>
    109f:	90                   	nop

000010a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10a1:	a1 e0 18 00 00       	mov    0x18e0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    10a6:	89 e5                	mov    %esp,%ebp
    10a8:	57                   	push   %edi
    10a9:	56                   	push   %esi
    10aa:	53                   	push   %ebx
    10ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
    10ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10b1:	39 c8                	cmp    %ecx,%eax
    10b3:	73 1d                	jae    10d2 <free+0x32>
    10b5:	8d 76 00             	lea    0x0(%esi),%esi
    10b8:	8b 10                	mov    (%eax),%edx
    10ba:	39 d1                	cmp    %edx,%ecx
    10bc:	72 1a                	jb     10d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10be:	39 d0                	cmp    %edx,%eax
    10c0:	72 08                	jb     10ca <free+0x2a>
    10c2:	39 c8                	cmp    %ecx,%eax
    10c4:	72 12                	jb     10d8 <free+0x38>
    10c6:	39 d1                	cmp    %edx,%ecx
    10c8:	72 0e                	jb     10d8 <free+0x38>
    10ca:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10cc:	39 c8                	cmp    %ecx,%eax
    10ce:	66 90                	xchg   %ax,%ax
    10d0:	72 e6                	jb     10b8 <free+0x18>
    10d2:	8b 10                	mov    (%eax),%edx
    10d4:	eb e8                	jmp    10be <free+0x1e>
    10d6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    10d8:	8b 71 04             	mov    0x4(%ecx),%esi
    10db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10de:	39 d7                	cmp    %edx,%edi
    10e0:	74 19                	je     10fb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    10e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    10e5:	8b 50 04             	mov    0x4(%eax),%edx
    10e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10eb:	39 ce                	cmp    %ecx,%esi
    10ed:	74 23                	je     1112 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    10ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
    10f1:	a3 e0 18 00 00       	mov    %eax,0x18e0
}
    10f6:	5b                   	pop    %ebx
    10f7:	5e                   	pop    %esi
    10f8:	5f                   	pop    %edi
    10f9:	5d                   	pop    %ebp
    10fa:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    10fb:	03 72 04             	add    0x4(%edx),%esi
    10fe:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1101:	8b 10                	mov    (%eax),%edx
    1103:	8b 12                	mov    (%edx),%edx
    1105:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1108:	8b 50 04             	mov    0x4(%eax),%edx
    110b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    110e:	39 ce                	cmp    %ecx,%esi
    1110:	75 dd                	jne    10ef <free+0x4f>
    p->s.size += bp->s.size;
    1112:	03 51 04             	add    0x4(%ecx),%edx
    1115:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1118:	8b 53 f8             	mov    -0x8(%ebx),%edx
    111b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
    111d:	a3 e0 18 00 00       	mov    %eax,0x18e0
}
    1122:	5b                   	pop    %ebx
    1123:	5e                   	pop    %esi
    1124:	5f                   	pop    %edi
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	89 f6                	mov    %esi,%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	53                   	push   %ebx
    1136:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1139:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    113c:	8b 0d e0 18 00 00    	mov    0x18e0,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1142:	83 c3 07             	add    $0x7,%ebx
    1145:	c1 eb 03             	shr    $0x3,%ebx
    1148:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    114b:	85 c9                	test   %ecx,%ecx
    114d:	0f 84 93 00 00 00    	je     11e6 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1153:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    1155:	8b 50 04             	mov    0x4(%eax),%edx
    1158:	39 d3                	cmp    %edx,%ebx
    115a:	76 1f                	jbe    117b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
    115c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1163:	90                   	nop
    1164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
    1168:	3b 05 e0 18 00 00    	cmp    0x18e0,%eax
    116e:	74 30                	je     11a0 <malloc+0x70>
    1170:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1172:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    1174:	8b 50 04             	mov    0x4(%eax),%edx
    1177:	39 d3                	cmp    %edx,%ebx
    1179:	77 ed                	ja     1168 <malloc+0x38>
      if(p->s.size == nunits)
    117b:	39 d3                	cmp    %edx,%ebx
    117d:	74 61                	je     11e0 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    117f:	29 da                	sub    %ebx,%edx
    1181:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1184:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1187:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    118a:	89 0d e0 18 00 00    	mov    %ecx,0x18e0
      return (void*) (p + 1);
    1190:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1193:	83 c4 1c             	add    $0x1c,%esp
    1196:	5b                   	pop    %ebx
    1197:	5e                   	pop    %esi
    1198:	5f                   	pop    %edi
    1199:	5d                   	pop    %ebp
    119a:	c3                   	ret    
    119b:	90                   	nop
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    11a0:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
    11a6:	b8 00 80 00 00       	mov    $0x8000,%eax
    11ab:	bf 00 10 00 00       	mov    $0x1000,%edi
    11b0:	76 04                	jbe    11b6 <malloc+0x86>
    11b2:	89 f0                	mov    %esi,%eax
    11b4:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    11b6:	89 04 24             	mov    %eax,(%esp)
    11b9:	e8 c2 fb ff ff       	call   d80 <sbrk>
  if(p == (char*) -1)
    11be:	83 f8 ff             	cmp    $0xffffffff,%eax
    11c1:	74 18                	je     11db <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    11c3:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    11c6:	83 c0 08             	add    $0x8,%eax
    11c9:	89 04 24             	mov    %eax,(%esp)
    11cc:	e8 cf fe ff ff       	call   10a0 <free>
  return freep;
    11d1:	8b 0d e0 18 00 00    	mov    0x18e0,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    11d7:	85 c9                	test   %ecx,%ecx
    11d9:	75 97                	jne    1172 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    11db:	31 c0                	xor    %eax,%eax
    11dd:	eb b4                	jmp    1193 <malloc+0x63>
    11df:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    11e0:	8b 10                	mov    (%eax),%edx
    11e2:	89 11                	mov    %edx,(%ecx)
    11e4:	eb a4                	jmp    118a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    11e6:	c7 05 e0 18 00 00 d8 	movl   $0x18d8,0x18e0
    11ed:	18 00 00 
    base.s.size = 0;
    11f0:	b9 d8 18 00 00       	mov    $0x18d8,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    11f5:	c7 05 d8 18 00 00 d8 	movl   $0x18d8,0x18d8
    11fc:	18 00 00 
    base.s.size = 0;
    11ff:	c7 05 dc 18 00 00 00 	movl   $0x0,0x18dc
    1206:	00 00 00 
    1209:	e9 45 ff ff ff       	jmp    1153 <malloc+0x23>
    120e:	90                   	nop
    120f:	90                   	nop

00001210 <sem_clear>:
	}
	binary_sem_up(sem->S1);
}

void sem_clear(struct semaphore* sem )
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	83 ec 14             	sub    $0x14,%esp
    1217:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_clear(sem->S1);
    121a:	8b 03                	mov    (%ebx),%eax
    121c:	89 04 24             	mov    %eax,(%esp)
    121f:	e8 b4 fb ff ff       	call   dd8 <binary_sem_clear>
	binary_sem_clear(sem->S2);
    1224:	8b 43 04             	mov    0x4(%ebx),%eax
    1227:	89 04 24             	mov    %eax,(%esp)
    122a:	e8 a9 fb ff ff       	call   dd8 <binary_sem_clear>
	free(sem);
    122f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    1232:	83 c4 14             	add    $0x14,%esp
    1235:	5b                   	pop    %ebx
    1236:	5d                   	pop    %ebp

void sem_clear(struct semaphore* sem )
{
	binary_sem_clear(sem->S1);
	binary_sem_clear(sem->S2);
	free(sem);
    1237:	e9 64 fe ff ff       	jmp    10a0 <free>
    123c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001240 <sem_downs>:
	}
	binary_sem_up(sem->S1);
}

void sem_downs(struct semaphore* sem, int num )
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	83 ec 18             	sub    $0x18,%esp
    1246:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    1249:	8b 5d 08             	mov    0x8(%ebp),%ebx
    124c:	89 75 fc             	mov    %esi,-0x4(%ebp)
    124f:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S2);
    1252:	8b 43 04             	mov    0x4(%ebx),%eax
    1255:	89 04 24             	mov    %eax,(%esp)
    1258:	e8 6b fb ff ff       	call   dc8 <binary_sem_down>
	binary_sem_down(sem->S1);
    125d:	8b 03                	mov    (%ebx),%eax
    125f:	89 04 24             	mov    %eax,(%esp)
    1262:	e8 61 fb ff ff       	call   dc8 <binary_sem_down>
	sem->value -= num;
    1267:	8b 43 08             	mov    0x8(%ebx),%eax
    126a:	29 f0                	sub    %esi,%eax
	if(sem->value > 0) {
    126c:	85 c0                	test   %eax,%eax

void sem_downs(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value -= num;
    126e:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
    1271:	74 0b                	je     127e <sem_downs+0x3e>
		binary_sem_up(sem->S2);
    1273:	8b 43 04             	mov    0x4(%ebx),%eax
    1276:	89 04 24             	mov    %eax,(%esp)
    1279:	e8 52 fb ff ff       	call   dd0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    127e:	8b 03                	mov    (%ebx),%eax
}
    1280:	8b 75 fc             	mov    -0x4(%ebp),%esi
    1283:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1286:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1289:	89 ec                	mov    %ebp,%esp
    128b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value -= num;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    128c:	e9 3f fb ff ff       	jmp    dd0 <binary_sem_up>
    1291:	eb 0d                	jmp    12a0 <sem_down>
    1293:	90                   	nop
    1294:	90                   	nop
    1295:	90                   	nop
    1296:	90                   	nop
    1297:	90                   	nop
    1298:	90                   	nop
    1299:	90                   	nop
    129a:	90                   	nop
    129b:	90                   	nop
    129c:	90                   	nop
    129d:	90                   	nop
    129e:	90                   	nop
    129f:	90                   	nop

000012a0 <sem_down>:
	}
	binary_sem_up(sem->S1);
}

void sem_down(struct semaphore* sem )
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	53                   	push   %ebx
    12a4:	83 ec 14             	sub    $0x14,%esp
    12a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S2);
    12aa:	8b 43 04             	mov    0x4(%ebx),%eax
    12ad:	89 04 24             	mov    %eax,(%esp)
    12b0:	e8 13 fb ff ff       	call   dc8 <binary_sem_down>
	binary_sem_down(sem->S1);
    12b5:	8b 03                	mov    (%ebx),%eax
    12b7:	89 04 24             	mov    %eax,(%esp)
    12ba:	e8 09 fb ff ff       	call   dc8 <binary_sem_down>
	sem->value--;
    12bf:	8b 43 08             	mov    0x8(%ebx),%eax
    12c2:	83 e8 01             	sub    $0x1,%eax
	if(sem->value > 0) {
    12c5:	85 c0                	test   %eax,%eax

void sem_down(struct semaphore* sem )
{
	binary_sem_down(sem->S2);
	binary_sem_down(sem->S1);
	sem->value--;
    12c7:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value > 0) {
    12ca:	74 0b                	je     12d7 <sem_down+0x37>
		binary_sem_up(sem->S2);
    12cc:	8b 43 04             	mov    0x4(%ebx),%eax
    12cf:	89 04 24             	mov    %eax,(%esp)
    12d2:	e8 f9 fa ff ff       	call   dd0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    12d7:	8b 03                	mov    (%ebx),%eax
    12d9:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12dc:	83 c4 14             	add    $0x14,%esp
    12df:	5b                   	pop    %ebx
    12e0:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value--;
	if(sem->value > 0) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    12e1:	e9 ea fa ff ff       	jmp    dd0 <binary_sem_up>
    12e6:	8d 76 00             	lea    0x0(%esi),%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012f0 <sem_ups>:
	}
	binary_sem_up(sem->S1);
}

void sem_ups(struct semaphore* sem, int num )
{
    12f0:	55                   	push   %ebp
    12f1:	89 e5                	mov    %esp,%ebp
    12f3:	83 ec 18             	sub    $0x18,%esp
    12f6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    12f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    12fc:	89 75 fc             	mov    %esi,-0x4(%ebp)
    12ff:	8b 75 0c             	mov    0xc(%ebp),%esi
	binary_sem_down(sem->S1);
    1302:	8b 03                	mov    (%ebx),%eax
    1304:	89 04 24             	mov    %eax,(%esp)
    1307:	e8 bc fa ff ff       	call   dc8 <binary_sem_down>
	sem->value+= num;
    130c:	03 73 08             	add    0x8(%ebx),%esi
	if(sem->value == 1) {
    130f:	83 fe 01             	cmp    $0x1,%esi
}

void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
    1312:	89 73 08             	mov    %esi,0x8(%ebx)
	if(sem->value == 1) {
    1315:	74 19                	je     1330 <sem_ups+0x40>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1317:	8b 03                	mov    (%ebx),%eax
}
    1319:	8b 75 fc             	mov    -0x4(%ebp),%esi
    131c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    131f:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1322:	89 ec                	mov    %ebp,%esp
    1324:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1325:	e9 a6 fa ff ff       	jmp    dd0 <binary_sem_up>
    132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void sem_ups(struct semaphore* sem, int num )
{
	binary_sem_down(sem->S1);
	sem->value+= num;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
    1330:	8b 43 04             	mov    0x4(%ebx),%eax
    1333:	89 04 24             	mov    %eax,(%esp)
    1336:	e8 95 fa ff ff       	call   dd0 <binary_sem_up>
    133b:	eb da                	jmp    1317 <sem_ups+0x27>
    133d:	8d 76 00             	lea    0x0(%esi),%esi

00001340 <sem_up>:
	}
	return ret;
}

void sem_up(struct semaphore* sem )
{
    1340:	55                   	push   %ebp
    1341:	89 e5                	mov    %esp,%ebp
    1343:	53                   	push   %ebx
    1344:	83 ec 14             	sub    $0x14,%esp
    1347:	8b 5d 08             	mov    0x8(%ebp),%ebx
	binary_sem_down(sem->S1);
    134a:	8b 03                	mov    (%ebx),%eax
    134c:	89 04 24             	mov    %eax,(%esp)
    134f:	e8 74 fa ff ff       	call   dc8 <binary_sem_down>
	sem->value++;
    1354:	8b 43 08             	mov    0x8(%ebx),%eax
    1357:	83 c0 01             	add    $0x1,%eax
	if(sem->value == 1) {
    135a:	83 f8 01             	cmp    $0x1,%eax
}

void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
    135d:	89 43 08             	mov    %eax,0x8(%ebx)
	if(sem->value == 1) {
    1360:	74 16                	je     1378 <sem_up+0x38>
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    1362:	8b 03                	mov    (%ebx),%eax
    1364:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1367:	83 c4 14             	add    $0x14,%esp
    136a:	5b                   	pop    %ebx
    136b:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    136c:	e9 5f fa ff ff       	jmp    dd0 <binary_sem_up>
    1371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void sem_up(struct semaphore* sem )
{
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
    1378:	8b 43 04             	mov    0x4(%ebx),%eax
    137b:	89 04 24             	mov    %eax,(%esp)
    137e:	e8 4d fa ff ff       	call   dd0 <binary_sem_up>
	}
	binary_sem_up(sem->S1);
    1383:	8b 03                	mov    (%ebx),%eax
    1385:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1388:	83 c4 14             	add    $0x14,%esp
    138b:	5b                   	pop    %ebx
    138c:	5d                   	pop    %ebp
	binary_sem_down(sem->S1);
	sem->value++;
	if(sem->value == 1) {
		binary_sem_up(sem->S2);
	}
	binary_sem_up(sem->S1);
    138d:	e9 3e fa ff ff       	jmp    dd0 <binary_sem_up>
    1392:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013a0 <semaphore_create>:
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	83 ec 28             	sub    $0x28,%esp
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    13a6:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
#include "stat.h"
#include "user.h"
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
    13ad:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    13b0:	89 75 f8             	mov    %esi,-0x8(%ebp)
    13b3:	89 7d fc             	mov    %edi,-0x4(%ebp)
    13b6:	8b 7d 08             	mov    0x8(%ebp),%edi
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    13b9:	e8 72 fd ff ff       	call   1130 <malloc>
	ret->value = initial_semaphore_value;
    13be:	89 78 08             	mov    %edi,0x8(%eax)
#include "semaphore.h"

struct semaphore* semaphore_create(int initial_semaphore_value)
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
    13c1:	89 c3                	mov    %eax,%ebx
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
    13c3:	e8 f8 f9 ff ff       	call   dc0 <binary_sem_create>
    13c8:	89 03                	mov    %eax,(%ebx)
    13ca:	89 c6                	mov    %eax,%esi
    13cc:	e8 ef f9 ff ff       	call   dc0 <binary_sem_create>
    13d1:	01 c6                	add    %eax,%esi
    13d3:	89 43 04             	mov    %eax,0x4(%ebx)
    13d6:	78 20                	js     13f8 <semaphore_create+0x58>
		printf(2,"couldnt create the 2 binary semaphores");
		return 0;
	}
	if(initial_semaphore_value == 0) {
    13d8:	85 ff                	test   %edi,%edi
    13da:	75 08                	jne    13e4 <semaphore_create+0x44>
		binary_sem_down(ret->S2);
    13dc:	89 04 24             	mov    %eax,(%esp)
    13df:	e8 e4 f9 ff ff       	call   dc8 <binary_sem_down>
	}
	return ret;
}
    13e4:	89 d8                	mov    %ebx,%eax
    13e6:	8b 75 f8             	mov    -0x8(%ebp),%esi
    13e9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    13ec:	8b 7d fc             	mov    -0x4(%ebp),%edi
    13ef:	89 ec                	mov    %ebp,%esp
    13f1:	5d                   	pop    %ebp
    13f2:	c3                   	ret    
    13f3:	90                   	nop
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
	struct semaphore* ret;
	ret = malloc(sizeof(*ret));
	ret->value = initial_semaphore_value;
	if(((ret->S1 = binary_sem_create()) + (ret->S2 = binary_sem_create())) < 0) {
		printf(2,"couldnt create the 2 binary semaphores");
    13f8:	c7 44 24 04 28 18 00 	movl   $0x1828,0x4(%esp)
    13ff:	00 
    1400:	31 db                	xor    %ebx,%ebx
    1402:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1409:	e8 82 fa ff ff       	call   e90 <printf>
		return 0;
    140e:	eb d4                	jmp    13e4 <semaphore_create+0x44>

00001410 <semaphore_clear>:
	binary_sem_up(bb->mutex);
	sem_up(bb->empty);
	return element;
}

void semaphore_clear(struct BB* bb) {
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 14             	sub    $0x14,%esp
    1417:	8b 5d 08             	mov    0x8(%ebp),%ebx
	free(bb->buffer);
    141a:	8b 43 0c             	mov    0xc(%ebx),%eax
    141d:	89 04 24             	mov    %eax,(%esp)
    1420:	e8 7b fc ff ff       	call   10a0 <free>
	sem_clear(bb->empty);
    1425:	8b 43 04             	mov    0x4(%ebx),%eax
    1428:	89 04 24             	mov    %eax,(%esp)
    142b:	e8 e0 fd ff ff       	call   1210 <sem_clear>
	sem_clear(bb->full);
    1430:	8b 43 08             	mov    0x8(%ebx),%eax
    1433:	89 04 24             	mov    %eax,(%esp)
    1436:	e8 d5 fd ff ff       	call   1210 <sem_clear>
	binary_sem_clear(bb->mutex);
    143b:	8b 03                	mov    (%ebx),%eax
    143d:	89 04 24             	mov    %eax,(%esp)
    1440:	e8 93 f9 ff ff       	call   dd8 <binary_sem_clear>
	free(bb);
    1445:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    1448:	83 c4 14             	add    $0x14,%esp
    144b:	5b                   	pop    %ebx
    144c:	5d                   	pop    %ebp
void semaphore_clear(struct BB* bb) {
	free(bb->buffer);
	sem_clear(bb->empty);
	sem_clear(bb->full);
	binary_sem_clear(bb->mutex);
	free(bb);
    144d:	e9 4e fc ff ff       	jmp    10a0 <free>
    1452:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001460 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
    1466:	8b 45 08             	mov    0x8(%ebp),%eax
    1469:	8b 00                	mov    (%eax),%eax
    146b:	89 45 08             	mov    %eax,0x8(%ebp)
}
    146e:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
    146f:	e9 5c f9 ff ff       	jmp    dd0 <binary_sem_up>
    1474:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    147a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001480 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	56                   	push   %esi
    1484:	53                   	push   %ebx
    1485:	83 ec 10             	sub    $0x10,%esp
    1488:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
    148b:	8b 43 08             	mov    0x8(%ebx),%eax
    148e:	89 04 24             	mov    %eax,(%esp)
    1491:	e8 0a fe ff ff       	call   12a0 <sem_down>
	binary_sem_down(bb->mutex);
    1496:	8b 03                	mov    (%ebx),%eax
    1498:	89 04 24             	mov    %eax,(%esp)
    149b:	e8 28 f9 ff ff       	call   dc8 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
    14a0:	8b 43 14             	mov    0x14(%ebx),%eax
    14a3:	c1 e0 02             	shl    $0x2,%eax
    14a6:	03 43 0c             	add    0xc(%ebx),%eax
    14a9:	8b 30                	mov    (%eax),%esi
    14ab:	85 f6                	test   %esi,%esi
    14ad:	74 42                	je     14f1 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
    14af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
    14b5:	8b 53 18             	mov    0x18(%ebx),%edx
    14b8:	8b 43 14             	mov    0x14(%ebx),%eax
    14bb:	83 ea 01             	sub    $0x1,%edx
    14be:	39 d0                	cmp    %edx,%eax
    14c0:	74 26                	je     14e8 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
    14c2:	83 c0 01             	add    $0x1,%eax
    14c5:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
    14c8:	8b 03                	mov    (%ebx),%eax
    14ca:	89 04 24             	mov    %eax,(%esp)
    14cd:	e8 fe f8 ff ff       	call   dd0 <binary_sem_up>
	sem_up(bb->empty);
    14d2:	8b 43 04             	mov    0x4(%ebx),%eax
    14d5:	89 04 24             	mov    %eax,(%esp)
    14d8:	e8 63 fe ff ff       	call   1340 <sem_up>
	return element;
}
    14dd:	83 c4 10             	add    $0x10,%esp
    14e0:	89 f0                	mov    %esi,%eax
    14e2:	5b                   	pop    %ebx
    14e3:	5e                   	pop    %esi
    14e4:	5d                   	pop    %ebp
    14e5:	c3                   	ret    
    14e6:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
    14e8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    14ef:	eb d7                	jmp    14c8 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
    14f1:	c7 44 24 04 50 18 00 	movl   $0x1850,0x4(%esp)
    14f8:	00 
    14f9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1500:	e8 8b f9 ff ff       	call   e90 <printf>
    1505:	eb c1                	jmp    14c8 <semaphore_pop+0x48>
    1507:	89 f6                	mov    %esi,%esi
    1509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001510 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	56                   	push   %esi
    1514:	53                   	push   %ebx
    1515:	83 ec 10             	sub    $0x10,%esp
    1518:	8b 5d 08             	mov    0x8(%ebp),%ebx
    151b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    151e:	8b 43 04             	mov    0x4(%ebx),%eax
    1521:	89 04 24             	mov    %eax,(%esp)
    1524:	e8 77 fd ff ff       	call   12a0 <sem_down>
	binary_sem_down(bb->mutex);
    1529:	8b 03                	mov    (%ebx),%eax
    152b:	89 04 24             	mov    %eax,(%esp)
    152e:	e8 95 f8 ff ff       	call   dc8 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    1533:	8b 43 10             	mov    0x10(%ebx),%eax
    1536:	c1 e0 02             	shl    $0x2,%eax
    1539:	03 43 0c             	add    0xc(%ebx),%eax
    153c:	8b 10                	mov    (%eax),%edx
    153e:	85 d2                	test   %edx,%edx
    1540:	74 26                	je     1568 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    1542:	c7 44 24 04 94 18 00 	movl   $0x1894,0x4(%esp)
    1549:	00 
    154a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1551:	e8 3a f9 ff ff       	call   e90 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    1556:	8b 43 08             	mov    0x8(%ebx),%eax
    1559:	89 45 08             	mov    %eax,0x8(%ebp)
}
    155c:	83 c4 10             	add    $0x10,%esp
    155f:	5b                   	pop    %ebx
    1560:	5e                   	pop    %esi
    1561:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    1562:	e9 d9 fd ff ff       	jmp    1340 <sem_up>
    1567:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    1568:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    156a:	8b 53 18             	mov    0x18(%ebx),%edx
    156d:	8b 43 10             	mov    0x10(%ebx),%eax
    1570:	83 ea 01             	sub    $0x1,%edx
    1573:	39 d0                	cmp    %edx,%eax
    1575:	74 09                	je     1580 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    1577:	83 c0 01             	add    $0x1,%eax
    157a:	89 43 10             	mov    %eax,0x10(%ebx)
    157d:	eb d7                	jmp    1556 <semaphore_put_atomic+0x46>
    157f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    1580:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    1587:	eb cd                	jmp    1556 <semaphore_put_atomic+0x46>
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001590 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	56                   	push   %esi
    1594:	53                   	push   %ebx
    1595:	83 ec 10             	sub    $0x10,%esp
    1598:	8b 5d 08             	mov    0x8(%ebp),%ebx
    159b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    159e:	8b 43 04             	mov    0x4(%ebx),%eax
    15a1:	89 04 24             	mov    %eax,(%esp)
    15a4:	e8 f7 fc ff ff       	call   12a0 <sem_down>
	binary_sem_down(bb->mutex);
    15a9:	8b 03                	mov    (%ebx),%eax
    15ab:	89 04 24             	mov    %eax,(%esp)
    15ae:	e8 15 f8 ff ff       	call   dc8 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    15b3:	8b 43 10             	mov    0x10(%ebx),%eax
    15b6:	c1 e0 02             	shl    $0x2,%eax
    15b9:	03 43 0c             	add    0xc(%ebx),%eax
    15bc:	8b 08                	mov    (%eax),%ecx
    15be:	85 c9                	test   %ecx,%ecx
    15c0:	74 36                	je     15f8 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    15c2:	c7 44 24 04 94 18 00 	movl   $0x1894,0x4(%esp)
    15c9:	00 
    15ca:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    15d1:	e8 ba f8 ff ff       	call   e90 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
    15d6:	8b 03                	mov    (%ebx),%eax
    15d8:	89 04 24             	mov    %eax,(%esp)
    15db:	e8 f0 f7 ff ff       	call   dd0 <binary_sem_up>
	sem_up(bb->full);
    15e0:	8b 43 08             	mov    0x8(%ebx),%eax
    15e3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    15e6:	83 c4 10             	add    $0x10,%esp
    15e9:	5b                   	pop    %ebx
    15ea:	5e                   	pop    %esi
    15eb:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
    15ec:	e9 4f fd ff ff       	jmp    1340 <sem_up>
    15f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    15f8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    15fa:	8b 53 18             	mov    0x18(%ebx),%edx
    15fd:	8b 43 10             	mov    0x10(%ebx),%eax
    1600:	83 ea 01             	sub    $0x1,%edx
    1603:	39 d0                	cmp    %edx,%eax
    1605:	74 09                	je     1610 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    1607:	83 c0 01             	add    $0x1,%eax
    160a:	89 43 10             	mov    %eax,0x10(%ebx)
    160d:	eb c7                	jmp    15d6 <semaphore_put+0x46>
    160f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    1610:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    1617:	eb bd                	jmp    15d6 <semaphore_put+0x46>
    1619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001620 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
    1620:	55                   	push   %ebp
    1621:	89 e5                	mov    %esp,%ebp
    1623:	83 ec 18             	sub    $0x18,%esp
    1626:	89 75 fc             	mov    %esi,-0x4(%ebp)
    1629:	8b 75 08             	mov    0x8(%ebp),%esi
    162c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
    162f:	85 f6                	test   %esi,%esi
    1631:	79 15                	jns    1648 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    1633:	31 db                	xor    %ebx,%ebx
}
    1635:	89 d8                	mov    %ebx,%eax
    1637:	8b 75 fc             	mov    -0x4(%ebp),%esi
    163a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    163d:	89 ec                	mov    %ebp,%esp
    163f:	5d                   	pop    %ebp
    1640:	c3                   	ret    
    1641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
    1648:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
    164f:	e8 dc fa ff ff       	call   1130 <malloc>
    1654:	85 c0                	test   %eax,%eax
    1656:	89 c3                	mov    %eax,%ebx
    1658:	74 db                	je     1635 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
    165a:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
    1661:	89 04 24             	mov    %eax,(%esp)
    1664:	e8 c7 fa ff ff       	call   1130 <malloc>
    1669:	85 c0                	test   %eax,%eax
    166b:	89 43 0c             	mov    %eax,0xc(%ebx)
    166e:	74 c3                	je     1633 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
    1670:	89 34 24             	mov    %esi,(%esp)
    1673:	e8 28 fd ff ff       	call   13a0 <semaphore_create>
    1678:	85 c0                	test   %eax,%eax
    167a:	89 43 04             	mov    %eax,0x4(%ebx)
    167d:	74 b4                	je     1633 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
    167f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1686:	e8 15 fd ff ff       	call   13a0 <semaphore_create>
    168b:	85 c0                	test   %eax,%eax
    168d:	89 43 08             	mov    %eax,0x8(%ebx)
    1690:	74 a1                	je     1633 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
    1692:	e8 29 f7 ff ff       	call   dc0 <binary_sem_create>
	ret->produce = 0;
    1697:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
    169e:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
    16a5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
    16a8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    16aa:	eb 89                	jmp    1635 <BB_create+0x15>
