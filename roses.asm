
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
      2d:	a1 34 17 00 00       	mov    0x1734,%eax
      32:	89 04 24             	mov    %eax,(%esp)
      35:	e8 a6 13 00 00       	call   13e0 <semaphore_put>
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
      49:	0f b7 05 57 15 00 00 	movzwl 0x1557,%eax
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
      b0:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
      b7:	e8 1c 0b 00 00       	call   bd8 <open>
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
      df:	e8 cc 0a 00 00       	call   bb0 <read>
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
     132:	e8 79 0a 00 00       	call   bb0 <read>
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
     195:	e8 16 0a 00 00       	call   bb0 <read>
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
     1ae:	e8 bd 08 00 00       	call   a70 <atoi>
     1b3:	a3 48 17 00 00       	mov    %eax,0x1748
	H = atoi(Hstr);
     1b8:	8d 45 d1             	lea    -0x2f(%ebp),%eax
     1bb:	89 04 24             	mov    %eax,(%esp)
     1be:	e8 ad 08 00 00       	call   a70 <atoi>
     1c3:	a3 54 17 00 00       	mov    %eax,0x1754
	R = atoi(Rstr);
     1c8:	8d 45 c6             	lea    -0x3a(%ebp),%eax
     1cb:	89 04 24             	mov    %eax,(%esp)
     1ce:	e8 9d 08 00 00       	call   a70 <atoi>
     1d3:	a3 58 17 00 00       	mov    %eax,0x1758
	C = atoi(Cstr);
     1d8:	8d 45 bb             	lea    -0x45(%ebp),%eax
     1db:	89 04 24             	mov    %eax,(%esp)
     1de:	e8 8d 08 00 00       	call   a70 <atoi>
     1e3:	a3 50 17 00 00       	mov    %eax,0x1750
	totalRequests = atoi(totalRequestsstr);
     1e8:	8d 45 b0             	lea    -0x50(%ebp),%eax
     1eb:	89 04 24             	mov    %eax,(%esp)
     1ee:	e8 7d 08 00 00       	call   a70 <atoi>
	close(fd);
     1f3:	89 34 24             	mov    %esi,(%esp)
	}
	B = atoi(Bstr);
	H = atoi(Hstr);
	R = atoi(Rstr);
	C = atoi(Cstr);
	totalRequests = atoi(totalRequestsstr);
     1f6:	a3 30 17 00 00       	mov    %eax,0x1730
	close(fd);
     1fb:	e8 c0 09 00 00       	call   bc0 <close>
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
     2cb:	c7 44 24 04 13 15 00 	movl   $0x1513,0x4(%esp)
     2d2:	00 
     2d3:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2da:	e8 51 0a 00 00       	call   d30 <printf>
		exit();
     2df:	e8 b4 08 00 00       	call   b98 <exit>
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
     2ff:	e8 ac 08 00 00       	call   bb0 <read>
			if(strcmp(teststr, "otalRequests")==0) {
     304:	8d 45 a4             	lea    -0x5c(%ebp),%eax
     307:	c7 44 24 04 28 15 00 	movl   $0x1528,0x4(%esp)
     30e:	00 
     30f:	89 04 24             	mov    %eax,(%esp)
     312:	e8 89 06 00 00       	call   9a0 <strcmp>
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
	filedes = open("ss2_log.txt",(O_WRONLY | O_CREATE));
     358:	c7 44 24 04 01 02 00 	movl   $0x201,0x4(%esp)
     35f:	00 
     360:	c7 04 24 35 15 00 00 	movl   $0x1535,(%esp)
     367:	e8 6c 08 00 00       	call   bd8 <open>
	if(filedes < 0) {
     36c:	85 c0                	test   %eax,%eax
int main() {
	int i;
	void* ustack;
	readFromFile();
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ss2_log.txt",(O_WRONLY | O_CREATE));
     36e:	a3 24 17 00 00       	mov    %eax,0x1724
	if(filedes < 0) {
     373:	0f 88 ef 01 00 00    	js     568 <main+0x228>
		printf(2,"problem opening file\n");
		exit();
	}

	RBB = BB_create(R);
     379:	a1 58 17 00 00       	mov    0x1758,%eax
     37e:	89 04 24             	mov    %eax,(%esp)
     381:	e8 ea 10 00 00       	call   1470 <BB_create>
     386:	a3 34 17 00 00       	mov    %eax,0x1734
	CBB = BB_create(C);
     38b:	a1 50 17 00 00       	mov    0x1750,%eax
     390:	89 04 24             	mov    %eax,(%esp)
     393:	e8 d8 10 00 00       	call   1470 <BB_create>
	dirtyCups = 0;
     398:	c7 05 38 17 00 00 00 	movl   $0x0,0x1738
     39f:	00 00 00 
	requests = 0;
     3a2:	c7 05 44 17 00 00 00 	movl   $0x0,0x1744
     3a9:	00 00 00 
		printf(2,"problem opening file\n");
		exit();
	}

	RBB = BB_create(R);
	CBB = BB_create(C);
     3ac:	a3 5c 17 00 00       	mov    %eax,0x175c
	dirtyCups = 0;
	requests = 0;

	binsem_counter_dirty_cups = binary_sem_create();
     3b1:	e8 aa 08 00 00       	call   c60 <binary_sem_create>
     3b6:	a3 28 17 00 00       	mov    %eax,0x1728
	binsem_counter_requests = binary_sem_create();
     3bb:	e8 a0 08 00 00       	call   c60 <binary_sem_create>
     3c0:	a3 2c 17 00 00       	mov    %eax,0x172c
	binsem_wake_busboy = binary_sem_create();
     3c5:	e8 96 08 00 00       	call   c60 <binary_sem_create>
     3ca:	a3 3c 17 00 00       	mov    %eax,0x173c
	binsem_on_cups_array = binary_sem_create();
     3cf:	e8 8c 08 00 00       	call   c60 <binary_sem_create>
     3d4:	a3 40 17 00 00       	mov    %eax,0x1740
	binary_sem_down(binsem_wake_busboy);
     3d9:	a1 3c 17 00 00       	mov    0x173c,%eax
     3de:	89 04 24             	mov    %eax,(%esp)
     3e1:	e8 82 08 00 00       	call   c68 <binary_sem_down>

	cups = malloc(sizeof(Cup) * C);
     3e6:	a1 50 17 00 00       	mov    0x1750,%eax
     3eb:	c1 e0 02             	shl    $0x2,%eax
     3ee:	89 04 24             	mov    %eax,(%esp)
     3f1:	e8 da 0b 00 00       	call   fd0 <malloc>
	for(i=0;i<C;i++) {
     3f6:	8b 15 50 17 00 00    	mov    0x1750,%edx
     3fc:	85 d2                	test   %edx,%edx
	binsem_counter_requests = binary_sem_create();
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
     3fe:	a3 4c 17 00 00       	mov    %eax,0x174c
	for(i=0;i<C;i++) {
     403:	7e 40                	jle    445 <main+0x105>
     405:	31 db                	xor    %ebx,%ebx
     407:	eb 0c                	jmp    415 <main+0xd5>
     409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     410:	a1 4c 17 00 00       	mov    0x174c,%eax
		cups[i].clean = 1;
     415:	c7 04 98 01 00 00 00 	movl   $0x1,(%eax,%ebx,4)
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     41c:	a1 5c 17 00 00       	mov    0x175c,%eax
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     421:	8d 14 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edx
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     428:	03 15 4c 17 00 00    	add    0x174c,%edx
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     42e:	83 c3 01             	add    $0x1,%ebx
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
     431:	89 54 24 04          	mov    %edx,0x4(%esp)
     435:	89 04 24             	mov    %eax,(%esp)
     438:	e8 a3 0f 00 00       	call   13e0 <semaphore_put>
	binsem_wake_busboy = binary_sem_create();
	binsem_on_cups_array = binary_sem_create();
	binary_sem_down(binsem_wake_busboy);

	cups = malloc(sizeof(Cup) * C);
	for(i=0;i<C;i++) {
     43d:	39 1d 50 17 00 00    	cmp    %ebx,0x1750
     443:	7f cb                	jg     410 <main+0xd0>
		cups[i].clean = 1;
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
	}

	int tid[B+H+1];
     445:	a1 48 17 00 00       	mov    0x1748,%eax
     44a:	03 05 54 17 00 00    	add    0x1754,%eax
     450:	8d 14 85 22 00 00 00 	lea    0x22(,%eax,4),%edx
     457:	83 e2 f0             	and    $0xfffffff0,%edx
     45a:	29 d4                	sub    %edx,%esp
     45c:	8d 74 24 1b          	lea    0x1b(%esp),%esi
     460:	83 e6 f0             	and    $0xfffffff0,%esi
	for(i=0;i<(B+H+1);i++) {
     463:	85 c0                	test   %eax,%eax
     465:	0f 88 ca 00 00 00    	js     535 <main+0x1f5>
     46b:	31 db                	xor    %ebx,%ebx
     46d:	eb 38                	jmp    4a7 <main+0x167>
     46f:	90                   	nop
		}
		else {
			if(i<B) {
				tid[i] = thread_create(bartender ,ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
     470:	03 15 54 17 00 00    	add    0x1754,%edx
     476:	39 da                	cmp    %ebx,%edx
     478:	7f 6e                	jg     4e8 <main+0x1a8>
				tid[i] = thread_create(hostess ,ustack, STK_SIZE);
			}
			else {
				tid[i] = thread_create(busboy ,ustack, STK_SIZE);
     47a:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     481:	00 
     482:	89 44 24 04          	mov    %eax,0x4(%esp)
     486:	c7 04 24 20 07 00 00 	movl   $0x720,(%esp)
     48d:	e8 a6 07 00 00       	call   c38 <thread_create>
     492:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
		//printf(1,"im here %d",C);
		semaphore_put(CBB, (void*)(&(cups[i])));
	}

	int tid[B+H+1];
	for(i=0;i<(B+H+1);i++) {
     495:	a1 54 17 00 00       	mov    0x1754,%eax
     49a:	83 c3 01             	add    $0x1,%ebx
     49d:	03 05 48 17 00 00    	add    0x1748,%eax
     4a3:	39 d8                	cmp    %ebx,%eax
     4a5:	7c 61                	jl     508 <main+0x1c8>
		if((ustack = malloc(STK_SIZE)) <= 0) {
     4a7:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
     4ae:	e8 1d 0b 00 00       	call   fd0 <malloc>
     4b3:	85 c0                	test   %eax,%eax
     4b5:	0f 84 8d 00 00 00    	je     548 <main+0x208>
			printf(2,"cant malloc the stack for the thread\n");
			exit();
		}
		else {
			if(i<B) {
     4bb:	8b 15 48 17 00 00    	mov    0x1748,%edx
     4c1:	39 da                	cmp    %ebx,%edx
     4c3:	7e ab                	jle    470 <main+0x130>
				tid[i] = thread_create(bartender ,ustack, STK_SIZE);
     4c5:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     4cc:	00 
     4cd:	89 44 24 04          	mov    %eax,0x4(%esp)
     4d1:	c7 04 24 a0 08 00 00 	movl   $0x8a0,(%esp)
     4d8:	e8 5b 07 00 00       	call   c38 <thread_create>
     4dd:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
     4e0:	eb b3                	jmp    495 <main+0x155>
     4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			}
			else if((i>=B) && (i<(B+H))) {
				tid[i] = thread_create(hostess ,ustack, STK_SIZE);
     4e8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
     4ef:	00 
     4f0:	89 44 24 04          	mov    %eax,0x4(%esp)
     4f4:	c7 04 24 b0 07 00 00 	movl   $0x7b0,(%esp)
     4fb:	e8 38 07 00 00       	call   c38 <thread_create>
     500:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
		}
		else {
			if(i<B) {
				tid[i] = thread_create(bartender ,ustack, STK_SIZE);
			}
			else if((i>=B) && (i<(B+H))) {
     503:	eb 90                	jmp    495 <main+0x155>
     505:	8d 76 00             	lea    0x0(%esi),%esi
			else {
				tid[i] = thread_create(busboy ,ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+1);i++) {
     508:	85 c0                	test   %eax,%eax
     50a:	78 29                	js     535 <main+0x1f5>
     50c:	31 db                	xor    %ebx,%ebx
     50e:	66 90                	xchg   %ax,%ax
		thread_join(tid[i],0);
     510:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     517:	00 
     518:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
			else {
				tid[i] = thread_create(busboy ,ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+1);i++) {
     51b:	83 c3 01             	add    $0x1,%ebx
		thread_join(tid[i],0);
     51e:	89 04 24             	mov    %eax,(%esp)
     521:	e8 32 07 00 00       	call   c58 <thread_join>
			else {
				tid[i] = thread_create(busboy ,ustack, STK_SIZE);
			}
		}
	}
	for(i=0;i<(B+H+1);i++) {
     526:	a1 54 17 00 00       	mov    0x1754,%eax
     52b:	03 05 48 17 00 00    	add    0x1748,%eax
     531:	39 d8                	cmp    %ebx,%eax
     533:	7d db                	jge    510 <main+0x1d0>
		thread_join(tid[i],0);
	}
	close(filedes);
     535:	a1 24 17 00 00       	mov    0x1724,%eax
     53a:	89 04 24             	mov    %eax,(%esp)
     53d:	e8 7e 06 00 00       	call   bc0 <close>
	exit();
     542:	e8 51 06 00 00       	call   b98 <exit>
     547:	90                   	nop
	}

	int tid[B+H+1];
	for(i=0;i<(B+H+1);i++) {
		if((ustack = malloc(STK_SIZE)) <= 0) {
			printf(2,"cant malloc the stack for the thread\n");
     548:	c7 44 24 04 64 15 00 	movl   $0x1564,0x4(%esp)
     54f:	00 
     550:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     557:	e8 d4 07 00 00       	call   d30 <printf>
			exit();
     55c:	e8 37 06 00 00       	call   b98 <exit>
     561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	void* ustack;
	readFromFile();
	//printf(1,"%d %d %d %d %d\n",B,H,R,C,totalRequests);
	filedes = open("ss2_log.txt",(O_WRONLY | O_CREATE));
	if(filedes < 0) {
		printf(2,"problem opening file\n");
     568:	c7 44 24 04 41 15 00 	movl   $0x1541,0x4(%esp)
     56f:	00 
     570:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     577:	e8 b4 07 00 00       	call   d30 <printf>
		exit();
     57c:	e8 17 06 00 00       	call   b98 <exit>
     581:	eb 0d                	jmp    590 <washCups>
     583:	90                   	nop
     584:	90                   	nop
     585:	90                   	nop
     586:	90                   	nop
     587:	90                   	nop
     588:	90                   	nop
     589:	90                   	nop
     58a:	90                   	nop
     58b:	90                   	nop
     58c:	90                   	nop
     58d:	90                   	nop
     58e:	90                   	nop
     58f:	90                   	nop

00000590 <washCups>:

Cup* getCleanCup() {
	return (Cup*)semaphore_pop(CBB);
}

int washCups() {
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	57                   	push   %edi
     594:	56                   	push   %esi
     595:	53                   	push   %ebx
     596:	83 ec 2c             	sub    $0x2c,%esp
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
     599:	a1 40 17 00 00       	mov    0x1740,%eax
     59e:	89 04 24             	mov    %eax,(%esp)
     5a1:	e8 c2 06 00 00       	call   c68 <binary_sem_down>
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     5a6:	a1 50 17 00 00       	mov    0x1750,%eax
     5ab:	85 c0                	test   %eax,%eax
     5ad:	0f 8e 06 01 00 00    	jle    6b9 <washCups+0x129>
     5b3:	d9 7d e2             	fnstcw -0x1e(%ebp)
     5b6:	31 ff                	xor    %edi,%edi
     5b8:	31 db                	xor    %ebx,%ebx
     5ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     5bd:	db 45 e4             	fildl  -0x1c(%ebp)
     5c0:	dd 05 48 16 00 00    	fldl   0x1648
     5c6:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
     5ca:	de c9                	fmulp  %st,%st(1)
     5cc:	b4 0c                	mov    $0xc,%ah
     5ce:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
     5d2:	d9 6d e0             	fldcw  -0x20(%ebp)
     5d5:	db 5d e4             	fistpl -0x1c(%ebp)
     5d8:	d9 6d e2             	fldcw  -0x1e(%ebp)
     5db:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     5de:	85 d2                	test   %edx,%edx
     5e0:	7f 33                	jg     615 <washCups+0x85>
     5e2:	e9 c4 00 00 00       	jmp    6ab <washCups+0x11b>
     5e7:	90                   	nop
     5e8:	d9 7d e2             	fnstcw -0x1e(%ebp)
     5eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     5ee:	db 45 e4             	fildl  -0x1c(%ebp)
     5f1:	dc 0d 48 16 00 00    	fmull  0x1648
     5f7:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
     5fb:	b4 0c                	mov    $0xc,%ah
     5fd:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
     601:	d9 6d e0             	fldcw  -0x20(%ebp)
     604:	db 5d e4             	fistpl -0x1c(%ebp)
     607:	d9 6d e2             	fldcw  -0x1e(%ebp)
     60a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     60d:	39 d7                	cmp    %edx,%edi
     60f:	0f 8d 96 00 00 00    	jge    6ab <washCups+0x11b>
		if(cups[i].clean != 1) {
     615:	a1 4c 17 00 00       	mov    0x174c,%eax

int washCups() {
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     61a:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
		if(cups[i].clean != 1) {
     621:	01 f0                	add    %esi,%eax
     623:	83 38 01             	cmpl   $0x1,(%eax)
     626:	74 41                	je     669 <washCups+0xd9>
			cups[i].clean = 1;
     628:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
			binary_sem_down(binsem_counter_dirty_cups);
     62e:	a1 28 17 00 00       	mov    0x1728,%eax
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
			counter++;
     633:	83 c7 01             	add    $0x1,%edi
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
		if(cups[i].clean != 1) {
			cups[i].clean = 1;
			binary_sem_down(binsem_counter_dirty_cups);
     636:	89 04 24             	mov    %eax,(%esp)
     639:	e8 2a 06 00 00       	call   c68 <binary_sem_down>
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
     63e:	a1 28 17 00 00       	mov    0x1728,%eax
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
		if(cups[i].clean != 1) {
			cups[i].clean = 1;
			binary_sem_down(binsem_counter_dirty_cups);
			dirtyCups--;
     643:	83 2d 38 17 00 00 01 	subl   $0x1,0x1738
			binary_sem_up(binsem_counter_dirty_cups);
     64a:	89 04 24             	mov    %eax,(%esp)
     64d:	e8 1e 06 00 00       	call   c70 <binary_sem_up>
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
     652:	a1 5c 17 00 00       	mov    0x175c,%eax
     657:	03 35 4c 17 00 00    	add    0x174c,%esi
     65d:	89 04 24             	mov    %eax,(%esp)
     660:	89 74 24 04          	mov    %esi,0x4(%esp)
     664:	e8 77 0d 00 00       	call   13e0 <semaphore_put>
		}
		binary_sem_up(binsem_on_cups_array);
     669:	a1 40 17 00 00       	mov    0x1740,%eax

int washCups() {
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     66e:	83 c3 01             	add    $0x1,%ebx
			dirtyCups--;
			binary_sem_up(binsem_counter_dirty_cups);
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
		}
		binary_sem_up(binsem_on_cups_array);
     671:	89 04 24             	mov    %eax,(%esp)
     674:	e8 f7 05 00 00       	call   c70 <binary_sem_up>

int washCups() {
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     679:	a1 50 17 00 00       	mov    0x1750,%eax
     67e:	39 d8                	cmp    %ebx,%eax
     680:	0f 8f 62 ff ff ff    	jg     5e8 <washCups+0x58>
     686:	d9 7d e2             	fnstcw -0x1e(%ebp)
     689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     68c:	db 45 e4             	fildl  -0x1c(%ebp)
     68f:	dc 0d 48 16 00 00    	fmull  0x1648
     695:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
     699:	b4 0c                	mov    $0xc,%ah
     69b:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
     69f:	d9 6d e0             	fldcw  -0x20(%ebp)
     6a2:	db 5d e4             	fistpl -0x1c(%ebp)
     6a5:	d9 6d e2             	fldcw  -0x1e(%ebp)
     6a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
			counter++;
			semaphore_put(CBB,(void*)(&cups[i]));
		}
		binary_sem_up(binsem_on_cups_array);
	}
	if(counter != ((int)(C*0.85))) {
     6ab:	31 c0                	xor    %eax,%eax
     6ad:	39 d7                	cmp    %edx,%edi
     6af:	75 31                	jne    6e2 <washCups+0x152>
		printf(2,"less or more than 85% cups!! percentage is: %d",((int)(counter*0.85)));
		return -1;
	}
	return 0;
}
     6b1:	83 c4 2c             	add    $0x2c,%esp
     6b4:	5b                   	pop    %ebx
     6b5:	5e                   	pop    %esi
     6b6:	5f                   	pop    %edi
     6b7:	5d                   	pop    %ebp
     6b8:	c3                   	ret    

int washCups() {
	int i;
	int counter = 0;
	binary_sem_down(binsem_on_cups_array);
	for(i=0;(i<C && counter<((int)(C*0.85)));i++) {
     6b9:	d9 7d e2             	fnstcw -0x1e(%ebp)
     6bc:	31 ff                	xor    %edi,%edi
     6be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     6c1:	db 45 e4             	fildl  -0x1c(%ebp)
     6c4:	dc 0d 48 16 00 00    	fmull  0x1648
     6ca:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
     6ce:	b4 0c                	mov    $0xc,%ah
     6d0:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
     6d4:	d9 6d e0             	fldcw  -0x20(%ebp)
     6d7:	db 5d e4             	fistpl -0x1c(%ebp)
     6da:	d9 6d e2             	fldcw  -0x1e(%ebp)
     6dd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6e0:	eb c9                	jmp    6ab <washCups+0x11b>
			semaphore_put(CBB,(void*)(&cups[i]));
		}
		binary_sem_up(binsem_on_cups_array);
	}
	if(counter != ((int)(C*0.85))) {
		printf(2,"less or more than 85% cups!! percentage is: %d",((int)(counter*0.85)));
     6e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     6e5:	db 45 e4             	fildl  -0x1c(%ebp)
     6e8:	dc 0d 48 16 00 00    	fmull  0x1648
     6ee:	c7 44 24 04 8c 15 00 	movl   $0x158c,0x4(%esp)
     6f5:	00 
     6f6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     6fd:	d9 6d e0             	fldcw  -0x20(%ebp)
     700:	db 5c 24 08          	fistpl 0x8(%esp)
     704:	d9 6d e2             	fldcw  -0x1e(%ebp)
     707:	e8 24 06 00 00       	call   d30 <printf>
     70c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
		return -1;
     711:	eb 9e                	jmp    6b1 <washCups+0x121>
     713:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000720 <busboy>:
	thread_exit(0);
	return 0;
}

void*
busboy() {
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	53                   	push   %ebx
     724:	83 ec 24             	sub    $0x24,%esp
     727:	eb 4e                	jmp    777 <busboy+0x57>
     729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		binary_sem_down(binsem_wake_busboy);
		if(washCups() < 0) {
			printf(2,"problem with the washing of cups");
			exit();
		}
		printf(filedes,"Busboy %d added %d clean cups.\n",thread_getid(),(int)(C*0.85));
     730:	d9 7d f6             	fnstcw -0xa(%ebp)
     733:	db 05 50 17 00 00    	fildl  0x1750
     739:	dc 0d 48 16 00 00    	fmull  0x1648
     73f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     743:	b4 0c                	mov    $0xc,%ah
     745:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
     749:	d9 6d f4             	fldcw  -0xc(%ebp)
     74c:	db 5d f0             	fistpl -0x10(%ebp)
     74f:	d9 6d f6             	fldcw  -0xa(%ebp)
     752:	8b 5d f0             	mov    -0x10(%ebp),%ebx
     755:	e8 e6 04 00 00       	call   c40 <thread_getid>
     75a:	c7 44 24 04 e0 15 00 	movl   $0x15e0,0x4(%esp)
     761:	00 
     762:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     766:	89 44 24 08          	mov    %eax,0x8(%esp)
     76a:	a1 24 17 00 00       	mov    0x1724,%eax
     76f:	89 04 24             	mov    %eax,(%esp)
     772:	e8 b9 05 00 00       	call   d30 <printf>
}

void*
busboy() {
	while(1) {
		binary_sem_down(binsem_wake_busboy);
     777:	a1 3c 17 00 00       	mov    0x173c,%eax
     77c:	89 04 24             	mov    %eax,(%esp)
     77f:	e8 e4 04 00 00       	call   c68 <binary_sem_down>
		if(washCups() < 0) {
     784:	e8 07 fe ff ff       	call   590 <washCups>
     789:	85 c0                	test   %eax,%eax
     78b:	79 a3                	jns    730 <busboy+0x10>
			printf(2,"problem with the washing of cups");
     78d:	c7 44 24 04 bc 15 00 	movl   $0x15bc,0x4(%esp)
     794:	00 
     795:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     79c:	e8 8f 05 00 00       	call   d30 <printf>
			exit();
     7a1:	e8 f2 03 00 00       	call   b98 <exit>
     7a6:	8d 76 00             	lea    0x0(%esi),%esi
     7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007b0 <hostess>:
		sleep(10);
	}
}

void*
hostess() {
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	56                   	push   %esi
     7b4:	53                   	push   %ebx
     7b5:	83 ec 10             	sub    $0x10,%esp
	while(requests < totalRequests) {
     7b8:	a1 44 17 00 00       	mov    0x1744,%eax
     7bd:	3b 05 30 17 00 00    	cmp    0x1730,%eax
     7c3:	7d 7f                	jge    844 <hostess+0x94>
     7c5:	8d 76 00             	lea    0x0(%esi),%esi
		binary_sem_down(binsem_counter_requests);
     7c8:	a1 2c 17 00 00       	mov    0x172c,%eax
     7cd:	89 04 24             	mov    %eax,(%esp)
     7d0:	e8 93 04 00 00       	call   c68 <binary_sem_down>
		Request* req = malloc(sizeof(Request));
     7d5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     7dc:	e8 ef 07 00 00       	call   fd0 <malloc>
		requests++;
     7e1:	8b 1d 44 17 00 00    	mov    0x1744,%ebx
     7e7:	83 c3 01             	add    $0x1,%ebx
     7ea:	89 1d 44 17 00 00    	mov    %ebx,0x1744
		req->id = requests;
     7f0:	89 18                	mov    %ebx,(%eax)

void*
hostess() {
	while(requests < totalRequests) {
		binary_sem_down(binsem_counter_requests);
		Request* req = malloc(sizeof(Request));
     7f2:	89 c6                	mov    %eax,%esi
		requests++;
		req->id = requests;
		printf(filedes,"Hostess %d added a new request #%d\n",thread_getid(),req->id);
     7f4:	e8 47 04 00 00       	call   c40 <thread_getid>
     7f9:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     7fd:	c7 44 24 04 00 16 00 	movl   $0x1600,0x4(%esp)
     804:	00 
     805:	89 44 24 08          	mov    %eax,0x8(%esp)
     809:	a1 24 17 00 00       	mov    0x1724,%eax
     80e:	89 04 24             	mov    %eax,(%esp)
     811:	e8 1a 05 00 00       	call   d30 <printf>
		addNewRequest(req);
     816:	89 34 24             	mov    %esi,(%esp)
     819:	e8 02 f8 ff ff       	call   20 <addNewRequest>
		binary_sem_up(binsem_counter_requests);
     81e:	a1 2c 17 00 00       	mov    0x172c,%eax
     823:	89 04 24             	mov    %eax,(%esp)
     826:	e8 45 04 00 00       	call   c70 <binary_sem_up>
		sleep(10);
     82b:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
     832:	e8 f1 03 00 00       	call   c28 <sleep>
	}
}

void*
hostess() {
	while(requests < totalRequests) {
     837:	a1 44 17 00 00       	mov    0x1744,%eax
     83c:	3b 05 30 17 00 00    	cmp    0x1730,%eax
     842:	7c 84                	jl     7c8 <hostess+0x18>
		addNewRequest(req);
		binary_sem_up(binsem_counter_requests);
		sleep(10);
	}
	//printf(1,"exit hostess\n");
	thread_exit(0);
     844:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     84b:	e8 00 04 00 00       	call   c50 <thread_exit>
	return 0;
}
     850:	83 c4 10             	add    $0x10,%esp
     853:	31 c0                	xor    %eax,%eax
     855:	5b                   	pop    %ebx
     856:	5e                   	pop    %esi
     857:	5d                   	pop    %ebp
     858:	c3                   	ret    
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000860 <getRequest>:

void addNewRequest( Request* newReq) {
	semaphore_put(RBB,(void*)newReq);
}

Request* getRequest() {
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	83 ec 18             	sub    $0x18,%esp
	return (Request*)semaphore_pop(RBB);
     866:	a1 34 17 00 00       	mov    0x1734,%eax
     86b:	89 04 24             	mov    %eax,(%esp)
     86e:	e8 5d 0a 00 00       	call   12d0 <semaphore_pop>
}
     873:	c9                   	leave  
     874:	c3                   	ret    
     875:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000880 <getCleanCup>:
int B,H,R,C,totalRequests;
int binsem_wake_busboy; //lock on the waking and sleeping of the busboy to clean the cups
int binsem_on_cups_array; //lock on the array of cups
int filedes; //file descriptor of the log file

Cup* getCleanCup() {
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	83 ec 18             	sub    $0x18,%esp
	return (Cup*)semaphore_pop(CBB);
     886:	a1 5c 17 00 00       	mov    0x175c,%eax
     88b:	89 04 24             	mov    %eax,(%esp)
     88e:	e8 3d 0a 00 00       	call   12d0 <semaphore_pop>
}
     893:	c9                   	leave  
     894:	c3                   	ret    
     895:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <bartender>:
Request* getRequest() {
	return (Request*)semaphore_pop(RBB);
}

void*
bartender() {
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	56                   	push   %esi
     8a4:	53                   	push   %ebx
     8a5:	83 ec 20             	sub    $0x20,%esp
     8a8:	eb 4d                	jmp    8f7 <bartender+0x57>
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		dirtyCups++;
		cup->clean = 0;
		if(dirtyCups == ((int)(C*0.85))) {
			binary_sem_up(binsem_wake_busboy);
		}
		binary_sem_up(binsem_counter_dirty_cups);
     8b0:	a1 28 17 00 00       	mov    0x1728,%eax
     8b5:	89 04 24             	mov    %eax,(%esp)
     8b8:	e8 b3 03 00 00       	call   c70 <binary_sem_up>
		printf(filedes,"Bartender %d completed request #%d\n",thread_getid(),req->id);
     8bd:	8b 33                	mov    (%ebx),%esi
     8bf:	e8 7c 03 00 00       	call   c40 <thread_getid>
     8c4:	c7 44 24 04 24 16 00 	movl   $0x1624,0x4(%esp)
     8cb:	00 
     8cc:	89 74 24 0c          	mov    %esi,0xc(%esp)
     8d0:	89 44 24 08          	mov    %eax,0x8(%esp)
     8d4:	a1 24 17 00 00       	mov    0x1724,%eax
     8d9:	89 04 24             	mov    %eax,(%esp)
     8dc:	e8 4f 04 00 00       	call   d30 <printf>
		if(req->id == totalRequests) {
     8e1:	8b 03                	mov    (%ebx),%eax
     8e3:	3b 05 30 17 00 00    	cmp    0x1730,%eax
     8e9:	74 75                	je     960 <bartender+0xc0>
                    exit_all_threads();//need to leave the main process on so he can do thread_join
		}
		sleep(10);
     8eb:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
     8f2:	e8 31 03 00 00       	call   c28 <sleep>
}

void*
bartender() {
	while(1) {
		Request* req = getRequest();
     8f7:	e8 64 ff ff ff       	call   860 <getRequest>
     8fc:	89 c3                	mov    %eax,%ebx

		binary_sem_down(binsem_counter_dirty_cups);
     8fe:	a1 28 17 00 00       	mov    0x1728,%eax
     903:	89 04 24             	mov    %eax,(%esp)
     906:	e8 5d 03 00 00       	call   c68 <binary_sem_down>
		Cup* cup = getCleanCup();
     90b:	e8 70 ff ff ff       	call   880 <getCleanCup>
		dirtyCups++;
     910:	83 05 38 17 00 00 01 	addl   $0x1,0x1738
		cup->clean = 0;
     917:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(dirtyCups == ((int)(C*0.85))) {
     91d:	d9 7d f6             	fnstcw -0xa(%ebp)
     920:	db 05 50 17 00 00    	fildl  0x1750
     926:	dc 0d 48 16 00 00    	fmull  0x1648
     92c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     930:	b4 0c                	mov    $0xc,%ah
     932:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
     936:	d9 6d f4             	fldcw  -0xc(%ebp)
     939:	db 5d f0             	fistpl -0x10(%ebp)
     93c:	d9 6d f6             	fldcw  -0xa(%ebp)
     93f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     942:	3b 05 38 17 00 00    	cmp    0x1738,%eax
     948:	0f 85 62 ff ff ff    	jne    8b0 <bartender+0x10>
			binary_sem_up(binsem_wake_busboy);
     94e:	a1 3c 17 00 00       	mov    0x173c,%eax
     953:	89 04 24             	mov    %eax,(%esp)
     956:	e8 15 03 00 00       	call   c70 <binary_sem_up>
     95b:	e9 50 ff ff ff       	jmp    8b0 <bartender+0x10>
		}
		binary_sem_up(binsem_counter_dirty_cups);
		printf(filedes,"Bartender %d completed request #%d\n",thread_getid(),req->id);
		if(req->id == totalRequests) {
                    exit_all_threads();//need to leave the main process on so he can do thread_join
     960:	e8 1b 03 00 00       	call   c80 <exit_all_threads>
     965:	8d 76 00             	lea    0x0(%esi),%esi
     968:	eb 81                	jmp    8eb <bartender+0x4b>
     96a:	90                   	nop
     96b:	90                   	nop
     96c:	90                   	nop
     96d:	90                   	nop
     96e:	90                   	nop
     96f:	90                   	nop

00000970 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     970:	55                   	push   %ebp
     971:	31 d2                	xor    %edx,%edx
     973:	89 e5                	mov    %esp,%ebp
     975:	8b 45 08             	mov    0x8(%ebp),%eax
     978:	53                   	push   %ebx
     979:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     980:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     984:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     987:	83 c2 01             	add    $0x1,%edx
     98a:	84 c9                	test   %cl,%cl
     98c:	75 f2                	jne    980 <strcpy+0x10>
    ;
  return os;
}
     98e:	5b                   	pop    %ebx
     98f:	5d                   	pop    %ebp
     990:	c3                   	ret    
     991:	eb 0d                	jmp    9a0 <strcmp>
     993:	90                   	nop
     994:	90                   	nop
     995:	90                   	nop
     996:	90                   	nop
     997:	90                   	nop
     998:	90                   	nop
     999:	90                   	nop
     99a:	90                   	nop
     99b:	90                   	nop
     99c:	90                   	nop
     99d:	90                   	nop
     99e:	90                   	nop
     99f:	90                   	nop

000009a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	53                   	push   %ebx
     9a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     9a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     9aa:	0f b6 01             	movzbl (%ecx),%eax
     9ad:	84 c0                	test   %al,%al
     9af:	75 14                	jne    9c5 <strcmp+0x25>
     9b1:	eb 25                	jmp    9d8 <strcmp+0x38>
     9b3:	90                   	nop
     9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
     9b8:	83 c1 01             	add    $0x1,%ecx
     9bb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     9be:	0f b6 01             	movzbl (%ecx),%eax
     9c1:	84 c0                	test   %al,%al
     9c3:	74 13                	je     9d8 <strcmp+0x38>
     9c5:	0f b6 1a             	movzbl (%edx),%ebx
     9c8:	38 d8                	cmp    %bl,%al
     9ca:	74 ec                	je     9b8 <strcmp+0x18>
     9cc:	0f b6 db             	movzbl %bl,%ebx
     9cf:	0f b6 c0             	movzbl %al,%eax
     9d2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     9d4:	5b                   	pop    %ebx
     9d5:	5d                   	pop    %ebp
     9d6:	c3                   	ret    
     9d7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     9d8:	0f b6 1a             	movzbl (%edx),%ebx
     9db:	31 c0                	xor    %eax,%eax
     9dd:	0f b6 db             	movzbl %bl,%ebx
     9e0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     9e2:	5b                   	pop    %ebx
     9e3:	5d                   	pop    %ebp
     9e4:	c3                   	ret    
     9e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <strlen>:

uint
strlen(char *s)
{
     9f0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
     9f1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     9f3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
     9f5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     9f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     9fa:	80 39 00             	cmpb   $0x0,(%ecx)
     9fd:	74 0c                	je     a0b <strlen+0x1b>
     9ff:	90                   	nop
     a00:	83 c2 01             	add    $0x1,%edx
     a03:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     a07:	89 d0                	mov    %edx,%eax
     a09:	75 f5                	jne    a00 <strlen+0x10>
    ;
  return n;
}
     a0b:	5d                   	pop    %ebp
     a0c:	c3                   	ret    
     a0d:	8d 76 00             	lea    0x0(%esi),%esi

00000a10 <memset>:

void*
memset(void *dst, int c, uint n)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	8b 55 08             	mov    0x8(%ebp),%edx
     a16:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     a17:	8b 4d 10             	mov    0x10(%ebp),%ecx
     a1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     a1d:	89 d7                	mov    %edx,%edi
     a1f:	fc                   	cld    
     a20:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     a22:	89 d0                	mov    %edx,%eax
     a24:	5f                   	pop    %edi
     a25:	5d                   	pop    %ebp
     a26:	c3                   	ret    
     a27:	89 f6                	mov    %esi,%esi
     a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a30 <strchr>:

char*
strchr(const char *s, char c)
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	8b 45 08             	mov    0x8(%ebp),%eax
     a36:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     a3a:	0f b6 10             	movzbl (%eax),%edx
     a3d:	84 d2                	test   %dl,%dl
     a3f:	75 11                	jne    a52 <strchr+0x22>
     a41:	eb 15                	jmp    a58 <strchr+0x28>
     a43:	90                   	nop
     a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a48:	83 c0 01             	add    $0x1,%eax
     a4b:	0f b6 10             	movzbl (%eax),%edx
     a4e:	84 d2                	test   %dl,%dl
     a50:	74 06                	je     a58 <strchr+0x28>
    if(*s == c)
     a52:	38 ca                	cmp    %cl,%dl
     a54:	75 f2                	jne    a48 <strchr+0x18>
      return (char*) s;
  return 0;
}
     a56:	5d                   	pop    %ebp
     a57:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     a58:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*) s;
  return 0;
}
     a5a:	5d                   	pop    %ebp
     a5b:	90                   	nop
     a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a60:	c3                   	ret    
     a61:	eb 0d                	jmp    a70 <atoi>
     a63:	90                   	nop
     a64:	90                   	nop
     a65:	90                   	nop
     a66:	90                   	nop
     a67:	90                   	nop
     a68:	90                   	nop
     a69:	90                   	nop
     a6a:	90                   	nop
     a6b:	90                   	nop
     a6c:	90                   	nop
     a6d:	90                   	nop
     a6e:	90                   	nop
     a6f:	90                   	nop

00000a70 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     a70:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     a71:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
     a73:	89 e5                	mov    %esp,%ebp
     a75:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a78:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     a79:	0f b6 11             	movzbl (%ecx),%edx
     a7c:	8d 5a d0             	lea    -0x30(%edx),%ebx
     a7f:	80 fb 09             	cmp    $0x9,%bl
     a82:	77 1c                	ja     aa0 <atoi+0x30>
     a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
     a88:	0f be d2             	movsbl %dl,%edx
     a8b:	83 c1 01             	add    $0x1,%ecx
     a8e:	8d 04 80             	lea    (%eax,%eax,4),%eax
     a91:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     a95:	0f b6 11             	movzbl (%ecx),%edx
     a98:	8d 5a d0             	lea    -0x30(%edx),%ebx
     a9b:	80 fb 09             	cmp    $0x9,%bl
     a9e:	76 e8                	jbe    a88 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     aa0:	5b                   	pop    %ebx
     aa1:	5d                   	pop    %ebp
     aa2:	c3                   	ret    
     aa3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ab0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	56                   	push   %esi
     ab4:	8b 45 08             	mov    0x8(%ebp),%eax
     ab7:	53                   	push   %ebx
     ab8:	8b 5d 10             	mov    0x10(%ebp),%ebx
     abb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     abe:	85 db                	test   %ebx,%ebx
     ac0:	7e 14                	jle    ad6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
     ac2:	31 d2                	xor    %edx,%edx
     ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     ac8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     acc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     acf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     ad2:	39 da                	cmp    %ebx,%edx
     ad4:	75 f2                	jne    ac8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     ad6:	5b                   	pop    %ebx
     ad7:	5e                   	pop    %esi
     ad8:	5d                   	pop    %ebp
     ad9:	c3                   	ret    
     ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ae0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ae6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
     ae9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     aec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
     aef:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     af4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     afb:	00 
     afc:	89 04 24             	mov    %eax,(%esp)
     aff:	e8 d4 00 00 00       	call   bd8 <open>
  if(fd < 0)
     b04:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b06:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     b08:	78 19                	js     b23 <stat+0x43>
    return -1;
  r = fstat(fd, st);
     b0a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b0d:	89 1c 24             	mov    %ebx,(%esp)
     b10:	89 44 24 04          	mov    %eax,0x4(%esp)
     b14:	e8 d7 00 00 00       	call   bf0 <fstat>
  close(fd);
     b19:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     b1c:	89 c6                	mov    %eax,%esi
  close(fd);
     b1e:	e8 9d 00 00 00       	call   bc0 <close>
  return r;
}
     b23:	89 f0                	mov    %esi,%eax
     b25:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     b28:	8b 75 fc             	mov    -0x4(%ebp),%esi
     b2b:	89 ec                	mov    %ebp,%esp
     b2d:	5d                   	pop    %ebp
     b2e:	c3                   	ret    
     b2f:	90                   	nop

00000b30 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	31 f6                	xor    %esi,%esi
     b37:	53                   	push   %ebx
     b38:	83 ec 2c             	sub    $0x2c,%esp
     b3b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b3e:	eb 06                	jmp    b46 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     b40:	3c 0a                	cmp    $0xa,%al
     b42:	74 39                	je     b7d <gets+0x4d>
     b44:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b46:	8d 5e 01             	lea    0x1(%esi),%ebx
     b49:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b4c:	7d 31                	jge    b7f <gets+0x4f>
    cc = read(0, &c, 1);
     b4e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     b51:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     b58:	00 
     b59:	89 44 24 04          	mov    %eax,0x4(%esp)
     b5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b64:	e8 47 00 00 00       	call   bb0 <read>
    if(cc < 1)
     b69:	85 c0                	test   %eax,%eax
     b6b:	7e 12                	jle    b7f <gets+0x4f>
      break;
    buf[i++] = c;
     b6d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b71:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
     b75:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b79:	3c 0d                	cmp    $0xd,%al
     b7b:	75 c3                	jne    b40 <gets+0x10>
     b7d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     b7f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     b83:	89 f8                	mov    %edi,%eax
     b85:	83 c4 2c             	add    $0x2c,%esp
     b88:	5b                   	pop    %ebx
     b89:	5e                   	pop    %esi
     b8a:	5f                   	pop    %edi
     b8b:	5d                   	pop    %ebp
     b8c:	c3                   	ret    
     b8d:	90                   	nop
     b8e:	90                   	nop
     b8f:	90                   	nop

00000b90 <fork>:
     b90:	b8 01 00 00 00       	mov    $0x1,%eax
     b95:	cd 40                	int    $0x40
     b97:	c3                   	ret    

00000b98 <exit>:
     b98:	b8 02 00 00 00       	mov    $0x2,%eax
     b9d:	cd 40                	int    $0x40
     b9f:	c3                   	ret    

00000ba0 <wait>:
     ba0:	b8 03 00 00 00       	mov    $0x3,%eax
     ba5:	cd 40                	int    $0x40
     ba7:	c3                   	ret    

00000ba8 <pipe>:
     ba8:	b8 04 00 00 00       	mov    $0x4,%eax
     bad:	cd 40                	int    $0x40
     baf:	c3                   	ret    

00000bb0 <read>:
     bb0:	b8 06 00 00 00       	mov    $0x6,%eax
     bb5:	cd 40                	int    $0x40
     bb7:	c3                   	ret    

00000bb8 <write>:
     bb8:	b8 05 00 00 00       	mov    $0x5,%eax
     bbd:	cd 40                	int    $0x40
     bbf:	c3                   	ret    

00000bc0 <close>:
     bc0:	b8 07 00 00 00       	mov    $0x7,%eax
     bc5:	cd 40                	int    $0x40
     bc7:	c3                   	ret    

00000bc8 <kill>:
     bc8:	b8 08 00 00 00       	mov    $0x8,%eax
     bcd:	cd 40                	int    $0x40
     bcf:	c3                   	ret    

00000bd0 <exec>:
     bd0:	b8 09 00 00 00       	mov    $0x9,%eax
     bd5:	cd 40                	int    $0x40
     bd7:	c3                   	ret    

00000bd8 <open>:
     bd8:	b8 0a 00 00 00       	mov    $0xa,%eax
     bdd:	cd 40                	int    $0x40
     bdf:	c3                   	ret    

00000be0 <mknod>:
     be0:	b8 0b 00 00 00       	mov    $0xb,%eax
     be5:	cd 40                	int    $0x40
     be7:	c3                   	ret    

00000be8 <unlink>:
     be8:	b8 0c 00 00 00       	mov    $0xc,%eax
     bed:	cd 40                	int    $0x40
     bef:	c3                   	ret    

00000bf0 <fstat>:
     bf0:	b8 0d 00 00 00       	mov    $0xd,%eax
     bf5:	cd 40                	int    $0x40
     bf7:	c3                   	ret    

00000bf8 <link>:
     bf8:	b8 0e 00 00 00       	mov    $0xe,%eax
     bfd:	cd 40                	int    $0x40
     bff:	c3                   	ret    

00000c00 <mkdir>:
     c00:	b8 0f 00 00 00       	mov    $0xf,%eax
     c05:	cd 40                	int    $0x40
     c07:	c3                   	ret    

00000c08 <chdir>:
     c08:	b8 10 00 00 00       	mov    $0x10,%eax
     c0d:	cd 40                	int    $0x40
     c0f:	c3                   	ret    

00000c10 <dup>:
     c10:	b8 11 00 00 00       	mov    $0x11,%eax
     c15:	cd 40                	int    $0x40
     c17:	c3                   	ret    

00000c18 <getpid>:
     c18:	b8 12 00 00 00       	mov    $0x12,%eax
     c1d:	cd 40                	int    $0x40
     c1f:	c3                   	ret    

00000c20 <sbrk>:
     c20:	b8 13 00 00 00       	mov    $0x13,%eax
     c25:	cd 40                	int    $0x40
     c27:	c3                   	ret    

00000c28 <sleep>:
     c28:	b8 14 00 00 00       	mov    $0x14,%eax
     c2d:	cd 40                	int    $0x40
     c2f:	c3                   	ret    

00000c30 <uptime>:
     c30:	b8 15 00 00 00       	mov    $0x15,%eax
     c35:	cd 40                	int    $0x40
     c37:	c3                   	ret    

00000c38 <thread_create>:
     c38:	b8 16 00 00 00       	mov    $0x16,%eax
     c3d:	cd 40                	int    $0x40
     c3f:	c3                   	ret    

00000c40 <thread_getid>:
     c40:	b8 17 00 00 00       	mov    $0x17,%eax
     c45:	cd 40                	int    $0x40
     c47:	c3                   	ret    

00000c48 <thread_getProcid>:
     c48:	b8 18 00 00 00       	mov    $0x18,%eax
     c4d:	cd 40                	int    $0x40
     c4f:	c3                   	ret    

00000c50 <thread_exit>:
     c50:	b8 1a 00 00 00       	mov    $0x1a,%eax
     c55:	cd 40                	int    $0x40
     c57:	c3                   	ret    

00000c58 <thread_join>:
     c58:	b8 19 00 00 00       	mov    $0x19,%eax
     c5d:	cd 40                	int    $0x40
     c5f:	c3                   	ret    

00000c60 <binary_sem_create>:
     c60:	b8 1b 00 00 00       	mov    $0x1b,%eax
     c65:	cd 40                	int    $0x40
     c67:	c3                   	ret    

00000c68 <binary_sem_down>:
     c68:	b8 1c 00 00 00       	mov    $0x1c,%eax
     c6d:	cd 40                	int    $0x40
     c6f:	c3                   	ret    

00000c70 <binary_sem_up>:
     c70:	b8 1d 00 00 00       	mov    $0x1d,%eax
     c75:	cd 40                	int    $0x40
     c77:	c3                   	ret    

00000c78 <binary_sem_clear>:
     c78:	b8 1e 00 00 00       	mov    $0x1e,%eax
     c7d:	cd 40                	int    $0x40
     c7f:	c3                   	ret    

00000c80 <exit_all_threads>:
     c80:	b8 1f 00 00 00       	mov    $0x1f,%eax
     c85:	cd 40                	int    $0x40
     c87:	c3                   	ret    
     c88:	90                   	nop
     c89:	90                   	nop
     c8a:	90                   	nop
     c8b:	90                   	nop
     c8c:	90                   	nop
     c8d:	90                   	nop
     c8e:	90                   	nop
     c8f:	90                   	nop

00000c90 <printint>:
	write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	89 cf                	mov    %ecx,%edi
     c96:	56                   	push   %esi
     c97:	89 c6                	mov    %eax,%esi
     c99:	53                   	push   %ebx
     c9a:	83 ec 4c             	sub    $0x4c,%esp
	char buf[16];
	int i, neg;
	uint x;

	neg = 0;
	if(sgn && xx < 0){
     c9d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ca0:	85 c9                	test   %ecx,%ecx
     ca2:	74 04                	je     ca8 <printint+0x18>
     ca4:	85 d2                	test   %edx,%edx
     ca6:	78 70                	js     d18 <printint+0x88>
		neg = 1;
		x = -xx;
	} else {
		x = xx;
     ca8:	89 d0                	mov    %edx,%eax
     caa:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     cb1:	31 c9                	xor    %ecx,%ecx
     cb3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     cb6:	66 90                	xchg   %ax,%ax
	}

	i = 0;
	do{
		buf[i++] = digits[x % base];
     cb8:	31 d2                	xor    %edx,%edx
     cba:	f7 f7                	div    %edi
     cbc:	0f b6 92 57 16 00 00 	movzbl 0x1657(%edx),%edx
     cc3:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     cc6:	83 c1 01             	add    $0x1,%ecx
	}while((x /= base) != 0);
     cc9:	85 c0                	test   %eax,%eax
     ccb:	75 eb                	jne    cb8 <printint+0x28>
	if(neg)
     ccd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     cd0:	85 c0                	test   %eax,%eax
     cd2:	74 08                	je     cdc <printint+0x4c>
		buf[i++] = '-';
     cd4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
     cd9:	83 c1 01             	add    $0x1,%ecx

	while(--i >= 0)
     cdc:	8d 79 ff             	lea    -0x1(%ecx),%edi
     cdf:	01 fb                	add    %edi,%ebx
     ce1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ce8:	0f b6 03             	movzbl (%ebx),%eax
     ceb:	83 ef 01             	sub    $0x1,%edi
     cee:	83 eb 01             	sub    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     cf1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     cf8:	00 
     cf9:	89 34 24             	mov    %esi,(%esp)
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     cfc:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     cff:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d02:	89 44 24 04          	mov    %eax,0x4(%esp)
     d06:	e8 ad fe ff ff       	call   bb8 <write>
		buf[i++] = digits[x % base];
	}while((x /= base) != 0);
	if(neg)
		buf[i++] = '-';

	while(--i >= 0)
     d0b:	83 ff ff             	cmp    $0xffffffff,%edi
     d0e:	75 d8                	jne    ce8 <printint+0x58>
		putc(fd, buf[i]);
}
     d10:	83 c4 4c             	add    $0x4c,%esp
     d13:	5b                   	pop    %ebx
     d14:	5e                   	pop    %esi
     d15:	5f                   	pop    %edi
     d16:	5d                   	pop    %ebp
     d17:	c3                   	ret    
	uint x;

	neg = 0;
	if(sgn && xx < 0){
		neg = 1;
		x = -xx;
     d18:	89 d0                	mov    %edx,%eax
     d1a:	f7 d8                	neg    %eax
     d1c:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     d23:	eb 8c                	jmp    cb1 <printint+0x21>
     d25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d30 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	57                   	push   %edi
     d34:	56                   	push   %esi
     d35:	53                   	push   %ebx
     d36:	83 ec 3c             	sub    $0x3c,%esp
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     d39:	8b 45 0c             	mov    0xc(%ebp),%eax
     d3c:	0f b6 10             	movzbl (%eax),%edx
     d3f:	84 d2                	test   %dl,%dl
     d41:	0f 84 c9 00 00 00    	je     e10 <printf+0xe0>
	char *s;
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
     d47:	8d 4d 10             	lea    0x10(%ebp),%ecx
     d4a:	31 ff                	xor    %edi,%edi
     d4c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     d4f:	31 db                	xor    %ebx,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     d51:	8d 75 e7             	lea    -0x19(%ebp),%esi
     d54:	eb 1e                	jmp    d74 <printf+0x44>
     d56:	66 90                	xchg   %ax,%ax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
     d58:	83 fa 25             	cmp    $0x25,%edx
     d5b:	0f 85 b7 00 00 00    	jne    e18 <printf+0xe8>
     d61:	66 bf 25 00          	mov    $0x25,%di
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     d65:	83 c3 01             	add    $0x1,%ebx
     d68:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     d6c:	84 d2                	test   %dl,%dl
     d6e:	0f 84 9c 00 00 00    	je     e10 <printf+0xe0>
		c = fmt[i] & 0xff;
		if(state == 0){
     d74:	85 ff                	test   %edi,%edi
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
     d76:	0f b6 d2             	movzbl %dl,%edx
		if(state == 0){
     d79:	74 dd                	je     d58 <printf+0x28>
			if(c == '%'){
				state = '%';
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
     d7b:	83 ff 25             	cmp    $0x25,%edi
     d7e:	75 e5                	jne    d65 <printf+0x35>
			if(c == 'd'){
     d80:	83 fa 64             	cmp    $0x64,%edx
     d83:	0f 84 57 01 00 00    	je     ee0 <printf+0x1b0>
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
     d89:	83 fa 70             	cmp    $0x70,%edx
     d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d90:	0f 84 aa 00 00 00    	je     e40 <printf+0x110>
     d96:	83 fa 78             	cmp    $0x78,%edx
     d99:	0f 84 a1 00 00 00    	je     e40 <printf+0x110>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
     d9f:	83 fa 73             	cmp    $0x73,%edx
     da2:	0f 84 c0 00 00 00    	je     e68 <printf+0x138>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
     da8:	83 fa 63             	cmp    $0x63,%edx
     dab:	90                   	nop
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     db0:	0f 84 52 01 00 00    	je     f08 <printf+0x1d8>
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
     db6:	83 fa 25             	cmp    $0x25,%edx
     db9:	0f 84 f9 00 00 00    	je     eb8 <printf+0x188>
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     dbf:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     dc2:	83 c3 01             	add    $0x1,%ebx
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     dc5:	31 ff                	xor    %edi,%edi
     dc7:	89 55 cc             	mov    %edx,-0x34(%ebp)
     dca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     dce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     dd5:	00 
     dd6:	89 0c 24             	mov    %ecx,(%esp)
     dd9:	89 74 24 04          	mov    %esi,0x4(%esp)
     ddd:	e8 d6 fd ff ff       	call   bb8 <write>
     de2:	8b 55 cc             	mov    -0x34(%ebp),%edx
     de5:	8b 45 08             	mov    0x8(%ebp),%eax
     de8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     def:	00 
     df0:	89 74 24 04          	mov    %esi,0x4(%esp)
     df4:	88 55 e7             	mov    %dl,-0x19(%ebp)
     df7:	89 04 24             	mov    %eax,(%esp)
     dfa:	e8 b9 fd ff ff       	call   bb8 <write>
     dff:	8b 45 0c             	mov    0xc(%ebp),%eax
	int c, i, state;
	uint *ap;

	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
     e02:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
     e06:	84 d2                	test   %dl,%dl
     e08:	0f 85 66 ff ff ff    	jne    d74 <printf+0x44>
     e0e:	66 90                	xchg   %ax,%ax
				putc(fd, c);
			}
			state = 0;
		}
	}
}
     e10:	83 c4 3c             	add    $0x3c,%esp
     e13:	5b                   	pop    %ebx
     e14:	5e                   	pop    %esi
     e15:	5f                   	pop    %edi
     e16:	5d                   	pop    %ebp
     e17:	c3                   	ret    
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     e18:	8b 45 08             	mov    0x8(%ebp),%eax
	state = 0;
	ap = (uint*)(void*)&fmt + 1;
	for(i = 0; fmt[i]; i++){
		c = fmt[i] & 0xff;
		if(state == 0){
			if(c == '%'){
     e1b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     e1e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e25:	00 
     e26:	89 74 24 04          	mov    %esi,0x4(%esp)
     e2a:	89 04 24             	mov    %eax,(%esp)
     e2d:	e8 86 fd ff ff       	call   bb8 <write>
     e32:	8b 45 0c             	mov    0xc(%ebp),%eax
     e35:	e9 2b ff ff ff       	jmp    d65 <printf+0x35>
     e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
     e40:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e43:	b9 10 00 00 00       	mov    $0x10,%ecx
				ap++;
     e48:	31 ff                	xor    %edi,%edi
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
				ap++;
			} else if(c == 'x' || c == 'p'){
				printint(fd, *ap, 16, 0);
     e4a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e51:	8b 10                	mov    (%eax),%edx
     e53:	8b 45 08             	mov    0x8(%ebp),%eax
     e56:	e8 35 fe ff ff       	call   c90 <printint>
     e5b:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
     e5e:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     e62:	e9 fe fe ff ff       	jmp    d65 <printf+0x35>
     e67:	90                   	nop
			} else if(c == 's'){
				s = (char*)*ap;
     e68:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e6b:	8b 3a                	mov    (%edx),%edi
				ap++;
     e6d:	83 c2 04             	add    $0x4,%edx
     e70:	89 55 d4             	mov    %edx,-0x2c(%ebp)
				if(s == 0)
     e73:	85 ff                	test   %edi,%edi
     e75:	0f 84 ba 00 00 00    	je     f35 <printf+0x205>
					s = "(null)";
				while(*s != 0){
     e7b:	0f b6 17             	movzbl (%edi),%edx
     e7e:	84 d2                	test   %dl,%dl
     e80:	74 2d                	je     eaf <printf+0x17f>
     e82:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     e85:	8b 5d 08             	mov    0x8(%ebp),%ebx
					putc(fd, *s);
					s++;
     e88:	83 c7 01             	add    $0x1,%edi
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
     e8b:	88 55 e7             	mov    %dl,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     e8e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e95:	00 
     e96:	89 74 24 04          	mov    %esi,0x4(%esp)
     e9a:	89 1c 24             	mov    %ebx,(%esp)
     e9d:	e8 16 fd ff ff       	call   bb8 <write>
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
					s = "(null)";
				while(*s != 0){
     ea2:	0f b6 17             	movzbl (%edi),%edx
     ea5:	84 d2                	test   %dl,%dl
     ea7:	75 df                	jne    e88 <printf+0x158>
     ea9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     eac:	8b 45 0c             	mov    0xc(%ebp),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     eaf:	31 ff                	xor    %edi,%edi
     eb1:	e9 af fe ff ff       	jmp    d65 <printf+0x35>
     eb6:	66 90                	xchg   %ax,%ax
     eb8:	8b 55 08             	mov    0x8(%ebp),%edx
     ebb:	31 ff                	xor    %edi,%edi
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
			} else if(c == '%'){
     ebd:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     ec1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ec8:	00 
     ec9:	89 74 24 04          	mov    %esi,0x4(%esp)
     ecd:	89 14 24             	mov    %edx,(%esp)
     ed0:	e8 e3 fc ff ff       	call   bb8 <write>
     ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ed8:	e9 88 fe ff ff       	jmp    d65 <printf+0x35>
     edd:	8d 76 00             	lea    0x0(%esi),%esi
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
     ee0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     ee3:	b9 0a 00 00 00       	mov    $0xa,%ecx
				ap++;
     ee8:	66 31 ff             	xor    %di,%di
			} else {
				putc(fd, c);
			}
		} else if(state == '%'){
			if(c == 'd'){
				printint(fd, *ap, 10, 1);
     eeb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ef2:	8b 10                	mov    (%eax),%edx
     ef4:	8b 45 08             	mov    0x8(%ebp),%eax
     ef7:	e8 94 fd ff ff       	call   c90 <printint>
     efc:	8b 45 0c             	mov    0xc(%ebp),%eax
				ap++;
     eff:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     f03:	e9 5d fe ff ff       	jmp    d65 <printf+0x35>
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
     f08:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
				putc(fd, *ap);
				ap++;
     f0b:	31 ff                	xor    %edi,%edi
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
     f0d:	8b 01                	mov    (%ecx),%eax
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f0f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f16:	00 
     f17:	89 74 24 04          	mov    %esi,0x4(%esp)
					s = "(null)";
				while(*s != 0){
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
     f1b:	88 45 e7             	mov    %al,-0x19(%ebp)
int binsem_sync_print;

static void
putc(int fd, char c)
{
	write(fd, &c, 1);
     f1e:	8b 45 08             	mov    0x8(%ebp),%eax
     f21:	89 04 24             	mov    %eax,(%esp)
     f24:	e8 8f fc ff ff       	call   bb8 <write>
     f29:	8b 45 0c             	mov    0xc(%ebp),%eax
					putc(fd, *s);
					s++;
				}
			} else if(c == 'c'){
				putc(fd, *ap);
				ap++;
     f2c:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     f30:	e9 30 fe ff ff       	jmp    d65 <printf+0x35>
				printint(fd, *ap, 16, 0);
				ap++;
			} else if(c == 's'){
				s = (char*)*ap;
				ap++;
				if(s == 0)
     f35:	bf 50 16 00 00       	mov    $0x1650,%edi
     f3a:	e9 3c ff ff ff       	jmp    e7b <printf+0x14b>
     f3f:	90                   	nop

00000f40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f41:	a1 20 17 00 00       	mov    0x1720,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     f46:	89 e5                	mov    %esp,%ebp
     f48:	57                   	push   %edi
     f49:	56                   	push   %esi
     f4a:	53                   	push   %ebx
     f4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*) ap - 1;
     f4e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f51:	39 c8                	cmp    %ecx,%eax
     f53:	73 1d                	jae    f72 <free+0x32>
     f55:	8d 76 00             	lea    0x0(%esi),%esi
     f58:	8b 10                	mov    (%eax),%edx
     f5a:	39 d1                	cmp    %edx,%ecx
     f5c:	72 1a                	jb     f78 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f5e:	39 d0                	cmp    %edx,%eax
     f60:	72 08                	jb     f6a <free+0x2a>
     f62:	39 c8                	cmp    %ecx,%eax
     f64:	72 12                	jb     f78 <free+0x38>
     f66:	39 d1                	cmp    %edx,%ecx
     f68:	72 0e                	jb     f78 <free+0x38>
     f6a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f6c:	39 c8                	cmp    %ecx,%eax
     f6e:	66 90                	xchg   %ax,%ax
     f70:	72 e6                	jb     f58 <free+0x18>
     f72:	8b 10                	mov    (%eax),%edx
     f74:	eb e8                	jmp    f5e <free+0x1e>
     f76:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     f78:	8b 71 04             	mov    0x4(%ecx),%esi
     f7b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     f7e:	39 d7                	cmp    %edx,%edi
     f80:	74 19                	je     f9b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     f82:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     f85:	8b 50 04             	mov    0x4(%eax),%edx
     f88:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     f8b:	39 ce                	cmp    %ecx,%esi
     f8d:	74 23                	je     fb2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     f8f:	89 08                	mov    %ecx,(%eax)
  freep = p;
     f91:	a3 20 17 00 00       	mov    %eax,0x1720
}
     f96:	5b                   	pop    %ebx
     f97:	5e                   	pop    %esi
     f98:	5f                   	pop    %edi
     f99:	5d                   	pop    %ebp
     f9a:	c3                   	ret    
  bp = (Header*) ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     f9b:	03 72 04             	add    0x4(%edx),%esi
     f9e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
     fa1:	8b 10                	mov    (%eax),%edx
     fa3:	8b 12                	mov    (%edx),%edx
     fa5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     fa8:	8b 50 04             	mov    0x4(%eax),%edx
     fab:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     fae:	39 ce                	cmp    %ecx,%esi
     fb0:	75 dd                	jne    f8f <free+0x4f>
    p->s.size += bp->s.size;
     fb2:	03 51 04             	add    0x4(%ecx),%edx
     fb5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     fb8:	8b 53 f8             	mov    -0x8(%ebx),%edx
     fbb:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
     fbd:	a3 20 17 00 00       	mov    %eax,0x1720
}
     fc2:	5b                   	pop    %ebx
     fc3:	5e                   	pop    %esi
     fc4:	5f                   	pop    %edi
     fc5:	5d                   	pop    %ebp
     fc6:	c3                   	ret    
     fc7:	89 f6                	mov    %esi,%esi
     fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000fd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
     fd4:	56                   	push   %esi
     fd5:	53                   	push   %ebx
     fd6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
     fdc:	8b 0d 20 17 00 00    	mov    0x1720,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fe2:	83 c3 07             	add    $0x7,%ebx
     fe5:	c1 eb 03             	shr    $0x3,%ebx
     fe8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
     feb:	85 c9                	test   %ecx,%ecx
     fed:	0f 84 93 00 00 00    	je     1086 <malloc+0xb6>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ff3:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
     ff5:	8b 50 04             	mov    0x4(%eax),%edx
     ff8:	39 d3                	cmp    %edx,%ebx
     ffa:	76 1f                	jbe    101b <malloc+0x4b>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*) (p + 1);
     ffc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1003:	90                   	nop
    1004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(p == freep)
    1008:	3b 05 20 17 00 00    	cmp    0x1720,%eax
    100e:	74 30                	je     1040 <malloc+0x70>
    1010:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1012:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    1014:	8b 50 04             	mov    0x4(%eax),%edx
    1017:	39 d3                	cmp    %edx,%ebx
    1019:	77 ed                	ja     1008 <malloc+0x38>
      if(p->s.size == nunits)
    101b:	39 d3                	cmp    %edx,%ebx
    101d:	74 61                	je     1080 <malloc+0xb0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    101f:	29 da                	sub    %ebx,%edx
    1021:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1024:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    1027:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    102a:	89 0d 20 17 00 00    	mov    %ecx,0x1720
      return (void*) (p + 1);
    1030:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1033:	83 c4 1c             	add    $0x1c,%esp
    1036:	5b                   	pop    %ebx
    1037:	5e                   	pop    %esi
    1038:	5f                   	pop    %edi
    1039:	5d                   	pop    %ebp
    103a:	c3                   	ret    
    103b:	90                   	nop
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1040:	81 fb ff 0f 00 00    	cmp    $0xfff,%ebx
    1046:	b8 00 80 00 00       	mov    $0x8000,%eax
    104b:	bf 00 10 00 00       	mov    $0x1000,%edi
    1050:	76 04                	jbe    1056 <malloc+0x86>
    1052:	89 f0                	mov    %esi,%eax
    1054:	89 df                	mov    %ebx,%edi
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1056:	89 04 24             	mov    %eax,(%esp)
    1059:	e8 c2 fb ff ff       	call   c20 <sbrk>
  if(p == (char*) -1)
    105e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1061:	74 18                	je     107b <malloc+0xab>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1063:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1066:	83 c0 08             	add    $0x8,%eax
    1069:	89 04 24             	mov    %eax,(%esp)
    106c:	e8 cf fe ff ff       	call   f40 <free>
  return freep;
    1071:	8b 0d 20 17 00 00    	mov    0x1720,%ecx
      }
      freep = prevp;
      return (void*) (p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1077:	85 c9                	test   %ecx,%ecx
    1079:	75 97                	jne    1012 <malloc+0x42>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    107b:	31 c0                	xor    %eax,%eax
    107d:	eb b4                	jmp    1033 <malloc+0x63>
    107f:	90                   	nop
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1080:	8b 10                	mov    (%eax),%edx
    1082:	89 11                	mov    %edx,(%ecx)
    1084:	eb a4                	jmp    102a <malloc+0x5a>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1086:	c7 05 20 17 00 00 18 	movl   $0x1718,0x1720
    108d:	17 00 00 
    base.s.size = 0;
    1090:	b9 18 17 00 00       	mov    $0x1718,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1095:	c7 05 18 17 00 00 18 	movl   $0x1718,0x1718
    109c:	17 00 00 
    base.s.size = 0;
    109f:	c7 05 1c 17 00 00 00 	movl   $0x0,0x171c
    10a6:	00 00 00 
    10a9:	e9 45 ff ff ff       	jmp    ff3 <malloc+0x23>
    10ae:	90                   	nop
    10af:	90                   	nop

000010b0 <sem_clear>:
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	83 ec 14             	sub    $0x14,%esp
    10b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10ba:	8b 03                	mov    (%ebx),%eax
    10bc:	89 04 24             	mov    %eax,(%esp)
    10bf:	e8 b4 fb ff ff       	call   c78 <binary_sem_clear>
    10c4:	8b 43 04             	mov    0x4(%ebx),%eax
    10c7:	89 04 24             	mov    %eax,(%esp)
    10ca:	e8 a9 fb ff ff       	call   c78 <binary_sem_clear>
    10cf:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10d2:	83 c4 14             	add    $0x14,%esp
    10d5:	5b                   	pop    %ebx
    10d6:	5d                   	pop    %ebp
    10d7:	e9 64 fe ff ff       	jmp    f40 <free>
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010e0 <sem_downs>:
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	83 ec 18             	sub    $0x18,%esp
    10e6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    10e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
    10ef:	8b 75 0c             	mov    0xc(%ebp),%esi
    10f2:	8b 43 04             	mov    0x4(%ebx),%eax
    10f5:	89 04 24             	mov    %eax,(%esp)
    10f8:	e8 6b fb ff ff       	call   c68 <binary_sem_down>
    10fd:	8b 03                	mov    (%ebx),%eax
    10ff:	89 04 24             	mov    %eax,(%esp)
    1102:	e8 61 fb ff ff       	call   c68 <binary_sem_down>
    1107:	8b 43 08             	mov    0x8(%ebx),%eax
    110a:	29 f0                	sub    %esi,%eax
    110c:	85 c0                	test   %eax,%eax
    110e:	89 43 08             	mov    %eax,0x8(%ebx)
    1111:	74 0b                	je     111e <sem_downs+0x3e>
    1113:	8b 43 04             	mov    0x4(%ebx),%eax
    1116:	89 04 24             	mov    %eax,(%esp)
    1119:	e8 52 fb ff ff       	call   c70 <binary_sem_up>
    111e:	8b 03                	mov    (%ebx),%eax
    1120:	8b 75 fc             	mov    -0x4(%ebp),%esi
    1123:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    1126:	89 45 08             	mov    %eax,0x8(%ebp)
    1129:	89 ec                	mov    %ebp,%esp
    112b:	5d                   	pop    %ebp
    112c:	e9 3f fb ff ff       	jmp    c70 <binary_sem_up>
    1131:	eb 0d                	jmp    1140 <sem_down>
    1133:	90                   	nop
    1134:	90                   	nop
    1135:	90                   	nop
    1136:	90                   	nop
    1137:	90                   	nop
    1138:	90                   	nop
    1139:	90                   	nop
    113a:	90                   	nop
    113b:	90                   	nop
    113c:	90                   	nop
    113d:	90                   	nop
    113e:	90                   	nop
    113f:	90                   	nop

00001140 <sem_down>:
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	83 ec 14             	sub    $0x14,%esp
    1147:	8b 5d 08             	mov    0x8(%ebp),%ebx
    114a:	8b 43 04             	mov    0x4(%ebx),%eax
    114d:	89 04 24             	mov    %eax,(%esp)
    1150:	e8 13 fb ff ff       	call   c68 <binary_sem_down>
    1155:	8b 03                	mov    (%ebx),%eax
    1157:	89 04 24             	mov    %eax,(%esp)
    115a:	e8 09 fb ff ff       	call   c68 <binary_sem_down>
    115f:	8b 43 08             	mov    0x8(%ebx),%eax
    1162:	83 e8 01             	sub    $0x1,%eax
    1165:	85 c0                	test   %eax,%eax
    1167:	89 43 08             	mov    %eax,0x8(%ebx)
    116a:	74 0b                	je     1177 <sem_down+0x37>
    116c:	8b 43 04             	mov    0x4(%ebx),%eax
    116f:	89 04 24             	mov    %eax,(%esp)
    1172:	e8 f9 fa ff ff       	call   c70 <binary_sem_up>
    1177:	8b 03                	mov    (%ebx),%eax
    1179:	89 45 08             	mov    %eax,0x8(%ebp)
    117c:	83 c4 14             	add    $0x14,%esp
    117f:	5b                   	pop    %ebx
    1180:	5d                   	pop    %ebp
    1181:	e9 ea fa ff ff       	jmp    c70 <binary_sem_up>
    1186:	8d 76 00             	lea    0x0(%esi),%esi
    1189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001190 <sem_ups>:
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	83 ec 18             	sub    $0x18,%esp
    1196:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    1199:	8b 5d 08             	mov    0x8(%ebp),%ebx
    119c:	89 75 fc             	mov    %esi,-0x4(%ebp)
    119f:	8b 75 0c             	mov    0xc(%ebp),%esi
    11a2:	8b 03                	mov    (%ebx),%eax
    11a4:	89 04 24             	mov    %eax,(%esp)
    11a7:	e8 bc fa ff ff       	call   c68 <binary_sem_down>
    11ac:	03 73 08             	add    0x8(%ebx),%esi
    11af:	83 fe 01             	cmp    $0x1,%esi
    11b2:	89 73 08             	mov    %esi,0x8(%ebx)
    11b5:	74 19                	je     11d0 <sem_ups+0x40>
    11b7:	8b 03                	mov    (%ebx),%eax
    11b9:	8b 75 fc             	mov    -0x4(%ebp),%esi
    11bc:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    11bf:	89 45 08             	mov    %eax,0x8(%ebp)
    11c2:	89 ec                	mov    %ebp,%esp
    11c4:	5d                   	pop    %ebp
    11c5:	e9 a6 fa ff ff       	jmp    c70 <binary_sem_up>
    11ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11d0:	8b 43 04             	mov    0x4(%ebx),%eax
    11d3:	89 04 24             	mov    %eax,(%esp)
    11d6:	e8 95 fa ff ff       	call   c70 <binary_sem_up>
    11db:	eb da                	jmp    11b7 <sem_ups+0x27>
    11dd:	8d 76 00             	lea    0x0(%esi),%esi

000011e0 <sem_up>:
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	83 ec 14             	sub    $0x14,%esp
    11e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    11ea:	8b 03                	mov    (%ebx),%eax
    11ec:	89 04 24             	mov    %eax,(%esp)
    11ef:	e8 74 fa ff ff       	call   c68 <binary_sem_down>
    11f4:	8b 43 08             	mov    0x8(%ebx),%eax
    11f7:	83 c0 01             	add    $0x1,%eax
    11fa:	83 f8 01             	cmp    $0x1,%eax
    11fd:	89 43 08             	mov    %eax,0x8(%ebx)
    1200:	74 16                	je     1218 <sem_up+0x38>
    1202:	8b 03                	mov    (%ebx),%eax
    1204:	89 45 08             	mov    %eax,0x8(%ebp)
    1207:	83 c4 14             	add    $0x14,%esp
    120a:	5b                   	pop    %ebx
    120b:	5d                   	pop    %ebp
    120c:	e9 5f fa ff ff       	jmp    c70 <binary_sem_up>
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1218:	8b 43 04             	mov    0x4(%ebx),%eax
    121b:	89 04 24             	mov    %eax,(%esp)
    121e:	e8 4d fa ff ff       	call   c70 <binary_sem_up>
    1223:	8b 03                	mov    (%ebx),%eax
    1225:	89 45 08             	mov    %eax,0x8(%ebp)
    1228:	83 c4 14             	add    $0x14,%esp
    122b:	5b                   	pop    %ebx
    122c:	5d                   	pop    %ebp
    122d:	e9 3e fa ff ff       	jmp    c70 <binary_sem_up>
    1232:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <semaphore_create>:
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	83 ec 28             	sub    $0x28,%esp
    1246:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    124d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
    1250:	89 75 f8             	mov    %esi,-0x8(%ebp)
    1253:	89 7d fc             	mov    %edi,-0x4(%ebp)
    1256:	8b 7d 08             	mov    0x8(%ebp),%edi
    1259:	e8 72 fd ff ff       	call   fd0 <malloc>
    125e:	89 78 08             	mov    %edi,0x8(%eax)
    1261:	89 c3                	mov    %eax,%ebx
    1263:	e8 f8 f9 ff ff       	call   c60 <binary_sem_create>
    1268:	89 03                	mov    %eax,(%ebx)
    126a:	89 c6                	mov    %eax,%esi
    126c:	e8 ef f9 ff ff       	call   c60 <binary_sem_create>
    1271:	01 c6                	add    %eax,%esi
    1273:	89 43 04             	mov    %eax,0x4(%ebx)
    1276:	78 20                	js     1298 <semaphore_create+0x58>
    1278:	85 ff                	test   %edi,%edi
    127a:	75 08                	jne    1284 <semaphore_create+0x44>
    127c:	89 04 24             	mov    %eax,(%esp)
    127f:	e8 e4 f9 ff ff       	call   c68 <binary_sem_down>
    1284:	89 d8                	mov    %ebx,%eax
    1286:	8b 75 f8             	mov    -0x8(%ebp),%esi
    1289:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    128c:	8b 7d fc             	mov    -0x4(%ebp),%edi
    128f:	89 ec                	mov    %ebp,%esp
    1291:	5d                   	pop    %ebp
    1292:	c3                   	ret    
    1293:	90                   	nop
    1294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1298:	c7 44 24 04 68 16 00 	movl   $0x1668,0x4(%esp)
    129f:	00 
    12a0:	31 db                	xor    %ebx,%ebx
    12a2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    12a9:	e8 82 fa ff ff       	call   d30 <printf>
    12ae:	eb d4                	jmp    1284 <semaphore_create+0x44>

000012b0 <semaphore_release_atomic>:
	}
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
    12b3:	83 ec 08             	sub    $0x8,%esp
	binary_sem_up(bb->mutex);
    12b6:	8b 45 08             	mov    0x8(%ebp),%eax
    12b9:	8b 00                	mov    (%eax),%eax
    12bb:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12be:	c9                   	leave  
	sem_up(bb->full);
}

void semaphore_release_atomic(struct BB* bb)
{
	binary_sem_up(bb->mutex);
    12bf:	e9 ac f9 ff ff       	jmp    c70 <binary_sem_up>
    12c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000012d0 <semaphore_pop>:
}

void* semaphore_pop(struct BB* bb)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	56                   	push   %esi
    12d4:	53                   	push   %ebx
    12d5:	83 ec 10             	sub    $0x10,%esp
    12d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
	void* element = 0;
	sem_down(bb->full);
    12db:	8b 43 08             	mov    0x8(%ebx),%eax
    12de:	89 04 24             	mov    %eax,(%esp)
    12e1:	e8 5a fe ff ff       	call   1140 <sem_down>
	binary_sem_down(bb->mutex);
    12e6:	8b 03                	mov    (%ebx),%eax
    12e8:	89 04 24             	mov    %eax,(%esp)
    12eb:	e8 78 f9 ff ff       	call   c68 <binary_sem_down>
	if(bb->buffer[bb->consume] == 0) {
    12f0:	8b 43 14             	mov    0x14(%ebx),%eax
    12f3:	c1 e0 02             	shl    $0x2,%eax
    12f6:	03 43 0c             	add    0xc(%ebx),%eax
    12f9:	8b 30                	mov    (%eax),%esi
    12fb:	85 f6                	test   %esi,%esi
    12fd:	74 42                	je     1341 <semaphore_pop+0x71>
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
    12ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
		if(bb->consume == (bb->capacity - 1)) {
    1305:	8b 53 18             	mov    0x18(%ebx),%edx
    1308:	8b 43 14             	mov    0x14(%ebx),%eax
    130b:	83 ea 01             	sub    $0x1,%edx
    130e:	39 d0                	cmp    %edx,%eax
    1310:	74 26                	je     1338 <semaphore_pop+0x68>
			bb->consume = 0;
		}
		else {
			bb->consume++;
    1312:	83 c0 01             	add    $0x1,%eax
    1315:	89 43 14             	mov    %eax,0x14(%ebx)
		}
	}
	binary_sem_up(bb->mutex);
    1318:	8b 03                	mov    (%ebx),%eax
    131a:	89 04 24             	mov    %eax,(%esp)
    131d:	e8 4e f9 ff ff       	call   c70 <binary_sem_up>
	sem_up(bb->empty);
    1322:	8b 43 04             	mov    0x4(%ebx),%eax
    1325:	89 04 24             	mov    %eax,(%esp)
    1328:	e8 b3 fe ff ff       	call   11e0 <sem_up>
	return element;
}
    132d:	83 c4 10             	add    $0x10,%esp
    1330:	89 f0                	mov    %esi,%eax
    1332:	5b                   	pop    %ebx
    1333:	5e                   	pop    %esi
    1334:	5d                   	pop    %ebp
    1335:	c3                   	ret    
    1336:	66 90                	xchg   %ax,%ax
	}
	else {
		element = bb->buffer[bb->consume];
		bb->buffer[bb->consume] = 0;
		if(bb->consume == (bb->capacity - 1)) {
			bb->consume = 0;
    1338:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    133f:	eb d7                	jmp    1318 <semaphore_pop+0x48>
{
	void* element = 0;
	sem_down(bb->full);
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->consume] == 0) {
		printf(2,"something went wrong! buffer is empty and we are trying to consume\n");
    1341:	c7 44 24 04 90 16 00 	movl   $0x1690,0x4(%esp)
    1348:	00 
    1349:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1350:	e8 db f9 ff ff       	call   d30 <printf>
    1355:	eb c1                	jmp    1318 <semaphore_pop+0x48>
    1357:	89 f6                	mov    %esi,%esi
    1359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001360 <semaphore_put_atomic>:
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
}

void semaphore_put_atomic(struct BB* bb, void* element)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	56                   	push   %esi
    1364:	53                   	push   %ebx
    1365:	83 ec 10             	sub    $0x10,%esp
    1368:	8b 5d 08             	mov    0x8(%ebp),%ebx
    136b:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    136e:	8b 43 04             	mov    0x4(%ebx),%eax
    1371:	89 04 24             	mov    %eax,(%esp)
    1374:	e8 c7 fd ff ff       	call   1140 <sem_down>
	binary_sem_down(bb->mutex);
    1379:	8b 03                	mov    (%ebx),%eax
    137b:	89 04 24             	mov    %eax,(%esp)
    137e:	e8 e5 f8 ff ff       	call   c68 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    1383:	8b 43 10             	mov    0x10(%ebx),%eax
    1386:	c1 e0 02             	shl    $0x2,%eax
    1389:	03 43 0c             	add    0xc(%ebx),%eax
    138c:	8b 10                	mov    (%eax),%edx
    138e:	85 d2                	test   %edx,%edx
    1390:	74 26                	je     13b8 <semaphore_put_atomic+0x58>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    1392:	c7 44 24 04 d4 16 00 	movl   $0x16d4,0x4(%esp)
    1399:	00 
    139a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    13a1:	e8 8a f9 ff ff       	call   d30 <printf>
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    13a6:	8b 43 08             	mov    0x8(%ebx),%eax
    13a9:	89 45 08             	mov    %eax,0x8(%ebp)
}
    13ac:	83 c4 10             	add    $0x10,%esp
    13af:	5b                   	pop    %ebx
    13b0:	5e                   	pop    %esi
    13b1:	5d                   	pop    %ebp
		}
		else {
			bb->produce++;
		}
	}
	sem_up(bb->full);
    13b2:	e9 29 fe ff ff       	jmp    11e0 <sem_up>
    13b7:	90                   	nop
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    13b8:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    13ba:	8b 53 18             	mov    0x18(%ebx),%edx
    13bd:	8b 43 10             	mov    0x10(%ebx),%eax
    13c0:	83 ea 01             	sub    $0x1,%edx
    13c3:	39 d0                	cmp    %edx,%eax
    13c5:	74 09                	je     13d0 <semaphore_put_atomic+0x70>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    13c7:	83 c0 01             	add    $0x1,%eax
    13ca:	89 43 10             	mov    %eax,0x10(%ebx)
    13cd:	eb d7                	jmp    13a6 <semaphore_put_atomic+0x46>
    13cf:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    13d0:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    13d7:	eb cd                	jmp    13a6 <semaphore_put_atomic+0x46>
    13d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013e0 <semaphore_put>:
	ret->capacity = max_capacity;
	return ret;
}

void semaphore_put(struct BB* bb, void* element)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	56                   	push   %esi
    13e4:	53                   	push   %ebx
    13e5:	83 ec 10             	sub    $0x10,%esp
    13e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    13eb:	8b 75 0c             	mov    0xc(%ebp),%esi
	sem_down(bb->empty);
    13ee:	8b 43 04             	mov    0x4(%ebx),%eax
    13f1:	89 04 24             	mov    %eax,(%esp)
    13f4:	e8 47 fd ff ff       	call   1140 <sem_down>
	binary_sem_down(bb->mutex);
    13f9:	8b 03                	mov    (%ebx),%eax
    13fb:	89 04 24             	mov    %eax,(%esp)
    13fe:	e8 65 f8 ff ff       	call   c68 <binary_sem_down>
	if(bb->buffer[bb->produce] != 0) {
    1403:	8b 43 10             	mov    0x10(%ebx),%eax
    1406:	c1 e0 02             	shl    $0x2,%eax
    1409:	03 43 0c             	add    0xc(%ebx),%eax
    140c:	8b 08                	mov    (%eax),%ecx
    140e:	85 c9                	test   %ecx,%ecx
    1410:	74 36                	je     1448 <semaphore_put+0x68>
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
    1412:	c7 44 24 04 d4 16 00 	movl   $0x16d4,0x4(%esp)
    1419:	00 
    141a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1421:	e8 0a f9 ff ff       	call   d30 <printf>
		}
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
    1426:	8b 03                	mov    (%ebx),%eax
    1428:	89 04 24             	mov    %eax,(%esp)
    142b:	e8 40 f8 ff ff       	call   c70 <binary_sem_up>
	sem_up(bb->full);
    1430:	8b 43 08             	mov    0x8(%ebx),%eax
    1433:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1436:	83 c4 10             	add    $0x10,%esp
    1439:	5b                   	pop    %ebx
    143a:	5e                   	pop    %esi
    143b:	5d                   	pop    %ebp
		else {
			bb->produce++;
		}
	}
	binary_sem_up(bb->mutex);
	sem_up(bb->full);
    143c:	e9 9f fd ff ff       	jmp    11e0 <sem_up>
    1441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	binary_sem_down(bb->mutex);
	if(bb->buffer[bb->produce] != 0) {
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
    1448:	89 30                	mov    %esi,(%eax)
		if(bb->produce == (bb->capacity - 1)) {
    144a:	8b 53 18             	mov    0x18(%ebx),%edx
    144d:	8b 43 10             	mov    0x10(%ebx),%eax
    1450:	83 ea 01             	sub    $0x1,%edx
    1453:	39 d0                	cmp    %edx,%eax
    1455:	74 09                	je     1460 <semaphore_put+0x80>
			bb->produce = 0;
		}
		else {
			bb->produce++;
    1457:	83 c0 01             	add    $0x1,%eax
    145a:	89 43 10             	mov    %eax,0x10(%ebx)
    145d:	eb c7                	jmp    1426 <semaphore_put+0x46>
    145f:	90                   	nop
		printf(2,"something went wrong! buffer is full and we are trying to produce\n");
	}
	else {
		bb->buffer[bb->produce] = element;
		if(bb->produce == (bb->capacity - 1)) {
			bb->produce = 0;
    1460:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
    1467:	eb bd                	jmp    1426 <semaphore_put+0x46>
    1469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001470 <BB_create>:
#include "user.h"
#include "semaphore.h"
#include "boundedbuffer.h"

struct BB* BB_create(int max_capacity)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	83 ec 18             	sub    $0x18,%esp
    1476:	89 75 fc             	mov    %esi,-0x4(%ebp)
    1479:	8b 75 08             	mov    0x8(%ebp),%esi
    147c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
	struct BB* ret;
	if(max_capacity < 0)
    147f:	85 f6                	test   %esi,%esi
    1481:	79 15                	jns    1498 <BB_create+0x28>
		return 0;
	ret->mutex = binary_sem_create();
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    1483:	31 db                	xor    %ebx,%ebx
}
    1485:	89 d8                	mov    %ebx,%eax
    1487:	8b 75 fc             	mov    -0x4(%ebp),%esi
    148a:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    148d:	89 ec                	mov    %ebp,%esp
    148f:	5d                   	pop    %ebp
    1490:	c3                   	ret    
    1491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
struct BB* BB_create(int max_capacity)
{
	struct BB* ret;
	if(max_capacity < 0)
		return 0;
	if((ret = malloc(sizeof(*ret))) <=0)
    1498:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
    149f:	e8 2c fb ff ff       	call   fd0 <malloc>
    14a4:	85 c0                	test   %eax,%eax
    14a6:	89 c3                	mov    %eax,%ebx
    14a8:	74 db                	je     1485 <BB_create+0x15>
		return 0;
	if((ret->buffer = malloc(sizeof(void*) * max_capacity)) <=0)
    14aa:	8d 04 b5 00 00 00 00 	lea    0x0(,%esi,4),%eax
    14b1:	89 04 24             	mov    %eax,(%esp)
    14b4:	e8 17 fb ff ff       	call   fd0 <malloc>
    14b9:	85 c0                	test   %eax,%eax
    14bb:	89 43 0c             	mov    %eax,0xc(%ebx)
    14be:	74 c3                	je     1483 <BB_create+0x13>
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
    14c0:	89 34 24             	mov    %esi,(%esp)
    14c3:	e8 78 fd ff ff       	call   1240 <semaphore_create>
    14c8:	85 c0                	test   %eax,%eax
    14ca:	89 43 04             	mov    %eax,0x4(%ebx)
    14cd:	74 b4                	je     1483 <BB_create+0x13>
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
    14cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14d6:	e8 65 fd ff ff       	call   1240 <semaphore_create>
    14db:	85 c0                	test   %eax,%eax
    14dd:	89 43 08             	mov    %eax,0x8(%ebx)
    14e0:	74 a1                	je     1483 <BB_create+0x13>
		return 0;
	ret->mutex = binary_sem_create();
    14e2:	e8 79 f7 ff ff       	call   c60 <binary_sem_create>
	ret->produce = 0;
    14e7:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
	ret->consume = 0;
    14ee:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
	ret->capacity = max_capacity;
    14f5:	89 73 18             	mov    %esi,0x18(%ebx)
		return 0;
	if((ret->empty = semaphore_create(max_capacity)) <=0)
		return 0;
	if((ret->full = semaphore_create(0)) <=0)
		return 0;
	ret->mutex = binary_sem_create();
    14f8:	89 03                	mov    %eax,(%ebx)
	ret->produce = 0;
	ret->consume = 0;
	ret->capacity = max_capacity;
	return ret;
    14fa:	eb 89                	jmp    1485 <BB_create+0x15>
