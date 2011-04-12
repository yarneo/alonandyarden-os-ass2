
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <binary_sem_clear>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10000a:	c7 04 24 40 93 10 00 	movl   $0x109340,(%esp)
  100011:	e8 3a 46 00 00       	call   104650 <acquire>
  100016:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10001b:	83 fb 3f             	cmp    $0x3f,%ebx
  10001e:	77 12                	ja     100032 <binary_sem_clear+0x32>
  100020:	69 db d4 01 00 00    	imul   $0x1d4,%ebx,%ebx
  100026:	31 c0                	xor    %eax,%eax
  100028:	8b 93 ac 93 10 00    	mov    0x1093ac(%ebx),%edx
  10002e:	85 d2                	test   %edx,%edx
  100030:	75 06                	jne    100038 <binary_sem_clear+0x38>
  100032:	83 c4 14             	add    $0x14,%esp
  100035:	5b                   	pop    %ebx
  100036:	5d                   	pop    %ebp
  100037:	c3                   	ret    
  100038:	c7 04 24 40 93 10 00 	movl   $0x109340,(%esp)
  10003f:	c7 05 ac 93 10 00 00 	movl   $0x0,0x1093ac
  100046:	00 00 00 
  100049:	e8 b2 45 00 00       	call   104600 <release>
  10004e:	83 c4 14             	add    $0x14,%esp
  100051:	31 c0                	xor    %eax,%eax
  100053:	5b                   	pop    %ebx
  100054:	5d                   	pop    %ebp
  100055:	c3                   	ret    
  100056:	8d 76 00             	lea    0x0(%esi),%esi
  100059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100060 <binary_sem_create>:
  100060:	55                   	push   %ebp
  100061:	89 e5                	mov    %esp,%ebp
  100063:	53                   	push   %ebx
  100064:	31 db                	xor    %ebx,%ebx
  100066:	83 ec 14             	sub    $0x14,%esp
  100069:	c7 04 24 40 93 10 00 	movl   $0x109340,(%esp)
  100070:	e8 db 45 00 00       	call   104650 <acquire>
  100075:	b8 ac 93 10 00       	mov    $0x1093ac,%eax
  10007a:	eb 11                	jmp    10008d <binary_sem_create+0x2d>
  10007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100080:	83 c3 01             	add    $0x1,%ebx
  100083:	05 d4 01 00 00       	add    $0x1d4,%eax
  100088:	83 fb 40             	cmp    $0x40,%ebx
  10008b:	74 68                	je     1000f5 <binary_sem_create+0x95>
  10008d:	8b 08                	mov    (%eax),%ecx
  10008f:	85 c9                	test   %ecx,%ecx
  100091:	75 ed                	jne    100080 <binary_sem_create+0x20>
  100093:	69 cb d4 01 00 00    	imul   $0x1d4,%ebx,%ecx
  100099:	31 d2                	xor    %edx,%edx
  10009b:	c7 81 74 93 10 00 01 	movl   $0x1,0x109374(%ecx)
  1000a2:	00 00 00 
  1000a5:	c7 81 ac 93 10 00 01 	movl   $0x1,0x1093ac(%ecx)
  1000ac:	00 00 00 
  1000af:	c7 81 44 95 10 00 00 	movl   $0x0,0x109544(%ecx)
  1000b6:	00 00 00 
  1000b9:	c7 81 40 95 10 00 00 	movl   $0x0,0x109540(%ecx)
  1000c0:	00 00 00 
  1000c3:	81 c1 b0 93 10 00    	add    $0x1093b0,%ecx
  1000c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1000d0:	83 c2 01             	add    $0x1,%edx
  1000d3:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
  1000d9:	83 c1 04             	add    $0x4,%ecx
  1000dc:	83 fa 64             	cmp    $0x64,%edx
  1000df:	75 ef                	jne    1000d0 <binary_sem_create+0x70>
  1000e1:	c7 04 24 40 93 10 00 	movl   $0x109340,(%esp)
  1000e8:	e8 13 45 00 00       	call   104600 <release>
  1000ed:	89 d8                	mov    %ebx,%eax
  1000ef:	83 c4 14             	add    $0x14,%esp
  1000f2:	5b                   	pop    %ebx
  1000f3:	5d                   	pop    %ebp
  1000f4:	c3                   	ret    
  1000f5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  1000fa:	c7 04 24 40 93 10 00 	movl   $0x109340,(%esp)
  100101:	e8 fa 44 00 00       	call   104600 <release>
  100106:	89 d8                	mov    %ebx,%eax
  100108:	83 c4 14             	add    $0x14,%esp
  10010b:	5b                   	pop    %ebx
  10010c:	5d                   	pop    %ebp
  10010d:	c3                   	ret    
  10010e:	66 90                	xchg   %ax,%ax

00100110 <binary_sem_up>:
  100110:	55                   	push   %ebp
  100111:	89 e5                	mov    %esp,%ebp
  100113:	83 ec 28             	sub    $0x28,%esp
  100116:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  100119:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10011c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10011f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  100122:	83 fb 3f             	cmp    $0x3f,%ebx
  100125:	76 19                	jbe    100140 <binary_sem_up+0x30>
  100127:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10012c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10012f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  100132:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100135:	89 ec                	mov    %ebp,%esp
  100137:	5d                   	pop    %ebp
  100138:	c3                   	ret    
  100139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100140:	69 f3 d4 01 00 00    	imul   $0x1d4,%ebx,%esi
  100146:	8b be ac 93 10 00    	mov    0x1093ac(%esi),%edi
  10014c:	85 ff                	test   %edi,%edi
  10014e:	74 d7                	je     100127 <binary_sem_up+0x17>
  100150:	8d be 78 93 10 00    	lea    0x109378(%esi),%edi
  100156:	6b db 75             	imul   $0x75,%ebx,%ebx
  100159:	89 3c 24             	mov    %edi,(%esp)
  10015c:	e8 ef 44 00 00       	call   104650 <acquire>
  100161:	8b 96 40 95 10 00    	mov    0x109540(%esi),%edx
  100167:	8d 4c 1a 18          	lea    0x18(%edx,%ebx,1),%ecx
  10016b:	8b 04 8d 50 93 10 00 	mov    0x109350(,%ecx,4),%eax
  100172:	85 c0                	test   %eax,%eax
  100174:	74 37                	je     1001ad <binary_sem_up+0x9d>
  100176:	83 fa 63             	cmp    $0x63,%edx
  100179:	c7 04 8d 50 93 10 00 	movl   $0x0,0x109350(,%ecx,4)
  100180:	00 00 00 00 
  100184:	74 1b                	je     1001a1 <binary_sem_up+0x91>
  100186:	83 86 40 95 10 00 01 	addl   $0x1,0x109540(%esi)
  10018d:	89 04 24             	mov    %eax,(%esp)
  100190:	e8 5b 31 00 00       	call   1032f0 <wakeup>
  100195:	89 3c 24             	mov    %edi,(%esp)
  100198:	e8 63 44 00 00       	call   104600 <release>
  10019d:	31 c0                	xor    %eax,%eax
  10019f:	eb 8b                	jmp    10012c <binary_sem_up+0x1c>
  1001a1:	c7 86 40 95 10 00 00 	movl   $0x0,0x109540(%esi)
  1001a8:	00 00 00 
  1001ab:	eb e0                	jmp    10018d <binary_sem_up+0x7d>
  1001ad:	c7 86 74 93 10 00 01 	movl   $0x1,0x109374(%esi)
  1001b4:	00 00 00 
  1001b7:	89 3c 24             	mov    %edi,(%esp)
  1001ba:	e8 41 44 00 00       	call   104600 <release>
  1001bf:	31 c0                	xor    %eax,%eax
  1001c1:	e9 66 ff ff ff       	jmp    10012c <binary_sem_up+0x1c>
  1001c6:	8d 76 00             	lea    0x0(%esi),%esi
  1001c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001001d0 <binary_sem_down>:
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 38             	sub    $0x38,%esp
  1001d6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  1001d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001dc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  1001df:	89 7d fc             	mov    %edi,-0x4(%ebp)
  1001e2:	83 fb 3f             	cmp    $0x3f,%ebx
  1001e5:	76 19                	jbe    100200 <binary_sem_down+0x30>
  1001e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1001ec:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1001ef:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1001f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1001f5:	89 ec                	mov    %ebp,%esp
  1001f7:	5d                   	pop    %ebp
  1001f8:	c3                   	ret    
  1001f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100200:	69 f3 d4 01 00 00    	imul   $0x1d4,%ebx,%esi
  100206:	8b 96 ac 93 10 00    	mov    0x1093ac(%esi),%edx
  10020c:	85 d2                	test   %edx,%edx
  10020e:	74 d7                	je     1001e7 <binary_sem_down+0x17>
  100210:	8d be 70 93 10 00    	lea    0x109370(%esi),%edi
  100216:	8d 57 08             	lea    0x8(%edi),%edx
  100219:	89 14 24             	mov    %edx,(%esp)
  10021c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10021f:	e8 2c 44 00 00       	call   104650 <acquire>
  100224:	31 c0                	xor    %eax,%eax
  100226:	f0 87 47 04          	lock xchg %eax,0x4(%edi)
  10022a:	83 f8 01             	cmp    $0x1,%eax
  10022d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100230:	74 43                	je     100275 <binary_sem_down+0xa5>
  100232:	6b db 75             	imul   $0x75,%ebx,%ebx
  100235:	8b 8e 44 95 10 00    	mov    0x109544(%esi),%ecx
  10023b:	8d 5c 19 18          	lea    0x18(%ecx,%ebx,1),%ebx
  10023f:	8b 04 9d 50 93 10 00 	mov    0x109350(,%ebx,4),%eax
  100246:	85 c0                	test   %eax,%eax
  100248:	75 46                	jne    100290 <binary_sem_down+0xc0>
  10024a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100250:	83 f9 63             	cmp    $0x63,%ecx
  100253:	89 04 9d 50 93 10 00 	mov    %eax,0x109350(,%ebx,4)
  10025a:	74 28                	je     100284 <binary_sem_down+0xb4>
  10025c:	83 86 44 95 10 00 01 	addl   $0x1,0x109544(%esi)
  100263:	89 54 24 04          	mov    %edx,0x4(%esp)
  100267:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10026a:	89 04 24             	mov    %eax,(%esp)
  10026d:	e8 ae 31 00 00       	call   103420 <sleep>
  100272:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100275:	89 14 24             	mov    %edx,(%esp)
  100278:	e8 83 43 00 00       	call   104600 <release>
  10027d:	31 c0                	xor    %eax,%eax
  10027f:	e9 68 ff ff ff       	jmp    1001ec <binary_sem_down+0x1c>
  100284:	c7 86 44 95 10 00 00 	movl   $0x0,0x109544(%esi)
  10028b:	00 00 00 
  10028e:	eb d3                	jmp    100263 <binary_sem_down+0x93>
  100290:	c7 04 24 80 71 10 00 	movl   $0x107180,(%esp)
  100297:	e8 b4 08 00 00       	call   100b50 <panic>
  10029c:	90                   	nop
  10029d:	90                   	nop
  10029e:	90                   	nop
  10029f:	90                   	nop

001002a0 <brelse>:
  1002a0:	55                   	push   %ebp
  1002a1:	89 e5                	mov    %esp,%ebp
  1002a3:	53                   	push   %ebx
  1002a4:	83 ec 14             	sub    $0x14,%esp
  1002a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1002aa:	f6 03 01             	testb  $0x1,(%ebx)
  1002ad:	74 57                	je     100306 <brelse+0x66>
  1002af:	c7 04 24 80 08 11 00 	movl   $0x110880,(%esp)
  1002b6:	e8 95 43 00 00       	call   104650 <acquire>
  1002bb:	8b 43 10             	mov    0x10(%ebx),%eax
  1002be:	8b 53 0c             	mov    0xc(%ebx),%edx
  1002c1:	89 50 0c             	mov    %edx,0xc(%eax)
  1002c4:	8b 43 0c             	mov    0xc(%ebx),%eax
  1002c7:	8b 53 10             	mov    0x10(%ebx),%edx
  1002ca:	89 50 10             	mov    %edx,0x10(%eax)
  1002cd:	a1 b4 1d 11 00       	mov    0x111db4,%eax
  1002d2:	c7 43 0c a4 1d 11 00 	movl   $0x111da4,0xc(%ebx)
  1002d9:	89 43 10             	mov    %eax,0x10(%ebx)
  1002dc:	a1 b4 1d 11 00       	mov    0x111db4,%eax
  1002e1:	89 58 0c             	mov    %ebx,0xc(%eax)
  1002e4:	89 1d b4 1d 11 00    	mov    %ebx,0x111db4
  1002ea:	83 23 fe             	andl   $0xfffffffe,(%ebx)
  1002ed:	89 1c 24             	mov    %ebx,(%esp)
  1002f0:	e8 fb 2f 00 00       	call   1032f0 <wakeup>
  1002f5:	c7 45 08 80 08 11 00 	movl   $0x110880,0x8(%ebp)
  1002fc:	83 c4 14             	add    $0x14,%esp
  1002ff:	5b                   	pop    %ebx
  100300:	5d                   	pop    %ebp
  100301:	e9 fa 42 00 00       	jmp    104600 <release>
  100306:	c7 04 24 98 71 10 00 	movl   $0x107198,(%esp)
  10030d:	e8 3e 08 00 00       	call   100b50 <panic>
  100312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100320 <bwrite>:
  100320:	55                   	push   %ebp
  100321:	89 e5                	mov    %esp,%ebp
  100323:	83 ec 18             	sub    $0x18,%esp
  100326:	8b 45 08             	mov    0x8(%ebp),%eax
  100329:	8b 10                	mov    (%eax),%edx
  10032b:	f6 c2 01             	test   $0x1,%dl
  10032e:	74 0e                	je     10033e <bwrite+0x1e>
  100330:	83 ca 04             	or     $0x4,%edx
  100333:	89 10                	mov    %edx,(%eax)
  100335:	89 45 08             	mov    %eax,0x8(%ebp)
  100338:	c9                   	leave  
  100339:	e9 82 1e 00 00       	jmp    1021c0 <iderw>
  10033e:	c7 04 24 9f 71 10 00 	movl   $0x10719f,(%esp)
  100345:	e8 06 08 00 00       	call   100b50 <panic>
  10034a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100350 <bread>:
  100350:	55                   	push   %ebp
  100351:	89 e5                	mov    %esp,%ebp
  100353:	57                   	push   %edi
  100354:	56                   	push   %esi
  100355:	53                   	push   %ebx
  100356:	83 ec 1c             	sub    $0x1c,%esp
  100359:	8b 75 08             	mov    0x8(%ebp),%esi
  10035c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10035f:	c7 04 24 80 08 11 00 	movl   $0x110880,(%esp)
  100366:	e8 e5 42 00 00       	call   104650 <acquire>
  10036b:	8b 1d b4 1d 11 00    	mov    0x111db4,%ebx
  100371:	81 fb a4 1d 11 00    	cmp    $0x111da4,%ebx
  100377:	75 12                	jne    10038b <bread+0x3b>
  100379:	eb 35                	jmp    1003b0 <bread+0x60>
  10037b:	90                   	nop
  10037c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100380:	8b 5b 10             	mov    0x10(%ebx),%ebx
  100383:	81 fb a4 1d 11 00    	cmp    $0x111da4,%ebx
  100389:	74 25                	je     1003b0 <bread+0x60>
  10038b:	3b 73 04             	cmp    0x4(%ebx),%esi
  10038e:	66 90                	xchg   %ax,%ax
  100390:	75 ee                	jne    100380 <bread+0x30>
  100392:	3b 7b 08             	cmp    0x8(%ebx),%edi
  100395:	75 e9                	jne    100380 <bread+0x30>
  100397:	8b 03                	mov    (%ebx),%eax
  100399:	a8 01                	test   $0x1,%al
  10039b:	74 64                	je     100401 <bread+0xb1>
  10039d:	c7 44 24 04 80 08 11 	movl   $0x110880,0x4(%esp)
  1003a4:	00 
  1003a5:	89 1c 24             	mov    %ebx,(%esp)
  1003a8:	e8 73 30 00 00       	call   103420 <sleep>
  1003ad:	eb bc                	jmp    10036b <bread+0x1b>
  1003af:	90                   	nop
  1003b0:	8b 1d b0 1d 11 00    	mov    0x111db0,%ebx
  1003b6:	81 fb a4 1d 11 00    	cmp    $0x111da4,%ebx
  1003bc:	75 0d                	jne    1003cb <bread+0x7b>
  1003be:	eb 54                	jmp    100414 <bread+0xc4>
  1003c0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  1003c3:	81 fb a4 1d 11 00    	cmp    $0x111da4,%ebx
  1003c9:	74 49                	je     100414 <bread+0xc4>
  1003cb:	f6 03 01             	testb  $0x1,(%ebx)
  1003ce:	66 90                	xchg   %ax,%ax
  1003d0:	75 ee                	jne    1003c0 <bread+0x70>
  1003d2:	89 73 04             	mov    %esi,0x4(%ebx)
  1003d5:	89 7b 08             	mov    %edi,0x8(%ebx)
  1003d8:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  1003de:	c7 04 24 80 08 11 00 	movl   $0x110880,(%esp)
  1003e5:	e8 16 42 00 00       	call   104600 <release>
  1003ea:	f6 03 02             	testb  $0x2,(%ebx)
  1003ed:	75 08                	jne    1003f7 <bread+0xa7>
  1003ef:	89 1c 24             	mov    %ebx,(%esp)
  1003f2:	e8 c9 1d 00 00       	call   1021c0 <iderw>
  1003f7:	83 c4 1c             	add    $0x1c,%esp
  1003fa:	89 d8                	mov    %ebx,%eax
  1003fc:	5b                   	pop    %ebx
  1003fd:	5e                   	pop    %esi
  1003fe:	5f                   	pop    %edi
  1003ff:	5d                   	pop    %ebp
  100400:	c3                   	ret    
  100401:	83 c8 01             	or     $0x1,%eax
  100404:	89 03                	mov    %eax,(%ebx)
  100406:	c7 04 24 80 08 11 00 	movl   $0x110880,(%esp)
  10040d:	e8 ee 41 00 00       	call   104600 <release>
  100412:	eb d6                	jmp    1003ea <bread+0x9a>
  100414:	c7 04 24 a6 71 10 00 	movl   $0x1071a6,(%esp)
  10041b:	e8 30 07 00 00       	call   100b50 <panic>

00100420 <binit>:
  100420:	55                   	push   %ebp
  100421:	89 e5                	mov    %esp,%ebp
  100423:	83 ec 18             	sub    $0x18,%esp
  100426:	c7 44 24 04 b7 71 10 	movl   $0x1071b7,0x4(%esp)
  10042d:	00 
  10042e:	c7 04 24 80 08 11 00 	movl   $0x110880,(%esp)
  100435:	e8 86 40 00 00       	call   1044c0 <initlock>
  10043a:	ba a4 1d 11 00       	mov    $0x111da4,%edx
  10043f:	b8 b4 08 11 00       	mov    $0x1108b4,%eax
  100444:	c7 05 b0 1d 11 00 a4 	movl   $0x111da4,0x111db0
  10044b:	1d 11 00 
  10044e:	c7 05 b4 1d 11 00 a4 	movl   $0x111da4,0x111db4
  100455:	1d 11 00 
  100458:	89 50 10             	mov    %edx,0x10(%eax)
  10045b:	c7 40 0c a4 1d 11 00 	movl   $0x111da4,0xc(%eax)
  100462:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
  100469:	8b 15 b4 1d 11 00    	mov    0x111db4,%edx
  10046f:	89 42 0c             	mov    %eax,0xc(%edx)
  100472:	89 c2                	mov    %eax,%edx
  100474:	a3 b4 1d 11 00       	mov    %eax,0x111db4
  100479:	05 18 02 00 00       	add    $0x218,%eax
  10047e:	3d a4 1d 11 00       	cmp    $0x111da4,%eax
  100483:	75 d3                	jne    100458 <binit+0x38>
  100485:	c9                   	leave  
  100486:	c3                   	ret    
  100487:	90                   	nop
  100488:	90                   	nop
  100489:	90                   	nop
  10048a:	90                   	nop
  10048b:	90                   	nop
  10048c:	90                   	nop
  10048d:	90                   	nop
  10048e:	90                   	nop
  10048f:	90                   	nop

00100490 <consoleinit>:
  100490:	55                   	push   %ebp
  100491:	89 e5                	mov    %esp,%ebp
  100493:	83 ec 18             	sub    $0x18,%esp
  100496:	c7 44 24 04 be 71 10 	movl   $0x1071be,0x4(%esp)
  10049d:	00 
  10049e:	c7 04 24 a0 92 10 00 	movl   $0x1092a0,(%esp)
  1004a5:	e8 16 40 00 00       	call   1044c0 <initlock>
  1004aa:	c7 44 24 04 c6 71 10 	movl   $0x1071c6,0x4(%esp)
  1004b1:	00 
  1004b2:	c7 04 24 c0 1f 11 00 	movl   $0x111fc0,(%esp)
  1004b9:	e8 02 40 00 00       	call   1044c0 <initlock>
  1004be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1004c5:	c7 05 2c 2a 11 00 70 	movl   $0x100670,0x112a2c
  1004cc:	06 10 00 
  1004cf:	c7 05 28 2a 11 00 c0 	movl   $0x1008c0,0x112a28
  1004d6:	08 10 00 
  1004d9:	c7 05 d4 92 10 00 01 	movl   $0x1,0x1092d4
  1004e0:	00 00 00 
  1004e3:	e8 38 29 00 00       	call   102e20 <picenable>
  1004e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1004ef:	00 
  1004f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1004f7:	e8 e4 1e 00 00       	call   1023e0 <ioapicenable>
  1004fc:	c9                   	leave  
  1004fd:	c3                   	ret    
  1004fe:	66 90                	xchg   %ax,%ax

00100500 <consputc>:
  100500:	55                   	push   %ebp
  100501:	89 e5                	mov    %esp,%ebp
  100503:	57                   	push   %edi
  100504:	56                   	push   %esi
  100505:	89 c6                	mov    %eax,%esi
  100507:	53                   	push   %ebx
  100508:	83 ec 1c             	sub    $0x1c,%esp
  10050b:	83 3d 80 92 10 00 00 	cmpl   $0x0,0x109280
  100512:	74 03                	je     100517 <consputc+0x17>
  100514:	fa                   	cli    
  100515:	eb fe                	jmp    100515 <consputc+0x15>
  100517:	3d 00 01 00 00       	cmp    $0x100,%eax
  10051c:	0f 84 a0 00 00 00    	je     1005c2 <consputc+0xc2>
  100522:	89 04 24             	mov    %eax,(%esp)
  100525:	e8 96 58 00 00       	call   105dc0 <uartputc>
  10052a:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
  10052f:	b8 0e 00 00 00       	mov    $0xe,%eax
  100534:	89 ca                	mov    %ecx,%edx
  100536:	ee                   	out    %al,(%dx)
  100537:	bf d5 03 00 00       	mov    $0x3d5,%edi
  10053c:	89 fa                	mov    %edi,%edx
  10053e:	ec                   	in     (%dx),%al
  10053f:	0f b6 d8             	movzbl %al,%ebx
  100542:	89 ca                	mov    %ecx,%edx
  100544:	c1 e3 08             	shl    $0x8,%ebx
  100547:	b8 0f 00 00 00       	mov    $0xf,%eax
  10054c:	ee                   	out    %al,(%dx)
  10054d:	89 fa                	mov    %edi,%edx
  10054f:	ec                   	in     (%dx),%al
  100550:	0f b6 c0             	movzbl %al,%eax
  100553:	09 c3                	or     %eax,%ebx
  100555:	83 fe 0a             	cmp    $0xa,%esi
  100558:	0f 84 ee 00 00 00    	je     10064c <consputc+0x14c>
  10055e:	81 fe 00 01 00 00    	cmp    $0x100,%esi
  100564:	0f 84 cb 00 00 00    	je     100635 <consputc+0x135>
  10056a:	66 81 e6 ff 00       	and    $0xff,%si
  10056f:	66 81 ce 00 07       	or     $0x700,%si
  100574:	66 89 b4 1b 00 80 0b 	mov    %si,0xb8000(%ebx,%ebx,1)
  10057b:	00 
  10057c:	83 c3 01             	add    $0x1,%ebx
  10057f:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
  100585:	8d 8c 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%ecx
  10058c:	7f 5d                	jg     1005eb <consputc+0xeb>
  10058e:	be d4 03 00 00       	mov    $0x3d4,%esi
  100593:	b8 0e 00 00 00       	mov    $0xe,%eax
  100598:	89 f2                	mov    %esi,%edx
  10059a:	ee                   	out    %al,(%dx)
  10059b:	bf d5 03 00 00       	mov    $0x3d5,%edi
  1005a0:	89 d8                	mov    %ebx,%eax
  1005a2:	c1 f8 08             	sar    $0x8,%eax
  1005a5:	89 fa                	mov    %edi,%edx
  1005a7:	ee                   	out    %al,(%dx)
  1005a8:	b8 0f 00 00 00       	mov    $0xf,%eax
  1005ad:	89 f2                	mov    %esi,%edx
  1005af:	ee                   	out    %al,(%dx)
  1005b0:	89 d8                	mov    %ebx,%eax
  1005b2:	89 fa                	mov    %edi,%edx
  1005b4:	ee                   	out    %al,(%dx)
  1005b5:	66 c7 01 20 07       	movw   $0x720,(%ecx)
  1005ba:	83 c4 1c             	add    $0x1c,%esp
  1005bd:	5b                   	pop    %ebx
  1005be:	5e                   	pop    %esi
  1005bf:	5f                   	pop    %edi
  1005c0:	5d                   	pop    %ebp
  1005c1:	c3                   	ret    
  1005c2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1005c9:	e8 f2 57 00 00       	call   105dc0 <uartputc>
  1005ce:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1005d5:	e8 e6 57 00 00       	call   105dc0 <uartputc>
  1005da:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1005e1:	e8 da 57 00 00       	call   105dc0 <uartputc>
  1005e6:	e9 3f ff ff ff       	jmp    10052a <consputc+0x2a>
  1005eb:	83 eb 50             	sub    $0x50,%ebx
  1005ee:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
  1005f5:	00 
  1005f6:	8d b4 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%esi
  1005fd:	c7 44 24 04 a0 80 0b 	movl   $0xb80a0,0x4(%esp)
  100604:	00 
  100605:	c7 04 24 00 80 0b 00 	movl   $0xb8000,(%esp)
  10060c:	e8 5f 41 00 00       	call   104770 <memmove>
  100611:	b8 80 07 00 00       	mov    $0x780,%eax
  100616:	29 d8                	sub    %ebx,%eax
  100618:	01 c0                	add    %eax,%eax
  10061a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10061e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100625:	00 
  100626:	89 34 24             	mov    %esi,(%esp)
  100629:	e8 c2 40 00 00       	call   1046f0 <memset>
  10062e:	89 f1                	mov    %esi,%ecx
  100630:	e9 59 ff ff ff       	jmp    10058e <consputc+0x8e>
  100635:	85 db                	test   %ebx,%ebx
  100637:	8d 8c 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%ecx
  10063e:	0f 8e 4a ff ff ff    	jle    10058e <consputc+0x8e>
  100644:	83 eb 01             	sub    $0x1,%ebx
  100647:	e9 33 ff ff ff       	jmp    10057f <consputc+0x7f>
  10064c:	89 da                	mov    %ebx,%edx
  10064e:	89 d8                	mov    %ebx,%eax
  100650:	b9 50 00 00 00       	mov    $0x50,%ecx
  100655:	83 c3 50             	add    $0x50,%ebx
  100658:	c1 fa 1f             	sar    $0x1f,%edx
  10065b:	f7 f9                	idiv   %ecx
  10065d:	29 d3                	sub    %edx,%ebx
  10065f:	e9 1b ff ff ff       	jmp    10057f <consputc+0x7f>
  100664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10066a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00100670 <consolewrite>:
  100670:	55                   	push   %ebp
  100671:	89 e5                	mov    %esp,%ebp
  100673:	57                   	push   %edi
  100674:	56                   	push   %esi
  100675:	53                   	push   %ebx
  100676:	83 ec 1c             	sub    $0x1c,%esp
  100679:	8b 45 08             	mov    0x8(%ebp),%eax
  10067c:	8b 75 10             	mov    0x10(%ebp),%esi
  10067f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  100682:	89 04 24             	mov    %eax,(%esp)
  100685:	e8 66 13 00 00       	call   1019f0 <iunlock>
  10068a:	c7 04 24 a0 92 10 00 	movl   $0x1092a0,(%esp)
  100691:	e8 ba 3f 00 00       	call   104650 <acquire>
  100696:	85 f6                	test   %esi,%esi
  100698:	7e 16                	jle    1006b0 <consolewrite+0x40>
  10069a:	31 db                	xor    %ebx,%ebx
  10069c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1006a0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
  1006a4:	83 c3 01             	add    $0x1,%ebx
  1006a7:	e8 54 fe ff ff       	call   100500 <consputc>
  1006ac:	39 de                	cmp    %ebx,%esi
  1006ae:	7f f0                	jg     1006a0 <consolewrite+0x30>
  1006b0:	c7 04 24 a0 92 10 00 	movl   $0x1092a0,(%esp)
  1006b7:	e8 44 3f 00 00       	call   104600 <release>
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 04 24             	mov    %eax,(%esp)
  1006c2:	e8 69 17 00 00       	call   101e30 <ilock>
  1006c7:	83 c4 1c             	add    $0x1c,%esp
  1006ca:	89 f0                	mov    %esi,%eax
  1006cc:	5b                   	pop    %ebx
  1006cd:	5e                   	pop    %esi
  1006ce:	5f                   	pop    %edi
  1006cf:	5d                   	pop    %ebp
  1006d0:	c3                   	ret    
  1006d1:	eb 0d                	jmp    1006e0 <printint>
  1006d3:	90                   	nop
  1006d4:	90                   	nop
  1006d5:	90                   	nop
  1006d6:	90                   	nop
  1006d7:	90                   	nop
  1006d8:	90                   	nop
  1006d9:	90                   	nop
  1006da:	90                   	nop
  1006db:	90                   	nop
  1006dc:	90                   	nop
  1006dd:	90                   	nop
  1006de:	90                   	nop
  1006df:	90                   	nop

001006e0 <printint>:
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	57                   	push   %edi
  1006e4:	56                   	push   %esi
  1006e5:	89 d6                	mov    %edx,%esi
  1006e7:	53                   	push   %ebx
  1006e8:	83 ec 1c             	sub    $0x1c,%esp
  1006eb:	85 c9                	test   %ecx,%ecx
  1006ed:	74 04                	je     1006f3 <printint+0x13>
  1006ef:	85 c0                	test   %eax,%eax
  1006f1:	78 55                	js     100748 <printint+0x68>
  1006f3:	31 ff                	xor    %edi,%edi
  1006f5:	31 c9                	xor    %ecx,%ecx
  1006f7:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  1006fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100700:	31 d2                	xor    %edx,%edx
  100702:	f7 f6                	div    %esi
  100704:	0f b6 92 e6 71 10 00 	movzbl 0x1071e6(%edx),%edx
  10070b:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  10070e:	83 c1 01             	add    $0x1,%ecx
  100711:	85 c0                	test   %eax,%eax
  100713:	75 eb                	jne    100700 <printint+0x20>
  100715:	85 ff                	test   %edi,%edi
  100717:	74 08                	je     100721 <printint+0x41>
  100719:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
  10071e:	83 c1 01             	add    $0x1,%ecx
  100721:	8d 71 ff             	lea    -0x1(%ecx),%esi
  100724:	01 f3                	add    %esi,%ebx
  100726:	66 90                	xchg   %ax,%ax
  100728:	0f be 03             	movsbl (%ebx),%eax
  10072b:	83 ee 01             	sub    $0x1,%esi
  10072e:	83 eb 01             	sub    $0x1,%ebx
  100731:	e8 ca fd ff ff       	call   100500 <consputc>
  100736:	83 fe ff             	cmp    $0xffffffff,%esi
  100739:	75 ed                	jne    100728 <printint+0x48>
  10073b:	83 c4 1c             	add    $0x1c,%esp
  10073e:	5b                   	pop    %ebx
  10073f:	5e                   	pop    %esi
  100740:	5f                   	pop    %edi
  100741:	5d                   	pop    %ebp
  100742:	c3                   	ret    
  100743:	90                   	nop
  100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100748:	f7 d8                	neg    %eax
  10074a:	bf 01 00 00 00       	mov    $0x1,%edi
  10074f:	eb a4                	jmp    1006f5 <printint+0x15>
  100751:	eb 0d                	jmp    100760 <cprintf>
  100753:	90                   	nop
  100754:	90                   	nop
  100755:	90                   	nop
  100756:	90                   	nop
  100757:	90                   	nop
  100758:	90                   	nop
  100759:	90                   	nop
  10075a:	90                   	nop
  10075b:	90                   	nop
  10075c:	90                   	nop
  10075d:	90                   	nop
  10075e:	90                   	nop
  10075f:	90                   	nop

00100760 <cprintf>:
  100760:	55                   	push   %ebp
  100761:	89 e5                	mov    %esp,%ebp
  100763:	57                   	push   %edi
  100764:	56                   	push   %esi
  100765:	53                   	push   %ebx
  100766:	83 ec 2c             	sub    $0x2c,%esp
  100769:	8b 3d d4 92 10 00    	mov    0x1092d4,%edi
  10076f:	85 ff                	test   %edi,%edi
  100771:	0f 85 29 01 00 00    	jne    1008a0 <cprintf+0x140>
  100777:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10077a:	0f b6 01             	movzbl (%ecx),%eax
  10077d:	85 c0                	test   %eax,%eax
  10077f:	0f 84 93 00 00 00    	je     100818 <cprintf+0xb8>
  100785:	8d 75 0c             	lea    0xc(%ebp),%esi
  100788:	31 db                	xor    %ebx,%ebx
  10078a:	eb 3f                	jmp    1007cb <cprintf+0x6b>
  10078c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100790:	83 fa 25             	cmp    $0x25,%edx
  100793:	0f 84 b7 00 00 00    	je     100850 <cprintf+0xf0>
  100799:	83 fa 64             	cmp    $0x64,%edx
  10079c:	0f 84 8e 00 00 00    	je     100830 <cprintf+0xd0>
  1007a2:	b8 25 00 00 00       	mov    $0x25,%eax
  1007a7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1007aa:	e8 51 fd ff ff       	call   100500 <consputc>
  1007af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1007b2:	89 d0                	mov    %edx,%eax
  1007b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1007b8:	e8 43 fd ff ff       	call   100500 <consputc>
  1007bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1007c0:	83 c3 01             	add    $0x1,%ebx
  1007c3:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
  1007c7:	85 c0                	test   %eax,%eax
  1007c9:	74 4d                	je     100818 <cprintf+0xb8>
  1007cb:	83 f8 25             	cmp    $0x25,%eax
  1007ce:	75 e8                	jne    1007b8 <cprintf+0x58>
  1007d0:	83 c3 01             	add    $0x1,%ebx
  1007d3:	0f b6 14 19          	movzbl (%ecx,%ebx,1),%edx
  1007d7:	85 d2                	test   %edx,%edx
  1007d9:	74 3d                	je     100818 <cprintf+0xb8>
  1007db:	83 fa 70             	cmp    $0x70,%edx
  1007de:	74 12                	je     1007f2 <cprintf+0x92>
  1007e0:	7e ae                	jle    100790 <cprintf+0x30>
  1007e2:	83 fa 73             	cmp    $0x73,%edx
  1007e5:	8d 76 00             	lea    0x0(%esi),%esi
  1007e8:	74 7e                	je     100868 <cprintf+0x108>
  1007ea:	83 fa 78             	cmp    $0x78,%edx
  1007ed:	8d 76 00             	lea    0x0(%esi),%esi
  1007f0:	75 b0                	jne    1007a2 <cprintf+0x42>
  1007f2:	8b 06                	mov    (%esi),%eax
  1007f4:	31 c9                	xor    %ecx,%ecx
  1007f6:	ba 10 00 00 00       	mov    $0x10,%edx
  1007fb:	83 c3 01             	add    $0x1,%ebx
  1007fe:	83 c6 04             	add    $0x4,%esi
  100801:	e8 da fe ff ff       	call   1006e0 <printint>
  100806:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100809:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
  10080d:	85 c0                	test   %eax,%eax
  10080f:	75 ba                	jne    1007cb <cprintf+0x6b>
  100811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100818:	85 ff                	test   %edi,%edi
  10081a:	74 0c                	je     100828 <cprintf+0xc8>
  10081c:	c7 04 24 a0 92 10 00 	movl   $0x1092a0,(%esp)
  100823:	e8 d8 3d 00 00       	call   104600 <release>
  100828:	83 c4 2c             	add    $0x2c,%esp
  10082b:	5b                   	pop    %ebx
  10082c:	5e                   	pop    %esi
  10082d:	5f                   	pop    %edi
  10082e:	5d                   	pop    %ebp
  10082f:	c3                   	ret    
  100830:	8b 06                	mov    (%esi),%eax
  100832:	b9 01 00 00 00       	mov    $0x1,%ecx
  100837:	ba 0a 00 00 00       	mov    $0xa,%edx
  10083c:	83 c6 04             	add    $0x4,%esi
  10083f:	e8 9c fe ff ff       	call   1006e0 <printint>
  100844:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100847:	e9 74 ff ff ff       	jmp    1007c0 <cprintf+0x60>
  10084c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100850:	b8 25 00 00 00       	mov    $0x25,%eax
  100855:	e8 a6 fc ff ff       	call   100500 <consputc>
  10085a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10085d:	e9 5e ff ff ff       	jmp    1007c0 <cprintf+0x60>
  100862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100868:	8b 16                	mov    (%esi),%edx
  10086a:	83 c6 04             	add    $0x4,%esi
  10086d:	85 d2                	test   %edx,%edx
  10086f:	74 47                	je     1008b8 <cprintf+0x158>
  100871:	0f b6 02             	movzbl (%edx),%eax
  100874:	84 c0                	test   %al,%al
  100876:	0f 84 44 ff ff ff    	je     1007c0 <cprintf+0x60>
  10087c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100880:	0f be c0             	movsbl %al,%eax
  100883:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  100886:	e8 75 fc ff ff       	call   100500 <consputc>
  10088b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10088e:	83 c2 01             	add    $0x1,%edx
  100891:	0f b6 02             	movzbl (%edx),%eax
  100894:	84 c0                	test   %al,%al
  100896:	75 e8                	jne    100880 <cprintf+0x120>
  100898:	e9 20 ff ff ff       	jmp    1007bd <cprintf+0x5d>
  10089d:	8d 76 00             	lea    0x0(%esi),%esi
  1008a0:	c7 04 24 a0 92 10 00 	movl   $0x1092a0,(%esp)
  1008a7:	e8 a4 3d 00 00       	call   104650 <acquire>
  1008ac:	e9 c6 fe ff ff       	jmp    100777 <cprintf+0x17>
  1008b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1008b8:	ba cc 71 10 00       	mov    $0x1071cc,%edx
  1008bd:	eb b2                	jmp    100871 <cprintf+0x111>
  1008bf:	90                   	nop

001008c0 <consoleread>:
  1008c0:	55                   	push   %ebp
  1008c1:	89 e5                	mov    %esp,%ebp
  1008c3:	57                   	push   %edi
  1008c4:	56                   	push   %esi
  1008c5:	53                   	push   %ebx
  1008c6:	83 ec 3c             	sub    $0x3c,%esp
  1008c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1008cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  1008cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  1008d2:	89 3c 24             	mov    %edi,(%esp)
  1008d5:	e8 16 11 00 00       	call   1019f0 <iunlock>
  1008da:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  1008dd:	c7 04 24 c0 1f 11 00 	movl   $0x111fc0,(%esp)
  1008e4:	e8 67 3d 00 00       	call   104650 <acquire>
  1008e9:	85 db                	test   %ebx,%ebx
  1008eb:	7f 2c                	jg     100919 <consoleread+0x59>
  1008ed:	e9 c0 00 00 00       	jmp    1009b2 <consoleread+0xf2>
  1008f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1008f8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1008fe:	8b 40 4c             	mov    0x4c(%eax),%eax
  100901:	85 c0                	test   %eax,%eax
  100903:	75 5b                	jne    100960 <consoleread+0xa0>
  100905:	c7 44 24 04 c0 1f 11 	movl   $0x111fc0,0x4(%esp)
  10090c:	00 
  10090d:	c7 04 24 74 20 11 00 	movl   $0x112074,(%esp)
  100914:	e8 07 2b 00 00       	call   103420 <sleep>
  100919:	a1 74 20 11 00       	mov    0x112074,%eax
  10091e:	3b 05 78 20 11 00    	cmp    0x112078,%eax
  100924:	74 d2                	je     1008f8 <consoleread+0x38>
  100926:	89 c2                	mov    %eax,%edx
  100928:	83 e2 7f             	and    $0x7f,%edx
  10092b:	0f b6 8a f4 1f 11 00 	movzbl 0x111ff4(%edx),%ecx
  100932:	0f be d1             	movsbl %cl,%edx
  100935:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  100938:	8d 50 01             	lea    0x1(%eax),%edx
  10093b:	83 7d d4 04          	cmpl   $0x4,-0x2c(%ebp)
  10093f:	89 15 74 20 11 00    	mov    %edx,0x112074
  100945:	74 3a                	je     100981 <consoleread+0xc1>
  100947:	88 0e                	mov    %cl,(%esi)
  100949:	83 eb 01             	sub    $0x1,%ebx
  10094c:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
  100950:	74 39                	je     10098b <consoleread+0xcb>
  100952:	85 db                	test   %ebx,%ebx
  100954:	7e 35                	jle    10098b <consoleread+0xcb>
  100956:	83 c6 01             	add    $0x1,%esi
  100959:	eb be                	jmp    100919 <consoleread+0x59>
  10095b:	90                   	nop
  10095c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100960:	c7 04 24 c0 1f 11 00 	movl   $0x111fc0,(%esp)
  100967:	e8 94 3c 00 00       	call   104600 <release>
  10096c:	89 3c 24             	mov    %edi,(%esp)
  10096f:	e8 bc 14 00 00       	call   101e30 <ilock>
  100974:	83 c4 3c             	add    $0x3c,%esp
  100977:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10097c:	5b                   	pop    %ebx
  10097d:	5e                   	pop    %esi
  10097e:	5f                   	pop    %edi
  10097f:	5d                   	pop    %ebp
  100980:	c3                   	ret    
  100981:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  100984:	76 05                	jbe    10098b <consoleread+0xcb>
  100986:	a3 74 20 11 00       	mov    %eax,0x112074
  10098b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10098e:	29 d8                	sub    %ebx,%eax
  100990:	c7 04 24 c0 1f 11 00 	movl   $0x111fc0,(%esp)
  100997:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10099a:	e8 61 3c 00 00       	call   104600 <release>
  10099f:	89 3c 24             	mov    %edi,(%esp)
  1009a2:	e8 89 14 00 00       	call   101e30 <ilock>
  1009a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1009aa:	83 c4 3c             	add    $0x3c,%esp
  1009ad:	5b                   	pop    %ebx
  1009ae:	5e                   	pop    %esi
  1009af:	5f                   	pop    %edi
  1009b0:	5d                   	pop    %ebp
  1009b1:	c3                   	ret    
  1009b2:	31 c0                	xor    %eax,%eax
  1009b4:	eb da                	jmp    100990 <consoleread+0xd0>
  1009b6:	8d 76 00             	lea    0x0(%esi),%esi
  1009b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001009c0 <consoleintr>:
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	57                   	push   %edi
  1009c4:	bf f0 1f 11 00       	mov    $0x111ff0,%edi
  1009c9:	56                   	push   %esi
  1009ca:	53                   	push   %ebx
  1009cb:	83 ec 1c             	sub    $0x1c,%esp
  1009ce:	8b 75 08             	mov    0x8(%ebp),%esi
  1009d1:	c7 04 24 c0 1f 11 00 	movl   $0x111fc0,(%esp)
  1009d8:	e8 73 3c 00 00       	call   104650 <acquire>
  1009dd:	8d 76 00             	lea    0x0(%esi),%esi
  1009e0:	ff d6                	call   *%esi
  1009e2:	85 c0                	test   %eax,%eax
  1009e4:	89 c3                	mov    %eax,%ebx
  1009e6:	0f 88 9c 00 00 00    	js     100a88 <consoleintr+0xc8>
  1009ec:	83 fb 10             	cmp    $0x10,%ebx
  1009ef:	90                   	nop
  1009f0:	0f 84 1a 01 00 00    	je     100b10 <consoleintr+0x150>
  1009f6:	0f 8f a4 00 00 00    	jg     100aa0 <consoleintr+0xe0>
  1009fc:	83 fb 08             	cmp    $0x8,%ebx
  1009ff:	90                   	nop
  100a00:	0f 84 a8 00 00 00    	je     100aae <consoleintr+0xee>
  100a06:	85 db                	test   %ebx,%ebx
  100a08:	74 d6                	je     1009e0 <consoleintr+0x20>
  100a0a:	a1 7c 20 11 00       	mov    0x11207c,%eax
  100a0f:	89 c2                	mov    %eax,%edx
  100a11:	2b 15 74 20 11 00    	sub    0x112074,%edx
  100a17:	83 fa 7f             	cmp    $0x7f,%edx
  100a1a:	77 c4                	ja     1009e0 <consoleintr+0x20>
  100a1c:	83 fb 0d             	cmp    $0xd,%ebx
  100a1f:	0f 84 f8 00 00 00    	je     100b1d <consoleintr+0x15d>
  100a25:	89 c2                	mov    %eax,%edx
  100a27:	83 c0 01             	add    $0x1,%eax
  100a2a:	83 e2 7f             	and    $0x7f,%edx
  100a2d:	88 5c 17 04          	mov    %bl,0x4(%edi,%edx,1)
  100a31:	a3 7c 20 11 00       	mov    %eax,0x11207c
  100a36:	89 d8                	mov    %ebx,%eax
  100a38:	e8 c3 fa ff ff       	call   100500 <consputc>
  100a3d:	83 fb 04             	cmp    $0x4,%ebx
  100a40:	0f 84 f3 00 00 00    	je     100b39 <consoleintr+0x179>
  100a46:	83 fb 0a             	cmp    $0xa,%ebx
  100a49:	0f 84 ea 00 00 00    	je     100b39 <consoleintr+0x179>
  100a4f:	8b 15 74 20 11 00    	mov    0x112074,%edx
  100a55:	a1 7c 20 11 00       	mov    0x11207c,%eax
  100a5a:	83 ea 80             	sub    $0xffffff80,%edx
  100a5d:	39 d0                	cmp    %edx,%eax
  100a5f:	0f 85 7b ff ff ff    	jne    1009e0 <consoleintr+0x20>
  100a65:	a3 78 20 11 00       	mov    %eax,0x112078
  100a6a:	c7 04 24 74 20 11 00 	movl   $0x112074,(%esp)
  100a71:	e8 7a 28 00 00       	call   1032f0 <wakeup>
  100a76:	ff d6                	call   *%esi
  100a78:	85 c0                	test   %eax,%eax
  100a7a:	89 c3                	mov    %eax,%ebx
  100a7c:	0f 89 6a ff ff ff    	jns    1009ec <consoleintr+0x2c>
  100a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100a88:	c7 45 08 c0 1f 11 00 	movl   $0x111fc0,0x8(%ebp)
  100a8f:	83 c4 1c             	add    $0x1c,%esp
  100a92:	5b                   	pop    %ebx
  100a93:	5e                   	pop    %esi
  100a94:	5f                   	pop    %edi
  100a95:	5d                   	pop    %ebp
  100a96:	e9 65 3b 00 00       	jmp    104600 <release>
  100a9b:	90                   	nop
  100a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100aa0:	83 fb 15             	cmp    $0x15,%ebx
  100aa3:	74 57                	je     100afc <consoleintr+0x13c>
  100aa5:	83 fb 7f             	cmp    $0x7f,%ebx
  100aa8:	0f 85 58 ff ff ff    	jne    100a06 <consoleintr+0x46>
  100aae:	a1 7c 20 11 00       	mov    0x11207c,%eax
  100ab3:	3b 05 78 20 11 00    	cmp    0x112078,%eax
  100ab9:	0f 84 21 ff ff ff    	je     1009e0 <consoleintr+0x20>
  100abf:	83 e8 01             	sub    $0x1,%eax
  100ac2:	a3 7c 20 11 00       	mov    %eax,0x11207c
  100ac7:	b8 00 01 00 00       	mov    $0x100,%eax
  100acc:	e8 2f fa ff ff       	call   100500 <consputc>
  100ad1:	e9 0a ff ff ff       	jmp    1009e0 <consoleintr+0x20>
  100ad6:	66 90                	xchg   %ax,%ax
  100ad8:	83 e8 01             	sub    $0x1,%eax
  100adb:	89 c2                	mov    %eax,%edx
  100add:	83 e2 7f             	and    $0x7f,%edx
  100ae0:	80 ba f4 1f 11 00 0a 	cmpb   $0xa,0x111ff4(%edx)
  100ae7:	0f 84 f3 fe ff ff    	je     1009e0 <consoleintr+0x20>
  100aed:	a3 7c 20 11 00       	mov    %eax,0x11207c
  100af2:	b8 00 01 00 00       	mov    $0x100,%eax
  100af7:	e8 04 fa ff ff       	call   100500 <consputc>
  100afc:	a1 7c 20 11 00       	mov    0x11207c,%eax
  100b01:	3b 05 78 20 11 00    	cmp    0x112078,%eax
  100b07:	75 cf                	jne    100ad8 <consoleintr+0x118>
  100b09:	e9 d2 fe ff ff       	jmp    1009e0 <consoleintr+0x20>
  100b0e:	66 90                	xchg   %ax,%ax
  100b10:	e8 bb 38 00 00       	call   1043d0 <procdump>
  100b15:	8d 76 00             	lea    0x0(%esi),%esi
  100b18:	e9 c3 fe ff ff       	jmp    1009e0 <consoleintr+0x20>
  100b1d:	89 c2                	mov    %eax,%edx
  100b1f:	83 c0 01             	add    $0x1,%eax
  100b22:	83 e2 7f             	and    $0x7f,%edx
  100b25:	c6 44 17 04 0a       	movb   $0xa,0x4(%edi,%edx,1)
  100b2a:	a3 7c 20 11 00       	mov    %eax,0x11207c
  100b2f:	b8 0a 00 00 00       	mov    $0xa,%eax
  100b34:	e8 c7 f9 ff ff       	call   100500 <consputc>
  100b39:	a1 7c 20 11 00       	mov    0x11207c,%eax
  100b3e:	e9 22 ff ff ff       	jmp    100a65 <consoleintr+0xa5>
  100b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100b50 <panic>:
  100b50:	55                   	push   %ebp
  100b51:	89 e5                	mov    %esp,%ebp
  100b53:	56                   	push   %esi
  100b54:	53                   	push   %ebx
  100b55:	83 ec 40             	sub    $0x40,%esp
  100b58:	fa                   	cli    
  100b59:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  100b5f:	8d 75 d0             	lea    -0x30(%ebp),%esi
  100b62:	31 db                	xor    %ebx,%ebx
  100b64:	c7 05 d4 92 10 00 00 	movl   $0x0,0x1092d4
  100b6b:	00 00 00 
  100b6e:	0f b6 00             	movzbl (%eax),%eax
  100b71:	c7 04 24 d3 71 10 00 	movl   $0x1071d3,(%esp)
  100b78:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b7c:	e8 df fb ff ff       	call   100760 <cprintf>
  100b81:	8b 45 08             	mov    0x8(%ebp),%eax
  100b84:	89 04 24             	mov    %eax,(%esp)
  100b87:	e8 d4 fb ff ff       	call   100760 <cprintf>
  100b8c:	c7 04 24 f6 75 10 00 	movl   $0x1075f6,(%esp)
  100b93:	e8 c8 fb ff ff       	call   100760 <cprintf>
  100b98:	8d 45 08             	lea    0x8(%ebp),%eax
  100b9b:	89 74 24 04          	mov    %esi,0x4(%esp)
  100b9f:	89 04 24             	mov    %eax,(%esp)
  100ba2:	e8 39 39 00 00       	call   1044e0 <getcallerpcs>
  100ba7:	90                   	nop
  100ba8:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
  100bab:	83 c3 01             	add    $0x1,%ebx
  100bae:	c7 04 24 e2 71 10 00 	movl   $0x1071e2,(%esp)
  100bb5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bb9:	e8 a2 fb ff ff       	call   100760 <cprintf>
  100bbe:	83 fb 0a             	cmp    $0xa,%ebx
  100bc1:	75 e5                	jne    100ba8 <panic+0x58>
  100bc3:	c7 05 80 92 10 00 01 	movl   $0x1,0x109280
  100bca:	00 00 00 
  100bcd:	eb fe                	jmp    100bcd <panic+0x7d>
  100bcf:	90                   	nop

00100bd0 <exec>:
  100bd0:	55                   	push   %ebp
  100bd1:	89 e5                	mov    %esp,%ebp
  100bd3:	57                   	push   %edi
  100bd4:	56                   	push   %esi
  100bd5:	53                   	push   %ebx
  100bd6:	81 ec ac 00 00 00    	sub    $0xac,%esp
  100bdc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdf:	89 04 24             	mov    %eax,(%esp)
  100be2:	e8 e9 14 00 00       	call   1020d0 <namei>
  100be7:	89 c7                	mov    %eax,%edi
  100be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100bee:	85 ff                	test   %edi,%edi
  100bf0:	0f 84 1a 01 00 00    	je     100d10 <exec+0x140>
  100bf6:	89 3c 24             	mov    %edi,(%esp)
  100bf9:	e8 32 12 00 00       	call   101e30 <ilock>
  100bfe:	8d 45 94             	lea    -0x6c(%ebp),%eax
  100c01:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
  100c08:	00 
  100c09:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100c10:	00 
  100c11:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c15:	89 3c 24             	mov    %edi,(%esp)
  100c18:	e8 d3 09 00 00       	call   1015f0 <readi>
  100c1d:	83 f8 33             	cmp    $0x33,%eax
  100c20:	0f 86 dd 00 00 00    	jbe    100d03 <exec+0x133>
  100c26:	81 7d 94 7f 45 4c 46 	cmpl   $0x464c457f,-0x6c(%ebp)
  100c2d:	0f 85 d0 00 00 00    	jne    100d03 <exec+0x133>
  100c33:	90                   	nop
  100c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100c38:	e8 03 5f 00 00       	call   106b40 <setupkvm>
  100c3d:	85 c0                	test   %eax,%eax
  100c3f:	89 45 80             	mov    %eax,-0x80(%ebp)
  100c42:	0f 84 bb 00 00 00    	je     100d03 <exec+0x133>
  100c48:	66 83 7d c0 00       	cmpw   $0x0,-0x40(%ebp)
  100c4d:	8b 75 b0             	mov    -0x50(%ebp),%esi
  100c50:	0f 84 0d 03 00 00    	je     100f63 <exec+0x393>
  100c56:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%ebp)
  100c5d:	31 db                	xor    %ebx,%ebx
  100c5f:	eb 19                	jmp    100c7a <exec+0xaa>
  100c61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100c68:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
  100c6c:	83 c3 01             	add    $0x1,%ebx
  100c6f:	39 d8                	cmp    %ebx,%eax
  100c71:	0f 8e a9 00 00 00    	jle    100d20 <exec+0x150>
  100c77:	83 c6 20             	add    $0x20,%esi
  100c7a:	8d 55 c8             	lea    -0x38(%ebp),%edx
  100c7d:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
  100c84:	00 
  100c85:	89 74 24 08          	mov    %esi,0x8(%esp)
  100c89:	89 54 24 04          	mov    %edx,0x4(%esp)
  100c8d:	89 3c 24             	mov    %edi,(%esp)
  100c90:	e8 5b 09 00 00       	call   1015f0 <readi>
  100c95:	83 f8 20             	cmp    $0x20,%eax
  100c98:	75 5e                	jne    100cf8 <exec+0x128>
  100c9a:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
  100c9e:	75 c8                	jne    100c68 <exec+0x98>
  100ca0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ca3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  100ca6:	72 50                	jb     100cf8 <exec+0x128>
  100ca8:	03 45 d0             	add    -0x30(%ebp),%eax
  100cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  100caf:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100cb2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100cb6:	8b 45 80             	mov    -0x80(%ebp),%eax
  100cb9:	89 04 24             	mov    %eax,(%esp)
  100cbc:	e8 3f 61 00 00       	call   106e00 <allocuvm>
  100cc1:	85 c0                	test   %eax,%eax
  100cc3:	89 45 84             	mov    %eax,-0x7c(%ebp)
  100cc6:	74 30                	je     100cf8 <exec+0x128>
  100cc8:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100ccb:	89 44 24 10          	mov    %eax,0x10(%esp)
  100ccf:	8b 45 cc             	mov    -0x34(%ebp),%eax
  100cd2:	89 7c 24 08          	mov    %edi,0x8(%esp)
  100cd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100cda:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce1:	8b 55 80             	mov    -0x80(%ebp),%edx
  100ce4:	89 14 24             	mov    %edx,(%esp)
  100ce7:	e8 e4 61 00 00       	call   106ed0 <loaduvm>
  100cec:	85 c0                	test   %eax,%eax
  100cee:	0f 85 74 ff ff ff    	jne    100c68 <exec+0x98>
  100cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100cf8:	8b 45 80             	mov    -0x80(%ebp),%eax
  100cfb:	89 04 24             	mov    %eax,(%esp)
  100cfe:	e8 bd 5f 00 00       	call   106cc0 <freevm>
  100d03:	89 3c 24             	mov    %edi,(%esp)
  100d06:	e8 35 10 00 00       	call   101d40 <iunlockput>
  100d0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d10:	81 c4 ac 00 00 00    	add    $0xac,%esp
  100d16:	5b                   	pop    %ebx
  100d17:	5e                   	pop    %esi
  100d18:	5f                   	pop    %edi
  100d19:	5d                   	pop    %ebp
  100d1a:	c3                   	ret    
  100d1b:	90                   	nop
  100d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100d20:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100d23:	81 c1 ff 0f 00 00    	add    $0xfff,%ecx
  100d29:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  100d2f:	89 cb                	mov    %ecx,%ebx
  100d31:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
  100d34:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  100d3a:	89 3c 24             	mov    %edi,(%esp)
  100d3d:	e8 fe 0f 00 00       	call   101d40 <iunlockput>
  100d42:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  100d46:	8b 45 84             	mov    -0x7c(%ebp),%eax
  100d49:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d4d:	8b 55 80             	mov    -0x80(%ebp),%edx
  100d50:	89 14 24             	mov    %edx,(%esp)
  100d53:	e8 a8 60 00 00       	call   106e00 <allocuvm>
  100d58:	85 c0                	test   %eax,%eax
  100d5a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  100d60:	74 96                	je     100cf8 <exec+0x128>
  100d62:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100d65:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100d69:	8b 45 80             	mov    -0x80(%ebp),%eax
  100d6c:	89 04 24             	mov    %eax,(%esp)
  100d6f:	e8 0c 5d 00 00       	call   106a80 <uva2ka>
  100d74:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100d77:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
  100d7d:	8b 11                	mov    (%ecx),%edx
  100d7f:	85 d2                	test   %edx,%edx
  100d81:	0f 84 ac 01 00 00    	je     100f33 <exec+0x363>
  100d87:	31 f6                	xor    %esi,%esi
  100d89:	31 db                	xor    %ebx,%ebx
  100d8b:	89 cf                	mov    %ecx,%edi
  100d8d:	8d 76 00             	lea    0x0(%esi),%esi
  100d90:	89 14 24             	mov    %edx,(%esp)
  100d93:	83 c3 01             	add    $0x1,%ebx
  100d96:	e8 35 3b 00 00       	call   1048d0 <strlen>
  100d9b:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
  100d9e:	01 f0                	add    %esi,%eax
  100da0:	85 d2                	test   %edx,%edx
  100da2:	8d 70 01             	lea    0x1(%eax),%esi
  100da5:	75 e9                	jne    100d90 <exec+0x1c0>
  100da7:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  100dad:	89 da                	mov    %ebx,%edx
  100daf:	83 c0 04             	add    $0x4,%eax
  100db2:	f7 d2                	not    %edx
  100db4:	83 e0 fc             	and    $0xfffffffc,%eax
  100db7:	89 9d 70 ff ff ff    	mov    %ebx,-0x90(%ebp)
  100dbd:	89 df                	mov    %ebx,%edi
  100dbf:	83 ef 01             	sub    $0x1,%edi
  100dc2:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100dc5:	29 c2                	sub    %eax,%edx
  100dc7:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)
  100dcd:	89 d1                	mov    %edx,%ecx
  100dcf:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
  100dd5:	2b 4d 84             	sub    -0x7c(%ebp),%ecx
  100dd8:	8d 04 99             	lea    (%ecx,%ebx,4),%eax
  100ddb:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
  100de2:	8b 75 0c             	mov    0xc(%ebp),%esi
  100de5:	8d 14 bd 00 00 00 00 	lea    0x0(,%edi,4),%edx
  100dec:	8b 9d 74 ff ff ff    	mov    -0x8c(%ebp),%ebx
  100df2:	01 d6                	add    %edx,%esi
  100df4:	8d 14 11             	lea    (%ecx,%edx,1),%edx
  100df7:	03 95 7c ff ff ff    	add    -0x84(%ebp),%edx
  100dfd:	8d 76 00             	lea    0x0(%esi),%esi
  100e00:	8b 06                	mov    (%esi),%eax
  100e02:	83 ef 01             	sub    $0x1,%edi
  100e05:	89 04 24             	mov    %eax,(%esp)
  100e08:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
  100e0e:	e8 bd 3a 00 00       	call   1048d0 <strlen>
  100e13:	83 c0 01             	add    $0x1,%eax
  100e16:	29 c3                	sub    %eax,%ebx
  100e18:	89 44 24 08          	mov    %eax,0x8(%esp)
  100e1c:	8b 06                	mov    (%esi),%eax
  100e1e:	83 ee 04             	sub    $0x4,%esi
  100e21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100e25:	89 d8                	mov    %ebx,%eax
  100e27:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e2a:	03 85 7c ff ff ff    	add    -0x84(%ebp),%eax
  100e30:	89 04 24             	mov    %eax,(%esp)
  100e33:	e8 38 39 00 00       	call   104770 <memmove>
  100e38:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
  100e3e:	89 1a                	mov    %ebx,(%edx)
  100e40:	83 ea 04             	sub    $0x4,%edx
  100e43:	83 ff ff             	cmp    $0xffffffff,%edi
  100e46:	75 b8                	jne    100e00 <exec+0x230>
  100e48:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
  100e4e:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
  100e54:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
  100e5a:	83 e8 04             	sub    $0x4,%eax
  100e5d:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e60:	89 14 01             	mov    %edx,(%ecx,%eax,1)
  100e63:	89 d0                	mov    %edx,%eax
  100e65:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
  100e6b:	83 e8 08             	sub    $0x8,%eax
  100e6e:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e71:	89 14 01             	mov    %edx,(%ecx,%eax,1)
  100e74:	8b 9d 78 ff ff ff    	mov    -0x88(%ebp),%ebx
  100e7a:	83 eb 0c             	sub    $0xc,%ebx
  100e7d:	89 d8                	mov    %ebx,%eax
  100e7f:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e82:	c7 04 01 ff ff ff ff 	movl   $0xffffffff,(%ecx,%eax,1)
  100e89:	8b 4d 08             	mov    0x8(%ebp),%ecx
  100e8c:	0f b6 11             	movzbl (%ecx),%edx
  100e8f:	84 d2                	test   %dl,%dl
  100e91:	74 28                	je     100ebb <exec+0x2eb>
  100e93:	89 c8                	mov    %ecx,%eax
  100e95:	83 c0 01             	add    $0x1,%eax
  100e98:	eb 10                	jmp    100eaa <exec+0x2da>
  100e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100ea0:	0f b6 10             	movzbl (%eax),%edx
  100ea3:	83 c0 01             	add    $0x1,%eax
  100ea6:	84 d2                	test   %dl,%dl
  100ea8:	74 11                	je     100ebb <exec+0x2eb>
  100eaa:	80 fa 2f             	cmp    $0x2f,%dl
  100ead:	75 f1                	jne    100ea0 <exec+0x2d0>
  100eaf:	0f b6 10             	movzbl (%eax),%edx
  100eb2:	89 c1                	mov    %eax,%ecx
  100eb4:	83 c0 01             	add    $0x1,%eax
  100eb7:	84 d2                	test   %dl,%dl
  100eb9:	75 ef                	jne    100eaa <exec+0x2da>
  100ebb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ec1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100ec5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  100ecc:	00 
  100ecd:	83 c0 6c             	add    $0x6c,%eax
  100ed0:	89 04 24             	mov    %eax,(%esp)
  100ed3:	e8 b8 39 00 00       	call   104890 <safestrcpy>
  100ed8:	8b 55 80             	mov    -0x80(%ebp),%edx
  100edb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ee1:	8b 70 04             	mov    0x4(%eax),%esi
  100ee4:	89 50 04             	mov    %edx,0x4(%eax)
  100ee7:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  100eed:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ef3:	89 08                	mov    %ecx,(%eax)
  100ef5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100efb:	8b 55 ac             	mov    -0x54(%ebp),%edx
  100efe:	8b 40 60             	mov    0x60(%eax),%eax
  100f01:	89 50 38             	mov    %edx,0x38(%eax)
  100f04:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100f0a:	8b 40 60             	mov    0x60(%eax),%eax
  100f0d:	89 58 44             	mov    %ebx,0x44(%eax)
  100f10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100f16:	89 04 24             	mov    %eax,(%esp)
  100f19:	e8 72 60 00 00       	call   106f90 <switchuvm>
  100f1e:	89 34 24             	mov    %esi,(%esp)
  100f21:	e8 9a 5d 00 00       	call   106cc0 <freevm>
  100f26:	81 c4 ac 00 00 00    	add    $0xac,%esp
  100f2c:	31 c0                	xor    %eax,%eax
  100f2e:	5b                   	pop    %ebx
  100f2f:	5e                   	pop    %esi
  100f30:	5f                   	pop    %edi
  100f31:	5d                   	pop    %ebp
  100f32:	c3                   	ret    
  100f33:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  100f39:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
  100f3f:	83 ea 04             	sub    $0x4,%edx
  100f42:	89 d0                	mov    %edx,%eax
  100f44:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100f47:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)
  100f4d:	c7 04 01 00 00 00 00 	movl   $0x0,(%ecx,%eax,1)
  100f54:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
  100f5b:	00 00 00 
  100f5e:	e9 e5 fe ff ff       	jmp    100e48 <exec+0x278>
  100f63:	bb 00 10 00 00       	mov    $0x1000,%ebx
  100f68:	c7 45 84 00 00 00 00 	movl   $0x0,-0x7c(%ebp)
  100f6f:	e9 c6 fd ff ff       	jmp    100d3a <exec+0x16a>
  100f74:	90                   	nop
  100f75:	90                   	nop
  100f76:	90                   	nop
  100f77:	90                   	nop
  100f78:	90                   	nop
  100f79:	90                   	nop
  100f7a:	90                   	nop
  100f7b:	90                   	nop
  100f7c:	90                   	nop
  100f7d:	90                   	nop
  100f7e:	90                   	nop
  100f7f:	90                   	nop

00100f80 <filewrite>:
  100f80:	55                   	push   %ebp
  100f81:	89 e5                	mov    %esp,%ebp
  100f83:	83 ec 38             	sub    $0x38,%esp
  100f86:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  100f89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f8c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  100f8f:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f92:	89 7d fc             	mov    %edi,-0x4(%ebp)
  100f95:	8b 7d 10             	mov    0x10(%ebp),%edi
  100f98:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
  100f9c:	74 5a                	je     100ff8 <filewrite+0x78>
  100f9e:	8b 03                	mov    (%ebx),%eax
  100fa0:	83 f8 01             	cmp    $0x1,%eax
  100fa3:	74 5b                	je     101000 <filewrite+0x80>
  100fa5:	83 f8 02             	cmp    $0x2,%eax
  100fa8:	75 6d                	jne    101017 <filewrite+0x97>
  100faa:	8b 43 10             	mov    0x10(%ebx),%eax
  100fad:	89 04 24             	mov    %eax,(%esp)
  100fb0:	e8 7b 0e 00 00       	call   101e30 <ilock>
  100fb5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  100fb9:	8b 43 14             	mov    0x14(%ebx),%eax
  100fbc:	89 74 24 04          	mov    %esi,0x4(%esp)
  100fc0:	89 44 24 08          	mov    %eax,0x8(%esp)
  100fc4:	8b 43 10             	mov    0x10(%ebx),%eax
  100fc7:	89 04 24             	mov    %eax,(%esp)
  100fca:	e8 b1 07 00 00       	call   101780 <writei>
  100fcf:	85 c0                	test   %eax,%eax
  100fd1:	7e 03                	jle    100fd6 <filewrite+0x56>
  100fd3:	01 43 14             	add    %eax,0x14(%ebx)
  100fd6:	8b 53 10             	mov    0x10(%ebx),%edx
  100fd9:	89 14 24             	mov    %edx,(%esp)
  100fdc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100fdf:	e8 0c 0a 00 00       	call   1019f0 <iunlock>
  100fe4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100fe7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  100fea:	8b 75 f8             	mov    -0x8(%ebp),%esi
  100fed:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100ff0:	89 ec                	mov    %ebp,%esp
  100ff2:	5d                   	pop    %ebp
  100ff3:	c3                   	ret    
  100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ffd:	eb e8                	jmp    100fe7 <filewrite+0x67>
  100fff:	90                   	nop
  101000:	8b 43 0c             	mov    0xc(%ebx),%eax
  101003:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101006:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101009:	8b 7d fc             	mov    -0x4(%ebp),%edi
  10100c:	89 45 08             	mov    %eax,0x8(%ebp)
  10100f:	89 ec                	mov    %ebp,%esp
  101011:	5d                   	pop    %ebp
  101012:	e9 d9 1f 00 00       	jmp    102ff0 <pipewrite>
  101017:	c7 04 24 f7 71 10 00 	movl   $0x1071f7,(%esp)
  10101e:	e8 2d fb ff ff       	call   100b50 <panic>
  101023:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101030 <fileread>:
  101030:	55                   	push   %ebp
  101031:	89 e5                	mov    %esp,%ebp
  101033:	83 ec 38             	sub    $0x38,%esp
  101036:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101039:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10103c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10103f:	8b 75 0c             	mov    0xc(%ebp),%esi
  101042:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101045:	8b 7d 10             	mov    0x10(%ebp),%edi
  101048:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
  10104c:	74 5a                	je     1010a8 <fileread+0x78>
  10104e:	8b 03                	mov    (%ebx),%eax
  101050:	83 f8 01             	cmp    $0x1,%eax
  101053:	74 5b                	je     1010b0 <fileread+0x80>
  101055:	83 f8 02             	cmp    $0x2,%eax
  101058:	75 6d                	jne    1010c7 <fileread+0x97>
  10105a:	8b 43 10             	mov    0x10(%ebx),%eax
  10105d:	89 04 24             	mov    %eax,(%esp)
  101060:	e8 cb 0d 00 00       	call   101e30 <ilock>
  101065:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  101069:	8b 43 14             	mov    0x14(%ebx),%eax
  10106c:	89 74 24 04          	mov    %esi,0x4(%esp)
  101070:	89 44 24 08          	mov    %eax,0x8(%esp)
  101074:	8b 43 10             	mov    0x10(%ebx),%eax
  101077:	89 04 24             	mov    %eax,(%esp)
  10107a:	e8 71 05 00 00       	call   1015f0 <readi>
  10107f:	85 c0                	test   %eax,%eax
  101081:	7e 03                	jle    101086 <fileread+0x56>
  101083:	01 43 14             	add    %eax,0x14(%ebx)
  101086:	8b 53 10             	mov    0x10(%ebx),%edx
  101089:	89 14 24             	mov    %edx,(%esp)
  10108c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10108f:	e8 5c 09 00 00       	call   1019f0 <iunlock>
  101094:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101097:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10109a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10109d:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1010a0:	89 ec                	mov    %ebp,%esp
  1010a2:	5d                   	pop    %ebp
  1010a3:	c3                   	ret    
  1010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1010a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1010ad:	eb e8                	jmp    101097 <fileread+0x67>
  1010af:	90                   	nop
  1010b0:	8b 43 0c             	mov    0xc(%ebx),%eax
  1010b3:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1010b6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1010b9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1010bc:	89 45 08             	mov    %eax,0x8(%ebp)
  1010bf:	89 ec                	mov    %ebp,%esp
  1010c1:	5d                   	pop    %ebp
  1010c2:	e9 29 1e 00 00       	jmp    102ef0 <piperead>
  1010c7:	c7 04 24 01 72 10 00 	movl   $0x107201,(%esp)
  1010ce:	e8 7d fa ff ff       	call   100b50 <panic>
  1010d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1010d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001010e0 <filestat>:
  1010e0:	55                   	push   %ebp
  1010e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1010e6:	89 e5                	mov    %esp,%ebp
  1010e8:	53                   	push   %ebx
  1010e9:	83 ec 14             	sub    $0x14,%esp
  1010ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1010ef:	83 3b 02             	cmpl   $0x2,(%ebx)
  1010f2:	74 0c                	je     101100 <filestat+0x20>
  1010f4:	83 c4 14             	add    $0x14,%esp
  1010f7:	5b                   	pop    %ebx
  1010f8:	5d                   	pop    %ebp
  1010f9:	c3                   	ret    
  1010fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101100:	8b 43 10             	mov    0x10(%ebx),%eax
  101103:	89 04 24             	mov    %eax,(%esp)
  101106:	e8 25 0d 00 00       	call   101e30 <ilock>
  10110b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10110e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101112:	8b 43 10             	mov    0x10(%ebx),%eax
  101115:	89 04 24             	mov    %eax,(%esp)
  101118:	e8 e3 01 00 00       	call   101300 <stati>
  10111d:	8b 43 10             	mov    0x10(%ebx),%eax
  101120:	89 04 24             	mov    %eax,(%esp)
  101123:	e8 c8 08 00 00       	call   1019f0 <iunlock>
  101128:	83 c4 14             	add    $0x14,%esp
  10112b:	31 c0                	xor    %eax,%eax
  10112d:	5b                   	pop    %ebx
  10112e:	5d                   	pop    %ebp
  10112f:	c3                   	ret    

00101130 <filedup>:
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	53                   	push   %ebx
  101134:	83 ec 14             	sub    $0x14,%esp
  101137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10113a:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  101141:	e8 0a 35 00 00       	call   104650 <acquire>
  101146:	8b 43 04             	mov    0x4(%ebx),%eax
  101149:	85 c0                	test   %eax,%eax
  10114b:	7e 1a                	jle    101167 <filedup+0x37>
  10114d:	83 c0 01             	add    $0x1,%eax
  101150:	89 43 04             	mov    %eax,0x4(%ebx)
  101153:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  10115a:	e8 a1 34 00 00       	call   104600 <release>
  10115f:	89 d8                	mov    %ebx,%eax
  101161:	83 c4 14             	add    $0x14,%esp
  101164:	5b                   	pop    %ebx
  101165:	5d                   	pop    %ebp
  101166:	c3                   	ret    
  101167:	c7 04 24 0a 72 10 00 	movl   $0x10720a,(%esp)
  10116e:	e8 dd f9 ff ff       	call   100b50 <panic>
  101173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101180 <filealloc>:
  101180:	55                   	push   %ebp
  101181:	89 e5                	mov    %esp,%ebp
  101183:	53                   	push   %ebx
  101184:	bb cc 20 11 00       	mov    $0x1120cc,%ebx
  101189:	83 ec 14             	sub    $0x14,%esp
  10118c:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  101193:	e8 b8 34 00 00       	call   104650 <acquire>
  101198:	8b 15 b8 20 11 00    	mov    0x1120b8,%edx
  10119e:	85 d2                	test   %edx,%edx
  1011a0:	75 11                	jne    1011b3 <filealloc+0x33>
  1011a2:	eb 4a                	jmp    1011ee <filealloc+0x6e>
  1011a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1011a8:	83 c3 18             	add    $0x18,%ebx
  1011ab:	81 fb 14 2a 11 00    	cmp    $0x112a14,%ebx
  1011b1:	74 25                	je     1011d8 <filealloc+0x58>
  1011b3:	8b 43 04             	mov    0x4(%ebx),%eax
  1011b6:	85 c0                	test   %eax,%eax
  1011b8:	75 ee                	jne    1011a8 <filealloc+0x28>
  1011ba:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
  1011c1:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  1011c8:	e8 33 34 00 00       	call   104600 <release>
  1011cd:	89 d8                	mov    %ebx,%eax
  1011cf:	83 c4 14             	add    $0x14,%esp
  1011d2:	5b                   	pop    %ebx
  1011d3:	5d                   	pop    %ebp
  1011d4:	c3                   	ret    
  1011d5:	8d 76 00             	lea    0x0(%esi),%esi
  1011d8:	31 db                	xor    %ebx,%ebx
  1011da:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  1011e1:	e8 1a 34 00 00       	call   104600 <release>
  1011e6:	89 d8                	mov    %ebx,%eax
  1011e8:	83 c4 14             	add    $0x14,%esp
  1011eb:	5b                   	pop    %ebx
  1011ec:	5d                   	pop    %ebp
  1011ed:	c3                   	ret    
  1011ee:	bb b4 20 11 00       	mov    $0x1120b4,%ebx
  1011f3:	eb c5                	jmp    1011ba <filealloc+0x3a>
  1011f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1011f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101200 <fileclose>:
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	83 ec 38             	sub    $0x38,%esp
  101206:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101209:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10120c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10120f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101212:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  101219:	e8 32 34 00 00       	call   104650 <acquire>
  10121e:	8b 43 04             	mov    0x4(%ebx),%eax
  101221:	85 c0                	test   %eax,%eax
  101223:	0f 8e 9c 00 00 00    	jle    1012c5 <fileclose+0xc5>
  101229:	83 e8 01             	sub    $0x1,%eax
  10122c:	85 c0                	test   %eax,%eax
  10122e:	89 43 04             	mov    %eax,0x4(%ebx)
  101231:	74 1d                	je     101250 <fileclose+0x50>
  101233:	c7 45 08 80 20 11 00 	movl   $0x112080,0x8(%ebp)
  10123a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10123d:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101240:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101243:	89 ec                	mov    %ebp,%esp
  101245:	5d                   	pop    %ebp
  101246:	e9 b5 33 00 00       	jmp    104600 <release>
  10124b:	90                   	nop
  10124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101250:	8b 43 0c             	mov    0xc(%ebx),%eax
  101253:	8b 7b 10             	mov    0x10(%ebx),%edi
  101256:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101259:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
  10125d:	88 45 e7             	mov    %al,-0x19(%ebp)
  101260:	8b 33                	mov    (%ebx),%esi
  101262:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  101269:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  10126f:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  101276:	e8 85 33 00 00       	call   104600 <release>
  10127b:	83 fe 01             	cmp    $0x1,%esi
  10127e:	74 30                	je     1012b0 <fileclose+0xb0>
  101280:	83 fe 02             	cmp    $0x2,%esi
  101283:	74 13                	je     101298 <fileclose+0x98>
  101285:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101288:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10128b:	8b 7d fc             	mov    -0x4(%ebp),%edi
  10128e:	89 ec                	mov    %ebp,%esp
  101290:	5d                   	pop    %ebp
  101291:	c3                   	ret    
  101292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101298:	89 7d 08             	mov    %edi,0x8(%ebp)
  10129b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10129e:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1012a1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1012a4:	89 ec                	mov    %ebp,%esp
  1012a6:	5d                   	pop    %ebp
  1012a7:	e9 54 08 00 00       	jmp    101b00 <iput>
  1012ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1012b0:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  1012b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1012b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1012bb:	89 04 24             	mov    %eax,(%esp)
  1012be:	e8 1d 1e 00 00       	call   1030e0 <pipeclose>
  1012c3:	eb c0                	jmp    101285 <fileclose+0x85>
  1012c5:	c7 04 24 12 72 10 00 	movl   $0x107212,(%esp)
  1012cc:	e8 7f f8 ff ff       	call   100b50 <panic>
  1012d1:	eb 0d                	jmp    1012e0 <fileinit>
  1012d3:	90                   	nop
  1012d4:	90                   	nop
  1012d5:	90                   	nop
  1012d6:	90                   	nop
  1012d7:	90                   	nop
  1012d8:	90                   	nop
  1012d9:	90                   	nop
  1012da:	90                   	nop
  1012db:	90                   	nop
  1012dc:	90                   	nop
  1012dd:	90                   	nop
  1012de:	90                   	nop
  1012df:	90                   	nop

001012e0 <fileinit>:
  1012e0:	55                   	push   %ebp
  1012e1:	89 e5                	mov    %esp,%ebp
  1012e3:	83 ec 18             	sub    $0x18,%esp
  1012e6:	c7 44 24 04 1c 72 10 	movl   $0x10721c,0x4(%esp)
  1012ed:	00 
  1012ee:	c7 04 24 80 20 11 00 	movl   $0x112080,(%esp)
  1012f5:	e8 c6 31 00 00       	call   1044c0 <initlock>
  1012fa:	c9                   	leave  
  1012fb:	c3                   	ret    
  1012fc:	90                   	nop
  1012fd:	90                   	nop
  1012fe:	90                   	nop
  1012ff:	90                   	nop

00101300 <stati>:
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	8b 55 08             	mov    0x8(%ebp),%edx
  101306:	8b 45 0c             	mov    0xc(%ebp),%eax
  101309:	8b 0a                	mov    (%edx),%ecx
  10130b:	89 48 04             	mov    %ecx,0x4(%eax)
  10130e:	8b 4a 04             	mov    0x4(%edx),%ecx
  101311:	89 48 08             	mov    %ecx,0x8(%eax)
  101314:	0f b7 4a 10          	movzwl 0x10(%edx),%ecx
  101318:	66 89 08             	mov    %cx,(%eax)
  10131b:	0f b7 4a 16          	movzwl 0x16(%edx),%ecx
  10131f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  101323:	8b 52 18             	mov    0x18(%edx),%edx
  101326:	89 50 10             	mov    %edx,0x10(%eax)
  101329:	5d                   	pop    %ebp
  10132a:	c3                   	ret    
  10132b:	90                   	nop
  10132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00101330 <idup>:
  101330:	55                   	push   %ebp
  101331:	89 e5                	mov    %esp,%ebp
  101333:	53                   	push   %ebx
  101334:	83 ec 14             	sub    $0x14,%esp
  101337:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10133a:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101341:	e8 0a 33 00 00       	call   104650 <acquire>
  101346:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  10134a:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101351:	e8 aa 32 00 00       	call   104600 <release>
  101356:	89 d8                	mov    %ebx,%eax
  101358:	83 c4 14             	add    $0x14,%esp
  10135b:	5b                   	pop    %ebx
  10135c:	5d                   	pop    %ebp
  10135d:	c3                   	ret    
  10135e:	66 90                	xchg   %ax,%ax

00101360 <iget>:
  101360:	55                   	push   %ebp
  101361:	89 e5                	mov    %esp,%ebp
  101363:	57                   	push   %edi
  101364:	89 d7                	mov    %edx,%edi
  101366:	56                   	push   %esi
  101367:	31 f6                	xor    %esi,%esi
  101369:	53                   	push   %ebx
  10136a:	89 c3                	mov    %eax,%ebx
  10136c:	83 ec 2c             	sub    $0x2c,%esp
  10136f:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101376:	e8 d5 32 00 00       	call   104650 <acquire>
  10137b:	b8 b4 2a 11 00       	mov    $0x112ab4,%eax
  101380:	eb 14                	jmp    101396 <iget+0x36>
  101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101388:	85 f6                	test   %esi,%esi
  10138a:	74 3c                	je     1013c8 <iget+0x68>
  10138c:	83 c0 50             	add    $0x50,%eax
  10138f:	3d 54 3a 11 00       	cmp    $0x113a54,%eax
  101394:	74 42                	je     1013d8 <iget+0x78>
  101396:	8b 48 08             	mov    0x8(%eax),%ecx
  101399:	85 c9                	test   %ecx,%ecx
  10139b:	7e eb                	jle    101388 <iget+0x28>
  10139d:	39 18                	cmp    %ebx,(%eax)
  10139f:	75 e7                	jne    101388 <iget+0x28>
  1013a1:	39 78 04             	cmp    %edi,0x4(%eax)
  1013a4:	75 e2                	jne    101388 <iget+0x28>
  1013a6:	83 c1 01             	add    $0x1,%ecx
  1013a9:	89 48 08             	mov    %ecx,0x8(%eax)
  1013ac:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  1013b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1013b6:	e8 45 32 00 00       	call   104600 <release>
  1013bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1013be:	83 c4 2c             	add    $0x2c,%esp
  1013c1:	5b                   	pop    %ebx
  1013c2:	5e                   	pop    %esi
  1013c3:	5f                   	pop    %edi
  1013c4:	5d                   	pop    %ebp
  1013c5:	c3                   	ret    
  1013c6:	66 90                	xchg   %ax,%ax
  1013c8:	85 c9                	test   %ecx,%ecx
  1013ca:	75 c0                	jne    10138c <iget+0x2c>
  1013cc:	89 c6                	mov    %eax,%esi
  1013ce:	83 c0 50             	add    $0x50,%eax
  1013d1:	3d 54 3a 11 00       	cmp    $0x113a54,%eax
  1013d6:	75 be                	jne    101396 <iget+0x36>
  1013d8:	85 f6                	test   %esi,%esi
  1013da:	74 29                	je     101405 <iget+0xa5>
  1013dc:	89 1e                	mov    %ebx,(%esi)
  1013de:	89 7e 04             	mov    %edi,0x4(%esi)
  1013e1:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  1013e8:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  1013ef:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  1013f6:	e8 05 32 00 00       	call   104600 <release>
  1013fb:	83 c4 2c             	add    $0x2c,%esp
  1013fe:	89 f0                	mov    %esi,%eax
  101400:	5b                   	pop    %ebx
  101401:	5e                   	pop    %esi
  101402:	5f                   	pop    %edi
  101403:	5d                   	pop    %ebp
  101404:	c3                   	ret    
  101405:	c7 04 24 23 72 10 00 	movl   $0x107223,(%esp)
  10140c:	e8 3f f7 ff ff       	call   100b50 <panic>
  101411:	eb 0d                	jmp    101420 <readsb>
  101413:	90                   	nop
  101414:	90                   	nop
  101415:	90                   	nop
  101416:	90                   	nop
  101417:	90                   	nop
  101418:	90                   	nop
  101419:	90                   	nop
  10141a:	90                   	nop
  10141b:	90                   	nop
  10141c:	90                   	nop
  10141d:	90                   	nop
  10141e:	90                   	nop
  10141f:	90                   	nop

00101420 <readsb>:
  101420:	55                   	push   %ebp
  101421:	89 e5                	mov    %esp,%ebp
  101423:	83 ec 18             	sub    $0x18,%esp
  101426:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  10142d:	00 
  10142e:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  101431:	89 75 fc             	mov    %esi,-0x4(%ebp)
  101434:	89 d6                	mov    %edx,%esi
  101436:	89 04 24             	mov    %eax,(%esp)
  101439:	e8 12 ef ff ff       	call   100350 <bread>
  10143e:	89 34 24             	mov    %esi,(%esp)
  101441:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
  101448:	00 
  101449:	89 c3                	mov    %eax,%ebx
  10144b:	8d 40 18             	lea    0x18(%eax),%eax
  10144e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101452:	e8 19 33 00 00       	call   104770 <memmove>
  101457:	89 1c 24             	mov    %ebx,(%esp)
  10145a:	e8 41 ee ff ff       	call   1002a0 <brelse>
  10145f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  101462:	8b 75 fc             	mov    -0x4(%ebp),%esi
  101465:	89 ec                	mov    %ebp,%esp
  101467:	5d                   	pop    %ebp
  101468:	c3                   	ret    
  101469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101470 <balloc>:
  101470:	55                   	push   %ebp
  101471:	89 e5                	mov    %esp,%ebp
  101473:	57                   	push   %edi
  101474:	56                   	push   %esi
  101475:	53                   	push   %ebx
  101476:	83 ec 3c             	sub    $0x3c,%esp
  101479:	8d 55 dc             	lea    -0x24(%ebp),%edx
  10147c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10147f:	e8 9c ff ff ff       	call   101420 <readsb>
  101484:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101487:	85 c0                	test   %eax,%eax
  101489:	0f 84 9c 00 00 00    	je     10152b <balloc+0xbb>
  10148f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  101496:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101499:	31 db                	xor    %ebx,%ebx
  10149b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10149e:	c1 e8 03             	shr    $0x3,%eax
  1014a1:	c1 fa 0c             	sar    $0xc,%edx
  1014a4:	8d 44 10 03          	lea    0x3(%eax,%edx,1),%eax
  1014a8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1014ac:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1014af:	89 04 24             	mov    %eax,(%esp)
  1014b2:	e8 99 ee ff ff       	call   100350 <bread>
  1014b7:	89 c6                	mov    %eax,%esi
  1014b9:	eb 10                	jmp    1014cb <balloc+0x5b>
  1014bb:	90                   	nop
  1014bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1014c0:	83 c3 01             	add    $0x1,%ebx
  1014c3:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
  1014c9:	74 45                	je     101510 <balloc+0xa0>
  1014cb:	89 d9                	mov    %ebx,%ecx
  1014cd:	ba 01 00 00 00       	mov    $0x1,%edx
  1014d2:	83 e1 07             	and    $0x7,%ecx
  1014d5:	89 d8                	mov    %ebx,%eax
  1014d7:	d3 e2                	shl    %cl,%edx
  1014d9:	c1 f8 03             	sar    $0x3,%eax
  1014dc:	89 d1                	mov    %edx,%ecx
  1014de:	0f b6 54 06 18       	movzbl 0x18(%esi,%eax,1),%edx
  1014e3:	0f b6 fa             	movzbl %dl,%edi
  1014e6:	85 cf                	test   %ecx,%edi
  1014e8:	75 d6                	jne    1014c0 <balloc+0x50>
  1014ea:	09 d1                	or     %edx,%ecx
  1014ec:	88 4c 06 18          	mov    %cl,0x18(%esi,%eax,1)
  1014f0:	89 34 24             	mov    %esi,(%esp)
  1014f3:	e8 28 ee ff ff       	call   100320 <bwrite>
  1014f8:	89 34 24             	mov    %esi,(%esp)
  1014fb:	e8 a0 ed ff ff       	call   1002a0 <brelse>
  101500:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  101503:	83 c4 3c             	add    $0x3c,%esp
  101506:	8d 04 13             	lea    (%ebx,%edx,1),%eax
  101509:	5b                   	pop    %ebx
  10150a:	5e                   	pop    %esi
  10150b:	5f                   	pop    %edi
  10150c:	5d                   	pop    %ebp
  10150d:	c3                   	ret    
  10150e:	66 90                	xchg   %ax,%ax
  101510:	89 34 24             	mov    %esi,(%esp)
  101513:	e8 88 ed ff ff       	call   1002a0 <brelse>
  101518:	81 45 d4 00 10 00 00 	addl   $0x1000,-0x2c(%ebp)
  10151f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101522:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  101525:	0f 87 6b ff ff ff    	ja     101496 <balloc+0x26>
  10152b:	c7 04 24 33 72 10 00 	movl   $0x107233,(%esp)
  101532:	e8 19 f6 ff ff       	call   100b50 <panic>
  101537:	89 f6                	mov    %esi,%esi
  101539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101540 <bmap>:
  101540:	55                   	push   %ebp
  101541:	89 e5                	mov    %esp,%ebp
  101543:	83 ec 38             	sub    $0x38,%esp
  101546:	83 fa 0b             	cmp    $0xb,%edx
  101549:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  10154c:	89 c3                	mov    %eax,%ebx
  10154e:	89 75 f8             	mov    %esi,-0x8(%ebp)
  101551:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101554:	77 1a                	ja     101570 <bmap+0x30>
  101556:	8d 7a 04             	lea    0x4(%edx),%edi
  101559:	8b 44 b8 0c          	mov    0xc(%eax,%edi,4),%eax
  10155d:	85 c0                	test   %eax,%eax
  10155f:	74 5f                	je     1015c0 <bmap+0x80>
  101561:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101564:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101567:	8b 7d fc             	mov    -0x4(%ebp),%edi
  10156a:	89 ec                	mov    %ebp,%esp
  10156c:	5d                   	pop    %ebp
  10156d:	c3                   	ret    
  10156e:	66 90                	xchg   %ax,%ax
  101570:	8d 7a f4             	lea    -0xc(%edx),%edi
  101573:	83 ff 7f             	cmp    $0x7f,%edi
  101576:	77 64                	ja     1015dc <bmap+0x9c>
  101578:	8b 40 4c             	mov    0x4c(%eax),%eax
  10157b:	85 c0                	test   %eax,%eax
  10157d:	74 51                	je     1015d0 <bmap+0x90>
  10157f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101583:	8b 03                	mov    (%ebx),%eax
  101585:	89 04 24             	mov    %eax,(%esp)
  101588:	e8 c3 ed ff ff       	call   100350 <bread>
  10158d:	8d 7c b8 18          	lea    0x18(%eax,%edi,4),%edi
  101591:	89 c6                	mov    %eax,%esi
  101593:	8b 07                	mov    (%edi),%eax
  101595:	85 c0                	test   %eax,%eax
  101597:	75 17                	jne    1015b0 <bmap+0x70>
  101599:	8b 03                	mov    (%ebx),%eax
  10159b:	e8 d0 fe ff ff       	call   101470 <balloc>
  1015a0:	89 07                	mov    %eax,(%edi)
  1015a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1015a5:	89 34 24             	mov    %esi,(%esp)
  1015a8:	e8 73 ed ff ff       	call   100320 <bwrite>
  1015ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1015b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1015b3:	89 34 24             	mov    %esi,(%esp)
  1015b6:	e8 e5 ec ff ff       	call   1002a0 <brelse>
  1015bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1015be:	eb a1                	jmp    101561 <bmap+0x21>
  1015c0:	8b 03                	mov    (%ebx),%eax
  1015c2:	e8 a9 fe ff ff       	call   101470 <balloc>
  1015c7:	89 44 bb 0c          	mov    %eax,0xc(%ebx,%edi,4)
  1015cb:	eb 94                	jmp    101561 <bmap+0x21>
  1015cd:	8d 76 00             	lea    0x0(%esi),%esi
  1015d0:	8b 03                	mov    (%ebx),%eax
  1015d2:	e8 99 fe ff ff       	call   101470 <balloc>
  1015d7:	89 43 4c             	mov    %eax,0x4c(%ebx)
  1015da:	eb a3                	jmp    10157f <bmap+0x3f>
  1015dc:	c7 04 24 49 72 10 00 	movl   $0x107249,(%esp)
  1015e3:	e8 68 f5 ff ff       	call   100b50 <panic>
  1015e8:	90                   	nop
  1015e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001015f0 <readi>:
  1015f0:	55                   	push   %ebp
  1015f1:	89 e5                	mov    %esp,%ebp
  1015f3:	83 ec 38             	sub    $0x38,%esp
  1015f6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  1015f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1015fc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  1015ff:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101602:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101605:	8b 75 10             	mov    0x10(%ebp),%esi
  101608:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10160b:	66 83 7b 10 03       	cmpw   $0x3,0x10(%ebx)
  101610:	74 1e                	je     101630 <readi+0x40>
  101612:	8b 43 18             	mov    0x18(%ebx),%eax
  101615:	39 f0                	cmp    %esi,%eax
  101617:	73 3f                	jae    101658 <readi+0x68>
  101619:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10161e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101621:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101624:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101627:	89 ec                	mov    %ebp,%esp
  101629:	5d                   	pop    %ebp
  10162a:	c3                   	ret    
  10162b:	90                   	nop
  10162c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101630:	0f b7 43 12          	movzwl 0x12(%ebx),%eax
  101634:	66 83 f8 09          	cmp    $0x9,%ax
  101638:	77 df                	ja     101619 <readi+0x29>
  10163a:	98                   	cwtl   
  10163b:	8b 04 c5 20 2a 11 00 	mov    0x112a20(,%eax,8),%eax
  101642:	85 c0                	test   %eax,%eax
  101644:	74 d3                	je     101619 <readi+0x29>
  101646:	89 4d 10             	mov    %ecx,0x10(%ebp)
  101649:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10164c:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10164f:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101652:	89 ec                	mov    %ebp,%esp
  101654:	5d                   	pop    %ebp
  101655:	ff e0                	jmp    *%eax
  101657:	90                   	nop
  101658:	89 ca                	mov    %ecx,%edx
  10165a:	01 f2                	add    %esi,%edx
  10165c:	72 bb                	jb     101619 <readi+0x29>
  10165e:	39 d0                	cmp    %edx,%eax
  101660:	73 04                	jae    101666 <readi+0x76>
  101662:	89 c1                	mov    %eax,%ecx
  101664:	29 f1                	sub    %esi,%ecx
  101666:	85 c9                	test   %ecx,%ecx
  101668:	74 7c                	je     1016e6 <readi+0xf6>
  10166a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  101671:	89 7d e0             	mov    %edi,-0x20(%ebp)
  101674:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  101677:	90                   	nop
  101678:	89 f2                	mov    %esi,%edx
  10167a:	89 d8                	mov    %ebx,%eax
  10167c:	c1 ea 09             	shr    $0x9,%edx
  10167f:	bf 00 02 00 00       	mov    $0x200,%edi
  101684:	e8 b7 fe ff ff       	call   101540 <bmap>
  101689:	89 44 24 04          	mov    %eax,0x4(%esp)
  10168d:	8b 03                	mov    (%ebx),%eax
  10168f:	89 04 24             	mov    %eax,(%esp)
  101692:	e8 b9 ec ff ff       	call   100350 <bread>
  101697:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10169a:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
  10169d:	89 c2                	mov    %eax,%edx
  10169f:	89 f0                	mov    %esi,%eax
  1016a1:	25 ff 01 00 00       	and    $0x1ff,%eax
  1016a6:	29 c7                	sub    %eax,%edi
  1016a8:	39 cf                	cmp    %ecx,%edi
  1016aa:	76 02                	jbe    1016ae <readi+0xbe>
  1016ac:	89 cf                	mov    %ecx,%edi
  1016ae:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
  1016b2:	01 fe                	add    %edi,%esi
  1016b4:	89 7c 24 08          	mov    %edi,0x8(%esp)
  1016b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1016bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1016bf:	89 04 24             	mov    %eax,(%esp)
  1016c2:	89 55 d8             	mov    %edx,-0x28(%ebp)
  1016c5:	e8 a6 30 00 00       	call   104770 <memmove>
  1016ca:	8b 55 d8             	mov    -0x28(%ebp),%edx
  1016cd:	89 14 24             	mov    %edx,(%esp)
  1016d0:	e8 cb eb ff ff       	call   1002a0 <brelse>
  1016d5:	01 7d e4             	add    %edi,-0x1c(%ebp)
  1016d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1016db:	01 7d e0             	add    %edi,-0x20(%ebp)
  1016de:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  1016e1:	77 95                	ja     101678 <readi+0x88>
  1016e3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1016e6:	89 c8                	mov    %ecx,%eax
  1016e8:	e9 31 ff ff ff       	jmp    10161e <readi+0x2e>
  1016ed:	8d 76 00             	lea    0x0(%esi),%esi

001016f0 <iupdate>:
  1016f0:	55                   	push   %ebp
  1016f1:	89 e5                	mov    %esp,%ebp
  1016f3:	56                   	push   %esi
  1016f4:	53                   	push   %ebx
  1016f5:	83 ec 10             	sub    $0x10,%esp
  1016f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1016fb:	8b 43 04             	mov    0x4(%ebx),%eax
  1016fe:	c1 e8 03             	shr    $0x3,%eax
  101701:	83 c0 02             	add    $0x2,%eax
  101704:	89 44 24 04          	mov    %eax,0x4(%esp)
  101708:	8b 03                	mov    (%ebx),%eax
  10170a:	89 04 24             	mov    %eax,(%esp)
  10170d:	e8 3e ec ff ff       	call   100350 <bread>
  101712:	0f b7 53 10          	movzwl 0x10(%ebx),%edx
  101716:	89 c6                	mov    %eax,%esi
  101718:	8b 43 04             	mov    0x4(%ebx),%eax
  10171b:	83 e0 07             	and    $0x7,%eax
  10171e:	c1 e0 06             	shl    $0x6,%eax
  101721:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
  101725:	66 89 10             	mov    %dx,(%eax)
  101728:	0f b7 53 12          	movzwl 0x12(%ebx),%edx
  10172c:	66 89 50 02          	mov    %dx,0x2(%eax)
  101730:	0f b7 53 14          	movzwl 0x14(%ebx),%edx
  101734:	66 89 50 04          	mov    %dx,0x4(%eax)
  101738:	0f b7 53 16          	movzwl 0x16(%ebx),%edx
  10173c:	66 89 50 06          	mov    %dx,0x6(%eax)
  101740:	8b 53 18             	mov    0x18(%ebx),%edx
  101743:	83 c3 1c             	add    $0x1c,%ebx
  101746:	89 50 08             	mov    %edx,0x8(%eax)
  101749:	83 c0 0c             	add    $0xc,%eax
  10174c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  101750:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
  101757:	00 
  101758:	89 04 24             	mov    %eax,(%esp)
  10175b:	e8 10 30 00 00       	call   104770 <memmove>
  101760:	89 34 24             	mov    %esi,(%esp)
  101763:	e8 b8 eb ff ff       	call   100320 <bwrite>
  101768:	89 75 08             	mov    %esi,0x8(%ebp)
  10176b:	83 c4 10             	add    $0x10,%esp
  10176e:	5b                   	pop    %ebx
  10176f:	5e                   	pop    %esi
  101770:	5d                   	pop    %ebp
  101771:	e9 2a eb ff ff       	jmp    1002a0 <brelse>
  101776:	8d 76 00             	lea    0x0(%esi),%esi
  101779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101780 <writei>:
  101780:	55                   	push   %ebp
  101781:	89 e5                	mov    %esp,%ebp
  101783:	83 ec 38             	sub    $0x38,%esp
  101786:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101789:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10178c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10178f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  101792:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101795:	8b 75 10             	mov    0x10(%ebp),%esi
  101798:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10179b:	66 83 7b 10 03       	cmpw   $0x3,0x10(%ebx)
  1017a0:	74 1e                	je     1017c0 <writei+0x40>
  1017a2:	39 73 18             	cmp    %esi,0x18(%ebx)
  1017a5:	73 41                	jae    1017e8 <writei+0x68>
  1017a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1017ac:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1017af:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1017b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1017b5:	89 ec                	mov    %ebp,%esp
  1017b7:	5d                   	pop    %ebp
  1017b8:	c3                   	ret    
  1017b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1017c0:	0f b7 43 12          	movzwl 0x12(%ebx),%eax
  1017c4:	66 83 f8 09          	cmp    $0x9,%ax
  1017c8:	77 dd                	ja     1017a7 <writei+0x27>
  1017ca:	98                   	cwtl   
  1017cb:	8b 04 c5 24 2a 11 00 	mov    0x112a24(,%eax,8),%eax
  1017d2:	85 c0                	test   %eax,%eax
  1017d4:	74 d1                	je     1017a7 <writei+0x27>
  1017d6:	89 4d 10             	mov    %ecx,0x10(%ebp)
  1017d9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1017dc:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1017df:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1017e2:	89 ec                	mov    %ebp,%esp
  1017e4:	5d                   	pop    %ebp
  1017e5:	ff e0                	jmp    *%eax
  1017e7:	90                   	nop
  1017e8:	89 c8                	mov    %ecx,%eax
  1017ea:	01 f0                	add    %esi,%eax
  1017ec:	72 b9                	jb     1017a7 <writei+0x27>
  1017ee:	3d 00 18 01 00       	cmp    $0x11800,%eax
  1017f3:	76 07                	jbe    1017fc <writei+0x7c>
  1017f5:	b9 00 18 01 00       	mov    $0x11800,%ecx
  1017fa:	29 f1                	sub    %esi,%ecx
  1017fc:	85 c9                	test   %ecx,%ecx
  1017fe:	0f 84 92 00 00 00    	je     101896 <writei+0x116>
  101804:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10180b:	89 7d e0             	mov    %edi,-0x20(%ebp)
  10180e:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  101811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101818:	89 f2                	mov    %esi,%edx
  10181a:	89 d8                	mov    %ebx,%eax
  10181c:	c1 ea 09             	shr    $0x9,%edx
  10181f:	bf 00 02 00 00       	mov    $0x200,%edi
  101824:	e8 17 fd ff ff       	call   101540 <bmap>
  101829:	89 44 24 04          	mov    %eax,0x4(%esp)
  10182d:	8b 03                	mov    (%ebx),%eax
  10182f:	89 04 24             	mov    %eax,(%esp)
  101832:	e8 19 eb ff ff       	call   100350 <bread>
  101837:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10183a:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
  10183d:	89 c2                	mov    %eax,%edx
  10183f:	89 f0                	mov    %esi,%eax
  101841:	25 ff 01 00 00       	and    $0x1ff,%eax
  101846:	29 c7                	sub    %eax,%edi
  101848:	39 cf                	cmp    %ecx,%edi
  10184a:	76 02                	jbe    10184e <writei+0xce>
  10184c:	89 cf                	mov    %ecx,%edi
  10184e:	89 7c 24 08          	mov    %edi,0x8(%esp)
  101852:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  101855:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
  101859:	89 04 24             	mov    %eax,(%esp)
  10185c:	01 fe                	add    %edi,%esi
  10185e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  101862:	89 55 d8             	mov    %edx,-0x28(%ebp)
  101865:	e8 06 2f 00 00       	call   104770 <memmove>
  10186a:	8b 55 d8             	mov    -0x28(%ebp),%edx
  10186d:	89 14 24             	mov    %edx,(%esp)
  101870:	e8 ab ea ff ff       	call   100320 <bwrite>
  101875:	8b 55 d8             	mov    -0x28(%ebp),%edx
  101878:	89 14 24             	mov    %edx,(%esp)
  10187b:	e8 20 ea ff ff       	call   1002a0 <brelse>
  101880:	01 7d e4             	add    %edi,-0x1c(%ebp)
  101883:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101886:	01 7d e0             	add    %edi,-0x20(%ebp)
  101889:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  10188c:	77 8a                	ja     101818 <writei+0x98>
  10188e:	3b 73 18             	cmp    0x18(%ebx),%esi
  101891:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  101894:	77 07                	ja     10189d <writei+0x11d>
  101896:	89 c8                	mov    %ecx,%eax
  101898:	e9 0f ff ff ff       	jmp    1017ac <writei+0x2c>
  10189d:	89 73 18             	mov    %esi,0x18(%ebx)
  1018a0:	89 1c 24             	mov    %ebx,(%esp)
  1018a3:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1018a6:	e8 45 fe ff ff       	call   1016f0 <iupdate>
  1018ab:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  1018ae:	89 c8                	mov    %ecx,%eax
  1018b0:	e9 f7 fe ff ff       	jmp    1017ac <writei+0x2c>
  1018b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1018b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001018c0 <namecmp>:
  1018c0:	55                   	push   %ebp
  1018c1:	89 e5                	mov    %esp,%ebp
  1018c3:	83 ec 18             	sub    $0x18,%esp
  1018c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1018c9:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  1018d0:	00 
  1018d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d8:	89 04 24             	mov    %eax,(%esp)
  1018db:	e8 00 2f 00 00       	call   1047e0 <strncmp>
  1018e0:	c9                   	leave  
  1018e1:	c3                   	ret    
  1018e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1018e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001018f0 <dirlookup>:
  1018f0:	55                   	push   %ebp
  1018f1:	89 e5                	mov    %esp,%ebp
  1018f3:	57                   	push   %edi
  1018f4:	56                   	push   %esi
  1018f5:	53                   	push   %ebx
  1018f6:	83 ec 3c             	sub    $0x3c,%esp
  1018f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1018fc:	8b 55 10             	mov    0x10(%ebp),%edx
  1018ff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  101902:	89 45 dc             	mov    %eax,-0x24(%ebp)
  101905:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  101908:	66 83 78 10 01       	cmpw   $0x1,0x10(%eax)
  10190d:	0f 85 d0 00 00 00    	jne    1019e3 <dirlookup+0xf3>
  101913:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  10191a:	8b 48 18             	mov    0x18(%eax),%ecx
  10191d:	85 c9                	test   %ecx,%ecx
  10191f:	0f 84 b4 00 00 00    	je     1019d9 <dirlookup+0xe9>
  101925:	8b 55 e0             	mov    -0x20(%ebp),%edx
  101928:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10192b:	c1 ea 09             	shr    $0x9,%edx
  10192e:	e8 0d fc ff ff       	call   101540 <bmap>
  101933:	89 44 24 04          	mov    %eax,0x4(%esp)
  101937:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10193a:	8b 01                	mov    (%ecx),%eax
  10193c:	89 04 24             	mov    %eax,(%esp)
  10193f:	e8 0c ea ff ff       	call   100350 <bread>
  101944:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101947:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  10194a:	83 c0 18             	add    $0x18,%eax
  10194d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  101950:	89 c6                	mov    %eax,%esi
  101952:	81 c7 18 02 00 00    	add    $0x218,%edi
  101958:	eb 0d                	jmp    101967 <dirlookup+0x77>
  10195a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101960:	83 c6 10             	add    $0x10,%esi
  101963:	39 fe                	cmp    %edi,%esi
  101965:	74 51                	je     1019b8 <dirlookup+0xc8>
  101967:	66 83 3e 00          	cmpw   $0x0,(%esi)
  10196b:	74 f3                	je     101960 <dirlookup+0x70>
  10196d:	8d 46 02             	lea    0x2(%esi),%eax
  101970:	89 44 24 04          	mov    %eax,0x4(%esp)
  101974:	89 1c 24             	mov    %ebx,(%esp)
  101977:	e8 44 ff ff ff       	call   1018c0 <namecmp>
  10197c:	85 c0                	test   %eax,%eax
  10197e:	75 e0                	jne    101960 <dirlookup+0x70>
  101980:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  101983:	85 d2                	test   %edx,%edx
  101985:	74 0e                	je     101995 <dirlookup+0xa5>
  101987:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10198a:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  10198d:	8d 04 16             	lea    (%esi,%edx,1),%eax
  101990:	2b 45 d8             	sub    -0x28(%ebp),%eax
  101993:	89 01                	mov    %eax,(%ecx)
  101995:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101998:	0f b7 1e             	movzwl (%esi),%ebx
  10199b:	89 04 24             	mov    %eax,(%esp)
  10199e:	e8 fd e8 ff ff       	call   1002a0 <brelse>
  1019a3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1019a6:	89 da                	mov    %ebx,%edx
  1019a8:	8b 01                	mov    (%ecx),%eax
  1019aa:	83 c4 3c             	add    $0x3c,%esp
  1019ad:	5b                   	pop    %ebx
  1019ae:	5e                   	pop    %esi
  1019af:	5f                   	pop    %edi
  1019b0:	5d                   	pop    %ebp
  1019b1:	e9 aa f9 ff ff       	jmp    101360 <iget>
  1019b6:	66 90                	xchg   %ax,%ax
  1019b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1019bb:	89 04 24             	mov    %eax,(%esp)
  1019be:	e8 dd e8 ff ff       	call   1002a0 <brelse>
  1019c3:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1019c6:	81 45 e0 00 02 00 00 	addl   $0x200,-0x20(%ebp)
  1019cd:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  1019d0:	39 4a 18             	cmp    %ecx,0x18(%edx)
  1019d3:	0f 87 4c ff ff ff    	ja     101925 <dirlookup+0x35>
  1019d9:	83 c4 3c             	add    $0x3c,%esp
  1019dc:	31 c0                	xor    %eax,%eax
  1019de:	5b                   	pop    %ebx
  1019df:	5e                   	pop    %esi
  1019e0:	5f                   	pop    %edi
  1019e1:	5d                   	pop    %ebp
  1019e2:	c3                   	ret    
  1019e3:	c7 04 24 5c 72 10 00 	movl   $0x10725c,(%esp)
  1019ea:	e8 61 f1 ff ff       	call   100b50 <panic>
  1019ef:	90                   	nop

001019f0 <iunlock>:
  1019f0:	55                   	push   %ebp
  1019f1:	89 e5                	mov    %esp,%ebp
  1019f3:	53                   	push   %ebx
  1019f4:	83 ec 14             	sub    $0x14,%esp
  1019f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1019fa:	85 db                	test   %ebx,%ebx
  1019fc:	74 36                	je     101a34 <iunlock+0x44>
  1019fe:	f6 43 0c 01          	testb  $0x1,0xc(%ebx)
  101a02:	74 30                	je     101a34 <iunlock+0x44>
  101a04:	8b 43 08             	mov    0x8(%ebx),%eax
  101a07:	85 c0                	test   %eax,%eax
  101a09:	7e 29                	jle    101a34 <iunlock+0x44>
  101a0b:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101a12:	e8 39 2c 00 00       	call   104650 <acquire>
  101a17:	83 63 0c fe          	andl   $0xfffffffe,0xc(%ebx)
  101a1b:	89 1c 24             	mov    %ebx,(%esp)
  101a1e:	e8 cd 18 00 00       	call   1032f0 <wakeup>
  101a23:	c7 45 08 80 2a 11 00 	movl   $0x112a80,0x8(%ebp)
  101a2a:	83 c4 14             	add    $0x14,%esp
  101a2d:	5b                   	pop    %ebx
  101a2e:	5d                   	pop    %ebp
  101a2f:	e9 cc 2b 00 00       	jmp    104600 <release>
  101a34:	c7 04 24 6e 72 10 00 	movl   $0x10726e,(%esp)
  101a3b:	e8 10 f1 ff ff       	call   100b50 <panic>

00101a40 <bfree>:
  101a40:	55                   	push   %ebp
  101a41:	89 e5                	mov    %esp,%ebp
  101a43:	57                   	push   %edi
  101a44:	56                   	push   %esi
  101a45:	89 c6                	mov    %eax,%esi
  101a47:	53                   	push   %ebx
  101a48:	89 d3                	mov    %edx,%ebx
  101a4a:	83 ec 2c             	sub    $0x2c,%esp
  101a4d:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a51:	89 04 24             	mov    %eax,(%esp)
  101a54:	e8 f7 e8 ff ff       	call   100350 <bread>
  101a59:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  101a60:	00 
  101a61:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  101a68:	00 
  101a69:	89 c7                	mov    %eax,%edi
  101a6b:	8d 40 18             	lea    0x18(%eax),%eax
  101a6e:	89 04 24             	mov    %eax,(%esp)
  101a71:	e8 7a 2c 00 00       	call   1046f0 <memset>
  101a76:	89 3c 24             	mov    %edi,(%esp)
  101a79:	e8 a2 e8 ff ff       	call   100320 <bwrite>
  101a7e:	89 3c 24             	mov    %edi,(%esp)
  101a81:	e8 1a e8 ff ff       	call   1002a0 <brelse>
  101a86:	89 f0                	mov    %esi,%eax
  101a88:	8d 55 dc             	lea    -0x24(%ebp),%edx
  101a8b:	e8 90 f9 ff ff       	call   101420 <readsb>
  101a90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101a93:	89 da                	mov    %ebx,%edx
  101a95:	c1 ea 0c             	shr    $0xc,%edx
  101a98:	89 34 24             	mov    %esi,(%esp)
  101a9b:	be 01 00 00 00       	mov    $0x1,%esi
  101aa0:	c1 e8 03             	shr    $0x3,%eax
  101aa3:	8d 44 10 03          	lea    0x3(%eax,%edx,1),%eax
  101aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aab:	e8 a0 e8 ff ff       	call   100350 <bread>
  101ab0:	89 da                	mov    %ebx,%edx
  101ab2:	89 d9                	mov    %ebx,%ecx
  101ab4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  101aba:	83 e1 07             	and    $0x7,%ecx
  101abd:	c1 fa 03             	sar    $0x3,%edx
  101ac0:	d3 e6                	shl    %cl,%esi
  101ac2:	0f b6 4c 10 18       	movzbl 0x18(%eax,%edx,1),%ecx
  101ac7:	89 c7                	mov    %eax,%edi
  101ac9:	0f b6 c1             	movzbl %cl,%eax
  101acc:	85 f0                	test   %esi,%eax
  101ace:	74 22                	je     101af2 <bfree+0xb2>
  101ad0:	89 f0                	mov    %esi,%eax
  101ad2:	f7 d0                	not    %eax
  101ad4:	21 c8                	and    %ecx,%eax
  101ad6:	88 44 17 18          	mov    %al,0x18(%edi,%edx,1)
  101ada:	89 3c 24             	mov    %edi,(%esp)
  101add:	e8 3e e8 ff ff       	call   100320 <bwrite>
  101ae2:	89 3c 24             	mov    %edi,(%esp)
  101ae5:	e8 b6 e7 ff ff       	call   1002a0 <brelse>
  101aea:	83 c4 2c             	add    $0x2c,%esp
  101aed:	5b                   	pop    %ebx
  101aee:	5e                   	pop    %esi
  101aef:	5f                   	pop    %edi
  101af0:	5d                   	pop    %ebp
  101af1:	c3                   	ret    
  101af2:	c7 04 24 76 72 10 00 	movl   $0x107276,(%esp)
  101af9:	e8 52 f0 ff ff       	call   100b50 <panic>
  101afe:	66 90                	xchg   %ax,%ax

00101b00 <iput>:
  101b00:	55                   	push   %ebp
  101b01:	89 e5                	mov    %esp,%ebp
  101b03:	57                   	push   %edi
  101b04:	56                   	push   %esi
  101b05:	53                   	push   %ebx
  101b06:	83 ec 2c             	sub    $0x2c,%esp
  101b09:	8b 75 08             	mov    0x8(%ebp),%esi
  101b0c:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101b13:	e8 38 2b 00 00       	call   104650 <acquire>
  101b18:	8b 46 08             	mov    0x8(%esi),%eax
  101b1b:	83 f8 01             	cmp    $0x1,%eax
  101b1e:	0f 85 a1 00 00 00    	jne    101bc5 <iput+0xc5>
  101b24:	8b 56 0c             	mov    0xc(%esi),%edx
  101b27:	f6 c2 02             	test   $0x2,%dl
  101b2a:	0f 84 95 00 00 00    	je     101bc5 <iput+0xc5>
  101b30:	66 83 7e 16 00       	cmpw   $0x0,0x16(%esi)
  101b35:	0f 85 8a 00 00 00    	jne    101bc5 <iput+0xc5>
  101b3b:	f6 c2 01             	test   $0x1,%dl
  101b3e:	66 90                	xchg   %ax,%ax
  101b40:	0f 85 f8 00 00 00    	jne    101c3e <iput+0x13e>
  101b46:	83 ca 01             	or     $0x1,%edx
  101b49:	89 f3                	mov    %esi,%ebx
  101b4b:	89 56 0c             	mov    %edx,0xc(%esi)
  101b4e:	8d 7e 30             	lea    0x30(%esi),%edi
  101b51:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101b58:	e8 a3 2a 00 00       	call   104600 <release>
  101b5d:	eb 08                	jmp    101b67 <iput+0x67>
  101b5f:	90                   	nop
  101b60:	83 c3 04             	add    $0x4,%ebx
  101b63:	39 fb                	cmp    %edi,%ebx
  101b65:	74 1c                	je     101b83 <iput+0x83>
  101b67:	8b 53 1c             	mov    0x1c(%ebx),%edx
  101b6a:	85 d2                	test   %edx,%edx
  101b6c:	74 f2                	je     101b60 <iput+0x60>
  101b6e:	8b 06                	mov    (%esi),%eax
  101b70:	e8 cb fe ff ff       	call   101a40 <bfree>
  101b75:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  101b7c:	83 c3 04             	add    $0x4,%ebx
  101b7f:	39 fb                	cmp    %edi,%ebx
  101b81:	75 e4                	jne    101b67 <iput+0x67>
  101b83:	8b 46 4c             	mov    0x4c(%esi),%eax
  101b86:	85 c0                	test   %eax,%eax
  101b88:	75 56                	jne    101be0 <iput+0xe0>
  101b8a:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
  101b91:	89 34 24             	mov    %esi,(%esp)
  101b94:	e8 57 fb ff ff       	call   1016f0 <iupdate>
  101b99:	66 c7 46 10 00 00    	movw   $0x0,0x10(%esi)
  101b9f:	89 34 24             	mov    %esi,(%esp)
  101ba2:	e8 49 fb ff ff       	call   1016f0 <iupdate>
  101ba7:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101bae:	e8 9d 2a 00 00       	call   104650 <acquire>
  101bb3:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  101bba:	89 34 24             	mov    %esi,(%esp)
  101bbd:	e8 2e 17 00 00       	call   1032f0 <wakeup>
  101bc2:	8b 46 08             	mov    0x8(%esi),%eax
  101bc5:	83 e8 01             	sub    $0x1,%eax
  101bc8:	89 46 08             	mov    %eax,0x8(%esi)
  101bcb:	c7 45 08 80 2a 11 00 	movl   $0x112a80,0x8(%ebp)
  101bd2:	83 c4 2c             	add    $0x2c,%esp
  101bd5:	5b                   	pop    %ebx
  101bd6:	5e                   	pop    %esi
  101bd7:	5f                   	pop    %edi
  101bd8:	5d                   	pop    %ebp
  101bd9:	e9 22 2a 00 00       	jmp    104600 <release>
  101bde:	66 90                	xchg   %ax,%ax
  101be0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be4:	8b 06                	mov    (%esi),%eax
  101be6:	31 db                	xor    %ebx,%ebx
  101be8:	89 04 24             	mov    %eax,(%esp)
  101beb:	e8 60 e7 ff ff       	call   100350 <bread>
  101bf0:	89 c7                	mov    %eax,%edi
  101bf2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101bf5:	83 c7 18             	add    $0x18,%edi
  101bf8:	31 c0                	xor    %eax,%eax
  101bfa:	eb 11                	jmp    101c0d <iput+0x10d>
  101bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101c00:	83 c3 01             	add    $0x1,%ebx
  101c03:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
  101c09:	89 d8                	mov    %ebx,%eax
  101c0b:	74 10                	je     101c1d <iput+0x11d>
  101c0d:	8b 14 87             	mov    (%edi,%eax,4),%edx
  101c10:	85 d2                	test   %edx,%edx
  101c12:	74 ec                	je     101c00 <iput+0x100>
  101c14:	8b 06                	mov    (%esi),%eax
  101c16:	e8 25 fe ff ff       	call   101a40 <bfree>
  101c1b:	eb e3                	jmp    101c00 <iput+0x100>
  101c1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101c20:	89 04 24             	mov    %eax,(%esp)
  101c23:	e8 78 e6 ff ff       	call   1002a0 <brelse>
  101c28:	8b 56 4c             	mov    0x4c(%esi),%edx
  101c2b:	8b 06                	mov    (%esi),%eax
  101c2d:	e8 0e fe ff ff       	call   101a40 <bfree>
  101c32:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  101c39:	e9 4c ff ff ff       	jmp    101b8a <iput+0x8a>
  101c3e:	c7 04 24 89 72 10 00 	movl   $0x107289,(%esp)
  101c45:	e8 06 ef ff ff       	call   100b50 <panic>
  101c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101c50 <dirlink>:
  101c50:	55                   	push   %ebp
  101c51:	89 e5                	mov    %esp,%ebp
  101c53:	57                   	push   %edi
  101c54:	56                   	push   %esi
  101c55:	53                   	push   %ebx
  101c56:	83 ec 2c             	sub    $0x2c,%esp
  101c59:	8b 75 08             	mov    0x8(%ebp),%esi
  101c5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c5f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  101c66:	00 
  101c67:	89 34 24             	mov    %esi,(%esp)
  101c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6e:	e8 7d fc ff ff       	call   1018f0 <dirlookup>
  101c73:	85 c0                	test   %eax,%eax
  101c75:	0f 85 89 00 00 00    	jne    101d04 <dirlink+0xb4>
  101c7b:	8b 56 18             	mov    0x18(%esi),%edx
  101c7e:	85 d2                	test   %edx,%edx
  101c80:	0f 84 8d 00 00 00    	je     101d13 <dirlink+0xc3>
  101c86:	8d 7d d8             	lea    -0x28(%ebp),%edi
  101c89:	31 db                	xor    %ebx,%ebx
  101c8b:	eb 0b                	jmp    101c98 <dirlink+0x48>
  101c8d:	8d 76 00             	lea    0x0(%esi),%esi
  101c90:	83 c3 10             	add    $0x10,%ebx
  101c93:	39 5e 18             	cmp    %ebx,0x18(%esi)
  101c96:	76 24                	jbe    101cbc <dirlink+0x6c>
  101c98:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  101c9f:	00 
  101ca0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  101ca4:	89 7c 24 04          	mov    %edi,0x4(%esp)
  101ca8:	89 34 24             	mov    %esi,(%esp)
  101cab:	e8 40 f9 ff ff       	call   1015f0 <readi>
  101cb0:	83 f8 10             	cmp    $0x10,%eax
  101cb3:	75 65                	jne    101d1a <dirlink+0xca>
  101cb5:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
  101cba:	75 d4                	jne    101c90 <dirlink+0x40>
  101cbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  101cbf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  101cc6:	00 
  101cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ccb:	8d 45 da             	lea    -0x26(%ebp),%eax
  101cce:	89 04 24             	mov    %eax,(%esp)
  101cd1:	e8 6a 2b 00 00       	call   104840 <strncpy>
  101cd6:	8b 45 10             	mov    0x10(%ebp),%eax
  101cd9:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  101ce0:	00 
  101ce1:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  101ce5:	89 7c 24 04          	mov    %edi,0x4(%esp)
  101ce9:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  101ced:	89 34 24             	mov    %esi,(%esp)
  101cf0:	e8 8b fa ff ff       	call   101780 <writei>
  101cf5:	83 f8 10             	cmp    $0x10,%eax
  101cf8:	75 2c                	jne    101d26 <dirlink+0xd6>
  101cfa:	31 c0                	xor    %eax,%eax
  101cfc:	83 c4 2c             	add    $0x2c,%esp
  101cff:	5b                   	pop    %ebx
  101d00:	5e                   	pop    %esi
  101d01:	5f                   	pop    %edi
  101d02:	5d                   	pop    %ebp
  101d03:	c3                   	ret    
  101d04:	89 04 24             	mov    %eax,(%esp)
  101d07:	e8 f4 fd ff ff       	call   101b00 <iput>
  101d0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101d11:	eb e9                	jmp    101cfc <dirlink+0xac>
  101d13:	8d 7d d8             	lea    -0x28(%ebp),%edi
  101d16:	31 db                	xor    %ebx,%ebx
  101d18:	eb a2                	jmp    101cbc <dirlink+0x6c>
  101d1a:	c7 04 24 93 72 10 00 	movl   $0x107293,(%esp)
  101d21:	e8 2a ee ff ff       	call   100b50 <panic>
  101d26:	c7 04 24 86 78 10 00 	movl   $0x107886,(%esp)
  101d2d:	e8 1e ee ff ff       	call   100b50 <panic>
  101d32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101d40 <iunlockput>:
  101d40:	55                   	push   %ebp
  101d41:	89 e5                	mov    %esp,%ebp
  101d43:	53                   	push   %ebx
  101d44:	83 ec 14             	sub    $0x14,%esp
  101d47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101d4a:	89 1c 24             	mov    %ebx,(%esp)
  101d4d:	e8 9e fc ff ff       	call   1019f0 <iunlock>
  101d52:	89 5d 08             	mov    %ebx,0x8(%ebp)
  101d55:	83 c4 14             	add    $0x14,%esp
  101d58:	5b                   	pop    %ebx
  101d59:	5d                   	pop    %ebp
  101d5a:	e9 a1 fd ff ff       	jmp    101b00 <iput>
  101d5f:	90                   	nop

00101d60 <ialloc>:
  101d60:	55                   	push   %ebp
  101d61:	89 e5                	mov    %esp,%ebp
  101d63:	57                   	push   %edi
  101d64:	56                   	push   %esi
  101d65:	53                   	push   %ebx
  101d66:	83 ec 3c             	sub    $0x3c,%esp
  101d69:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
  101d6d:	8d 55 dc             	lea    -0x24(%ebp),%edx
  101d70:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
  101d74:	8b 45 08             	mov    0x8(%ebp),%eax
  101d77:	e8 a4 f6 ff ff       	call   101420 <readsb>
  101d7c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
  101d80:	0f 86 96 00 00 00    	jbe    101e1c <ialloc+0xbc>
  101d86:	be 01 00 00 00       	mov    $0x1,%esi
  101d8b:	bb 01 00 00 00       	mov    $0x1,%ebx
  101d90:	eb 18                	jmp    101daa <ialloc+0x4a>
  101d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101d98:	83 c3 01             	add    $0x1,%ebx
  101d9b:	89 3c 24             	mov    %edi,(%esp)
  101d9e:	89 de                	mov    %ebx,%esi
  101da0:	e8 fb e4 ff ff       	call   1002a0 <brelse>
  101da5:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  101da8:	76 72                	jbe    101e1c <ialloc+0xbc>
  101daa:	89 f0                	mov    %esi,%eax
  101dac:	c1 e8 03             	shr    $0x3,%eax
  101daf:	83 c0 02             	add    $0x2,%eax
  101db2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101db6:	8b 45 08             	mov    0x8(%ebp),%eax
  101db9:	89 04 24             	mov    %eax,(%esp)
  101dbc:	e8 8f e5 ff ff       	call   100350 <bread>
  101dc1:	89 c7                	mov    %eax,%edi
  101dc3:	89 f0                	mov    %esi,%eax
  101dc5:	83 e0 07             	and    $0x7,%eax
  101dc8:	c1 e0 06             	shl    $0x6,%eax
  101dcb:	8d 54 07 18          	lea    0x18(%edi,%eax,1),%edx
  101dcf:	66 83 3a 00          	cmpw   $0x0,(%edx)
  101dd3:	75 c3                	jne    101d98 <ialloc+0x38>
  101dd5:	89 14 24             	mov    %edx,(%esp)
  101dd8:	89 55 d0             	mov    %edx,-0x30(%ebp)
  101ddb:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
  101de2:	00 
  101de3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  101dea:	00 
  101deb:	e8 00 29 00 00       	call   1046f0 <memset>
  101df0:	8b 55 d0             	mov    -0x30(%ebp),%edx
  101df3:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  101df7:	66 89 02             	mov    %ax,(%edx)
  101dfa:	89 3c 24             	mov    %edi,(%esp)
  101dfd:	e8 1e e5 ff ff       	call   100320 <bwrite>
  101e02:	89 3c 24             	mov    %edi,(%esp)
  101e05:	e8 96 e4 ff ff       	call   1002a0 <brelse>
  101e0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0d:	89 f2                	mov    %esi,%edx
  101e0f:	e8 4c f5 ff ff       	call   101360 <iget>
  101e14:	83 c4 3c             	add    $0x3c,%esp
  101e17:	5b                   	pop    %ebx
  101e18:	5e                   	pop    %esi
  101e19:	5f                   	pop    %edi
  101e1a:	5d                   	pop    %ebp
  101e1b:	c3                   	ret    
  101e1c:	c7 04 24 a0 72 10 00 	movl   $0x1072a0,(%esp)
  101e23:	e8 28 ed ff ff       	call   100b50 <panic>
  101e28:	90                   	nop
  101e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101e30 <ilock>:
  101e30:	55                   	push   %ebp
  101e31:	89 e5                	mov    %esp,%ebp
  101e33:	56                   	push   %esi
  101e34:	53                   	push   %ebx
  101e35:	83 ec 10             	sub    $0x10,%esp
  101e38:	8b 5d 08             	mov    0x8(%ebp),%ebx
  101e3b:	85 db                	test   %ebx,%ebx
  101e3d:	0f 84 e5 00 00 00    	je     101f28 <ilock+0xf8>
  101e43:	8b 4b 08             	mov    0x8(%ebx),%ecx
  101e46:	85 c9                	test   %ecx,%ecx
  101e48:	0f 8e da 00 00 00    	jle    101f28 <ilock+0xf8>
  101e4e:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101e55:	e8 f6 27 00 00       	call   104650 <acquire>
  101e5a:	8b 43 0c             	mov    0xc(%ebx),%eax
  101e5d:	a8 01                	test   $0x1,%al
  101e5f:	74 1e                	je     101e7f <ilock+0x4f>
  101e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101e68:	c7 44 24 04 80 2a 11 	movl   $0x112a80,0x4(%esp)
  101e6f:	00 
  101e70:	89 1c 24             	mov    %ebx,(%esp)
  101e73:	e8 a8 15 00 00       	call   103420 <sleep>
  101e78:	8b 43 0c             	mov    0xc(%ebx),%eax
  101e7b:	a8 01                	test   $0x1,%al
  101e7d:	75 e9                	jne    101e68 <ilock+0x38>
  101e7f:	83 c8 01             	or     $0x1,%eax
  101e82:	89 43 0c             	mov    %eax,0xc(%ebx)
  101e85:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  101e8c:	e8 6f 27 00 00       	call   104600 <release>
  101e91:	f6 43 0c 02          	testb  $0x2,0xc(%ebx)
  101e95:	74 09                	je     101ea0 <ilock+0x70>
  101e97:	83 c4 10             	add    $0x10,%esp
  101e9a:	5b                   	pop    %ebx
  101e9b:	5e                   	pop    %esi
  101e9c:	5d                   	pop    %ebp
  101e9d:	c3                   	ret    
  101e9e:	66 90                	xchg   %ax,%ax
  101ea0:	8b 43 04             	mov    0x4(%ebx),%eax
  101ea3:	c1 e8 03             	shr    $0x3,%eax
  101ea6:	83 c0 02             	add    $0x2,%eax
  101ea9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ead:	8b 03                	mov    (%ebx),%eax
  101eaf:	89 04 24             	mov    %eax,(%esp)
  101eb2:	e8 99 e4 ff ff       	call   100350 <bread>
  101eb7:	89 c6                	mov    %eax,%esi
  101eb9:	8b 43 04             	mov    0x4(%ebx),%eax
  101ebc:	83 e0 07             	and    $0x7,%eax
  101ebf:	c1 e0 06             	shl    $0x6,%eax
  101ec2:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
  101ec6:	0f b7 10             	movzwl (%eax),%edx
  101ec9:	66 89 53 10          	mov    %dx,0x10(%ebx)
  101ecd:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  101ed1:	66 89 53 12          	mov    %dx,0x12(%ebx)
  101ed5:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  101ed9:	66 89 53 14          	mov    %dx,0x14(%ebx)
  101edd:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  101ee1:	66 89 53 16          	mov    %dx,0x16(%ebx)
  101ee5:	8b 50 08             	mov    0x8(%eax),%edx
  101ee8:	83 c0 0c             	add    $0xc,%eax
  101eeb:	89 53 18             	mov    %edx,0x18(%ebx)
  101eee:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ef2:	8d 43 1c             	lea    0x1c(%ebx),%eax
  101ef5:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
  101efc:	00 
  101efd:	89 04 24             	mov    %eax,(%esp)
  101f00:	e8 6b 28 00 00       	call   104770 <memmove>
  101f05:	89 34 24             	mov    %esi,(%esp)
  101f08:	e8 93 e3 ff ff       	call   1002a0 <brelse>
  101f0d:	83 4b 0c 02          	orl    $0x2,0xc(%ebx)
  101f11:	66 83 7b 10 00       	cmpw   $0x0,0x10(%ebx)
  101f16:	0f 85 7b ff ff ff    	jne    101e97 <ilock+0x67>
  101f1c:	c7 04 24 b8 72 10 00 	movl   $0x1072b8,(%esp)
  101f23:	e8 28 ec ff ff       	call   100b50 <panic>
  101f28:	c7 04 24 b2 72 10 00 	movl   $0x1072b2,(%esp)
  101f2f:	e8 1c ec ff ff       	call   100b50 <panic>
  101f34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101f3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00101f40 <namex>:
  101f40:	55                   	push   %ebp
  101f41:	89 e5                	mov    %esp,%ebp
  101f43:	57                   	push   %edi
  101f44:	56                   	push   %esi
  101f45:	53                   	push   %ebx
  101f46:	89 c3                	mov    %eax,%ebx
  101f48:	83 ec 2c             	sub    $0x2c,%esp
  101f4b:	89 55 e0             	mov    %edx,-0x20(%ebp)
  101f4e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  101f51:	80 38 2f             	cmpb   $0x2f,(%eax)
  101f54:	0f 84 14 01 00 00    	je     10206e <namex+0x12e>
  101f5a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  101f60:	8b 40 48             	mov    0x48(%eax),%eax
  101f63:	89 04 24             	mov    %eax,(%esp)
  101f66:	e8 c5 f3 ff ff       	call   101330 <idup>
  101f6b:	89 c7                	mov    %eax,%edi
  101f6d:	eb 04                	jmp    101f73 <namex+0x33>
  101f6f:	90                   	nop
  101f70:	83 c3 01             	add    $0x1,%ebx
  101f73:	0f b6 03             	movzbl (%ebx),%eax
  101f76:	3c 2f                	cmp    $0x2f,%al
  101f78:	74 f6                	je     101f70 <namex+0x30>
  101f7a:	84 c0                	test   %al,%al
  101f7c:	75 1a                	jne    101f98 <namex+0x58>
  101f7e:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  101f81:	85 db                	test   %ebx,%ebx
  101f83:	0f 85 0d 01 00 00    	jne    102096 <namex+0x156>
  101f89:	83 c4 2c             	add    $0x2c,%esp
  101f8c:	89 f8                	mov    %edi,%eax
  101f8e:	5b                   	pop    %ebx
  101f8f:	5e                   	pop    %esi
  101f90:	5f                   	pop    %edi
  101f91:	5d                   	pop    %ebp
  101f92:	c3                   	ret    
  101f93:	90                   	nop
  101f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101f98:	3c 2f                	cmp    $0x2f,%al
  101f9a:	0f 84 94 00 00 00    	je     102034 <namex+0xf4>
  101fa0:	89 de                	mov    %ebx,%esi
  101fa2:	eb 08                	jmp    101fac <namex+0x6c>
  101fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101fa8:	3c 2f                	cmp    $0x2f,%al
  101faa:	74 0a                	je     101fb6 <namex+0x76>
  101fac:	83 c6 01             	add    $0x1,%esi
  101faf:	0f b6 06             	movzbl (%esi),%eax
  101fb2:	84 c0                	test   %al,%al
  101fb4:	75 f2                	jne    101fa8 <namex+0x68>
  101fb6:	89 f2                	mov    %esi,%edx
  101fb8:	29 da                	sub    %ebx,%edx
  101fba:	83 fa 0d             	cmp    $0xd,%edx
  101fbd:	7e 79                	jle    102038 <namex+0xf8>
  101fbf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  101fc6:	00 
  101fc7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  101fcb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101fce:	89 04 24             	mov    %eax,(%esp)
  101fd1:	e8 9a 27 00 00       	call   104770 <memmove>
  101fd6:	eb 03                	jmp    101fdb <namex+0x9b>
  101fd8:	83 c6 01             	add    $0x1,%esi
  101fdb:	80 3e 2f             	cmpb   $0x2f,(%esi)
  101fde:	74 f8                	je     101fd8 <namex+0x98>
  101fe0:	85 f6                	test   %esi,%esi
  101fe2:	74 9a                	je     101f7e <namex+0x3e>
  101fe4:	89 3c 24             	mov    %edi,(%esp)
  101fe7:	e8 44 fe ff ff       	call   101e30 <ilock>
  101fec:	66 83 7f 10 01       	cmpw   $0x1,0x10(%edi)
  101ff1:	75 67                	jne    10205a <namex+0x11a>
  101ff3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101ff6:	85 c0                	test   %eax,%eax
  101ff8:	74 0c                	je     102006 <namex+0xc6>
  101ffa:	80 3e 00             	cmpb   $0x0,(%esi)
  101ffd:	8d 76 00             	lea    0x0(%esi),%esi
  102000:	0f 84 7e 00 00 00    	je     102084 <namex+0x144>
  102006:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10200d:	00 
  10200e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102011:	89 3c 24             	mov    %edi,(%esp)
  102014:	89 44 24 04          	mov    %eax,0x4(%esp)
  102018:	e8 d3 f8 ff ff       	call   1018f0 <dirlookup>
  10201d:	85 c0                	test   %eax,%eax
  10201f:	89 c3                	mov    %eax,%ebx
  102021:	74 37                	je     10205a <namex+0x11a>
  102023:	89 3c 24             	mov    %edi,(%esp)
  102026:	89 df                	mov    %ebx,%edi
  102028:	89 f3                	mov    %esi,%ebx
  10202a:	e8 11 fd ff ff       	call   101d40 <iunlockput>
  10202f:	e9 3f ff ff ff       	jmp    101f73 <namex+0x33>
  102034:	89 de                	mov    %ebx,%esi
  102036:	31 d2                	xor    %edx,%edx
  102038:	89 54 24 08          	mov    %edx,0x8(%esp)
  10203c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  102040:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102043:	89 04 24             	mov    %eax,(%esp)
  102046:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102049:	e8 22 27 00 00       	call   104770 <memmove>
  10204e:	8b 55 dc             	mov    -0x24(%ebp),%edx
  102051:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102054:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
  102058:	eb 81                	jmp    101fdb <namex+0x9b>
  10205a:	89 3c 24             	mov    %edi,(%esp)
  10205d:	31 ff                	xor    %edi,%edi
  10205f:	e8 dc fc ff ff       	call   101d40 <iunlockput>
  102064:	83 c4 2c             	add    $0x2c,%esp
  102067:	89 f8                	mov    %edi,%eax
  102069:	5b                   	pop    %ebx
  10206a:	5e                   	pop    %esi
  10206b:	5f                   	pop    %edi
  10206c:	5d                   	pop    %ebp
  10206d:	c3                   	ret    
  10206e:	ba 01 00 00 00       	mov    $0x1,%edx
  102073:	b8 01 00 00 00       	mov    $0x1,%eax
  102078:	e8 e3 f2 ff ff       	call   101360 <iget>
  10207d:	89 c7                	mov    %eax,%edi
  10207f:	e9 ef fe ff ff       	jmp    101f73 <namex+0x33>
  102084:	89 3c 24             	mov    %edi,(%esp)
  102087:	e8 64 f9 ff ff       	call   1019f0 <iunlock>
  10208c:	83 c4 2c             	add    $0x2c,%esp
  10208f:	89 f8                	mov    %edi,%eax
  102091:	5b                   	pop    %ebx
  102092:	5e                   	pop    %esi
  102093:	5f                   	pop    %edi
  102094:	5d                   	pop    %ebp
  102095:	c3                   	ret    
  102096:	89 3c 24             	mov    %edi,(%esp)
  102099:	31 ff                	xor    %edi,%edi
  10209b:	e8 60 fa ff ff       	call   101b00 <iput>
  1020a0:	e9 e4 fe ff ff       	jmp    101f89 <namex+0x49>
  1020a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1020a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020b0 <nameiparent>:
  1020b0:	55                   	push   %ebp
  1020b1:	ba 01 00 00 00       	mov    $0x1,%edx
  1020b6:	89 e5                	mov    %esp,%ebp
  1020b8:	83 ec 08             	sub    $0x8,%esp
  1020bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1020be:	8b 45 08             	mov    0x8(%ebp),%eax
  1020c1:	c9                   	leave  
  1020c2:	e9 79 fe ff ff       	jmp    101f40 <namex>
  1020c7:	89 f6                	mov    %esi,%esi
  1020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020d0 <namei>:
  1020d0:	55                   	push   %ebp
  1020d1:	31 d2                	xor    %edx,%edx
  1020d3:	89 e5                	mov    %esp,%ebp
  1020d5:	83 ec 18             	sub    $0x18,%esp
  1020d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1020db:	8d 4d ea             	lea    -0x16(%ebp),%ecx
  1020de:	e8 5d fe ff ff       	call   101f40 <namex>
  1020e3:	c9                   	leave  
  1020e4:	c3                   	ret    
  1020e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1020e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020f0 <iinit>:
  1020f0:	55                   	push   %ebp
  1020f1:	89 e5                	mov    %esp,%ebp
  1020f3:	83 ec 18             	sub    $0x18,%esp
  1020f6:	c7 44 24 04 c7 72 10 	movl   $0x1072c7,0x4(%esp)
  1020fd:	00 
  1020fe:	c7 04 24 80 2a 11 00 	movl   $0x112a80,(%esp)
  102105:	e8 b6 23 00 00       	call   1044c0 <initlock>
  10210a:	c9                   	leave  
  10210b:	c3                   	ret    
  10210c:	90                   	nop
  10210d:	90                   	nop
  10210e:	90                   	nop
  10210f:	90                   	nop

00102110 <idestart>:
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  102113:	56                   	push   %esi
  102114:	89 c6                	mov    %eax,%esi
  102116:	83 ec 14             	sub    $0x14,%esp
  102119:	85 c0                	test   %eax,%eax
  10211b:	0f 84 8d 00 00 00    	je     1021ae <idestart+0x9e>
  102121:	ba f7 01 00 00       	mov    $0x1f7,%edx
  102126:	66 90                	xchg   %ax,%ax
  102128:	ec                   	in     (%dx),%al
  102129:	25 c0 00 00 00       	and    $0xc0,%eax
  10212e:	83 f8 40             	cmp    $0x40,%eax
  102131:	75 f5                	jne    102128 <idestart+0x18>
  102133:	ba f6 03 00 00       	mov    $0x3f6,%edx
  102138:	31 c0                	xor    %eax,%eax
  10213a:	ee                   	out    %al,(%dx)
  10213b:	ba f2 01 00 00       	mov    $0x1f2,%edx
  102140:	b8 01 00 00 00       	mov    $0x1,%eax
  102145:	ee                   	out    %al,(%dx)
  102146:	8b 4e 08             	mov    0x8(%esi),%ecx
  102149:	b2 f3                	mov    $0xf3,%dl
  10214b:	89 c8                	mov    %ecx,%eax
  10214d:	ee                   	out    %al,(%dx)
  10214e:	89 c8                	mov    %ecx,%eax
  102150:	b2 f4                	mov    $0xf4,%dl
  102152:	c1 e8 08             	shr    $0x8,%eax
  102155:	ee                   	out    %al,(%dx)
  102156:	89 c8                	mov    %ecx,%eax
  102158:	b2 f5                	mov    $0xf5,%dl
  10215a:	c1 e8 10             	shr    $0x10,%eax
  10215d:	ee                   	out    %al,(%dx)
  10215e:	8b 46 04             	mov    0x4(%esi),%eax
  102161:	c1 e9 18             	shr    $0x18,%ecx
  102164:	b2 f6                	mov    $0xf6,%dl
  102166:	83 e1 0f             	and    $0xf,%ecx
  102169:	83 e0 01             	and    $0x1,%eax
  10216c:	c1 e0 04             	shl    $0x4,%eax
  10216f:	09 c8                	or     %ecx,%eax
  102171:	83 c8 e0             	or     $0xffffffe0,%eax
  102174:	ee                   	out    %al,(%dx)
  102175:	f6 06 04             	testb  $0x4,(%esi)
  102178:	75 16                	jne    102190 <idestart+0x80>
  10217a:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10217f:	b8 20 00 00 00       	mov    $0x20,%eax
  102184:	ee                   	out    %al,(%dx)
  102185:	83 c4 14             	add    $0x14,%esp
  102188:	5e                   	pop    %esi
  102189:	5d                   	pop    %ebp
  10218a:	c3                   	ret    
  10218b:	90                   	nop
  10218c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102190:	b2 f7                	mov    $0xf7,%dl
  102192:	b8 30 00 00 00       	mov    $0x30,%eax
  102197:	ee                   	out    %al,(%dx)
  102198:	b9 80 00 00 00       	mov    $0x80,%ecx
  10219d:	83 c6 18             	add    $0x18,%esi
  1021a0:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1021a5:	fc                   	cld    
  1021a6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  1021a8:	83 c4 14             	add    $0x14,%esp
  1021ab:	5e                   	pop    %esi
  1021ac:	5d                   	pop    %ebp
  1021ad:	c3                   	ret    
  1021ae:	c7 04 24 ce 72 10 00 	movl   $0x1072ce,(%esp)
  1021b5:	e8 96 e9 ff ff       	call   100b50 <panic>
  1021ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001021c0 <iderw>:
  1021c0:	55                   	push   %ebp
  1021c1:	89 e5                	mov    %esp,%ebp
  1021c3:	53                   	push   %ebx
  1021c4:	83 ec 14             	sub    $0x14,%esp
  1021c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1021ca:	8b 03                	mov    (%ebx),%eax
  1021cc:	a8 01                	test   $0x1,%al
  1021ce:	0f 84 90 00 00 00    	je     102264 <iderw+0xa4>
  1021d4:	83 e0 06             	and    $0x6,%eax
  1021d7:	83 f8 02             	cmp    $0x2,%eax
  1021da:	0f 84 9c 00 00 00    	je     10227c <iderw+0xbc>
  1021e0:	8b 53 04             	mov    0x4(%ebx),%edx
  1021e3:	85 d2                	test   %edx,%edx
  1021e5:	74 0d                	je     1021f4 <iderw+0x34>
  1021e7:	a1 18 93 10 00       	mov    0x109318,%eax
  1021ec:	85 c0                	test   %eax,%eax
  1021ee:	0f 84 7c 00 00 00    	je     102270 <iderw+0xb0>
  1021f4:	c7 04 24 e0 92 10 00 	movl   $0x1092e0,(%esp)
  1021fb:	e8 50 24 00 00       	call   104650 <acquire>
  102200:	ba 14 93 10 00       	mov    $0x109314,%edx
  102205:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  10220c:	a1 14 93 10 00       	mov    0x109314,%eax
  102211:	85 c0                	test   %eax,%eax
  102213:	74 0d                	je     102222 <iderw+0x62>
  102215:	8d 76 00             	lea    0x0(%esi),%esi
  102218:	8d 50 14             	lea    0x14(%eax),%edx
  10221b:	8b 40 14             	mov    0x14(%eax),%eax
  10221e:	85 c0                	test   %eax,%eax
  102220:	75 f6                	jne    102218 <iderw+0x58>
  102222:	89 1a                	mov    %ebx,(%edx)
  102224:	39 1d 14 93 10 00    	cmp    %ebx,0x109314
  10222a:	75 14                	jne    102240 <iderw+0x80>
  10222c:	eb 2d                	jmp    10225b <iderw+0x9b>
  10222e:	66 90                	xchg   %ax,%ax
  102230:	c7 44 24 04 e0 92 10 	movl   $0x1092e0,0x4(%esp)
  102237:	00 
  102238:	89 1c 24             	mov    %ebx,(%esp)
  10223b:	e8 e0 11 00 00       	call   103420 <sleep>
  102240:	8b 03                	mov    (%ebx),%eax
  102242:	83 e0 06             	and    $0x6,%eax
  102245:	83 f8 02             	cmp    $0x2,%eax
  102248:	75 e6                	jne    102230 <iderw+0x70>
  10224a:	c7 45 08 e0 92 10 00 	movl   $0x1092e0,0x8(%ebp)
  102251:	83 c4 14             	add    $0x14,%esp
  102254:	5b                   	pop    %ebx
  102255:	5d                   	pop    %ebp
  102256:	e9 a5 23 00 00       	jmp    104600 <release>
  10225b:	89 d8                	mov    %ebx,%eax
  10225d:	e8 ae fe ff ff       	call   102110 <idestart>
  102262:	eb dc                	jmp    102240 <iderw+0x80>
  102264:	c7 04 24 d7 72 10 00 	movl   $0x1072d7,(%esp)
  10226b:	e8 e0 e8 ff ff       	call   100b50 <panic>
  102270:	c7 04 24 00 73 10 00 	movl   $0x107300,(%esp)
  102277:	e8 d4 e8 ff ff       	call   100b50 <panic>
  10227c:	c7 04 24 eb 72 10 00 	movl   $0x1072eb,(%esp)
  102283:	e8 c8 e8 ff ff       	call   100b50 <panic>
  102288:	90                   	nop
  102289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102290 <ideintr>:
  102290:	55                   	push   %ebp
  102291:	89 e5                	mov    %esp,%ebp
  102293:	57                   	push   %edi
  102294:	53                   	push   %ebx
  102295:	83 ec 10             	sub    $0x10,%esp
  102298:	c7 04 24 e0 92 10 00 	movl   $0x1092e0,(%esp)
  10229f:	e8 ac 23 00 00       	call   104650 <acquire>
  1022a4:	8b 1d 14 93 10 00    	mov    0x109314,%ebx
  1022aa:	85 db                	test   %ebx,%ebx
  1022ac:	74 7a                	je     102328 <ideintr+0x98>
  1022ae:	8b 43 14             	mov    0x14(%ebx),%eax
  1022b1:	a3 14 93 10 00       	mov    %eax,0x109314
  1022b6:	8b 0b                	mov    (%ebx),%ecx
  1022b8:	f6 c1 04             	test   $0x4,%cl
  1022bb:	74 33                	je     1022f0 <ideintr+0x60>
  1022bd:	83 c9 02             	or     $0x2,%ecx
  1022c0:	83 e1 fb             	and    $0xfffffffb,%ecx
  1022c3:	89 0b                	mov    %ecx,(%ebx)
  1022c5:	89 1c 24             	mov    %ebx,(%esp)
  1022c8:	e8 23 10 00 00       	call   1032f0 <wakeup>
  1022cd:	a1 14 93 10 00       	mov    0x109314,%eax
  1022d2:	85 c0                	test   %eax,%eax
  1022d4:	74 05                	je     1022db <ideintr+0x4b>
  1022d6:	e8 35 fe ff ff       	call   102110 <idestart>
  1022db:	c7 04 24 e0 92 10 00 	movl   $0x1092e0,(%esp)
  1022e2:	e8 19 23 00 00       	call   104600 <release>
  1022e7:	83 c4 10             	add    $0x10,%esp
  1022ea:	5b                   	pop    %ebx
  1022eb:	5f                   	pop    %edi
  1022ec:	5d                   	pop    %ebp
  1022ed:	c3                   	ret    
  1022ee:	66 90                	xchg   %ax,%ax
  1022f0:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1022f5:	8d 76 00             	lea    0x0(%esi),%esi
  1022f8:	ec                   	in     (%dx),%al
  1022f9:	0f b6 c0             	movzbl %al,%eax
  1022fc:	89 c7                	mov    %eax,%edi
  1022fe:	81 e7 c0 00 00 00    	and    $0xc0,%edi
  102304:	83 ff 40             	cmp    $0x40,%edi
  102307:	75 ef                	jne    1022f8 <ideintr+0x68>
  102309:	a8 21                	test   $0x21,%al
  10230b:	75 b0                	jne    1022bd <ideintr+0x2d>
  10230d:	8d 7b 18             	lea    0x18(%ebx),%edi
  102310:	b9 80 00 00 00       	mov    $0x80,%ecx
  102315:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10231a:	fc                   	cld    
  10231b:	f3 6d                	rep insl (%dx),%es:(%edi)
  10231d:	8b 0b                	mov    (%ebx),%ecx
  10231f:	eb 9c                	jmp    1022bd <ideintr+0x2d>
  102321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102328:	c7 04 24 e0 92 10 00 	movl   $0x1092e0,(%esp)
  10232f:	e8 cc 22 00 00       	call   104600 <release>
  102334:	c7 04 24 1d 73 10 00 	movl   $0x10731d,(%esp)
  10233b:	e8 20 e4 ff ff       	call   100760 <cprintf>
  102340:	eb a5                	jmp    1022e7 <ideintr+0x57>
  102342:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102350 <ideinit>:
  102350:	55                   	push   %ebp
  102351:	89 e5                	mov    %esp,%ebp
  102353:	83 ec 18             	sub    $0x18,%esp
  102356:	c7 44 24 04 36 73 10 	movl   $0x107336,0x4(%esp)
  10235d:	00 
  10235e:	c7 04 24 e0 92 10 00 	movl   $0x1092e0,(%esp)
  102365:	e8 56 21 00 00       	call   1044c0 <initlock>
  10236a:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  102371:	e8 aa 0a 00 00       	call   102e20 <picenable>
  102376:	a1 a0 40 11 00       	mov    0x1140a0,%eax
  10237b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  102382:	83 e8 01             	sub    $0x1,%eax
  102385:	89 44 24 04          	mov    %eax,0x4(%esp)
  102389:	e8 52 00 00 00       	call   1023e0 <ioapicenable>
  10238e:	ba f7 01 00 00       	mov    $0x1f7,%edx
  102393:	90                   	nop
  102394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102398:	ec                   	in     (%dx),%al
  102399:	25 c0 00 00 00       	and    $0xc0,%eax
  10239e:	83 f8 40             	cmp    $0x40,%eax
  1023a1:	75 f5                	jne    102398 <ideinit+0x48>
  1023a3:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1023a8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  1023ad:	ee                   	out    %al,(%dx)
  1023ae:	31 c9                	xor    %ecx,%ecx
  1023b0:	b2 f7                	mov    $0xf7,%dl
  1023b2:	eb 0f                	jmp    1023c3 <ideinit+0x73>
  1023b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1023b8:	83 c1 01             	add    $0x1,%ecx
  1023bb:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
  1023c1:	74 0f                	je     1023d2 <ideinit+0x82>
  1023c3:	ec                   	in     (%dx),%al
  1023c4:	84 c0                	test   %al,%al
  1023c6:	74 f0                	je     1023b8 <ideinit+0x68>
  1023c8:	c7 05 18 93 10 00 01 	movl   $0x1,0x109318
  1023cf:	00 00 00 
  1023d2:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1023d7:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
  1023dc:	ee                   	out    %al,(%dx)
  1023dd:	c9                   	leave  
  1023de:	c3                   	ret    
  1023df:	90                   	nop

001023e0 <ioapicenable>:
  1023e0:	8b 15 a4 3a 11 00    	mov    0x113aa4,%edx
  1023e6:	55                   	push   %ebp
  1023e7:	89 e5                	mov    %esp,%ebp
  1023e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1023ec:	85 d2                	test   %edx,%edx
  1023ee:	74 31                	je     102421 <ioapicenable+0x41>
  1023f0:	8b 15 54 3a 11 00    	mov    0x113a54,%edx
  1023f6:	8d 48 20             	lea    0x20(%eax),%ecx
  1023f9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  1023fd:	89 02                	mov    %eax,(%edx)
  1023ff:	8b 15 54 3a 11 00    	mov    0x113a54,%edx
  102405:	83 c0 01             	add    $0x1,%eax
  102408:	89 4a 10             	mov    %ecx,0x10(%edx)
  10240b:	8b 0d 54 3a 11 00    	mov    0x113a54,%ecx
  102411:	8b 55 0c             	mov    0xc(%ebp),%edx
  102414:	89 01                	mov    %eax,(%ecx)
  102416:	a1 54 3a 11 00       	mov    0x113a54,%eax
  10241b:	c1 e2 18             	shl    $0x18,%edx
  10241e:	89 50 10             	mov    %edx,0x10(%eax)
  102421:	5d                   	pop    %ebp
  102422:	c3                   	ret    
  102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102430 <ioapicinit>:
  102430:	55                   	push   %ebp
  102431:	89 e5                	mov    %esp,%ebp
  102433:	56                   	push   %esi
  102434:	53                   	push   %ebx
  102435:	83 ec 10             	sub    $0x10,%esp
  102438:	8b 0d a4 3a 11 00    	mov    0x113aa4,%ecx
  10243e:	85 c9                	test   %ecx,%ecx
  102440:	0f 84 9e 00 00 00    	je     1024e4 <ioapicinit+0xb4>
  102446:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
  10244d:	00 00 00 
  102450:	8b 35 10 00 c0 fe    	mov    0xfec00010,%esi
  102456:	bb 00 00 c0 fe       	mov    $0xfec00000,%ebx
  10245b:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
  102462:	00 00 00 
  102465:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
  10246a:	0f b6 15 a0 3a 11 00 	movzbl 0x113aa0,%edx
  102471:	c7 05 54 3a 11 00 00 	movl   $0xfec00000,0x113a54
  102478:	00 c0 fe 
  10247b:	c1 ee 10             	shr    $0x10,%esi
  10247e:	c1 e8 18             	shr    $0x18,%eax
  102481:	81 e6 ff 00 00 00    	and    $0xff,%esi
  102487:	39 c2                	cmp    %eax,%edx
  102489:	74 12                	je     10249d <ioapicinit+0x6d>
  10248b:	c7 04 24 3c 73 10 00 	movl   $0x10733c,(%esp)
  102492:	e8 c9 e2 ff ff       	call   100760 <cprintf>
  102497:	8b 1d 54 3a 11 00    	mov    0x113a54,%ebx
  10249d:	ba 10 00 00 00       	mov    $0x10,%edx
  1024a2:	31 c0                	xor    %eax,%eax
  1024a4:	eb 08                	jmp    1024ae <ioapicinit+0x7e>
  1024a6:	66 90                	xchg   %ax,%ax
  1024a8:	8b 1d 54 3a 11 00    	mov    0x113a54,%ebx
  1024ae:	89 13                	mov    %edx,(%ebx)
  1024b0:	8b 1d 54 3a 11 00    	mov    0x113a54,%ebx
  1024b6:	8d 48 20             	lea    0x20(%eax),%ecx
  1024b9:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  1024bf:	83 c0 01             	add    $0x1,%eax
  1024c2:	89 4b 10             	mov    %ecx,0x10(%ebx)
  1024c5:	8b 0d 54 3a 11 00    	mov    0x113a54,%ecx
  1024cb:	8d 5a 01             	lea    0x1(%edx),%ebx
  1024ce:	83 c2 02             	add    $0x2,%edx
  1024d1:	39 c6                	cmp    %eax,%esi
  1024d3:	89 19                	mov    %ebx,(%ecx)
  1024d5:	8b 0d 54 3a 11 00    	mov    0x113a54,%ecx
  1024db:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  1024e2:	7d c4                	jge    1024a8 <ioapicinit+0x78>
  1024e4:	83 c4 10             	add    $0x10,%esp
  1024e7:	5b                   	pop    %ebx
  1024e8:	5e                   	pop    %esi
  1024e9:	5d                   	pop    %ebp
  1024ea:	c3                   	ret    
  1024eb:	90                   	nop
  1024ec:	90                   	nop
  1024ed:	90                   	nop
  1024ee:	90                   	nop
  1024ef:	90                   	nop

001024f0 <kalloc>:
  1024f0:	55                   	push   %ebp
  1024f1:	89 e5                	mov    %esp,%ebp
  1024f3:	53                   	push   %ebx
  1024f4:	83 ec 14             	sub    $0x14,%esp
  1024f7:	c7 04 24 60 3a 11 00 	movl   $0x113a60,(%esp)
  1024fe:	e8 4d 21 00 00       	call   104650 <acquire>
  102503:	8b 1d 94 3a 11 00    	mov    0x113a94,%ebx
  102509:	85 db                	test   %ebx,%ebx
  10250b:	74 07                	je     102514 <kalloc+0x24>
  10250d:	8b 03                	mov    (%ebx),%eax
  10250f:	a3 94 3a 11 00       	mov    %eax,0x113a94
  102514:	c7 04 24 60 3a 11 00 	movl   $0x113a60,(%esp)
  10251b:	e8 e0 20 00 00       	call   104600 <release>
  102520:	89 d8                	mov    %ebx,%eax
  102522:	83 c4 14             	add    $0x14,%esp
  102525:	5b                   	pop    %ebx
  102526:	5d                   	pop    %ebp
  102527:	c3                   	ret    
  102528:	90                   	nop
  102529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102530 <kfree>:
  102530:	55                   	push   %ebp
  102531:	89 e5                	mov    %esp,%ebp
  102533:	53                   	push   %ebx
  102534:	83 ec 14             	sub    $0x14,%esp
  102537:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10253a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
  102540:	75 52                	jne    102594 <kfree+0x64>
  102542:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
  102548:	76 4a                	jbe    102594 <kfree+0x64>
  10254a:	81 fb ff ff ff 00    	cmp    $0xffffff,%ebx
  102550:	77 42                	ja     102594 <kfree+0x64>
  102552:	89 1c 24             	mov    %ebx,(%esp)
  102555:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  10255c:	00 
  10255d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  102564:	00 
  102565:	e8 86 21 00 00       	call   1046f0 <memset>
  10256a:	c7 04 24 60 3a 11 00 	movl   $0x113a60,(%esp)
  102571:	e8 da 20 00 00       	call   104650 <acquire>
  102576:	a1 94 3a 11 00       	mov    0x113a94,%eax
  10257b:	89 03                	mov    %eax,(%ebx)
  10257d:	89 1d 94 3a 11 00    	mov    %ebx,0x113a94
  102583:	c7 45 08 60 3a 11 00 	movl   $0x113a60,0x8(%ebp)
  10258a:	83 c4 14             	add    $0x14,%esp
  10258d:	5b                   	pop    %ebx
  10258e:	5d                   	pop    %ebp
  10258f:	e9 6c 20 00 00       	jmp    104600 <release>
  102594:	c7 04 24 6e 73 10 00 	movl   $0x10736e,(%esp)
  10259b:	e8 b0 e5 ff ff       	call   100b50 <panic>

001025a0 <kinit>:
  1025a0:	55                   	push   %ebp
  1025a1:	89 e5                	mov    %esp,%ebp
  1025a3:	53                   	push   %ebx
  1025a4:	bb 83 7c 11 00       	mov    $0x117c83,%ebx
  1025a9:	83 ec 14             	sub    $0x14,%esp
  1025ac:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  1025b2:	c7 44 24 04 74 73 10 	movl   $0x107374,0x4(%esp)
  1025b9:	00 
  1025ba:	c7 04 24 60 3a 11 00 	movl   $0x113a60,(%esp)
  1025c1:	e8 fa 1e 00 00       	call   1044c0 <initlock>
  1025c6:	8d 83 ff 0f 00 00    	lea    0xfff(%ebx),%eax
  1025cc:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  1025d1:	77 20                	ja     1025f3 <kinit+0x53>
  1025d3:	90                   	nop
  1025d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1025d8:	89 1c 24             	mov    %ebx,(%esp)
  1025db:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  1025e1:	e8 4a ff ff ff       	call   102530 <kfree>
  1025e6:	8d 83 ff 0f 00 00    	lea    0xfff(%ebx),%eax
  1025ec:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  1025f1:	76 e5                	jbe    1025d8 <kinit+0x38>
  1025f3:	83 c4 14             	add    $0x14,%esp
  1025f6:	5b                   	pop    %ebx
  1025f7:	5d                   	pop    %ebp
  1025f8:	c3                   	ret    
  1025f9:	90                   	nop
  1025fa:	90                   	nop
  1025fb:	90                   	nop
  1025fc:	90                   	nop
  1025fd:	90                   	nop
  1025fe:	90                   	nop
  1025ff:	90                   	nop

00102600 <kbdgetc>:
  102600:	55                   	push   %ebp
  102601:	ba 64 00 00 00       	mov    $0x64,%edx
  102606:	89 e5                	mov    %esp,%ebp
  102608:	ec                   	in     (%dx),%al
  102609:	89 c2                	mov    %eax,%edx
  10260b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102610:	83 e2 01             	and    $0x1,%edx
  102613:	74 3e                	je     102653 <kbdgetc+0x53>
  102615:	ba 60 00 00 00       	mov    $0x60,%edx
  10261a:	ec                   	in     (%dx),%al
  10261b:	0f b6 c0             	movzbl %al,%eax
  10261e:	3d e0 00 00 00       	cmp    $0xe0,%eax
  102623:	0f 84 7f 00 00 00    	je     1026a8 <kbdgetc+0xa8>
  102629:	84 c0                	test   %al,%al
  10262b:	79 2b                	jns    102658 <kbdgetc+0x58>
  10262d:	8b 15 1c 93 10 00    	mov    0x10931c,%edx
  102633:	f6 c2 40             	test   $0x40,%dl
  102636:	75 03                	jne    10263b <kbdgetc+0x3b>
  102638:	83 e0 7f             	and    $0x7f,%eax
  10263b:	0f b6 80 80 73 10 00 	movzbl 0x107380(%eax),%eax
  102642:	83 c8 40             	or     $0x40,%eax
  102645:	0f b6 c0             	movzbl %al,%eax
  102648:	f7 d0                	not    %eax
  10264a:	21 d0                	and    %edx,%eax
  10264c:	a3 1c 93 10 00       	mov    %eax,0x10931c
  102651:	31 c0                	xor    %eax,%eax
  102653:	5d                   	pop    %ebp
  102654:	c3                   	ret    
  102655:	8d 76 00             	lea    0x0(%esi),%esi
  102658:	8b 0d 1c 93 10 00    	mov    0x10931c,%ecx
  10265e:	f6 c1 40             	test   $0x40,%cl
  102661:	74 05                	je     102668 <kbdgetc+0x68>
  102663:	0c 80                	or     $0x80,%al
  102665:	83 e1 bf             	and    $0xffffffbf,%ecx
  102668:	0f b6 90 80 73 10 00 	movzbl 0x107380(%eax),%edx
  10266f:	09 ca                	or     %ecx,%edx
  102671:	0f b6 88 80 74 10 00 	movzbl 0x107480(%eax),%ecx
  102678:	31 ca                	xor    %ecx,%edx
  10267a:	89 d1                	mov    %edx,%ecx
  10267c:	83 e1 03             	and    $0x3,%ecx
  10267f:	8b 0c 8d 80 75 10 00 	mov    0x107580(,%ecx,4),%ecx
  102686:	89 15 1c 93 10 00    	mov    %edx,0x10931c
  10268c:	83 e2 08             	and    $0x8,%edx
  10268f:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
  102693:	74 be                	je     102653 <kbdgetc+0x53>
  102695:	8d 50 9f             	lea    -0x61(%eax),%edx
  102698:	83 fa 19             	cmp    $0x19,%edx
  10269b:	77 1b                	ja     1026b8 <kbdgetc+0xb8>
  10269d:	83 e8 20             	sub    $0x20,%eax
  1026a0:	5d                   	pop    %ebp
  1026a1:	c3                   	ret    
  1026a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1026a8:	30 c0                	xor    %al,%al
  1026aa:	83 0d 1c 93 10 00 40 	orl    $0x40,0x10931c
  1026b1:	5d                   	pop    %ebp
  1026b2:	c3                   	ret    
  1026b3:	90                   	nop
  1026b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1026b8:	8d 50 bf             	lea    -0x41(%eax),%edx
  1026bb:	83 fa 19             	cmp    $0x19,%edx
  1026be:	77 93                	ja     102653 <kbdgetc+0x53>
  1026c0:	83 c0 20             	add    $0x20,%eax
  1026c3:	5d                   	pop    %ebp
  1026c4:	c3                   	ret    
  1026c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001026d0 <kbdintr>:
  1026d0:	55                   	push   %ebp
  1026d1:	89 e5                	mov    %esp,%ebp
  1026d3:	83 ec 18             	sub    $0x18,%esp
  1026d6:	c7 04 24 00 26 10 00 	movl   $0x102600,(%esp)
  1026dd:	e8 de e2 ff ff       	call   1009c0 <consoleintr>
  1026e2:	c9                   	leave  
  1026e3:	c3                   	ret    
  1026e4:	90                   	nop
  1026e5:	90                   	nop
  1026e6:	90                   	nop
  1026e7:	90                   	nop
  1026e8:	90                   	nop
  1026e9:	90                   	nop
  1026ea:	90                   	nop
  1026eb:	90                   	nop
  1026ec:	90                   	nop
  1026ed:	90                   	nop
  1026ee:	90                   	nop
  1026ef:	90                   	nop

001026f0 <lapiceoi>:
  1026f0:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1026f5:	55                   	push   %ebp
  1026f6:	89 e5                	mov    %esp,%ebp
  1026f8:	85 c0                	test   %eax,%eax
  1026fa:	74 12                	je     10270e <lapiceoi+0x1e>
  1026fc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  102703:	00 00 00 
  102706:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10270b:	8b 40 20             	mov    0x20(%eax),%eax
  10270e:	5d                   	pop    %ebp
  10270f:	c3                   	ret    

00102710 <microdelay>:
  102710:	55                   	push   %ebp
  102711:	89 e5                	mov    %esp,%ebp
  102713:	5d                   	pop    %ebp
  102714:	c3                   	ret    
  102715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102720 <lapicstartap>:
  102720:	55                   	push   %ebp
  102721:	ba 70 00 00 00       	mov    $0x70,%edx
  102726:	89 e5                	mov    %esp,%ebp
  102728:	b8 0f 00 00 00       	mov    $0xf,%eax
  10272d:	53                   	push   %ebx
  10272e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102731:	0f b6 5d 08          	movzbl 0x8(%ebp),%ebx
  102735:	ee                   	out    %al,(%dx)
  102736:	b8 0a 00 00 00       	mov    $0xa,%eax
  10273b:	b2 71                	mov    $0x71,%dl
  10273d:	ee                   	out    %al,(%dx)
  10273e:	89 c8                	mov    %ecx,%eax
  102740:	c1 e8 04             	shr    $0x4,%eax
  102743:	66 a3 69 04 00 00    	mov    %ax,0x469
  102749:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10274e:	c1 e3 18             	shl    $0x18,%ebx
  102751:	66 c7 05 67 04 00 00 	movw   $0x0,0x467
  102758:	00 00 
  10275a:	c1 e9 0c             	shr    $0xc,%ecx
  10275d:	80 cd 06             	or     $0x6,%ch
  102760:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  102766:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10276b:	8b 50 20             	mov    0x20(%eax),%edx
  10276e:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
  102775:	c5 00 00 
  102778:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10277d:	8b 50 20             	mov    0x20(%eax),%edx
  102780:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
  102787:	85 00 00 
  10278a:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10278f:	8b 50 20             	mov    0x20(%eax),%edx
  102792:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  102798:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10279d:	8b 50 20             	mov    0x20(%eax),%edx
  1027a0:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  1027a6:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1027ab:	8b 50 20             	mov    0x20(%eax),%edx
  1027ae:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  1027b4:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1027b9:	8b 50 20             	mov    0x20(%eax),%edx
  1027bc:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  1027c2:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1027c7:	5b                   	pop    %ebx
  1027c8:	5d                   	pop    %ebp
  1027c9:	8b 40 20             	mov    0x20(%eax),%eax
  1027cc:	c3                   	ret    
  1027cd:	8d 76 00             	lea    0x0(%esi),%esi

001027d0 <cpunum>:
  1027d0:	55                   	push   %ebp
  1027d1:	89 e5                	mov    %esp,%ebp
  1027d3:	83 ec 18             	sub    $0x18,%esp
  1027d6:	9c                   	pushf  
  1027d7:	58                   	pop    %eax
  1027d8:	f6 c4 02             	test   $0x2,%ah
  1027db:	74 12                	je     1027ef <cpunum+0x1f>
  1027dd:	a1 20 93 10 00       	mov    0x109320,%eax
  1027e2:	8d 50 01             	lea    0x1(%eax),%edx
  1027e5:	85 c0                	test   %eax,%eax
  1027e7:	89 15 20 93 10 00    	mov    %edx,0x109320
  1027ed:	74 19                	je     102808 <cpunum+0x38>
  1027ef:	8b 15 98 3a 11 00    	mov    0x113a98,%edx
  1027f5:	31 c0                	xor    %eax,%eax
  1027f7:	85 d2                	test   %edx,%edx
  1027f9:	74 06                	je     102801 <cpunum+0x31>
  1027fb:	8b 42 20             	mov    0x20(%edx),%eax
  1027fe:	c1 e8 18             	shr    $0x18,%eax
  102801:	c9                   	leave  
  102802:	c3                   	ret    
  102803:	90                   	nop
  102804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102808:	8b 45 04             	mov    0x4(%ebp),%eax
  10280b:	c7 04 24 90 75 10 00 	movl   $0x107590,(%esp)
  102812:	89 44 24 04          	mov    %eax,0x4(%esp)
  102816:	e8 45 df ff ff       	call   100760 <cprintf>
  10281b:	eb d2                	jmp    1027ef <cpunum+0x1f>
  10281d:	8d 76 00             	lea    0x0(%esi),%esi

00102820 <lapicinit>:
  102820:	55                   	push   %ebp
  102821:	89 e5                	mov    %esp,%ebp
  102823:	83 ec 18             	sub    $0x18,%esp
  102826:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10282b:	c7 04 24 bc 75 10 00 	movl   $0x1075bc,(%esp)
  102832:	89 44 24 08          	mov    %eax,0x8(%esp)
  102836:	8b 45 08             	mov    0x8(%ebp),%eax
  102839:	89 44 24 04          	mov    %eax,0x4(%esp)
  10283d:	e8 1e df ff ff       	call   100760 <cprintf>
  102842:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102847:	85 c0                	test   %eax,%eax
  102849:	0f 84 0a 01 00 00    	je     102959 <lapicinit+0x139>
  10284f:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
  102856:	01 00 00 
  102859:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10285e:	8b 50 20             	mov    0x20(%eax),%edx
  102861:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
  102868:	00 00 00 
  10286b:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102870:	8b 50 20             	mov    0x20(%eax),%edx
  102873:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
  10287a:	00 02 00 
  10287d:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102882:	8b 50 20             	mov    0x20(%eax),%edx
  102885:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
  10288c:	96 98 00 
  10288f:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102894:	8b 50 20             	mov    0x20(%eax),%edx
  102897:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
  10289e:	00 01 00 
  1028a1:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1028a6:	8b 50 20             	mov    0x20(%eax),%edx
  1028a9:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
  1028b0:	00 01 00 
  1028b3:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1028b8:	8b 50 20             	mov    0x20(%eax),%edx
  1028bb:	8b 50 30             	mov    0x30(%eax),%edx
  1028be:	c1 ea 10             	shr    $0x10,%edx
  1028c1:	80 fa 03             	cmp    $0x3,%dl
  1028c4:	0f 87 96 00 00 00    	ja     102960 <lapicinit+0x140>
  1028ca:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
  1028d1:	00 00 00 
  1028d4:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1028d9:	8b 50 20             	mov    0x20(%eax),%edx
  1028dc:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1028e3:	00 00 00 
  1028e6:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1028eb:	8b 50 20             	mov    0x20(%eax),%edx
  1028ee:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1028f5:	00 00 00 
  1028f8:	a1 98 3a 11 00       	mov    0x113a98,%eax
  1028fd:	8b 50 20             	mov    0x20(%eax),%edx
  102900:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  102907:	00 00 00 
  10290a:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10290f:	8b 50 20             	mov    0x20(%eax),%edx
  102912:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
  102919:	00 00 00 
  10291c:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102921:	8b 50 20             	mov    0x20(%eax),%edx
  102924:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
  10292b:	85 08 00 
  10292e:	8b 0d 98 3a 11 00    	mov    0x113a98,%ecx
  102934:	8b 41 20             	mov    0x20(%ecx),%eax
  102937:	8d 91 00 03 00 00    	lea    0x300(%ecx),%edx
  10293d:	8d 76 00             	lea    0x0(%esi),%esi
  102940:	8b 02                	mov    (%edx),%eax
  102942:	f6 c4 10             	test   $0x10,%ah
  102945:	75 f9                	jne    102940 <lapicinit+0x120>
  102947:	c7 81 80 00 00 00 00 	movl   $0x0,0x80(%ecx)
  10294e:	00 00 00 
  102951:	a1 98 3a 11 00       	mov    0x113a98,%eax
  102956:	8b 40 20             	mov    0x20(%eax),%eax
  102959:	c9                   	leave  
  10295a:	c3                   	ret    
  10295b:	90                   	nop
  10295c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102960:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
  102967:	00 01 00 
  10296a:	a1 98 3a 11 00       	mov    0x113a98,%eax
  10296f:	8b 50 20             	mov    0x20(%eax),%edx
  102972:	e9 53 ff ff ff       	jmp    1028ca <lapicinit+0xaa>
  102977:	90                   	nop
  102978:	90                   	nop
  102979:	90                   	nop
  10297a:	90                   	nop
  10297b:	90                   	nop
  10297c:	90                   	nop
  10297d:	90                   	nop
  10297e:	90                   	nop
  10297f:	90                   	nop

00102980 <mpmain>:
  102980:	55                   	push   %ebp
  102981:	89 e5                	mov    %esp,%ebp
  102983:	53                   	push   %ebx
  102984:	83 ec 14             	sub    $0x14,%esp
  102987:	e8 44 fe ff ff       	call   1027d0 <cpunum>
  10298c:	89 c3                	mov    %eax,%ebx
  10298e:	e8 ed 01 00 00       	call   102b80 <mpbcpu>
  102993:	39 c3                	cmp    %eax,%ebx
  102995:	74 16                	je     1029ad <mpmain+0x2d>
  102997:	e8 a4 46 00 00       	call   107040 <ksegment>
  10299c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1029a0:	e8 2b fe ff ff       	call   1027d0 <cpunum>
  1029a5:	89 04 24             	mov    %eax,(%esp)
  1029a8:	e8 73 fe ff ff       	call   102820 <lapicinit>
  1029ad:	e8 8e 3f 00 00       	call   106940 <vmenable>
  1029b2:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1029b8:	0f b6 00             	movzbl (%eax),%eax
  1029bb:	c7 04 24 d0 75 10 00 	movl   $0x1075d0,(%esp)
  1029c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029c6:	e8 95 dd ff ff       	call   100760 <cprintf>
  1029cb:	e8 70 30 00 00       	call   105a40 <idtinit>
  1029d0:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1029d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1029dc:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  1029e3:	e8 48 0b 00 00       	call   103530 <scheduler>
  1029e8:	90                   	nop
  1029e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001029f0 <mainc>:
  1029f0:	55                   	push   %ebp
  1029f1:	89 e5                	mov    %esp,%ebp
  1029f3:	53                   	push   %ebx
  1029f4:	83 ec 14             	sub    $0x14,%esp
  1029f7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1029fd:	0f b6 00             	movzbl (%eax),%eax
  102a00:	c7 04 24 e1 75 10 00 	movl   $0x1075e1,(%esp)
  102a07:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a0b:	e8 50 dd ff ff       	call   100760 <cprintf>
  102a10:	e8 eb 41 00 00       	call   106c00 <kvmalloc>
  102a15:	e8 86 1a 00 00       	call   1044a0 <pinit>
  102a1a:	e8 c1 32 00 00       	call   105ce0 <tvinit>
  102a1f:	90                   	nop
  102a20:	e8 fb d9 ff ff       	call   100420 <binit>
  102a25:	e8 b6 e8 ff ff       	call   1012e0 <fileinit>
  102a2a:	e8 c1 f6 ff ff       	call   1020f0 <iinit>
  102a2f:	90                   	nop
  102a30:	e8 1b f9 ff ff       	call   102350 <ideinit>
  102a35:	a1 a4 3a 11 00       	mov    0x113aa4,%eax
  102a3a:	85 c0                	test   %eax,%eax
  102a3c:	0f 84 ab 00 00 00    	je     102aed <mainc+0xfd>
  102a42:	e8 89 18 00 00       	call   1042d0 <userinit>
  102a47:	c7 44 24 08 6a 00 00 	movl   $0x6a,0x8(%esp)
  102a4e:	00 
  102a4f:	c7 44 24 04 14 92 10 	movl   $0x109214,0x4(%esp)
  102a56:	00 
  102a57:	c7 04 24 00 70 00 00 	movl   $0x7000,(%esp)
  102a5e:	e8 0d 1d 00 00       	call   104770 <memmove>
  102a63:	69 05 a0 40 11 00 bc 	imul   $0xbc,0x1140a0,%eax
  102a6a:	00 00 00 
  102a6d:	05 c0 3a 11 00       	add    $0x113ac0,%eax
  102a72:	3d c0 3a 11 00       	cmp    $0x113ac0,%eax
  102a77:	76 6a                	jbe    102ae3 <mainc+0xf3>
  102a79:	bb c0 3a 11 00       	mov    $0x113ac0,%ebx
  102a7e:	66 90                	xchg   %ax,%ax
  102a80:	e8 4b fd ff ff       	call   1027d0 <cpunum>
  102a85:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  102a8b:	05 c0 3a 11 00       	add    $0x113ac0,%eax
  102a90:	39 c3                	cmp    %eax,%ebx
  102a92:	74 36                	je     102aca <mainc+0xda>
  102a94:	e8 57 fa ff ff       	call   1024f0 <kalloc>
  102a99:	c7 05 f8 6f 00 00 80 	movl   $0x102980,0x6ff8
  102aa0:	29 10 00 
  102aa3:	05 00 10 00 00       	add    $0x1000,%eax
  102aa8:	a3 fc 6f 00 00       	mov    %eax,0x6ffc
  102aad:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
  102ab4:	00 
  102ab5:	0f b6 03             	movzbl (%ebx),%eax
  102ab8:	89 04 24             	mov    %eax,(%esp)
  102abb:	e8 60 fc ff ff       	call   102720 <lapicstartap>
  102ac0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
  102ac6:	85 c0                	test   %eax,%eax
  102ac8:	74 f6                	je     102ac0 <mainc+0xd0>
  102aca:	69 05 a0 40 11 00 bc 	imul   $0xbc,0x1140a0,%eax
  102ad1:	00 00 00 
  102ad4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
  102ada:	05 c0 3a 11 00       	add    $0x113ac0,%eax
  102adf:	39 c3                	cmp    %eax,%ebx
  102ae1:	72 9d                	jb     102a80 <mainc+0x90>
  102ae3:	83 c4 14             	add    $0x14,%esp
  102ae6:	5b                   	pop    %ebx
  102ae7:	5d                   	pop    %ebp
  102ae8:	e9 93 fe ff ff       	jmp    102980 <mpmain>
  102aed:	e8 ee 2e 00 00       	call   1059e0 <timerinit>
  102af2:	e9 4b ff ff ff       	jmp    102a42 <mainc+0x52>
  102af7:	89 f6                	mov    %esi,%esi
  102af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102b00 <jkstack>:
  102b00:	55                   	push   %ebp
  102b01:	89 e5                	mov    %esp,%ebp
  102b03:	83 ec 18             	sub    $0x18,%esp
  102b06:	e8 e5 f9 ff ff       	call   1024f0 <kalloc>
  102b0b:	85 c0                	test   %eax,%eax
  102b0d:	74 19                	je     102b28 <jkstack+0x28>
  102b0f:	05 00 10 00 00       	add    $0x1000,%eax
  102b14:	89 c4                	mov    %eax,%esp
  102b16:	e8 d5 fe ff ff       	call   1029f0 <mainc>
  102b1b:	c7 04 24 01 76 10 00 	movl   $0x107601,(%esp)
  102b22:	e8 29 e0 ff ff       	call   100b50 <panic>
  102b27:	90                   	nop
  102b28:	c7 04 24 f8 75 10 00 	movl   $0x1075f8,(%esp)
  102b2f:	e8 1c e0 ff ff       	call   100b50 <panic>
  102b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00102b40 <main>:
  102b40:	55                   	push   %ebp
  102b41:	89 e5                	mov    %esp,%ebp
  102b43:	83 e4 f0             	and    $0xfffffff0,%esp
  102b46:	83 ec 10             	sub    $0x10,%esp
  102b49:	e8 d2 00 00 00       	call   102c20 <mpinit>
  102b4e:	e8 2d 00 00 00       	call   102b80 <mpbcpu>
  102b53:	89 04 24             	mov    %eax,(%esp)
  102b56:	e8 c5 fc ff ff       	call   102820 <lapicinit>
  102b5b:	e8 e0 44 00 00       	call   107040 <ksegment>
  102b60:	e8 eb 02 00 00       	call   102e50 <picinit>
  102b65:	e8 c6 f8 ff ff       	call   102430 <ioapicinit>
  102b6a:	e8 21 d9 ff ff       	call   100490 <consoleinit>
  102b6f:	90                   	nop
  102b70:	e8 9b 32 00 00       	call   105e10 <uartinit>
  102b75:	e8 26 fa ff ff       	call   1025a0 <kinit>
  102b7a:	e8 81 ff ff ff       	call   102b00 <jkstack>
  102b7f:	90                   	nop

00102b80 <mpbcpu>:
  102b80:	a1 24 93 10 00       	mov    0x109324,%eax
  102b85:	55                   	push   %ebp
  102b86:	89 e5                	mov    %esp,%ebp
  102b88:	5d                   	pop    %ebp
  102b89:	2d c0 3a 11 00       	sub    $0x113ac0,%eax
  102b8e:	c1 f8 02             	sar    $0x2,%eax
  102b91:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
  102b97:	c3                   	ret    
  102b98:	90                   	nop
  102b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102ba0 <mpsearch1>:
  102ba0:	55                   	push   %ebp
  102ba1:	89 e5                	mov    %esp,%ebp
  102ba3:	56                   	push   %esi
  102ba4:	89 d6                	mov    %edx,%esi
  102ba6:	53                   	push   %ebx
  102ba7:	89 c3                	mov    %eax,%ebx
  102ba9:	83 ec 10             	sub    $0x10,%esp
  102bac:	8d 34 33             	lea    (%ebx,%esi,1),%esi
  102baf:	89 54 24 08          	mov    %edx,0x8(%esp)
  102bb3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bb7:	c7 04 24 09 76 10 00 	movl   $0x107609,(%esp)
  102bbe:	e8 9d db ff ff       	call   100760 <cprintf>
  102bc3:	39 f3                	cmp    %esi,%ebx
  102bc5:	73 3a                	jae    102c01 <mpsearch1+0x61>
  102bc7:	90                   	nop
  102bc8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  102bcf:	00 
  102bd0:	c7 44 24 04 1c 76 10 	movl   $0x10761c,0x4(%esp)
  102bd7:	00 
  102bd8:	89 1c 24             	mov    %ebx,(%esp)
  102bdb:	e8 30 1b 00 00       	call   104710 <memcmp>
  102be0:	85 c0                	test   %eax,%eax
  102be2:	75 16                	jne    102bfa <mpsearch1+0x5a>
  102be4:	31 d2                	xor    %edx,%edx
  102be6:	66 90                	xchg   %ax,%ax
  102be8:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
  102bec:	83 c0 01             	add    $0x1,%eax
  102bef:	01 ca                	add    %ecx,%edx
  102bf1:	83 f8 10             	cmp    $0x10,%eax
  102bf4:	75 f2                	jne    102be8 <mpsearch1+0x48>
  102bf6:	84 d2                	test   %dl,%dl
  102bf8:	74 10                	je     102c0a <mpsearch1+0x6a>
  102bfa:	83 c3 10             	add    $0x10,%ebx
  102bfd:	39 de                	cmp    %ebx,%esi
  102bff:	77 c7                	ja     102bc8 <mpsearch1+0x28>
  102c01:	83 c4 10             	add    $0x10,%esp
  102c04:	31 c0                	xor    %eax,%eax
  102c06:	5b                   	pop    %ebx
  102c07:	5e                   	pop    %esi
  102c08:	5d                   	pop    %ebp
  102c09:	c3                   	ret    
  102c0a:	83 c4 10             	add    $0x10,%esp
  102c0d:	89 d8                	mov    %ebx,%eax
  102c0f:	5b                   	pop    %ebx
  102c10:	5e                   	pop    %esi
  102c11:	5d                   	pop    %ebp
  102c12:	c3                   	ret    
  102c13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102c20 <mpinit>:
  102c20:	55                   	push   %ebp
  102c21:	89 e5                	mov    %esp,%ebp
  102c23:	57                   	push   %edi
  102c24:	56                   	push   %esi
  102c25:	53                   	push   %ebx
  102c26:	83 ec 2c             	sub    $0x2c,%esp
  102c29:	0f b6 05 0f 04 00 00 	movzbl 0x40f,%eax
  102c30:	0f b6 15 0e 04 00 00 	movzbl 0x40e,%edx
  102c37:	c7 05 24 93 10 00 c0 	movl   $0x113ac0,0x109324
  102c3e:	3a 11 00 
  102c41:	c1 e0 08             	shl    $0x8,%eax
  102c44:	09 d0                	or     %edx,%eax
  102c46:	c1 e0 04             	shl    $0x4,%eax
  102c49:	85 c0                	test   %eax,%eax
  102c4b:	75 1b                	jne    102c68 <mpinit+0x48>
  102c4d:	0f b6 05 14 04 00 00 	movzbl 0x414,%eax
  102c54:	0f b6 15 13 04 00 00 	movzbl 0x413,%edx
  102c5b:	c1 e0 08             	shl    $0x8,%eax
  102c5e:	09 d0                	or     %edx,%eax
  102c60:	c1 e0 0a             	shl    $0xa,%eax
  102c63:	2d 00 04 00 00       	sub    $0x400,%eax
  102c68:	ba 00 04 00 00       	mov    $0x400,%edx
  102c6d:	e8 2e ff ff ff       	call   102ba0 <mpsearch1>
  102c72:	85 c0                	test   %eax,%eax
  102c74:	89 c3                	mov    %eax,%ebx
  102c76:	0f 84 54 01 00 00    	je     102dd0 <mpinit+0x1b0>
  102c7c:	8b 73 04             	mov    0x4(%ebx),%esi
  102c7f:	85 f6                	test   %esi,%esi
  102c81:	74 1c                	je     102c9f <mpinit+0x7f>
  102c83:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  102c8a:	00 
  102c8b:	c7 44 24 04 21 76 10 	movl   $0x107621,0x4(%esp)
  102c92:	00 
  102c93:	89 34 24             	mov    %esi,(%esp)
  102c96:	e8 75 1a 00 00       	call   104710 <memcmp>
  102c9b:	85 c0                	test   %eax,%eax
  102c9d:	74 09                	je     102ca8 <mpinit+0x88>
  102c9f:	83 c4 2c             	add    $0x2c,%esp
  102ca2:	5b                   	pop    %ebx
  102ca3:	5e                   	pop    %esi
  102ca4:	5f                   	pop    %edi
  102ca5:	5d                   	pop    %ebp
  102ca6:	c3                   	ret    
  102ca7:	90                   	nop
  102ca8:	0f b6 46 06          	movzbl 0x6(%esi),%eax
  102cac:	3c 04                	cmp    $0x4,%al
  102cae:	74 04                	je     102cb4 <mpinit+0x94>
  102cb0:	3c 01                	cmp    $0x1,%al
  102cb2:	75 eb                	jne    102c9f <mpinit+0x7f>
  102cb4:	0f b7 7e 04          	movzwl 0x4(%esi),%edi
  102cb8:	85 ff                	test   %edi,%edi
  102cba:	74 15                	je     102cd1 <mpinit+0xb1>
  102cbc:	31 d2                	xor    %edx,%edx
  102cbe:	31 c0                	xor    %eax,%eax
  102cc0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
  102cc4:	83 c0 01             	add    $0x1,%eax
  102cc7:	01 ca                	add    %ecx,%edx
  102cc9:	39 c7                	cmp    %eax,%edi
  102ccb:	7f f3                	jg     102cc0 <mpinit+0xa0>
  102ccd:	84 d2                	test   %dl,%dl
  102ccf:	75 ce                	jne    102c9f <mpinit+0x7f>
  102cd1:	c7 05 a4 3a 11 00 01 	movl   $0x1,0x113aa4
  102cd8:	00 00 00 
  102cdb:	8b 46 24             	mov    0x24(%esi),%eax
  102cde:	a3 98 3a 11 00       	mov    %eax,0x113a98
  102ce3:	0f b7 56 04          	movzwl 0x4(%esi),%edx
  102ce7:	8d 46 2c             	lea    0x2c(%esi),%eax
  102cea:	8d 14 16             	lea    (%esi,%edx,1),%edx
  102ced:	39 d0                	cmp    %edx,%eax
  102cef:	73 61                	jae    102d52 <mpinit+0x132>
  102cf1:	8b 0d 24 93 10 00    	mov    0x109324,%ecx
  102cf7:	89 de                	mov    %ebx,%esi
  102cf9:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  102cfc:	0f b6 08             	movzbl (%eax),%ecx
  102cff:	80 f9 04             	cmp    $0x4,%cl
  102d02:	76 2c                	jbe    102d30 <mpinit+0x110>
  102d04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d07:	0f b6 c9             	movzbl %cl,%ecx
  102d0a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  102d0e:	c7 04 24 48 76 10 00 	movl   $0x107648,(%esp)
  102d15:	a3 24 93 10 00       	mov    %eax,0x109324
  102d1a:	e8 41 da ff ff       	call   100760 <cprintf>
  102d1f:	c7 04 24 41 76 10 00 	movl   $0x107641,(%esp)
  102d26:	e8 25 de ff ff       	call   100b50 <panic>
  102d2b:	90                   	nop
  102d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102d30:	0f b6 c9             	movzbl %cl,%ecx
  102d33:	ff 24 8d 68 76 10 00 	jmp    *0x107668(,%ecx,4)
  102d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102d40:	83 c0 08             	add    $0x8,%eax
  102d43:	39 c2                	cmp    %eax,%edx
  102d45:	77 b5                	ja     102cfc <mpinit+0xdc>
  102d47:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  102d4a:	89 f3                	mov    %esi,%ebx
  102d4c:	89 0d 24 93 10 00    	mov    %ecx,0x109324
  102d52:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
  102d56:	0f 84 43 ff ff ff    	je     102c9f <mpinit+0x7f>
  102d5c:	ba 22 00 00 00       	mov    $0x22,%edx
  102d61:	b8 70 00 00 00       	mov    $0x70,%eax
  102d66:	ee                   	out    %al,(%dx)
  102d67:	b2 23                	mov    $0x23,%dl
  102d69:	ec                   	in     (%dx),%al
  102d6a:	83 c8 01             	or     $0x1,%eax
  102d6d:	ee                   	out    %al,(%dx)
  102d6e:	e9 2c ff ff ff       	jmp    102c9f <mpinit+0x7f>
  102d73:	90                   	nop
  102d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102d78:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
  102d7c:	8b 3d a0 40 11 00    	mov    0x1140a0,%edi
  102d82:	0f b6 cb             	movzbl %bl,%ecx
  102d85:	39 f9                	cmp    %edi,%ecx
  102d87:	75 68                	jne    102df1 <mpinit+0x1d1>
  102d89:	f6 40 03 02          	testb  $0x2,0x3(%eax)
  102d8d:	74 0f                	je     102d9e <mpinit+0x17e>
  102d8f:	69 f9 bc 00 00 00    	imul   $0xbc,%ecx,%edi
  102d95:	81 c7 c0 3a 11 00    	add    $0x113ac0,%edi
  102d9b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  102d9e:	69 f9 bc 00 00 00    	imul   $0xbc,%ecx,%edi
  102da4:	83 c1 01             	add    $0x1,%ecx
  102da7:	89 0d a0 40 11 00    	mov    %ecx,0x1140a0
  102dad:	83 c0 14             	add    $0x14,%eax
  102db0:	88 9f c0 3a 11 00    	mov    %bl,0x113ac0(%edi)
  102db6:	eb 8b                	jmp    102d43 <mpinit+0x123>
  102db8:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  102dbc:	83 c0 08             	add    $0x8,%eax
  102dbf:	88 0d a0 3a 11 00    	mov    %cl,0x113aa0
  102dc5:	e9 79 ff ff ff       	jmp    102d43 <mpinit+0x123>
  102dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102dd0:	ba 00 00 01 00       	mov    $0x10000,%edx
  102dd5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
  102dda:	e8 c1 fd ff ff       	call   102ba0 <mpsearch1>
  102ddf:	85 c0                	test   %eax,%eax
  102de1:	89 c3                	mov    %eax,%ebx
  102de3:	0f 85 93 fe ff ff    	jne    102c7c <mpinit+0x5c>
  102de9:	83 c4 2c             	add    $0x2c,%esp
  102dec:	5b                   	pop    %ebx
  102ded:	5e                   	pop    %esi
  102dee:	5f                   	pop    %edi
  102def:	5d                   	pop    %ebp
  102df0:	c3                   	ret    
  102df1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102df4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  102df8:	89 7c 24 04          	mov    %edi,0x4(%esp)
  102dfc:	c7 04 24 26 76 10 00 	movl   $0x107626,(%esp)
  102e03:	a3 24 93 10 00       	mov    %eax,0x109324
  102e08:	e8 53 d9 ff ff       	call   100760 <cprintf>
  102e0d:	c7 04 24 41 76 10 00 	movl   $0x107641,(%esp)
  102e14:	e8 37 dd ff ff       	call   100b50 <panic>
  102e19:	90                   	nop
  102e1a:	90                   	nop
  102e1b:	90                   	nop
  102e1c:	90                   	nop
  102e1d:	90                   	nop
  102e1e:	90                   	nop
  102e1f:	90                   	nop

00102e20 <picenable>:
  102e20:	55                   	push   %ebp
  102e21:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  102e26:	89 e5                	mov    %esp,%ebp
  102e28:	ba 21 00 00 00       	mov    $0x21,%edx
  102e2d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102e30:	d3 c0                	rol    %cl,%eax
  102e32:	66 23 05 e0 8d 10 00 	and    0x108de0,%ax
  102e39:	66 a3 e0 8d 10 00    	mov    %ax,0x108de0
  102e3f:	ee                   	out    %al,(%dx)
  102e40:	66 c1 e8 08          	shr    $0x8,%ax
  102e44:	b2 a1                	mov    $0xa1,%dl
  102e46:	ee                   	out    %al,(%dx)
  102e47:	5d                   	pop    %ebp
  102e48:	c3                   	ret    
  102e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102e50 <picinit>:
  102e50:	55                   	push   %ebp
  102e51:	b9 21 00 00 00       	mov    $0x21,%ecx
  102e56:	89 e5                	mov    %esp,%ebp
  102e58:	83 ec 0c             	sub    $0xc,%esp
  102e5b:	89 1c 24             	mov    %ebx,(%esp)
  102e5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102e63:	89 ca                	mov    %ecx,%edx
  102e65:	89 74 24 04          	mov    %esi,0x4(%esp)
  102e69:	89 7c 24 08          	mov    %edi,0x8(%esp)
  102e6d:	ee                   	out    %al,(%dx)
  102e6e:	bb a1 00 00 00       	mov    $0xa1,%ebx
  102e73:	89 da                	mov    %ebx,%edx
  102e75:	ee                   	out    %al,(%dx)
  102e76:	be 11 00 00 00       	mov    $0x11,%esi
  102e7b:	b2 20                	mov    $0x20,%dl
  102e7d:	89 f0                	mov    %esi,%eax
  102e7f:	ee                   	out    %al,(%dx)
  102e80:	b8 20 00 00 00       	mov    $0x20,%eax
  102e85:	89 ca                	mov    %ecx,%edx
  102e87:	ee                   	out    %al,(%dx)
  102e88:	b8 04 00 00 00       	mov    $0x4,%eax
  102e8d:	ee                   	out    %al,(%dx)
  102e8e:	bf 03 00 00 00       	mov    $0x3,%edi
  102e93:	89 f8                	mov    %edi,%eax
  102e95:	ee                   	out    %al,(%dx)
  102e96:	b1 a0                	mov    $0xa0,%cl
  102e98:	89 f0                	mov    %esi,%eax
  102e9a:	89 ca                	mov    %ecx,%edx
  102e9c:	ee                   	out    %al,(%dx)
  102e9d:	b8 28 00 00 00       	mov    $0x28,%eax
  102ea2:	89 da                	mov    %ebx,%edx
  102ea4:	ee                   	out    %al,(%dx)
  102ea5:	b8 02 00 00 00       	mov    $0x2,%eax
  102eaa:	ee                   	out    %al,(%dx)
  102eab:	89 f8                	mov    %edi,%eax
  102ead:	ee                   	out    %al,(%dx)
  102eae:	be 68 00 00 00       	mov    $0x68,%esi
  102eb3:	b2 20                	mov    $0x20,%dl
  102eb5:	89 f0                	mov    %esi,%eax
  102eb7:	ee                   	out    %al,(%dx)
  102eb8:	bb 0a 00 00 00       	mov    $0xa,%ebx
  102ebd:	89 d8                	mov    %ebx,%eax
  102ebf:	ee                   	out    %al,(%dx)
  102ec0:	89 f0                	mov    %esi,%eax
  102ec2:	89 ca                	mov    %ecx,%edx
  102ec4:	ee                   	out    %al,(%dx)
  102ec5:	89 d8                	mov    %ebx,%eax
  102ec7:	ee                   	out    %al,(%dx)
  102ec8:	0f b7 05 e0 8d 10 00 	movzwl 0x108de0,%eax
  102ecf:	66 83 f8 ff          	cmp    $0xffffffff,%ax
  102ed3:	74 0a                	je     102edf <picinit+0x8f>
  102ed5:	b2 21                	mov    $0x21,%dl
  102ed7:	ee                   	out    %al,(%dx)
  102ed8:	66 c1 e8 08          	shr    $0x8,%ax
  102edc:	b2 a1                	mov    $0xa1,%dl
  102ede:	ee                   	out    %al,(%dx)
  102edf:	8b 1c 24             	mov    (%esp),%ebx
  102ee2:	8b 74 24 04          	mov    0x4(%esp),%esi
  102ee6:	8b 7c 24 08          	mov    0x8(%esp),%edi
  102eea:	89 ec                	mov    %ebp,%esp
  102eec:	5d                   	pop    %ebp
  102eed:	c3                   	ret    
  102eee:	90                   	nop
  102eef:	90                   	nop

00102ef0 <piperead>:
  102ef0:	55                   	push   %ebp
  102ef1:	89 e5                	mov    %esp,%ebp
  102ef3:	57                   	push   %edi
  102ef4:	56                   	push   %esi
  102ef5:	53                   	push   %ebx
  102ef6:	83 ec 1c             	sub    $0x1c,%esp
  102ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  102efc:	8b 7d 10             	mov    0x10(%ebp),%edi
  102eff:	89 1c 24             	mov    %ebx,(%esp)
  102f02:	e8 49 17 00 00       	call   104650 <acquire>
  102f07:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  102f0d:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f13:	75 58                	jne    102f6d <piperead+0x7d>
  102f15:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
  102f1b:	85 f6                	test   %esi,%esi
  102f1d:	74 4e                	je     102f6d <piperead+0x7d>
  102f1f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  102f25:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
  102f2b:	8b 48 4c             	mov    0x4c(%eax),%ecx
  102f2e:	85 c9                	test   %ecx,%ecx
  102f30:	74 21                	je     102f53 <piperead+0x63>
  102f32:	e9 99 00 00 00       	jmp    102fd0 <piperead+0xe0>
  102f37:	90                   	nop
  102f38:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
  102f3e:	85 c0                	test   %eax,%eax
  102f40:	74 2b                	je     102f6d <piperead+0x7d>
  102f42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  102f48:	8b 50 4c             	mov    0x4c(%eax),%edx
  102f4b:	85 d2                	test   %edx,%edx
  102f4d:	0f 85 7d 00 00 00    	jne    102fd0 <piperead+0xe0>
  102f53:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  102f57:	89 34 24             	mov    %esi,(%esp)
  102f5a:	e8 c1 04 00 00       	call   103420 <sleep>
  102f5f:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  102f65:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f6b:	74 cb                	je     102f38 <piperead+0x48>
  102f6d:	85 ff                	test   %edi,%edi
  102f6f:	7e 76                	jle    102fe7 <piperead+0xf7>
  102f71:	31 f6                	xor    %esi,%esi
  102f73:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f79:	75 0d                	jne    102f88 <piperead+0x98>
  102f7b:	eb 6a                	jmp    102fe7 <piperead+0xf7>
  102f7d:	8d 76 00             	lea    0x0(%esi),%esi
  102f80:	39 93 38 02 00 00    	cmp    %edx,0x238(%ebx)
  102f86:	74 22                	je     102faa <piperead+0xba>
  102f88:	89 d0                	mov    %edx,%eax
  102f8a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102f8d:	83 c2 01             	add    $0x1,%edx
  102f90:	25 ff 01 00 00       	and    $0x1ff,%eax
  102f95:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
  102f9a:	88 04 31             	mov    %al,(%ecx,%esi,1)
  102f9d:	83 c6 01             	add    $0x1,%esi
  102fa0:	39 f7                	cmp    %esi,%edi
  102fa2:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
  102fa8:	7f d6                	jg     102f80 <piperead+0x90>
  102faa:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  102fb0:	89 04 24             	mov    %eax,(%esp)
  102fb3:	e8 38 03 00 00       	call   1032f0 <wakeup>
  102fb8:	89 1c 24             	mov    %ebx,(%esp)
  102fbb:	e8 40 16 00 00       	call   104600 <release>
  102fc0:	83 c4 1c             	add    $0x1c,%esp
  102fc3:	89 f0                	mov    %esi,%eax
  102fc5:	5b                   	pop    %ebx
  102fc6:	5e                   	pop    %esi
  102fc7:	5f                   	pop    %edi
  102fc8:	5d                   	pop    %ebp
  102fc9:	c3                   	ret    
  102fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102fd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
  102fd5:	89 1c 24             	mov    %ebx,(%esp)
  102fd8:	e8 23 16 00 00       	call   104600 <release>
  102fdd:	83 c4 1c             	add    $0x1c,%esp
  102fe0:	89 f0                	mov    %esi,%eax
  102fe2:	5b                   	pop    %ebx
  102fe3:	5e                   	pop    %esi
  102fe4:	5f                   	pop    %edi
  102fe5:	5d                   	pop    %ebp
  102fe6:	c3                   	ret    
  102fe7:	31 f6                	xor    %esi,%esi
  102fe9:	eb bf                	jmp    102faa <piperead+0xba>
  102feb:	90                   	nop
  102fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00102ff0 <pipewrite>:
  102ff0:	55                   	push   %ebp
  102ff1:	89 e5                	mov    %esp,%ebp
  102ff3:	57                   	push   %edi
  102ff4:	56                   	push   %esi
  102ff5:	53                   	push   %ebx
  102ff6:	83 ec 3c             	sub    $0x3c,%esp
  102ff9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  102ffc:	89 1c 24             	mov    %ebx,(%esp)
  102fff:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
  103005:	e8 46 16 00 00       	call   104650 <acquire>
  10300a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10300d:	85 c9                	test   %ecx,%ecx
  10300f:	0f 8e 8d 00 00 00    	jle    1030a2 <pipewrite+0xb2>
  103015:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
  10301b:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
  103021:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  103028:	eb 37                	jmp    103061 <pipewrite+0x71>
  10302a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103030:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
  103036:	85 c0                	test   %eax,%eax
  103038:	74 7e                	je     1030b8 <pipewrite+0xc8>
  10303a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103040:	8b 50 4c             	mov    0x4c(%eax),%edx
  103043:	85 d2                	test   %edx,%edx
  103045:	75 71                	jne    1030b8 <pipewrite+0xc8>
  103047:	89 34 24             	mov    %esi,(%esp)
  10304a:	e8 a1 02 00 00       	call   1032f0 <wakeup>
  10304f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  103053:	89 3c 24             	mov    %edi,(%esp)
  103056:	e8 c5 03 00 00       	call   103420 <sleep>
  10305b:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
  103061:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  103067:	81 c2 00 02 00 00    	add    $0x200,%edx
  10306d:	39 d0                	cmp    %edx,%eax
  10306f:	74 bf                	je     103030 <pipewrite+0x40>
  103071:	89 c2                	mov    %eax,%edx
  103073:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  103076:	83 c0 01             	add    $0x1,%eax
  103079:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
  10307f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103082:	8b 55 0c             	mov    0xc(%ebp),%edx
  103085:	0f b6 0c 0a          	movzbl (%edx,%ecx,1),%ecx
  103089:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10308c:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  103090:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
  103096:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  10309a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10309d:	39 4d 10             	cmp    %ecx,0x10(%ebp)
  1030a0:	7f bf                	jg     103061 <pipewrite+0x71>
  1030a2:	89 34 24             	mov    %esi,(%esp)
  1030a5:	e8 46 02 00 00       	call   1032f0 <wakeup>
  1030aa:	89 1c 24             	mov    %ebx,(%esp)
  1030ad:	e8 4e 15 00 00       	call   104600 <release>
  1030b2:	eb 13                	jmp    1030c7 <pipewrite+0xd7>
  1030b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1030b8:	89 1c 24             	mov    %ebx,(%esp)
  1030bb:	e8 40 15 00 00       	call   104600 <release>
  1030c0:	c7 45 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebp)
  1030c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1030ca:	83 c4 3c             	add    $0x3c,%esp
  1030cd:	5b                   	pop    %ebx
  1030ce:	5e                   	pop    %esi
  1030cf:	5f                   	pop    %edi
  1030d0:	5d                   	pop    %ebp
  1030d1:	c3                   	ret    
  1030d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1030d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001030e0 <pipeclose>:
  1030e0:	55                   	push   %ebp
  1030e1:	89 e5                	mov    %esp,%ebp
  1030e3:	83 ec 18             	sub    $0x18,%esp
  1030e6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  1030e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1030ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  1030ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  1030f2:	89 1c 24             	mov    %ebx,(%esp)
  1030f5:	e8 56 15 00 00       	call   104650 <acquire>
  1030fa:	85 f6                	test   %esi,%esi
  1030fc:	74 42                	je     103140 <pipeclose+0x60>
  1030fe:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
  103104:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
  10310b:	00 00 00 
  10310e:	89 04 24             	mov    %eax,(%esp)
  103111:	e8 da 01 00 00       	call   1032f0 <wakeup>
  103116:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
  10311c:	85 c0                	test   %eax,%eax
  10311e:	75 0a                	jne    10312a <pipeclose+0x4a>
  103120:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
  103126:	85 f6                	test   %esi,%esi
  103128:	74 36                	je     103160 <pipeclose+0x80>
  10312a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10312d:	8b 75 fc             	mov    -0x4(%ebp),%esi
  103130:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  103133:	89 ec                	mov    %ebp,%esp
  103135:	5d                   	pop    %ebp
  103136:	e9 c5 14 00 00       	jmp    104600 <release>
  10313b:	90                   	nop
  10313c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103140:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  103146:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
  10314d:	00 00 00 
  103150:	89 04 24             	mov    %eax,(%esp)
  103153:	e8 98 01 00 00       	call   1032f0 <wakeup>
  103158:	eb bc                	jmp    103116 <pipeclose+0x36>
  10315a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103160:	89 1c 24             	mov    %ebx,(%esp)
  103163:	e8 98 14 00 00       	call   104600 <release>
  103168:	8b 75 fc             	mov    -0x4(%ebp),%esi
  10316b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  10316e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  103171:	89 ec                	mov    %ebp,%esp
  103173:	5d                   	pop    %ebp
  103174:	e9 b7 f3 ff ff       	jmp    102530 <kfree>
  103179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103180 <pipealloc>:
  103180:	55                   	push   %ebp
  103181:	89 e5                	mov    %esp,%ebp
  103183:	57                   	push   %edi
  103184:	56                   	push   %esi
  103185:	53                   	push   %ebx
  103186:	83 ec 1c             	sub    $0x1c,%esp
  103189:	8b 75 08             	mov    0x8(%ebp),%esi
  10318c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10318f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  103195:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  10319b:	e8 e0 df ff ff       	call   101180 <filealloc>
  1031a0:	85 c0                	test   %eax,%eax
  1031a2:	89 06                	mov    %eax,(%esi)
  1031a4:	0f 84 9c 00 00 00    	je     103246 <pipealloc+0xc6>
  1031aa:	e8 d1 df ff ff       	call   101180 <filealloc>
  1031af:	85 c0                	test   %eax,%eax
  1031b1:	89 03                	mov    %eax,(%ebx)
  1031b3:	0f 84 7f 00 00 00    	je     103238 <pipealloc+0xb8>
  1031b9:	e8 32 f3 ff ff       	call   1024f0 <kalloc>
  1031be:	85 c0                	test   %eax,%eax
  1031c0:	89 c7                	mov    %eax,%edi
  1031c2:	74 74                	je     103238 <pipealloc+0xb8>
  1031c4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
  1031cb:	00 00 00 
  1031ce:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
  1031d5:	00 00 00 
  1031d8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
  1031df:	00 00 00 
  1031e2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
  1031e9:	00 00 00 
  1031ec:	89 04 24             	mov    %eax,(%esp)
  1031ef:	c7 44 24 04 7c 76 10 	movl   $0x10767c,0x4(%esp)
  1031f6:	00 
  1031f7:	e8 c4 12 00 00       	call   1044c0 <initlock>
  1031fc:	8b 06                	mov    (%esi),%eax
  1031fe:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  103204:	8b 06                	mov    (%esi),%eax
  103206:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  10320a:	8b 06                	mov    (%esi),%eax
  10320c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  103210:	8b 06                	mov    (%esi),%eax
  103212:	89 78 0c             	mov    %edi,0xc(%eax)
  103215:	8b 03                	mov    (%ebx),%eax
  103217:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  10321d:	8b 03                	mov    (%ebx),%eax
  10321f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  103223:	8b 03                	mov    (%ebx),%eax
  103225:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  103229:	8b 03                	mov    (%ebx),%eax
  10322b:	89 78 0c             	mov    %edi,0xc(%eax)
  10322e:	31 c0                	xor    %eax,%eax
  103230:	83 c4 1c             	add    $0x1c,%esp
  103233:	5b                   	pop    %ebx
  103234:	5e                   	pop    %esi
  103235:	5f                   	pop    %edi
  103236:	5d                   	pop    %ebp
  103237:	c3                   	ret    
  103238:	8b 06                	mov    (%esi),%eax
  10323a:	85 c0                	test   %eax,%eax
  10323c:	74 08                	je     103246 <pipealloc+0xc6>
  10323e:	89 04 24             	mov    %eax,(%esp)
  103241:	e8 ba df ff ff       	call   101200 <fileclose>
  103246:	8b 13                	mov    (%ebx),%edx
  103248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10324d:	85 d2                	test   %edx,%edx
  10324f:	74 df                	je     103230 <pipealloc+0xb0>
  103251:	89 14 24             	mov    %edx,(%esp)
  103254:	e8 a7 df ff ff       	call   101200 <fileclose>
  103259:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10325e:	eb d0                	jmp    103230 <pipealloc+0xb0>

00103260 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).

int
kill(int pid) {
  103260:	55                   	push   %ebp
  103261:	89 e5                	mov    %esp,%ebp
  103263:	53                   	push   %ebx
  103264:	83 ec 14             	sub    $0x14,%esp
  103267:	8b 5d 08             	mov    0x8(%ebp),%ebx
    struct proc *p;

    acquire(&ptable.lock);
  10326a:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103271:	e8 da 13 00 00       	call   104650 <acquire>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
  103276:	8b 15 8c 41 11 00    	mov    0x11418c,%edx
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).

int
kill(int pid) {
  10327c:	b8 c0 41 11 00       	mov    $0x1141c0,%eax
    struct proc *p;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
  103281:	39 da                	cmp    %ebx,%edx
  103283:	75 0f                	jne    103294 <kill+0x34>
  103285:	eb 60                	jmp    1032e7 <kill+0x87>
  103287:	90                   	nop
int
kill(int pid) {
    struct proc *p;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103288:	05 8c 00 00 00       	add    $0x8c,%eax
  10328d:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103292:	74 3c                	je     1032d0 <kill+0x70>
        if (p->pid == pid) {
  103294:	8b 50 58             	mov    0x58(%eax),%edx
  103297:	39 da                	cmp    %ebx,%edx
  103299:	75 ed                	jne    103288 <kill+0x28>
            p->killed = 1;
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
  10329b:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
    struct proc *p;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
            p->killed = 1;
  10329f:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
  1032a6:	74 18                	je     1032c0 <kill+0x60>
                p->state = RUNNABLE;
            release(&ptable.lock);
  1032a8:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1032af:	e8 4c 13 00 00       	call   104600 <release>
            return 0;
        }
    }
    release(&ptable.lock);
    return -1;
}
  1032b4:	83 c4 14             	add    $0x14,%esp
        if (p->pid == pid) {
            p->killed = 1;
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
                p->state = RUNNABLE;
            release(&ptable.lock);
  1032b7:	31 c0                	xor    %eax,%eax
            return 0;
        }
    }
    release(&ptable.lock);
    return -1;
}
  1032b9:	5b                   	pop    %ebx
  1032ba:	5d                   	pop    %ebp
  1032bb:	c3                   	ret    
  1032bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
            p->killed = 1;
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
                p->state = RUNNABLE;
  1032c0:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
  1032c7:	eb df                	jmp    1032a8 <kill+0x48>
  1032c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            release(&ptable.lock);
            return 0;
        }
    }
    release(&ptable.lock);
  1032d0:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1032d7:	e8 24 13 00 00       	call   104600 <release>
    return -1;
}
  1032dc:	83 c4 14             	add    $0x14,%esp
                p->state = RUNNABLE;
            release(&ptable.lock);
            return 0;
        }
    }
    release(&ptable.lock);
  1032df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
}
  1032e4:	5b                   	pop    %ebx
  1032e5:	5d                   	pop    %ebp
  1032e6:	c3                   	ret    
kill(int pid) {
    struct proc *p;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
  1032e7:	b8 34 41 11 00       	mov    $0x114134,%eax
  1032ec:	eb ad                	jmp    10329b <kill+0x3b>
  1032ee:	66 90                	xchg   %ax,%ax

001032f0 <wakeup>:
}

// Wake up all processes sleeping on chan.

void
wakeup(void *chan) {
  1032f0:	55                   	push   %ebp
  1032f1:	89 e5                	mov    %esp,%ebp
  1032f3:	53                   	push   %ebx
  1032f4:	83 ec 14             	sub    $0x14,%esp
  1032f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    acquire(&ptable.lock);
  1032fa:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103301:	e8 4a 13 00 00       	call   104650 <acquire>
}

// Wake up all processes sleeping on chan.

void
wakeup(void *chan) {
  103306:	b8 34 41 11 00       	mov    $0x114134,%eax
  10330b:	eb 0f                	jmp    10331c <wakeup+0x2c>
  10330d:	8d 76 00             	lea    0x0(%esi),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103310:	05 8c 00 00 00       	add    $0x8c,%eax
  103315:	3d 34 64 11 00       	cmp    $0x116434,%eax
  10331a:	74 24                	je     103340 <wakeup+0x50>
        if (p->state == SLEEPING && p->chan == chan)
  10331c:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103320:	75 ee                	jne    103310 <wakeup+0x20>
  103322:	3b 58 68             	cmp    0x68(%eax),%ebx
  103325:	75 e9                	jne    103310 <wakeup+0x20>
            p->state = RUNNABLE;
  103327:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  10332e:	05 8c 00 00 00       	add    $0x8c,%eax
  103333:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103338:	75 e2                	jne    10331c <wakeup+0x2c>
  10333a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

void
wakeup(void *chan) {
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
  103340:	c7 45 08 00 41 11 00 	movl   $0x114100,0x8(%ebp)
}
  103347:	83 c4 14             	add    $0x14,%esp
  10334a:	5b                   	pop    %ebx
  10334b:	5d                   	pop    %ebp

void
wakeup(void *chan) {
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
  10334c:	e9 af 12 00 00       	jmp    104600 <release>
  103351:	eb 0d                	jmp    103360 <forkret>
  103353:	90                   	nop
  103354:	90                   	nop
  103355:	90                   	nop
  103356:	90                   	nop
  103357:	90                   	nop
  103358:	90                   	nop
  103359:	90                   	nop
  10335a:	90                   	nop
  10335b:	90                   	nop
  10335c:	90                   	nop
  10335d:	90                   	nop
  10335e:	90                   	nop
  10335f:	90                   	nop

00103360 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.

void
forkret(void) {
  103360:	55                   	push   %ebp
  103361:	89 e5                	mov    %esp,%ebp
  103363:	83 ec 18             	sub    $0x18,%esp
    // Still holding ptable.lock from scheduler.
    release(&ptable.lock);
  103366:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10336d:	e8 8e 12 00 00       	call   104600 <release>

    // Return to "caller", actually trapret (see allocproc).
}
  103372:	c9                   	leave  
  103373:	c3                   	ret    
  103374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10337a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00103380 <sched>:

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.

void
sched(void) {
  103380:	55                   	push   %ebp
  103381:	89 e5                	mov    %esp,%ebp
  103383:	53                   	push   %ebx
  103384:	83 ec 14             	sub    $0x14,%esp
    int intena;

    if (!holding(&ptable.lock))
  103387:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10338e:	e8 ad 11 00 00       	call   104540 <holding>
  103393:	85 c0                	test   %eax,%eax
  103395:	74 4d                	je     1033e4 <sched+0x64>
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
  103397:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  10339d:	83 b8 ac 00 00 00 01 	cmpl   $0x1,0xac(%eax)
  1033a4:	75 62                	jne    103408 <sched+0x88>
        panic("sched locks");
    if (proc->state == RUNNING)
  1033a6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1033ad:	83 7a 54 04          	cmpl   $0x4,0x54(%edx)
  1033b1:	74 49                	je     1033fc <sched+0x7c>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  1033b3:	9c                   	pushf  
  1033b4:	59                   	pop    %ecx
        panic("sched running");
    if (readeflags() & FL_IF)
  1033b5:	80 e5 02             	and    $0x2,%ch
  1033b8:	75 36                	jne    1033f0 <sched+0x70>
        panic("sched interruptible");
    intena = cpu->intena;
  1033ba:	8b 98 b0 00 00 00    	mov    0xb0(%eax),%ebx
    swtch(&proc->context, cpu->scheduler);
  1033c0:	83 c2 64             	add    $0x64,%edx
  1033c3:	8b 40 04             	mov    0x4(%eax),%eax
  1033c6:	89 14 24             	mov    %edx,(%esp)
  1033c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033cd:	e8 1a 15 00 00       	call   1048ec <swtch>
    cpu->intena = intena;
  1033d2:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1033d8:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
  1033de:	83 c4 14             	add    $0x14,%esp
  1033e1:	5b                   	pop    %ebx
  1033e2:	5d                   	pop    %ebp
  1033e3:	c3                   	ret    
void
sched(void) {
    int intena;

    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
  1033e4:	c7 04 24 81 76 10 00 	movl   $0x107681,(%esp)
  1033eb:	e8 60 d7 ff ff       	call   100b50 <panic>
    if (cpu->ncli != 1)
        panic("sched locks");
    if (proc->state == RUNNING)
        panic("sched running");
    if (readeflags() & FL_IF)
        panic("sched interruptible");
  1033f0:	c7 04 24 ad 76 10 00 	movl   $0x1076ad,(%esp)
  1033f7:	e8 54 d7 ff ff       	call   100b50 <panic>
    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
        panic("sched locks");
    if (proc->state == RUNNING)
        panic("sched running");
  1033fc:	c7 04 24 9f 76 10 00 	movl   $0x10769f,(%esp)
  103403:	e8 48 d7 ff ff       	call   100b50 <panic>
    int intena;

    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
        panic("sched locks");
  103408:	c7 04 24 93 76 10 00 	movl   $0x107693,(%esp)
  10340f:	e8 3c d7 ff ff       	call   100b50 <panic>
  103414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10341a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00103420 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.

void
sleep(void *chan, struct spinlock *lk) {
  103420:	55                   	push   %ebp
  103421:	89 e5                	mov    %esp,%ebp
  103423:	56                   	push   %esi
  103424:	53                   	push   %ebx
  103425:	83 ec 10             	sub    $0x10,%esp
    if (proc == 0)
  103428:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.

void
sleep(void *chan, struct spinlock *lk) {
  10342e:	8b 75 08             	mov    0x8(%ebp),%esi
  103431:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    if (proc == 0)
  103434:	85 c0                	test   %eax,%eax
  103436:	0f 84 a1 00 00 00    	je     1034dd <sleep+0xbd>
        panic("sleep");

    if (lk == 0)
  10343c:	85 db                	test   %ebx,%ebx
  10343e:	0f 84 8d 00 00 00    	je     1034d1 <sleep+0xb1>
    // change p->state and then call sched.
    // Once we hold ptable.lock, we can be
    // guaranteed that we won't miss any wakeup
    // (wakeup runs with ptable.lock locked),
    // so it's okay to release lk.
    if (lk != &ptable.lock) { //DOC: sleeplock0
  103444:	81 fb 00 41 11 00    	cmp    $0x114100,%ebx
  10344a:	74 5c                	je     1034a8 <sleep+0x88>
        acquire(&ptable.lock); //DOC: sleeplock1
  10344c:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103453:	e8 f8 11 00 00       	call   104650 <acquire>
        release(lk);
  103458:	89 1c 24             	mov    %ebx,(%esp)
  10345b:	e8 a0 11 00 00       	call   104600 <release>
    }

    // Go to sleep.
    proc->chan = chan;
  103460:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103466:	89 70 68             	mov    %esi,0x68(%eax)
    proc->state = SLEEPING;
  103469:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10346f:	c7 40 54 02 00 00 00 	movl   $0x2,0x54(%eax)
    sched();
  103476:	e8 05 ff ff ff       	call   103380 <sched>

    // Tidy up.
    proc->chan = 0;
  10347b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103481:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

    // Reacquire original lock.
    if (lk != &ptable.lock) { //DOC: sleeplock2
        release(&ptable.lock);
  103488:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10348f:	e8 6c 11 00 00       	call   104600 <release>
        acquire(lk);
  103494:	89 5d 08             	mov    %ebx,0x8(%ebp)
    }
}
  103497:	83 c4 10             	add    $0x10,%esp
  10349a:	5b                   	pop    %ebx
  10349b:	5e                   	pop    %esi
  10349c:	5d                   	pop    %ebp
    proc->chan = 0;

    // Reacquire original lock.
    if (lk != &ptable.lock) { //DOC: sleeplock2
        release(&ptable.lock);
        acquire(lk);
  10349d:	e9 ae 11 00 00       	jmp    104650 <acquire>
  1034a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        acquire(&ptable.lock); //DOC: sleeplock1
        release(lk);
    }

    // Go to sleep.
    proc->chan = chan;
  1034a8:	89 70 68             	mov    %esi,0x68(%eax)
    proc->state = SLEEPING;
  1034ab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1034b1:	c7 40 54 02 00 00 00 	movl   $0x2,0x54(%eax)
    sched();
  1034b8:	e8 c3 fe ff ff       	call   103380 <sched>

    // Tidy up.
    proc->chan = 0;
  1034bd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1034c3:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
    // Reacquire original lock.
    if (lk != &ptable.lock) { //DOC: sleeplock2
        release(&ptable.lock);
        acquire(lk);
    }
}
  1034ca:	83 c4 10             	add    $0x10,%esp
  1034cd:	5b                   	pop    %ebx
  1034ce:	5e                   	pop    %esi
  1034cf:	5d                   	pop    %ebp
  1034d0:	c3                   	ret    
sleep(void *chan, struct spinlock *lk) {
    if (proc == 0)
        panic("sleep");

    if (lk == 0)
        panic("sleep without lk");
  1034d1:	c7 04 24 c7 76 10 00 	movl   $0x1076c7,(%esp)
  1034d8:	e8 73 d6 ff ff       	call   100b50 <panic>
// Reacquires lock when awakened.

void
sleep(void *chan, struct spinlock *lk) {
    if (proc == 0)
        panic("sleep");
  1034dd:	c7 04 24 c1 76 10 00 	movl   $0x1076c1,(%esp)
  1034e4:	e8 67 d6 ff ff       	call   100b50 <panic>
  1034e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001034f0 <yield>:
}

// Give up the CPU for one scheduling round.

void
yield(void) {
  1034f0:	55                   	push   %ebp
  1034f1:	89 e5                	mov    %esp,%ebp
  1034f3:	83 ec 18             	sub    $0x18,%esp
    acquire(&ptable.lock); //DOC: yieldlock
  1034f6:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1034fd:	e8 4e 11 00 00       	call   104650 <acquire>
    proc->state = RUNNABLE;
  103502:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103508:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
    sched();
  10350f:	e8 6c fe ff ff       	call   103380 <sched>
    release(&ptable.lock);
  103514:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10351b:	e8 e0 10 00 00       	call   104600 <release>
}
  103520:	c9                   	leave  
  103521:	c3                   	ret    
  103522:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103530 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.

void
scheduler(void) {
  103530:	55                   	push   %ebp
  103531:	89 e5                	mov    %esp,%ebp
  103533:	53                   	push   %ebx
  103534:	83 ec 14             	sub    $0x14,%esp
  103537:	90                   	nop
}

static inline void
sti(void)
{
  asm volatile("sti");
  103538:	fb                   	sti    
  103539:	bb 34 41 11 00       	mov    $0x114134,%ebx
    for (;;) {
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
  10353e:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103545:	e8 06 11 00 00       	call   104650 <acquire>
  10354a:	eb 12                	jmp    10355e <scheduler+0x2e>
  10354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103550:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  103556:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  10355c:	74 5a                	je     1035b8 <scheduler+0x88>
            if (p->state != RUNNABLE)
  10355e:	83 7b 54 03          	cmpl   $0x3,0x54(%ebx)
  103562:	75 ec                	jne    103550 <scheduler+0x20>
                continue;

            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
  103564:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
            switchuvm(p);
  10356b:	89 1c 24             	mov    %ebx,(%esp)
  10356e:	e8 1d 3a 00 00       	call   106f90 <switchuvm>
            p->state = RUNNING;
            swtch(&cpu->scheduler, proc->context);
  103573:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
            // Switch to chosen process.  It is the process's job
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
            switchuvm(p);
            p->state = RUNNING;
  103579:	c7 43 54 04 00 00 00 	movl   $0x4,0x54(%ebx)
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103580:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
            // to release ptable.lock and then reacquire it
            // before jumping back to us.
            proc = p;
            switchuvm(p);
            p->state = RUNNING;
            swtch(&cpu->scheduler, proc->context);
  103586:	8b 40 64             	mov    0x64(%eax),%eax
  103589:	89 44 24 04          	mov    %eax,0x4(%esp)
  10358d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  103593:	83 c0 04             	add    $0x4,%eax
  103596:	89 04 24             	mov    %eax,(%esp)
  103599:	e8 4e 13 00 00       	call   1048ec <swtch>
            switchkvm();
  10359e:	e8 bd 33 00 00       	call   106960 <switchkvm>
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  1035a3:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
            swtch(&cpu->scheduler, proc->context);
            switchkvm();

            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
  1035a9:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
  1035b0:	00 00 00 00 
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  1035b4:	75 a8                	jne    10355e <scheduler+0x2e>
  1035b6:	66 90                	xchg   %ax,%ax

            // Process is done running for now.
            // It should have changed its p->state before coming back.
            proc = 0;
        }
        release(&ptable.lock);
  1035b8:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1035bf:	e8 3c 10 00 00       	call   104600 <release>

    }
  1035c4:	e9 6f ff ff ff       	jmp    103538 <scheduler+0x8>
  1035c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001035d0 <thread_join>:
        sleep(proc, &ptable.lock); //DOC: wait-sleep
    }
}

int
thread_join(int thread_id, void** ret_val) {
  1035d0:	55                   	push   %ebp
  1035d1:	89 e5                	mov    %esp,%ebp
  1035d3:	57                   	push   %edi
  1035d4:	56                   	push   %esi
  1035d5:	53                   	push   %ebx
    struct proc *p;
    int exists;

    acquire(&ptable.lock);
  1035d6:	bb 34 41 11 00       	mov    $0x114134,%ebx
        sleep(proc, &ptable.lock); //DOC: wait-sleep
    }
}

int
thread_join(int thread_id, void** ret_val) {
  1035db:	83 ec 1c             	sub    $0x1c,%esp
  1035de:	8b 75 08             	mov    0x8(%ebp),%esi
  1035e1:	8b 7d 0c             	mov    0xc(%ebp),%edi
    struct proc *p;
    int exists;

    acquire(&ptable.lock);
  1035e4:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1035eb:	e8 60 10 00 00       	call   104650 <acquire>
  1035f0:	31 c0                	xor    %eax,%eax
  1035f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  1035f8:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  1035fe:	72 37                	jb     103637 <thread_join+0x67>
                release(&ptable.lock);
                return 0;
            }
        }
        //if theres no such tid or the process was killed
        if (!exists || proc->parent->killed) {
  103600:	85 c0                	test   %eax,%eax
  103602:	0f 84 80 00 00 00    	je     103688 <thread_join+0xb8>
  103608:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10360e:	8b 50 5c             	mov    0x5c(%eax),%edx
  103611:	8b 52 4c             	mov    0x4c(%edx),%edx
  103614:	85 d2                	test   %edx,%edx
  103616:	75 70                	jne    103688 <thread_join+0xb8>
            release(&ptable.lock);
            return -1;
        }
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
  103618:	bb 34 41 11 00       	mov    $0x114134,%ebx
  10361d:	89 04 24             	mov    %eax,(%esp)
  103620:	c7 44 24 04 00 41 11 	movl   $0x114100,0x4(%esp)
  103627:	00 
  103628:	e8 f3 fd ff ff       	call   103420 <sleep>
  10362d:	31 c0                	xor    %eax,%eax

    acquire(&ptable.lock);
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  10362f:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103635:	73 c9                	jae    103600 <thread_join+0x30>
            if (p->tid != thread_id) {// || ((p->parent != proc) && (p->parent != proc->parent))) {
  103637:	8b 53 7c             	mov    0x7c(%ebx),%edx
  10363a:	39 f2                	cmp    %esi,%edx
  10363c:	74 0a                	je     103648 <thread_join+0x78>

    acquire(&ptable.lock);
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  10363e:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  103644:	eb b2                	jmp    1035f8 <thread_join+0x28>
  103646:	66 90                	xchg   %ax,%ax
            if (p->tid != thread_id) {// || ((p->parent != proc) && (p->parent != proc->parent))) {
                continue;
            } else
                //cprintf("nice one\n");

                if (p->joinedthread == 0) {
  103648:	8b 83 80 00 00 00    	mov    0x80(%ebx),%eax
  10364e:	85 c0                	test   %eax,%eax
  103650:	75 26                	jne    103678 <thread_join+0xa8>
                p->joinedthread = proc;
  103652:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103658:	89 83 80 00 00 00    	mov    %eax,0x80(%ebx)
                    return -1;
                }
            }

            exists = 1;
	    *(ret_val) = p->ret_val;
  10365e:	8b 83 84 00 00 00    	mov    0x84(%ebx),%eax
  103664:	89 07                	mov    %eax,(%edi)
            if (p->state == ZOMBIE) { //if thread already exited
  103666:	83 7b 54 05          	cmpl   $0x5,0x54(%ebx)
  10366a:	74 35                	je     1036a1 <thread_join+0xd1>
                p->pid = 0;
                p->state = UNUSED;
                p->joinedthread = 0;
                p->parent = 0;
                release(&ptable.lock);
                return 0;
  10366c:	b8 01 00 00 00       	mov    $0x1,%eax
  103671:	eb cb                	jmp    10363e <thread_join+0x6e>
  103673:	90                   	nop
  103674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                //cprintf("nice one\n");

                if (p->joinedthread == 0) {
                p->joinedthread = proc;
            } else {
                if (p->joinedthread != proc) {
  103678:	65 3b 05 04 00 00 00 	cmp    %gs:0x4,%eax
  10367f:	74 dd                	je     10365e <thread_join+0x8e>
            return -1;
        }
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
        //cprintf("after sleep\n");
    }
  103681:	83 c8 ff             	or     $0xffffffff,%eax
  103684:	eb 13                	jmp    103699 <thread_join+0xc9>
  103686:	66 90                	xchg   %ax,%ax
                return 0;
            }
        }
        //if theres no such tid or the process was killed
        if (!exists || proc->parent->killed) {
            release(&ptable.lock);
  103688:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10368f:	e8 6c 0f 00 00       	call   104600 <release>
  103694:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
        //cprintf("after sleep\n");
    }

}
  103699:	83 c4 1c             	add    $0x1c,%esp
  10369c:	5b                   	pop    %ebx
  10369d:	5e                   	pop    %esi
  10369e:	5f                   	pop    %edi
  10369f:	5d                   	pop    %ebp
  1036a0:	c3                   	ret    

            exists = 1;
	    *(ret_val) = p->ret_val;
            if (p->state == ZOMBIE) { //if thread already exited
                //cprintf("lets see\n");
                kfree(p->kstack);
  1036a1:	8b 43 50             	mov    0x50(%ebx),%eax
  1036a4:	89 04 24             	mov    %eax,(%esp)
  1036a7:	e8 84 ee ff ff       	call   102530 <kfree>
                p->kstack = 0;
  1036ac:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
                p->name[0] = 0;
  1036b3:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
                p->pid = 0;
  1036b7:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
                p->state = UNUSED;
  1036be:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
                p->joinedthread = 0;
  1036c5:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
  1036cc:	00 00 00 
                p->parent = 0;
  1036cf:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
                release(&ptable.lock);
  1036d6:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1036dd:	e8 1e 0f 00 00       	call   104600 <release>
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
        //cprintf("after sleep\n");
    }

}
  1036e2:	83 c4 1c             	add    $0x1c,%esp
                p->name[0] = 0;
                p->pid = 0;
                p->state = UNUSED;
                p->joinedthread = 0;
                p->parent = 0;
                release(&ptable.lock);
  1036e5:	31 c0                	xor    %eax,%eax
        //cprintf("before sleep\n");
        sleep(proc, &ptable.lock); //DOC: wait-sleep
        //cprintf("after sleep\n");
    }

}
  1036e7:	5b                   	pop    %ebx
  1036e8:	5e                   	pop    %esi
  1036e9:	5f                   	pop    %edi
  1036ea:	5d                   	pop    %ebp
  1036eb:	c3                   	ret    
  1036ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001036f0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  1036f0:	55                   	push   %ebp
  1036f1:	89 e5                	mov    %esp,%ebp
  1036f3:	56                   	push   %esi
  1036f4:	53                   	push   %ebx
    struct proc *p, *np;
    int havekids, pid = -1;

    acquire(&ptable.lock);
  1036f5:	bb 34 41 11 00       	mov    $0x114134,%ebx

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  1036fa:	83 ec 20             	sub    $0x20,%esp
    struct proc *p, *np;
    int havekids, pid = -1;

    acquire(&ptable.lock);
  1036fd:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103704:	e8 47 0f 00 00       	call   104650 <acquire>
  103709:	31 c0                	xor    %eax,%eax
  10370b:	90                   	nop
  10370c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103710:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103716:	72 30                	jb     103748 <wait+0x58>


        }

        // No point waiting if we don't have any children.
        if (!havekids || proc->killed) {
  103718:	85 c0                	test   %eax,%eax
  10371a:	74 5c                	je     103778 <wait+0x88>
  10371c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103722:	8b 48 4c             	mov    0x4c(%eax),%ecx
  103725:	85 c9                	test   %ecx,%ecx
  103727:	75 4f                	jne    103778 <wait+0x88>
            release(&ptable.lock);
            return -1;
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock); //DOC: wait-sleep
  103729:	bb 34 41 11 00       	mov    $0x114134,%ebx
  10372e:	89 04 24             	mov    %eax,(%esp)
  103731:	c7 44 24 04 00 41 11 	movl   $0x114100,0x4(%esp)
  103738:	00 
  103739:	e8 e2 fc ff ff       	call   103420 <sleep>
  10373e:	31 c0                	xor    %eax,%eax

    acquire(&ptable.lock);
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103740:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103746:	73 d0                	jae    103718 <wait+0x28>
            if (p->parent != proc)
  103748:	8b 53 5c             	mov    0x5c(%ebx),%edx
  10374b:	65 3b 15 04 00 00 00 	cmp    %gs:0x4,%edx
  103752:	74 0c                	je     103760 <wait+0x70>

    acquire(&ptable.lock);
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103754:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  10375a:	eb b4                	jmp    103710 <wait+0x20>
  10375c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                continue;
            havekids = 1;


            //cprintf("tid: %d, thread_count of parent: %d",p->tid,proc->thread_count);
            if ((p->state == ZOMBIE) && (p->thread_count == 0)) {
  103760:	83 7b 54 05          	cmpl   $0x5,0x54(%ebx)
  103764:	74 2a                	je     103790 <wait+0xa0>
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                p->joinedthread = 0;
                release(&ptable.lock);
                return pid;
  103766:	b8 01 00 00 00       	mov    $0x1,%eax
  10376b:	90                   	nop
  10376c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103770:	eb e2                	jmp    103754 <wait+0x64>
  103772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

        }

        // No point waiting if we don't have any children.
        if (!havekids || proc->killed) {
            release(&ptable.lock);
  103778:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  10377f:	e8 7c 0e 00 00       	call   104600 <release>
  103784:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock); //DOC: wait-sleep
    }
}
  103789:	83 c4 20             	add    $0x20,%esp
  10378c:	5b                   	pop    %ebx
  10378d:	5e                   	pop    %esi
  10378e:	5d                   	pop    %ebp
  10378f:	c3                   	ret    
                continue;
            havekids = 1;


            //cprintf("tid: %d, thread_count of parent: %d",p->tid,proc->thread_count);
            if ((p->state == ZOMBIE) && (p->thread_count == 0)) {
  103790:	8b b3 88 00 00 00    	mov    0x88(%ebx),%esi
  103796:	85 f6                	test   %esi,%esi
  103798:	74 6e                	je     103808 <wait+0x118>
                // Found one.
                freevm(p->pgdir);
                release(&ptable.lock);
                return pid;
            } else if (p->state == ZOMBIE) {
                pid = p->pid;
  10379a:	8b 43 58             	mov    0x58(%ebx),%eax
                kfree(p->kstack);
  10379d:	8b 53 50             	mov    0x50(%ebx),%edx
  1037a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1037a3:	89 14 24             	mov    %edx,(%esp)
  1037a6:	e8 85 ed ff ff       	call   102530 <kfree>
                p->kstack = 0;
                p->state = UNUSED;
                p->pid = 0;
  1037ab:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
                release(&ptable.lock);
                return pid;
            } else if (p->state == ZOMBIE) {
                pid = p->pid;
                kfree(p->kstack);
                p->kstack = 0;
  1037b2:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
                p->state = UNUSED;
  1037b9:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
                p->pid = 0;
                p->tid = 0;
  1037c0:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
                p->thread_count = -1;
  1037c7:	c7 83 88 00 00 00 ff 	movl   $0xffffffff,0x88(%ebx)
  1037ce:	ff ff ff 
                p->ret_val = 0;
  1037d1:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  1037d8:	00 00 00 
                p->parent = 0;
  1037db:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
                p->name[0] = 0;
  1037e2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
                p->killed = 0;
  1037e6:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
                p->joinedthread = 0;
  1037ed:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
  1037f4:	00 00 00 
                release(&ptable.lock);
  1037f7:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1037fe:	e8 fd 0d 00 00       	call   104600 <release>
                return pid;
  103803:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103806:	eb 81                	jmp    103789 <wait+0x99>

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  103808:	83 c8 ff             	or     $0xffffffff,%eax
  10380b:	be 34 41 11 00       	mov    $0x114134,%esi
  103810:	eb 14                	jmp    103826 <wait+0x136>
  103812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            havekids = 1;


            //cprintf("tid: %d, thread_count of parent: %d",p->tid,proc->thread_count);
            if ((p->state == ZOMBIE) && (p->thread_count == 0)) {
                for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
  103818:	81 c6 8c 00 00 00    	add    $0x8c,%esi
  10381e:	81 fe 34 64 11 00    	cmp    $0x116434,%esi
  103824:	74 70                	je     103896 <wait+0x1a6>
                    if ((np->pid == p->pid) && (p != np)) {
  103826:	8b 4e 58             	mov    0x58(%esi),%ecx
  103829:	8b 53 58             	mov    0x58(%ebx),%edx
  10382c:	39 d1                	cmp    %edx,%ecx
  10382e:	75 e8                	jne    103818 <wait+0x128>
  103830:	39 f3                	cmp    %esi,%ebx
  103832:	74 e4                	je     103818 <wait+0x128>
                        pid = np->pid;
  103834:	8b 46 58             	mov    0x58(%esi),%eax
                        kfree(np->kstack);
  103837:	8b 56 50             	mov    0x50(%esi),%edx
  10383a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10383d:	89 14 24             	mov    %edx,(%esp)
  103840:	e8 eb ec ff ff       	call   102530 <kfree>
                        np->kstack = 0;
                        np->state = UNUSED;
                        np->pid = 0;
  103845:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
            if ((p->state == ZOMBIE) && (p->thread_count == 0)) {
                for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
                    if ((np->pid == p->pid) && (p != np)) {
                        pid = np->pid;
                        kfree(np->kstack);
                        np->kstack = 0;
  10384c:	c7 46 50 00 00 00 00 	movl   $0x0,0x50(%esi)
                        np->state = UNUSED;
  103853:	c7 46 54 00 00 00 00 	movl   $0x0,0x54(%esi)
                        np->pid = 0;
                        np->tid = 0;
  10385a:	c7 46 7c 00 00 00 00 	movl   $0x0,0x7c(%esi)
                        np->thread_count = -1;
  103861:	c7 86 88 00 00 00 ff 	movl   $0xffffffff,0x88(%esi)
  103868:	ff ff ff 
                        np->ret_val = 0;
  10386b:	c7 86 84 00 00 00 00 	movl   $0x0,0x84(%esi)
  103872:	00 00 00 
                        np->parent = 0;
  103875:	c7 46 5c 00 00 00 00 	movl   $0x0,0x5c(%esi)
                        np->name[0] = 0;
  10387c:	c6 46 6c 00          	movb   $0x0,0x6c(%esi)
                        np->killed = 0;
  103880:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
                        np->joinedthread = 0;
  103887:	c7 86 80 00 00 00 00 	movl   $0x0,0x80(%esi)
  10388e:	00 00 00 
  103891:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103894:	eb 82                	jmp    103818 <wait+0x128>
                    }
                }
                // Found one.
                freevm(p->pgdir);
  103896:	8b 53 04             	mov    0x4(%ebx),%edx
  103899:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10389c:	89 14 24             	mov    %edx,(%esp)
  10389f:	e8 1c 34 00 00       	call   106cc0 <freevm>
                release(&ptable.lock);
  1038a4:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1038ab:	e8 50 0d 00 00       	call   104600 <release>
                return pid;
  1038b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1038b3:	e9 d1 fe ff ff       	jmp    103789 <wait+0x99>
  1038b8:	90                   	nop
  1038b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001038c0 <exit_all_threads>:
  sched();
  panic("zombie exit");
}

void
exit_all_threads(void) {
  1038c0:	55                   	push   %ebp
  1038c1:	89 e5                	mov    %esp,%ebp
  1038c3:	57                   	push   %edi
  1038c4:	56                   	push   %esi
  1038c5:	53                   	push   %ebx
  1038c6:	83 ec 1c             	sub    $0x1c,%esp
    struct proc *p;
    int fd;

    if (proc == initproc)
  1038c9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1038cf:	3b 05 28 93 10 00    	cmp    0x109328,%eax
  1038d5:	0f 84 17 01 00 00    	je     1039f2 <exit_all_threads+0x132>
        panic("init exiting");

    iput(proc->cwd);
  1038db:	8b 40 48             	mov    0x48(%eax),%eax
  1038de:	89 04 24             	mov    %eax,(%esp)
  1038e1:	e8 1a e2 ff ff       	call   101b00 <iput>
    proc->cwd = 0;
  1038e6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1038ec:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)

    acquire(&ptable.lock);
  1038f3:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1038fa:	e8 51 0d 00 00       	call   104650 <acquire>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
  1038ff:	65 8b 1d 04 00 00 00 	mov    %gs:0x4,%ebx
  sched();
  panic("zombie exit");
}

void
exit_all_threads(void) {
  103906:	b9 34 64 11 00       	mov    $0x116434,%ecx
  10390b:	b8 34 41 11 00       	mov    $0x114134,%eax
    proc->cwd = 0;

    acquire(&ptable.lock);

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
  103910:	8b 53 5c             	mov    0x5c(%ebx),%edx
  103913:	eb 0f                	jmp    103924 <exit_all_threads+0x64>
  103915:	8d 76 00             	lea    0x0(%esi),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103918:	05 8c 00 00 00       	add    $0x8c,%eax
  10391d:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103922:	74 1e                	je     103942 <exit_all_threads+0x82>
        if (p->state == SLEEPING && p->chan == chan)
  103924:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103928:	75 ee                	jne    103918 <exit_all_threads+0x58>
  10392a:	3b 50 68             	cmp    0x68(%eax),%edx
  10392d:	75 e9                	jne    103918 <exit_all_threads+0x58>
            p->state = RUNNABLE;
  10392f:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103936:	05 8c 00 00 00       	add    $0x8c,%eax
  10393b:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103940:	75 e2                	jne    103924 <exit_all_threads+0x64>
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->parent == proc) {
            p->parent = initproc;
  103942:	8b 35 28 93 10 00    	mov    0x109328,%esi
  103948:	ba 34 41 11 00       	mov    $0x114134,%edx
  10394d:	eb 0f                	jmp    10395e <exit_all_threads+0x9e>
  10394f:	90                   	nop

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103950:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  103956:	81 fa 34 64 11 00    	cmp    $0x116434,%edx
  10395c:	74 47                	je     1039a5 <exit_all_threads+0xe5>
        if (p->parent == proc) {
  10395e:	3b 5a 5c             	cmp    0x5c(%edx),%ebx
  103961:	74 5d                	je     1039c0 <exit_all_threads+0x100>
            p->parent = initproc;
            if (p->state == ZOMBIE)
                wakeup1(initproc);
        }
        if ((p->pid == proc->pid) && (p->tid != -1)) {
  103963:	8b 7a 58             	mov    0x58(%edx),%edi
  103966:	8b 43 58             	mov    0x58(%ebx),%eax
  103969:	39 c7                	cmp    %eax,%edi
  10396b:	75 e3                	jne    103950 <exit_all_threads+0x90>
  10396d:	8b 42 7c             	mov    0x7c(%edx),%eax
  103970:	83 f8 ff             	cmp    $0xffffffff,%eax
  103973:	74 db                	je     103950 <exit_all_threads+0x90>
  103975:	31 c0                	xor    %eax,%eax
  103977:	90                   	nop
            for (fd = 0; fd < NOFILE; fd++) {
                if (p->ofile[fd]) {
  103978:	8b 7c 82 08          	mov    0x8(%edx,%eax,4),%edi
  10397c:	85 ff                	test   %edi,%edi
  10397e:	74 08                	je     103988 <exit_all_threads+0xc8>
                    p->ofile[fd] = 0;
  103980:	c7 44 82 08 00 00 00 	movl   $0x0,0x8(%edx,%eax,4)
  103987:	00 
            p->parent = initproc;
            if (p->state == ZOMBIE)
                wakeup1(initproc);
        }
        if ((p->pid == proc->pid) && (p->tid != -1)) {
            for (fd = 0; fd < NOFILE; fd++) {
  103988:	83 c0 01             	add    $0x1,%eax
  10398b:	83 f8 10             	cmp    $0x10,%eax
  10398e:	75 e8                	jne    103978 <exit_all_threads+0xb8>
                if (p->ofile[fd]) {
                    p->ofile[fd] = 0;
                }
            }
            p->state = ZOMBIE;
  103990:	c7 42 54 05 00 00 00 	movl   $0x5,0x54(%edx)

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103997:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  10399d:	81 fa 34 64 11 00    	cmp    $0x116434,%edx
  1039a3:	75 b9                	jne    10395e <exit_all_threads+0x9e>
            p->state = ZOMBIE;
        }
    }

    // Jump into the scheduler, never to return.
    proc->state = ZOMBIE;
  1039a5:	c7 43 54 05 00 00 00 	movl   $0x5,0x54(%ebx)
    sched();
  1039ac:	e8 cf f9 ff ff       	call   103380 <sched>
    panic("zombie exit");
  1039b1:	c7 04 24 0d 77 10 00 	movl   $0x10770d,(%esp)
  1039b8:	e8 93 d1 ff ff       	call   100b50 <panic>
  1039bd:	8d 76 00             	lea    0x0(%esi),%esi

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->parent == proc) {
            p->parent = initproc;
            if (p->state == ZOMBIE)
  1039c0:	83 7a 54 05          	cmpl   $0x5,0x54(%edx)
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->parent == proc) {
            p->parent = initproc;
  1039c4:	89 72 5c             	mov    %esi,0x5c(%edx)
            if (p->state == ZOMBIE)
  1039c7:	75 9a                	jne    103963 <exit_all_threads+0xa3>
  1039c9:	b8 34 41 11 00       	mov    $0x114134,%eax
  1039ce:	eb 09                	jmp    1039d9 <exit_all_threads+0x119>

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  1039d0:	05 8c 00 00 00       	add    $0x8c,%eax
  1039d5:	39 c1                	cmp    %eax,%ecx
  1039d7:	74 8a                	je     103963 <exit_all_threads+0xa3>
        if (p->state == SLEEPING && p->chan == chan)
  1039d9:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  1039dd:	75 f1                	jne    1039d0 <exit_all_threads+0x110>
  1039df:	3b 70 68             	cmp    0x68(%eax),%esi
  1039e2:	75 ec                	jne    1039d0 <exit_all_threads+0x110>
            p->state = RUNNABLE;
  1039e4:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
  1039eb:	90                   	nop
  1039ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1039f0:	eb de                	jmp    1039d0 <exit_all_threads+0x110>
exit_all_threads(void) {
    struct proc *p;
    int fd;

    if (proc == initproc)
        panic("init exiting");
  1039f2:	c7 04 24 d8 76 10 00 	movl   $0x1076d8,(%esp)
  1039f9:	e8 52 d1 ff ff       	call   100b50 <panic>
  1039fe:	66 90                	xchg   %ax,%ax

00103a00 <exit>:
   }
   */

void
exit(void)
{
  103a00:	55                   	push   %ebp
  103a01:	89 e5                	mov    %esp,%ebp
  103a03:	56                   	push   %esi
  103a04:	53                   	push   %ebx
  103a05:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  struct proc *np;
  int fd;

  if(proc->tid == -1) {
  103a08:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103a0e:	8b 50 7c             	mov    0x7c(%eax),%edx
  103a11:	83 fa ff             	cmp    $0xffffffff,%edx
  103a14:	0f 85 1c 01 00 00    	jne    103b36 <exit+0x136>
   	thread_exit();
   }
   */

void
exit(void)
  103a1a:	bb 34 64 11 00       	mov    $0x116434,%ebx
  103a1f:	b9 34 41 11 00       	mov    $0x114134,%ecx
  103a24:	eb 10                	jmp    103a36 <exit+0x36>
  103a26:	66 90                	xchg   %ax,%ax
  int fd;

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103a28:	81 c1 8c 00 00 00    	add    $0x8c,%ecx
  103a2e:	81 f9 34 64 11 00    	cmp    $0x116434,%ecx
  103a34:	74 4c                	je     103a82 <exit+0x82>
	if((p->parent == proc) && (p->tid != -1)){
  103a36:	3b 41 5c             	cmp    0x5c(%ecx),%eax
  103a39:	75 ed                	jne    103a28 <exit+0x28>
  103a3b:	8b 51 7c             	mov    0x7c(%ecx),%edx
  103a3e:	83 fa ff             	cmp    $0xffffffff,%edx
  103a41:	74 e5                	je     103a28 <exit+0x28>
  103a43:	31 d2                	xor    %edx,%edx
  103a45:	8d 76 00             	lea    0x0(%esi),%esi
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
  103a48:	8b 74 90 08          	mov    0x8(%eax,%edx,4),%esi
  103a4c:	85 f6                	test   %esi,%esi
  103a4e:	74 0e                	je     103a5e <exit+0x5e>
				proc->ofile[fd] = 0;
  103a50:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  103a57:	00 
  103a58:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->parent == proc) && (p->tid != -1)){
		for(fd = 0; fd < NOFILE; fd++){
  103a5e:	83 c2 01             	add    $0x1,%edx
  103a61:	83 fa 10             	cmp    $0x10,%edx
  103a64:	75 e2                	jne    103a48 <exit+0x48>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;
  103a66:	c7 41 48 00 00 00 00 	movl   $0x0,0x48(%ecx)
			p->state = ZOMBIE;
  103a6d:	c7 41 54 05 00 00 00 	movl   $0x5,0x54(%ecx)
  int fd;

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103a74:	81 c1 8c 00 00 00    	add    $0x8c,%ecx
  103a7a:	81 f9 34 64 11 00    	cmp    $0x116434,%ecx
  103a80:	75 b4                	jne    103a36 <exit+0x36>
			p->cwd = 0;
			p->state = ZOMBIE;
		}
  	}
	/////////////
	proc->cwd = 0;
  103a82:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
	iput(proc->cwd);
  103a89:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103a8f:	8b 40 48             	mov    0x48(%eax),%eax
  103a92:	89 04 24             	mov    %eax,(%esp)
  103a95:	e8 66 e0 ff ff       	call   101b00 <iput>
	
	acquire(&ptable.lock);
  103a9a:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103aa1:	e8 aa 0b 00 00       	call   104650 <acquire>
	
	// Parent might be sleeping in wait().
	wakeup1(proc->parent);
  103aa6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103aac:	ba 34 41 11 00       	mov    $0x114134,%edx
  103ab1:	8b 48 5c             	mov    0x5c(%eax),%ecx
  103ab4:	eb 0c                	jmp    103ac2 <exit+0xc2>
  103ab6:	66 90                	xchg   %ax,%ax

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103ab8:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  103abe:	39 d3                	cmp    %edx,%ebx
  103ac0:	74 1c                	je     103ade <exit+0xde>
        if (p->state == SLEEPING && p->chan == chan)
  103ac2:	83 7a 54 02          	cmpl   $0x2,0x54(%edx)
  103ac6:	75 f0                	jne    103ab8 <exit+0xb8>
  103ac8:	3b 4a 68             	cmp    0x68(%edx),%ecx
  103acb:	75 eb                	jne    103ab8 <exit+0xb8>
            p->state = RUNNABLE;
  103acd:	c7 42 54 03 00 00 00 	movl   $0x3,0x54(%edx)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103ad4:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  103ada:	39 d3                	cmp    %edx,%ebx
  103adc:	75 e4                	jne    103ac2 <exit+0xc2>
  103ade:	8b 35 28 93 10 00    	mov    0x109328,%esi
  103ae4:	b9 34 41 11 00       	mov    $0x114134,%ecx
  103ae9:	eb 17                	jmp    103b02 <exit+0x102>
  103aeb:	90                   	nop
  103aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	
	// Parent might be sleeping in wait().
	wakeup1(proc->parent);
	
	// Pass abandoned children to init.
	for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
  103af0:	81 c1 8c 00 00 00    	add    $0x8c,%ecx
  103af6:	81 f9 34 64 11 00    	cmp    $0x116434,%ecx
  103afc:	0f 84 e5 01 00 00    	je     103ce7 <exit+0x2e7>
	if(np->parent == proc){
  103b02:	3b 41 5c             	cmp    0x5c(%ecx),%eax
  103b05:	75 e9                	jne    103af0 <exit+0xf0>
	np->parent = initproc;
	if(np->state == ZOMBIE)
  103b07:	83 79 54 05          	cmpl   $0x5,0x54(%ecx)
	wakeup1(proc->parent);
	
	// Pass abandoned children to init.
	for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
	if(np->parent == proc){
	np->parent = initproc;
  103b0b:	89 71 5c             	mov    %esi,0x5c(%ecx)
	if(np->state == ZOMBIE)
  103b0e:	75 e0                	jne    103af0 <exit+0xf0>
  103b10:	ba 34 41 11 00       	mov    $0x114134,%edx
  103b15:	eb 0b                	jmp    103b22 <exit+0x122>
  103b17:	90                   	nop

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103b18:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  103b1e:	39 d3                	cmp    %edx,%ebx
  103b20:	74 ce                	je     103af0 <exit+0xf0>
        if (p->state == SLEEPING && p->chan == chan)
  103b22:	83 7a 54 02          	cmpl   $0x2,0x54(%edx)
  103b26:	75 f0                	jne    103b18 <exit+0x118>
  103b28:	39 72 68             	cmp    %esi,0x68(%edx)
  103b2b:	75 eb                	jne    103b18 <exit+0x118>
            p->state = RUNNABLE;
  103b2d:	c7 42 54 03 00 00 00 	movl   $0x3,0x54(%edx)
  103b34:	eb e2                	jmp    103b18 <exit+0x118>
	}
	////////////


  } else {
	cprintf("thread exits");
  103b36:	c7 04 24 e5 76 10 00 	movl   $0x1076e5,(%esp)
  103b3d:	e8 1e cc ff ff       	call   100760 <cprintf>
  103b42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
   	thread_exit();
   }
   */

void
exit(void)
  103b48:	b9 34 41 11 00       	mov    $0x114134,%ecx
	}
	////////////


  } else {
	cprintf("thread exits");
  103b4d:	89 c2                	mov    %eax,%edx
  103b4f:	eb 15                	jmp    103b66 <exit+0x166>
  103b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103b58:	81 c1 8c 00 00 00    	add    $0x8c,%ecx
  103b5e:	81 f9 34 64 11 00    	cmp    $0x116434,%ecx
  103b64:	74 56                	je     103bbc <exit+0x1bc>
	//kills the parent process and all the threads of the process not including proc
	if(p->pid == proc->pid && p->tid != proc->tid){
  103b66:	8b 71 58             	mov    0x58(%ecx),%esi
  103b69:	8b 58 58             	mov    0x58(%eax),%ebx
  103b6c:	39 de                	cmp    %ebx,%esi
  103b6e:	75 e8                	jne    103b58 <exit+0x158>
  103b70:	8b 71 7c             	mov    0x7c(%ecx),%esi
  103b73:	8b 58 7c             	mov    0x7c(%eax),%ebx
  103b76:	39 de                	cmp    %ebx,%esi
  103b78:	74 de                	je     103b58 <exit+0x158>
  103b7a:	31 d2                	xor    %edx,%edx
  103b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
  103b80:	8b 5c 90 08          	mov    0x8(%eax,%edx,4),%ebx
  103b84:	85 db                	test   %ebx,%ebx
  103b86:	74 0e                	je     103b96 <exit+0x196>
				proc->ofile[fd] = 0;
  103b88:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  103b8f:	00 
  103b90:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
	cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	//kills the parent process and all the threads of the process not including proc
	if(p->pid == proc->pid && p->tid != proc->tid){
		for(fd = 0; fd < NOFILE; fd++){
  103b96:	83 c2 01             	add    $0x1,%edx
  103b99:	83 fa 10             	cmp    $0x10,%edx
  103b9c:	75 e2                	jne    103b80 <exit+0x180>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;			
  103b9e:	c7 41 48 00 00 00 00 	movl   $0x0,0x48(%ecx)
			p->state = ZOMBIE;
  103ba5:	89 c2                	mov    %eax,%edx
  103ba7:	c7 41 54 05 00 00 00 	movl   $0x5,0x54(%ecx)


  } else {
	cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103bae:	81 c1 8c 00 00 00    	add    $0x8c,%ecx
  103bb4:	81 f9 34 64 11 00    	cmp    $0x116434,%ecx
  103bba:	75 aa                	jne    103b66 <exit+0x166>
  103bbc:	bb 34 41 11 00       	mov    $0x114134,%ebx
  103bc1:	eb 19                	jmp    103bdc <exit+0x1dc>
  103bc3:	90                   	nop
  103bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			p->state = ZOMBIE;
		}
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103bc8:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  103bce:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103bd4:	0f 84 07 01 00 00    	je     103ce1 <exit+0x2e1>
  103bda:	89 c2                	mov    %eax,%edx
	if(p->pid == proc->pid && p->tid == -1){
  103bdc:	8b 73 58             	mov    0x58(%ebx),%esi
  103bdf:	8b 48 58             	mov    0x58(%eax),%ecx
  103be2:	39 ce                	cmp    %ecx,%esi
  103be4:	75 e2                	jne    103bc8 <exit+0x1c8>
  103be6:	8b 4b 7c             	mov    0x7c(%ebx),%ecx
  103be9:	83 f9 ff             	cmp    $0xffffffff,%ecx
  103bec:	75 da                	jne    103bc8 <exit+0x1c8>
  103bee:	31 c0                	xor    %eax,%eax
  103bf0:	eb 0d                	jmp    103bff <exit+0x1ff>
  103bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		for(fd = 0; fd < NOFILE; fd++){
  103bf8:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
			if(proc->ofile[fd]){
  103bff:	8b 4c 82 08          	mov    0x8(%edx,%eax,4),%ecx
  103c03:	85 c9                	test   %ecx,%ecx
  103c05:	74 08                	je     103c0f <exit+0x20f>
				proc->ofile[fd] = 0;
  103c07:	c7 44 82 08 00 00 00 	movl   $0x0,0x8(%edx,%eax,4)
  103c0e:	00 
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if(p->pid == proc->pid && p->tid == -1){
		for(fd = 0; fd < NOFILE; fd++){
  103c0f:	83 c0 01             	add    $0x1,%eax
  103c12:	83 f8 10             	cmp    $0x10,%eax
  103c15:	75 e1                	jne    103bf8 <exit+0x1f8>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;
  103c17:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
			iput(p->cwd);
  103c1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103c25:	e8 d6 de ff ff       	call   101b00 <iput>
			
			acquire(&ptable.lock);
  103c2a:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103c31:	e8 1a 0a 00 00       	call   104650 <acquire>
			
			// Parent might be sleeping in wait().
			wakeup1(p->parent);
  103c36:	8b 53 5c             	mov    0x5c(%ebx),%edx
  103c39:	b8 34 41 11 00       	mov    $0x114134,%eax
  103c3e:	eb 0c                	jmp    103c4c <exit+0x24c>

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103c40:	05 8c 00 00 00       	add    $0x8c,%eax
  103c45:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103c4a:	74 1e                	je     103c6a <exit+0x26a>
        if (p->state == SLEEPING && p->chan == chan)
  103c4c:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103c50:	75 ee                	jne    103c40 <exit+0x240>
  103c52:	3b 50 68             	cmp    0x68(%eax),%edx
  103c55:	75 e9                	jne    103c40 <exit+0x240>
            p->state = RUNNABLE;
  103c57:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103c5e:	05 8c 00 00 00       	add    $0x8c,%eax
  103c63:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103c68:	75 e2                	jne    103c4c <exit+0x24c>
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
			if(np->parent == p){
			np->parent = initproc;
  103c6a:	8b 0d 28 93 10 00    	mov    0x109328,%ecx
  103c70:	ba 34 41 11 00       	mov    $0x114134,%edx
  103c75:	eb 0f                	jmp    103c86 <exit+0x286>
  103c77:	90                   	nop
			
			// Parent might be sleeping in wait().
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
  103c78:	81 c2 8c 00 00 00    	add    $0x8c,%edx
  103c7e:	81 fa 34 64 11 00    	cmp    $0x116434,%edx
  103c84:	74 3c                	je     103cc2 <exit+0x2c2>
			if(np->parent == p){
  103c86:	39 5a 5c             	cmp    %ebx,0x5c(%edx)
  103c89:	75 ed                	jne    103c78 <exit+0x278>
			np->parent = initproc;
			if(np->state == ZOMBIE)
  103c8b:	83 7a 54 05          	cmpl   $0x5,0x54(%edx)
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
			if(np->parent == p){
			np->parent = initproc;
  103c8f:	89 4a 5c             	mov    %ecx,0x5c(%edx)
			if(np->state == ZOMBIE)
  103c92:	75 e4                	jne    103c78 <exit+0x278>
  103c94:	b8 34 41 11 00       	mov    $0x114134,%eax
  103c99:	eb 11                	jmp    103cac <exit+0x2ac>
  103c9b:	90                   	nop
  103c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103ca0:	05 8c 00 00 00       	add    $0x8c,%eax
  103ca5:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103caa:	74 cc                	je     103c78 <exit+0x278>
        if (p->state == SLEEPING && p->chan == chan)
  103cac:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103cb0:	75 ee                	jne    103ca0 <exit+0x2a0>
  103cb2:	3b 48 68             	cmp    0x68(%eax),%ecx
  103cb5:	75 e9                	jne    103ca0 <exit+0x2a0>
            p->state = RUNNABLE;
  103cb7:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
  103cbe:	66 90                	xchg   %ax,%ax
  103cc0:	eb de                	jmp    103ca0 <exit+0x2a0>
			np->parent = initproc;
			if(np->state == ZOMBIE)
				wakeup1(initproc);
			}
			}
			p->state = ZOMBIE;
  103cc2:	c7 43 54 05 00 00 00 	movl   $0x5,0x54(%ebx)
			p->state = ZOMBIE;
		}
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103cc9:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  103ccf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103cd5:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103cdb:	0f 85 f9 fe ff ff    	jne    103bda <exit+0x1da>
  103ce1:	8b 35 28 93 10 00    	mov    0x109328,%esi
			p->state = ZOMBIE;
		}
	}
  }
	
	proc->cwd = 0;
  103ce7:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
  if(proc == initproc)
  103cee:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    panic("init exiting");
  103cf4:	31 db                	xor    %ebx,%ebx
		}
	}
  }
	
	proc->cwd = 0;
  if(proc == initproc)
  103cf6:	39 c6                	cmp    %eax,%esi
  103cf8:	74 4a                	je     103d44 <exit+0x344>
  103cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
  103d00:	8b 54 98 08          	mov    0x8(%eax,%ebx,4),%edx
  103d04:	85 d2                	test   %edx,%edx
  103d06:	74 1c                	je     103d24 <exit+0x324>
      fileclose(proc->ofile[fd]);
  103d08:	89 14 24             	mov    %edx,(%esp)
  103d0b:	e8 f0 d4 ff ff       	call   101200 <fileclose>
      proc->ofile[fd] = 0;
  103d10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d16:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
  103d1d:	00 
  103d1e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
	proc->cwd = 0;
  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
  103d24:	83 c3 01             	add    $0x1,%ebx
  103d27:	83 fb 10             	cmp    $0x10,%ebx
  103d2a:	75 d4                	jne    103d00 <exit+0x300>
      proc->ofile[fd] = 0;
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
  103d2c:	c7 40 54 05 00 00 00 	movl   $0x5,0x54(%eax)
  sched();
  103d33:	e8 48 f6 ff ff       	call   103380 <sched>
  panic("zombie exit");
  103d38:	c7 04 24 0d 77 10 00 	movl   $0x10770d,(%esp)
  103d3f:	e8 0c ce ff ff       	call   100b50 <panic>
	}
  }
	
	proc->cwd = 0;
  if(proc == initproc)
    panic("init exiting");
  103d44:	c7 04 24 d8 76 10 00 	movl   $0x1076d8,(%esp)
  103d4b:	e8 00 ce ff ff       	call   100b50 <panic>

00103d50 <thread_exit>:
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
  103d50:	55                   	push   %ebp
  103d51:	89 e5                	mov    %esp,%ebp
  103d53:	83 ec 18             	sub    $0x18,%esp
    if (proc == initproc) {
  103d56:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d5c:	3b 05 28 93 10 00    	cmp    0x109328,%eax
  103d62:	0f 84 db 00 00 00    	je     103e43 <thread_exit+0xf3>
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
  103d68:	8b 40 7c             	mov    0x7c(%eax),%eax
  103d6b:	83 f8 ff             	cmp    $0xffffffff,%eax
  103d6e:	0f 84 c5 00 00 00    	je     103e39 <thread_exit+0xe9>
        exit();
    }

    acquire(&ptable.lock);
  103d74:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103d7b:	e8 d0 08 00 00       	call   104650 <acquire>

    iput(proc->cwd);
  103d80:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d86:	8b 40 48             	mov    0x48(%eax),%eax
  103d89:	89 04 24             	mov    %eax,(%esp)
  103d8c:	e8 6f dd ff ff       	call   101b00 <iput>
    proc->state = ZOMBIE;
  103d91:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d97:	c7 40 54 05 00 00 00 	movl   $0x5,0x54(%eax)
    proc->cwd = 0;
  103d9e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103da4:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
    proc->ret_val = ret_val;
  103dab:	8b 55 08             	mov    0x8(%ebp),%edx
  103dae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103db4:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
    acquire(&threadcountlock);
  103dba:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  103dc1:	e8 8a 08 00 00       	call   104650 <acquire>
    proc->parent->thread_count--;
  103dc6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103dcc:	8b 40 5c             	mov    0x5c(%eax),%eax
  103dcf:	83 a8 88 00 00 00 01 	subl   $0x1,0x88(%eax)
    release(&threadcountlock);
  103dd6:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  103ddd:	e8 1e 08 00 00       	call   104600 <release>

    wakeup1(proc->joinedthread);
  103de2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103de8:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
  103dee:	b8 34 41 11 00       	mov    $0x114134,%eax
  103df3:	eb 0f                	jmp    103e04 <thread_exit+0xb4>
  103df5:	8d 76 00             	lea    0x0(%esi),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103df8:	05 8c 00 00 00       	add    $0x8c,%eax
  103dfd:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103e02:	74 24                	je     103e28 <thread_exit+0xd8>
        if (p->state == SLEEPING && p->chan == chan)
  103e04:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103e08:	75 ee                	jne    103df8 <thread_exit+0xa8>
  103e0a:	3b 50 68             	cmp    0x68(%eax),%edx
  103e0d:	75 e9                	jne    103df8 <thread_exit+0xa8>
            p->state = RUNNABLE;
  103e0f:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103e16:	05 8c 00 00 00       	add    $0x8c,%eax
  103e1b:	3d 34 64 11 00       	cmp    $0x116434,%eax
  103e20:	75 e2                	jne    103e04 <thread_exit+0xb4>
  103e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    wakeup1(proc->joinedthread);

    // Jump into the scheduler, never to return.

    sched();
  103e28:	e8 53 f5 ff ff       	call   103380 <sched>
    panic("thread zombie exit");
  103e2d:	c7 04 24 06 77 10 00 	movl   $0x107706,(%esp)
  103e34:	e8 17 cd ff ff       	call   100b50 <panic>
thread_exit(void* ret_val) {
    if (proc == initproc) {
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
        exit();
  103e39:	e8 c2 fb ff ff       	call   103a00 <exit>
  103e3e:	e9 31 ff ff ff       	jmp    103d74 <thread_exit+0x24>
}

void
thread_exit(void* ret_val) {
    if (proc == initproc) {
        panic("init thread exiting");
  103e43:	c7 04 24 f2 76 10 00 	movl   $0x1076f2,(%esp)
  103e4a:	e8 01 cd ff ff       	call   100b50 <panic>
  103e4f:	90                   	nop

00103e50 <allocproc>:
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and return it.
// Otherwise return 0.

static struct proc*
allocproc(void) {
  103e50:	55                   	push   %ebp
  103e51:	89 e5                	mov    %esp,%ebp
  103e53:	53                   	push   %ebx
  103e54:	83 ec 14             	sub    $0x14,%esp
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
  103e57:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103e5e:	e8 ed 07 00 00       	call   104650 <acquire>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
  103e63:	8b 15 88 41 11 00    	mov    0x114188,%edx
  103e69:	85 d2                	test   %edx,%edx
  103e6b:	0f 84 d5 00 00 00    	je     103f46 <allocproc+0xf6>
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and return it.
// Otherwise return 0.

static struct proc*
allocproc(void) {
  103e71:	bb c0 41 11 00       	mov    $0x1141c0,%ebx
  103e76:	eb 12                	jmp    103e8a <allocproc+0x3a>
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103e78:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  103e7e:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  103e84:	0f 84 a6 00 00 00    	je     103f30 <allocproc+0xe0>
        if (p->state == UNUSED)
  103e8a:	8b 43 54             	mov    0x54(%ebx),%eax
  103e8d:	85 c0                	test   %eax,%eax
  103e8f:	75 e7                	jne    103e78 <allocproc+0x28>
            goto found;
    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;
  103e91:	c7 43 54 01 00 00 00 	movl   $0x1,0x54(%ebx)
    p->pid = nextpid++;
  103e98:	a1 e4 8d 10 00       	mov    0x108de4,%eax
  103e9d:	89 43 58             	mov    %eax,0x58(%ebx)
  103ea0:	83 c0 01             	add    $0x1,%eax
  103ea3:	a3 e4 8d 10 00       	mov    %eax,0x108de4
    p->joinedthread = 0;
  103ea8:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
  103eaf:	00 00 00 
    p->tid = -1;
  103eb2:	c7 43 7c ff ff ff ff 	movl   $0xffffffff,0x7c(%ebx)
    p->thread_count = -1;
  103eb9:	c7 83 88 00 00 00 ff 	movl   $0xffffffff,0x88(%ebx)
  103ec0:	ff ff ff 
    p->ret_val = 0;
  103ec3:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  103eca:	00 00 00 
    release(&ptable.lock);
  103ecd:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103ed4:	e8 27 07 00 00       	call   104600 <release>

    // Allocate kernel stack if possible.
    if ((p->kstack = kalloc()) == 0) {
  103ed9:	e8 12 e6 ff ff       	call   1024f0 <kalloc>
  103ede:	85 c0                	test   %eax,%eax
  103ee0:	89 43 50             	mov    %eax,0x50(%ebx)
  103ee3:	74 6b                	je     103f50 <allocproc+0x100>
    }

    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame.
    sp -= sizeof *p->tf;
  103ee5:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
    p->tf = (struct trapframe*) sp;
  103eeb:	89 53 60             	mov    %edx,0x60(%ebx)

    // Set up new context to start executing at forkret,
    // which returns to trapret (see below).
    sp -= 4;
    *(uint*) sp = (uint) trapret;
  103eee:	c7 80 b0 0f 00 00 30 	movl   $0x105a30,0xfb0(%eax)
  103ef5:	5a 10 00 

    sp -= sizeof *p->context;
    p->context = (struct context*) sp;
  103ef8:	05 9c 0f 00 00       	add    $0xf9c,%eax
  103efd:	89 43 64             	mov    %eax,0x64(%ebx)
    memset(p->context, 0, sizeof *p->context);
  103f00:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  103f07:	00 
  103f08:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  103f0f:	00 
  103f10:	89 04 24             	mov    %eax,(%esp)
  103f13:	e8 d8 07 00 00       	call   1046f0 <memset>
    p->context->eip = (uint) forkret;
  103f18:	8b 43 64             	mov    0x64(%ebx),%eax
  103f1b:	c7 40 10 60 33 10 00 	movl   $0x103360,0x10(%eax)
    return p;
}
  103f22:	89 d8                	mov    %ebx,%eax
  103f24:	83 c4 14             	add    $0x14,%esp
  103f27:	5b                   	pop    %ebx
  103f28:	5d                   	pop    %ebp
  103f29:	c3                   	ret    
  103f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            goto found;
    release(&ptable.lock);
  103f30:	31 db                	xor    %ebx,%ebx
  103f32:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  103f39:	e8 c2 06 00 00       	call   104600 <release>
    sp -= sizeof *p->context;
    p->context = (struct context*) sp;
    memset(p->context, 0, sizeof *p->context);
    p->context->eip = (uint) forkret;
    return p;
}
  103f3e:	89 d8                	mov    %ebx,%eax
  103f40:	83 c4 14             	add    $0x14,%esp
  103f43:	5b                   	pop    %ebx
  103f44:	5d                   	pop    %ebp
  103f45:	c3                   	ret    
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            goto found;
    release(&ptable.lock);
    return 0;
  103f46:	bb 34 41 11 00       	mov    $0x114134,%ebx
  103f4b:	e9 41 ff ff ff       	jmp    103e91 <allocproc+0x41>
    p->ret_val = 0;
    release(&ptable.lock);

    // Allocate kernel stack if possible.
    if ((p->kstack = kalloc()) == 0) {
        p->state = UNUSED;
  103f50:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
  103f57:	31 db                	xor    %ebx,%ebx
        return 0;
  103f59:	eb c7                	jmp    103f22 <allocproc+0xd2>
  103f5b:	90                   	nop
  103f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103f60 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

int
fork(void) {
  103f60:	55                   	push   %ebp
  103f61:	89 e5                	mov    %esp,%ebp
  103f63:	57                   	push   %edi
  103f64:	56                   	push   %esi
    int i, pid;
    struct proc *np;

    // Allocate process.
    if ((np = allocproc()) == 0)
  103f65:	be ff ff ff ff       	mov    $0xffffffff,%esi
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

int
fork(void) {
  103f6a:	53                   	push   %ebx
  103f6b:	83 ec 1c             	sub    $0x1c,%esp
    int i, pid;
    struct proc *np;

    // Allocate process.
    if ((np = allocproc()) == 0)
  103f6e:	e8 dd fe ff ff       	call   103e50 <allocproc>
  103f73:	85 c0                	test   %eax,%eax
  103f75:	89 c3                	mov    %eax,%ebx
  103f77:	0f 84 be 00 00 00    	je     10403b <fork+0xdb>
        return -1;

    // Copy process state from p.
    if (!(np->pgdir = copyuvm(proc->pgdir, proc->sz))) {
  103f7d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103f83:	8b 10                	mov    (%eax),%edx
  103f85:	89 54 24 04          	mov    %edx,0x4(%esp)
  103f89:	8b 40 04             	mov    0x4(%eax),%eax
  103f8c:	89 04 24             	mov    %eax,(%esp)
  103f8f:	e8 ac 2d 00 00       	call   106d40 <copyuvm>
  103f94:	85 c0                	test   %eax,%eax
  103f96:	89 43 04             	mov    %eax,0x4(%ebx)
  103f99:	0f 84 a6 00 00 00    	je     104045 <fork+0xe5>
        kfree(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }
    np->sz = proc->sz;
  103f9f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    np->parent = proc;
    *np->tf = *proc->tf;
  103fa5:	b9 13 00 00 00       	mov    $0x13,%ecx
        kfree(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }
    np->sz = proc->sz;
  103faa:	8b 00                	mov    (%eax),%eax
  103fac:	89 03                	mov    %eax,(%ebx)
    np->parent = proc;
  103fae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103fb4:	89 43 5c             	mov    %eax,0x5c(%ebx)
    *np->tf = *proc->tf;
  103fb7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  103fbe:	8b 43 60             	mov    0x60(%ebx),%eax
  103fc1:	8b 72 60             	mov    0x60(%edx),%esi
  103fc4:	89 c7                	mov    %eax,%edi
  103fc6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;
  103fc8:	31 f6                	xor    %esi,%esi
  103fca:	8b 43 60             	mov    0x60(%ebx),%eax
  103fcd:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  103fd4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  103fdb:	90                   	nop
  103fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    for (i = 0; i < NOFILE; i++)
        if (proc->ofile[i])
  103fe0:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
  103fe4:	85 c0                	test   %eax,%eax
  103fe6:	74 13                	je     103ffb <fork+0x9b>
            np->ofile[i] = filedup(proc->ofile[i]);
  103fe8:	89 04 24             	mov    %eax,(%esp)
  103feb:	e8 40 d1 ff ff       	call   101130 <filedup>
  103ff0:	89 44 b3 08          	mov    %eax,0x8(%ebx,%esi,4)
  103ff4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
    *np->tf = *proc->tf;

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;

    for (i = 0; i < NOFILE; i++)
  103ffb:	83 c6 01             	add    $0x1,%esi
  103ffe:	83 fe 10             	cmp    $0x10,%esi
  104001:	75 dd                	jne    103fe0 <fork+0x80>
        if (proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);
  104003:	8b 42 48             	mov    0x48(%edx),%eax
  104006:	89 04 24             	mov    %eax,(%esp)
  104009:	e8 22 d3 ff ff       	call   101330 <idup>

    pid = np->pid;
  10400e:	8b 73 58             	mov    0x58(%ebx),%esi
    np->state = RUNNABLE;
  104011:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    np->tf->eax = 0;

    for (i = 0; i < NOFILE; i++)
        if (proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);
  104018:	89 43 48             	mov    %eax,0x48(%ebx)

    pid = np->pid;
    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof (proc->name));
  10401b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104021:	83 c3 6c             	add    $0x6c,%ebx
  104024:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10402b:	00 
  10402c:	89 1c 24             	mov    %ebx,(%esp)
  10402f:	83 c0 6c             	add    $0x6c,%eax
  104032:	89 44 24 04          	mov    %eax,0x4(%esp)
  104036:	e8 55 08 00 00       	call   104890 <safestrcpy>
    return pid;
}
  10403b:	83 c4 1c             	add    $0x1c,%esp
  10403e:	89 f0                	mov    %esi,%eax
  104040:	5b                   	pop    %ebx
  104041:	5e                   	pop    %esi
  104042:	5f                   	pop    %edi
  104043:	5d                   	pop    %ebp
  104044:	c3                   	ret    
    if ((np = allocproc()) == 0)
        return -1;

    // Copy process state from p.
    if (!(np->pgdir = copyuvm(proc->pgdir, proc->sz))) {
        kfree(np->kstack);
  104045:	8b 43 50             	mov    0x50(%ebx),%eax
  104048:	89 04 24             	mov    %eax,(%esp)
  10404b:	e8 e0 e4 ff ff       	call   102530 <kfree>
        np->kstack = 0;
  104050:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
        np->state = UNUSED;
  104057:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
        return -1;
  10405e:	eb db                	jmp    10403b <fork+0xdb>

00104060 <thread_create>:
    switchuvm(proc);
    return 0;
}

int
thread_create(void*(*start_func)(), void* stack, uint stack_size) {
  104060:	55                   	push   %ebp
  104061:	89 e5                	mov    %esp,%ebp
  104063:	57                   	push   %edi
  104064:	56                   	push   %esi
  104065:	53                   	push   %ebx
  104066:	83 ec 1c             	sub    $0x1c,%esp
    int i;

    //cprintf("Entering thread_create\n");

    // Allocate process.
    if ((np = allocproc()) == 0) {
  104069:	e8 e2 fd ff ff       	call   103e50 <allocproc>
  10406e:	89 c3                	mov    %eax,%ebx
  104070:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104075:	85 db                	test   %ebx,%ebx
  104077:	0f 84 3c 01 00 00    	je     1041b9 <thread_create+0x159>
        return -1;
    }

    //cprintf("process allocated\n");

    if (proc->tid == -1) {
  10407d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104083:	8b 40 7c             	mov    0x7c(%eax),%eax
  104086:	83 f8 ff             	cmp    $0xffffffff,%eax
  104089:	0f 84 39 01 00 00    	je     1041c8 <thread_create+0x168>
        proc->thread_count++;
        release(&threadcountlock);
        np->parent = proc;
        //cprintf("thread count of process %d is: %d\n",proc->pid,proc->thread_count);
    } else {
        acquire(&threadcountlock);
  10408f:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  104096:	e8 b5 05 00 00       	call   104650 <acquire>
        if (proc->parent->thread_count == -1) {
  10409b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040a1:	8b 40 5c             	mov    0x5c(%eax),%eax
  1040a4:	8b 90 88 00 00 00    	mov    0x88(%eax),%edx
  1040aa:	83 fa ff             	cmp    $0xffffffff,%edx
  1040ad:	0f 84 5d 01 00 00    	je     104210 <thread_create+0x1b0>
            proc->parent->thread_count = 0;
        }
        proc->parent->thread_count++;
  1040b3:	83 c2 01             	add    $0x1,%edx
  1040b6:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
        release(&threadcountlock);
  1040bc:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  1040c3:	e8 38 05 00 00       	call   104600 <release>
        np->parent = proc->parent;if(proc->tid != -1) {
  1040c8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040ce:	8b 40 5c             	mov    0x5c(%eax),%eax
  1040d1:	89 43 5c             	mov    %eax,0x5c(%ebx)
  1040d4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040da:	8b 50 7c             	mov    0x7c(%eax),%edx
  1040dd:	83 fa ff             	cmp    $0xffffffff,%edx
  1040e0:	74 0b                	je     1040ed <thread_create+0x8d>
    	exit();
  1040e2:	e8 19 f9 ff ff       	call   103a00 <exit>
  1040e7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    }
        //cprintf("thread count of process %d is: %d\n",proc->pid,proc->parent->thread_count);
    }


    np->sz = proc->sz;
  1040ed:	8b 00                	mov    (%eax),%eax
  1040ef:	89 03                	mov    %eax,(%ebx)
    np->pgdir = proc->pgdir;
  1040f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040f7:	8b 40 04             	mov    0x4(%eax),%eax
  1040fa:	89 43 04             	mov    %eax,0x4(%ebx)
  1040fd:	31 c0                	xor    %eax,%eax
  1040ff:	90                   	nop
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
  104100:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104107:	8b 54 82 08          	mov    0x8(%edx,%eax,4),%edx
  10410b:	89 54 83 08          	mov    %edx,0x8(%ebx,%eax,4)
    }


    np->sz = proc->sz;
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
  10410f:	83 c0 01             	add    $0x1,%eax
  104112:	83 f8 10             	cmp    $0x10,%eax
  104115:	75 e9                	jne    104100 <thread_create+0xa0>
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
  104117:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10411d:	8b 40 48             	mov    0x48(%eax),%eax
  104120:	89 04 24             	mov    %eax,(%esp)
  104123:	e8 08 d2 ff ff       	call   101330 <idup>
    np->killed = proc->killed;
    np->tid = np->pid;
    np->thread_count = -1;
    np->ret_val = 0;
    *np->tf = *proc->tf;
  104128:	b9 13 00 00 00       	mov    $0x13,%ecx
    np->sz = proc->sz;
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
  10412d:	89 43 48             	mov    %eax,0x48(%ebx)
    np->killed = proc->killed;
  104130:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104136:	8b 40 4c             	mov    0x4c(%eax),%eax
    np->tid = np->pid;
    np->thread_count = -1;
  104139:	c7 83 88 00 00 00 ff 	movl   $0xffffffff,0x88(%ebx)
  104140:	ff ff ff 
    np->ret_val = 0;
  104143:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  10414a:	00 00 00 
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
    np->killed = proc->killed;
  10414d:	89 43 4c             	mov    %eax,0x4c(%ebx)
    np->tid = np->pid;
  104150:	8b 43 58             	mov    0x58(%ebx),%eax
  104153:	89 43 7c             	mov    %eax,0x7c(%ebx)
    np->thread_count = -1;
    np->ret_val = 0;
    *np->tf = *proc->tf;
  104156:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  10415d:	8b 43 60             	mov    0x60(%ebx),%eax
  104160:	8b 72 60             	mov    0x60(%edx),%esi
  104163:	89 c7                	mov    %eax,%edi
  104165:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    np->tf->eax = 0;
  104167:	8b 43 60             	mov    0x60(%ebx),%eax
  10416a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    //cprintf("exec called\n");
    safestrcpy(np->name, proc->name, sizeof (proc->name));
  104171:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104177:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10417e:	00 
  10417f:	83 c0 6c             	add    $0x6c,%eax
  104182:	89 44 24 04          	mov    %eax,0x4(%esp)
  104186:	8d 43 6c             	lea    0x6c(%ebx),%eax
  104189:	89 04 24             	mov    %eax,(%esp)
  10418c:	e8 ff 06 00 00       	call   104890 <safestrcpy>
    //cprintf("name copied\n");
    np->state = RUNNABLE;
    np->pid = np->parent->pid;
  104191:	8b 43 5c             	mov    0x5c(%ebx),%eax
    *np->tf = *proc->tf;
    np->tf->eax = 0;
    //cprintf("exec called\n");
    safestrcpy(np->name, proc->name, sizeof (proc->name));
    //cprintf("name copied\n");
    np->state = RUNNABLE;
  104194:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    np->pid = np->parent->pid;
  10419b:	8b 40 58             	mov    0x58(%eax),%eax
  10419e:	89 43 58             	mov    %eax,0x58(%ebx)


    //	stack	-= 4;
    //	*(uint*)(stack) = 0xffffffff;   // fake return pc

    np->tf->eip = (uint) start_func;
  1041a1:	8b 43 60             	mov    0x60(%ebx),%eax
  1041a4:	8b 55 08             	mov    0x8(%ebp),%edx
  1041a7:	89 50 38             	mov    %edx,0x38(%eax)
    np->tf->esp = (uint) (stack + stack_size);
  1041aa:	8b 43 60             	mov    0x60(%ebx),%eax
  1041ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  1041b0:	03 55 10             	add    0x10(%ebp),%edx
  1041b3:	89 50 44             	mov    %edx,0x44(%eax)

    //cprintf("thread_create return value: %d\n", np->tid);
    return np->tid;
  1041b6:	8b 43 7c             	mov    0x7c(%ebx),%eax
}
  1041b9:	83 c4 1c             	add    $0x1c,%esp
  1041bc:	5b                   	pop    %ebx
  1041bd:	5e                   	pop    %esi
  1041be:	5f                   	pop    %edi
  1041bf:	5d                   	pop    %ebp
  1041c0:	c3                   	ret    
  1041c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }

    //cprintf("process allocated\n");

    if (proc->tid == -1) {
        acquire(&threadcountlock);
  1041c8:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  1041cf:	e8 7c 04 00 00       	call   104650 <acquire>
        if (proc->thread_count == -1) {
  1041d4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1041da:	8b 90 88 00 00 00    	mov    0x88(%eax),%edx
  1041e0:	83 fa ff             	cmp    $0xffffffff,%edx
  1041e3:	74 49                	je     10422e <thread_create+0x1ce>
            proc->thread_count = 0;
        }
        proc->thread_count++;
  1041e5:	83 c2 01             	add    $0x1,%edx
  1041e8:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
        release(&threadcountlock);
  1041ee:	c7 04 24 c0 40 11 00 	movl   $0x1140c0,(%esp)
  1041f5:	e8 06 04 00 00       	call   104600 <release>
        np->parent = proc;
  1041fa:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104200:	89 43 5c             	mov    %eax,0x5c(%ebx)
  104203:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104209:	e9 df fe ff ff       	jmp    1040ed <thread_create+0x8d>
  10420e:	66 90                	xchg   %ax,%ax
        //cprintf("thread count of process %d is: %d\n",proc->pid,proc->thread_count);
    } else {
        acquire(&threadcountlock);
        if (proc->parent->thread_count == -1) {
            proc->parent->thread_count = 0;
  104210:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
  104217:	00 00 00 
  10421a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104220:	8b 40 5c             	mov    0x5c(%eax),%eax
  104223:	8b 90 88 00 00 00    	mov    0x88(%eax),%edx
  104229:	e9 85 fe ff ff       	jmp    1040b3 <thread_create+0x53>
    //cprintf("process allocated\n");

    if (proc->tid == -1) {
        acquire(&threadcountlock);
        if (proc->thread_count == -1) {
            proc->thread_count = 0;
  10422e:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
  104235:	00 00 00 
  104238:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10423e:	8b 90 88 00 00 00    	mov    0x88(%eax),%edx
  104244:	eb 9f                	jmp    1041e5 <thread_create+0x185>
  104246:	8d 76 00             	lea    0x0(%esi),%esi
  104249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104250 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.

int
growproc(int n) {
  104250:	55                   	push   %ebp
  104251:	89 e5                	mov    %esp,%ebp
  104253:	83 ec 18             	sub    $0x18,%esp
    uint sz = proc->sz;
  104256:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.

int
growproc(int n) {
  10425d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    uint sz = proc->sz;
  104260:	8b 02                	mov    (%edx),%eax
    if (n > 0) {
  104262:	83 f9 00             	cmp    $0x0,%ecx
  104265:	7f 19                	jg     104280 <growproc+0x30>
        if (!(sz = allocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    } else if (n < 0) {
  104267:	75 39                	jne    1042a2 <growproc+0x52>
        if (!(sz = deallocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    }
    proc->sz = sz;
  104269:	89 02                	mov    %eax,(%edx)
    switchuvm(proc);
  10426b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104271:	89 04 24             	mov    %eax,(%esp)
  104274:	e8 17 2d 00 00       	call   106f90 <switchuvm>
  104279:	31 c0                	xor    %eax,%eax
    return 0;
}
  10427b:	c9                   	leave  
  10427c:	c3                   	ret    
  10427d:	8d 76 00             	lea    0x0(%esi),%esi

int
growproc(int n) {
    uint sz = proc->sz;
    if (n > 0) {
        if (!(sz = allocuvm(proc->pgdir, sz, sz + n)))
  104280:	01 c1                	add    %eax,%ecx
  104282:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  104286:	89 44 24 04          	mov    %eax,0x4(%esp)
  10428a:	8b 42 04             	mov    0x4(%edx),%eax
  10428d:	89 04 24             	mov    %eax,(%esp)
  104290:	e8 6b 2b 00 00       	call   106e00 <allocuvm>
  104295:	85 c0                	test   %eax,%eax
  104297:	74 27                	je     1042c0 <growproc+0x70>
            return -1;
    } else if (n < 0) {
        if (!(sz = deallocuvm(proc->pgdir, sz, sz + n)))
  104299:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1042a0:	eb c7                	jmp    104269 <growproc+0x19>
  1042a2:	01 c1                	add    %eax,%ecx
  1042a4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1042a8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1042ac:	8b 42 04             	mov    0x4(%edx),%eax
  1042af:	89 04 24             	mov    %eax,(%esp)
  1042b2:	e8 69 29 00 00       	call   106c20 <deallocuvm>
  1042b7:	85 c0                	test   %eax,%eax
  1042b9:	75 de                	jne    104299 <growproc+0x49>
  1042bb:	90                   	nop
  1042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            return -1;
    }
    proc->sz = sz;
    switchuvm(proc);
    return 0;
  1042c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1042c5:	c9                   	leave  
  1042c6:	c3                   	ret    
  1042c7:	89 f6                	mov    %esi,%esi
  1042c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001042d0 <userinit>:
}

// Set up first user process.

void
userinit(void) {
  1042d0:	55                   	push   %ebp
  1042d1:	89 e5                	mov    %esp,%ebp
  1042d3:	53                   	push   %ebx
  1042d4:	83 ec 14             	sub    $0x14,%esp
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
  1042d7:	e8 74 fb ff ff       	call   103e50 <allocproc>
  1042dc:	89 c3                	mov    %eax,%ebx
    initproc = p;
  1042de:	a3 28 93 10 00       	mov    %eax,0x109328
    if (!(p->pgdir = setupkvm()))
  1042e3:	e8 58 28 00 00       	call   106b40 <setupkvm>
  1042e8:	85 c0                	test   %eax,%eax
  1042ea:	89 43 04             	mov    %eax,0x4(%ebx)
  1042ed:	0f 84 d1 00 00 00    	je     1043c4 <userinit+0xf4>
        panic("userinit: out of memory?");
    inituvm(p->pgdir, _binary_initcode_start, (int) _binary_initcode_size);
  1042f3:	89 04 24             	mov    %eax,(%esp)
  1042f6:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
  1042fd:	00 
  1042fe:	c7 44 24 04 e8 91 10 	movl   $0x1091e8,0x4(%esp)
  104305:	00 
  104306:	e8 a5 27 00 00       	call   106ab0 <inituvm>
    p->sz = PGSIZE;
  10430b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
    memset(p->tf, 0, sizeof (*p->tf));
  104311:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
  104318:	00 
  104319:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  104320:	00 
  104321:	8b 43 60             	mov    0x60(%ebx),%eax
  104324:	89 04 24             	mov    %eax,(%esp)
  104327:	e8 c4 03 00 00       	call   1046f0 <memset>
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  10432c:	8b 43 60             	mov    0x60(%ebx),%eax
  10432f:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  104335:	8b 43 60             	mov    0x60(%ebx),%eax
  104338:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
    p->tf->es = p->tf->ds;
  10433e:	8b 43 60             	mov    0x60(%ebx),%eax
  104341:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
  104345:	66 89 50 28          	mov    %dx,0x28(%eax)
    p->tf->ss = p->tf->ds;
  104349:	8b 43 60             	mov    0x60(%ebx),%eax
  10434c:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
  104350:	66 89 50 48          	mov    %dx,0x48(%eax)
    p->tf->eflags = FL_IF;
  104354:	8b 43 60             	mov    0x60(%ebx),%eax
  104357:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
    p->tf->esp = PGSIZE;
  10435e:	8b 43 60             	mov    0x60(%ebx),%eax
  104361:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
    p->tf->eip = 0; // beginning of initcode.S
  104368:	8b 43 60             	mov    0x60(%ebx),%eax
  10436b:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

    safestrcpy(p->name, "initcode", sizeof (p->name));
  104372:	8d 43 6c             	lea    0x6c(%ebx),%eax
  104375:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10437c:	00 
  10437d:	c7 44 24 04 32 77 10 	movl   $0x107732,0x4(%esp)
  104384:	00 
  104385:	89 04 24             	mov    %eax,(%esp)
  104388:	e8 03 05 00 00       	call   104890 <safestrcpy>
    p->cwd = namei("/");
  10438d:	c7 04 24 3b 77 10 00 	movl   $0x10773b,(%esp)
  104394:	e8 37 dd ff ff       	call   1020d0 <namei>

    p->state = RUNNABLE;
  104399:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    p->tf->eflags = FL_IF;
    p->tf->esp = PGSIZE;
    p->tf->eip = 0; // beginning of initcode.S

    safestrcpy(p->name, "initcode", sizeof (p->name));
    p->cwd = namei("/");
  1043a0:	89 43 48             	mov    %eax,0x48(%ebx)

    p->state = RUNNABLE;
  1043a3:	31 c0                	xor    %eax,%eax
  1043a5:	8d 76 00             	lea    0x0(%esi),%esi
    int i;
    for (i = 0; i < BSEMCOUNT; i++) {
        bstbl.bsem[i].used = 0;
  1043a8:	c7 80 ac 93 10 00 00 	movl   $0x0,0x1093ac(%eax)
  1043af:	00 00 00 
  1043b2:	05 d4 01 00 00       	add    $0x1d4,%eax
    safestrcpy(p->name, "initcode", sizeof (p->name));
    p->cwd = namei("/");

    p->state = RUNNABLE;
    int i;
    for (i = 0; i < BSEMCOUNT; i++) {
  1043b7:	3d 00 75 00 00       	cmp    $0x7500,%eax
  1043bc:	75 ea                	jne    1043a8 <userinit+0xd8>
        bstbl.bsem[i].used = 0;
    }
}
  1043be:	83 c4 14             	add    $0x14,%esp
  1043c1:	5b                   	pop    %ebx
  1043c2:	5d                   	pop    %ebp
  1043c3:	c3                   	ret    
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
    initproc = p;
    if (!(p->pgdir = setupkvm()))
        panic("userinit: out of memory?");
  1043c4:	c7 04 24 19 77 10 00 	movl   $0x107719,(%esp)
  1043cb:	e8 80 c7 ff ff       	call   100b50 <panic>

001043d0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.

void
procdump(void) {
  1043d0:	55                   	push   %ebp
  1043d1:	89 e5                	mov    %esp,%ebp
  1043d3:	57                   	push   %edi
  1043d4:	56                   	push   %esi
  1043d5:	53                   	push   %ebx
  1043d6:	bb 34 41 11 00       	mov    $0x114134,%ebx
  1043db:	83 ec 4c             	sub    $0x4c,%esp
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
  1043de:	8d 7d c0             	lea    -0x40(%ebp),%edi
  1043e1:	eb 4e                	jmp    104431 <procdump+0x61>
  1043e3:	90                   	nop
  1043e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uint pc[10];

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->state == UNUSED)
            continue;
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
  1043e8:	8b 04 85 7c 77 10 00 	mov    0x10777c(,%eax,4),%eax
  1043ef:	85 c0                	test   %eax,%eax
  1043f1:	74 4a                	je     10443d <procdump+0x6d>
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
  1043f3:	8b 53 58             	mov    0x58(%ebx),%edx
  1043f6:	8d 4b 6c             	lea    0x6c(%ebx),%ecx
  1043f9:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1043fd:	89 44 24 08          	mov    %eax,0x8(%esp)
  104401:	c7 04 24 41 77 10 00 	movl   $0x107741,(%esp)
  104408:	89 54 24 04          	mov    %edx,0x4(%esp)
  10440c:	e8 4f c3 ff ff       	call   100760 <cprintf>
        if (p->state == SLEEPING) {
  104411:	83 7b 54 02          	cmpl   $0x2,0x54(%ebx)
  104415:	74 31                	je     104448 <procdump+0x78>
            getcallerpcs((uint*) p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
  104417:	c7 04 24 f6 75 10 00 	movl   $0x1075f6,(%esp)
  10441e:	e8 3d c3 ff ff       	call   100760 <cprintf>
    int i;
    struct proc *p;
    char *state;
    uint pc[10];

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  104423:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
  104429:	81 fb 34 64 11 00    	cmp    $0x116434,%ebx
  10442f:	74 57                	je     104488 <procdump+0xb8>
        if (p->state == UNUSED)
  104431:	8b 43 54             	mov    0x54(%ebx),%eax
  104434:	85 c0                	test   %eax,%eax
  104436:	74 eb                	je     104423 <procdump+0x53>
            continue;
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
  104438:	83 f8 05             	cmp    $0x5,%eax
  10443b:	76 ab                	jbe    1043e8 <procdump+0x18>
  10443d:	b8 3d 77 10 00       	mov    $0x10773d,%eax
  104442:	eb af                	jmp    1043f3 <procdump+0x23>
  104444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
  104448:	8b 43 64             	mov    0x64(%ebx),%eax
  10444b:	31 f6                	xor    %esi,%esi
  10444d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104451:	8b 40 0c             	mov    0xc(%eax),%eax
  104454:	83 c0 08             	add    $0x8,%eax
  104457:	89 04 24             	mov    %eax,(%esp)
  10445a:	e8 81 00 00 00       	call   1044e0 <getcallerpcs>
  10445f:	90                   	nop
            for (i = 0; i < 10 && pc[i] != 0; i++)
  104460:	8b 04 b7             	mov    (%edi,%esi,4),%eax
  104463:	85 c0                	test   %eax,%eax
  104465:	74 b0                	je     104417 <procdump+0x47>
  104467:	83 c6 01             	add    $0x1,%esi
                cprintf(" %p", pc[i]);
  10446a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10446e:	c7 04 24 e2 71 10 00 	movl   $0x1071e2,(%esp)
  104475:	e8 e6 c2 ff ff       	call   100760 <cprintf>
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
  10447a:	83 fe 0a             	cmp    $0xa,%esi
  10447d:	75 e1                	jne    104460 <procdump+0x90>
  10447f:	eb 96                	jmp    104417 <procdump+0x47>
  104481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
    }
}
  104488:	83 c4 4c             	add    $0x4c,%esp
  10448b:	5b                   	pop    %ebx
  10448c:	5e                   	pop    %esi
  10448d:	5f                   	pop    %edi
  10448e:	5d                   	pop    %ebp
  10448f:	90                   	nop
  104490:	c3                   	ret    
  104491:	eb 0d                	jmp    1044a0 <pinit>
  104493:	90                   	nop
  104494:	90                   	nop
  104495:	90                   	nop
  104496:	90                   	nop
  104497:	90                   	nop
  104498:	90                   	nop
  104499:	90                   	nop
  10449a:	90                   	nop
  10449b:	90                   	nop
  10449c:	90                   	nop
  10449d:	90                   	nop
  10449e:	90                   	nop
  10449f:	90                   	nop

001044a0 <pinit>:
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void) {
  1044a0:	55                   	push   %ebp
  1044a1:	89 e5                	mov    %esp,%ebp
  1044a3:	83 ec 18             	sub    $0x18,%esp
    initlock(&ptable.lock, "ptable");
  1044a6:	c7 44 24 04 4a 77 10 	movl   $0x10774a,0x4(%esp)
  1044ad:	00 
  1044ae:	c7 04 24 00 41 11 00 	movl   $0x114100,(%esp)
  1044b5:	e8 06 00 00 00       	call   1044c0 <initlock>
}
  1044ba:	c9                   	leave  
  1044bb:	c3                   	ret    
  1044bc:	90                   	nop
  1044bd:	90                   	nop
  1044be:	90                   	nop
  1044bf:	90                   	nop

001044c0 <initlock>:
  1044c0:	55                   	push   %ebp
  1044c1:	89 e5                	mov    %esp,%ebp
  1044c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1044c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  1044c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1044cf:	89 50 04             	mov    %edx,0x4(%eax)
  1044d2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  1044d9:	5d                   	pop    %ebp
  1044da:	c3                   	ret    
  1044db:	90                   	nop
  1044dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001044e0 <getcallerpcs>:
  1044e0:	55                   	push   %ebp
  1044e1:	31 c0                	xor    %eax,%eax
  1044e3:	89 e5                	mov    %esp,%ebp
  1044e5:	53                   	push   %ebx
  1044e6:	8b 55 08             	mov    0x8(%ebp),%edx
  1044e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1044ec:	83 ea 08             	sub    $0x8,%edx
  1044ef:	90                   	nop
  1044f0:	8d 8a 00 00 f0 ff    	lea    -0x100000(%edx),%ecx
  1044f6:	81 f9 fe ff ef ff    	cmp    $0xffeffffe,%ecx
  1044fc:	77 1a                	ja     104518 <getcallerpcs+0x38>
  1044fe:	8b 4a 04             	mov    0x4(%edx),%ecx
  104501:	89 0c 83             	mov    %ecx,(%ebx,%eax,4)
  104504:	83 c0 01             	add    $0x1,%eax
  104507:	8b 12                	mov    (%edx),%edx
  104509:	83 f8 0a             	cmp    $0xa,%eax
  10450c:	75 e2                	jne    1044f0 <getcallerpcs+0x10>
  10450e:	5b                   	pop    %ebx
  10450f:	5d                   	pop    %ebp
  104510:	c3                   	ret    
  104511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104518:	83 f8 09             	cmp    $0x9,%eax
  10451b:	7f f1                	jg     10450e <getcallerpcs+0x2e>
  10451d:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  104520:	83 c0 01             	add    $0x1,%eax
  104523:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  104529:	83 c2 04             	add    $0x4,%edx
  10452c:	83 f8 0a             	cmp    $0xa,%eax
  10452f:	75 ef                	jne    104520 <getcallerpcs+0x40>
  104531:	5b                   	pop    %ebx
  104532:	5d                   	pop    %ebp
  104533:	c3                   	ret    
  104534:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10453a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104540 <holding>:
  104540:	55                   	push   %ebp
  104541:	31 c0                	xor    %eax,%eax
  104543:	89 e5                	mov    %esp,%ebp
  104545:	8b 55 08             	mov    0x8(%ebp),%edx
  104548:	8b 0a                	mov    (%edx),%ecx
  10454a:	85 c9                	test   %ecx,%ecx
  10454c:	74 10                	je     10455e <holding+0x1e>
  10454e:	8b 42 08             	mov    0x8(%edx),%eax
  104551:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  104558:	0f 94 c0             	sete   %al
  10455b:	0f b6 c0             	movzbl %al,%eax
  10455e:	5d                   	pop    %ebp
  10455f:	c3                   	ret    

00104560 <pushcli>:
  104560:	55                   	push   %ebp
  104561:	89 e5                	mov    %esp,%ebp
  104563:	53                   	push   %ebx
  104564:	9c                   	pushf  
  104565:	5b                   	pop    %ebx
  104566:	fa                   	cli    
  104567:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  10456e:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  104574:	8d 48 01             	lea    0x1(%eax),%ecx
  104577:	85 c0                	test   %eax,%eax
  104579:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
  10457f:	75 12                	jne    104593 <pushcli+0x33>
  104581:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  104587:	81 e3 00 02 00 00    	and    $0x200,%ebx
  10458d:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
  104593:	5b                   	pop    %ebx
  104594:	5d                   	pop    %ebp
  104595:	c3                   	ret    
  104596:	8d 76 00             	lea    0x0(%esi),%esi
  104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001045a0 <popcli>:
  1045a0:	55                   	push   %ebp
  1045a1:	89 e5                	mov    %esp,%ebp
  1045a3:	83 ec 18             	sub    $0x18,%esp
  1045a6:	9c                   	pushf  
  1045a7:	58                   	pop    %eax
  1045a8:	f6 c4 02             	test   $0x2,%ah
  1045ab:	75 43                	jne    1045f0 <popcli+0x50>
  1045ad:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1045b4:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  1045ba:	83 e8 01             	sub    $0x1,%eax
  1045bd:	85 c0                	test   %eax,%eax
  1045bf:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
  1045c5:	78 1d                	js     1045e4 <popcli+0x44>
  1045c7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1045cd:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
  1045d3:	85 d2                	test   %edx,%edx
  1045d5:	75 0b                	jne    1045e2 <popcli+0x42>
  1045d7:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  1045dd:	85 c0                	test   %eax,%eax
  1045df:	74 01                	je     1045e2 <popcli+0x42>
  1045e1:	fb                   	sti    
  1045e2:	c9                   	leave  
  1045e3:	c3                   	ret    
  1045e4:	c7 04 24 ab 77 10 00 	movl   $0x1077ab,(%esp)
  1045eb:	e8 60 c5 ff ff       	call   100b50 <panic>
  1045f0:	c7 04 24 94 77 10 00 	movl   $0x107794,(%esp)
  1045f7:	e8 54 c5 ff ff       	call   100b50 <panic>
  1045fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104600 <release>:
  104600:	55                   	push   %ebp
  104601:	89 e5                	mov    %esp,%ebp
  104603:	83 ec 18             	sub    $0x18,%esp
  104606:	8b 55 08             	mov    0x8(%ebp),%edx
  104609:	8b 0a                	mov    (%edx),%ecx
  10460b:	85 c9                	test   %ecx,%ecx
  10460d:	74 0c                	je     10461b <release+0x1b>
  10460f:	8b 42 08             	mov    0x8(%edx),%eax
  104612:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  104619:	74 0d                	je     104628 <release+0x28>
  10461b:	c7 04 24 b2 77 10 00 	movl   $0x1077b2,(%esp)
  104622:	e8 29 c5 ff ff       	call   100b50 <panic>
  104627:	90                   	nop
  104628:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
  10462f:	31 c0                	xor    %eax,%eax
  104631:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  104638:	f0 87 02             	lock xchg %eax,(%edx)
  10463b:	c9                   	leave  
  10463c:	e9 5f ff ff ff       	jmp    1045a0 <popcli>
  104641:	eb 0d                	jmp    104650 <acquire>
  104643:	90                   	nop
  104644:	90                   	nop
  104645:	90                   	nop
  104646:	90                   	nop
  104647:	90                   	nop
  104648:	90                   	nop
  104649:	90                   	nop
  10464a:	90                   	nop
  10464b:	90                   	nop
  10464c:	90                   	nop
  10464d:	90                   	nop
  10464e:	90                   	nop
  10464f:	90                   	nop

00104650 <acquire>:
  104650:	55                   	push   %ebp
  104651:	89 e5                	mov    %esp,%ebp
  104653:	53                   	push   %ebx
  104654:	83 ec 14             	sub    $0x14,%esp
  104657:	9c                   	pushf  
  104658:	5b                   	pop    %ebx
  104659:	fa                   	cli    
  10465a:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  104661:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  104667:	8d 48 01             	lea    0x1(%eax),%ecx
  10466a:	85 c0                	test   %eax,%eax
  10466c:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
  104672:	75 12                	jne    104686 <acquire+0x36>
  104674:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  10467a:	81 e3 00 02 00 00    	and    $0x200,%ebx
  104680:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
  104686:	8b 55 08             	mov    0x8(%ebp),%edx
  104689:	8b 1a                	mov    (%edx),%ebx
  10468b:	85 db                	test   %ebx,%ebx
  10468d:	74 0c                	je     10469b <acquire+0x4b>
  10468f:	8b 42 08             	mov    0x8(%edx),%eax
  104692:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  104699:	74 45                	je     1046e0 <acquire+0x90>
  10469b:	b9 01 00 00 00       	mov    $0x1,%ecx
  1046a0:	eb 09                	jmp    1046ab <acquire+0x5b>
  1046a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1046a8:	8b 55 08             	mov    0x8(%ebp),%edx
  1046ab:	89 c8                	mov    %ecx,%eax
  1046ad:	f0 87 02             	lock xchg %eax,(%edx)
  1046b0:	85 c0                	test   %eax,%eax
  1046b2:	75 f4                	jne    1046a8 <acquire+0x58>
  1046b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1046b7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1046be:	89 50 08             	mov    %edx,0x8(%eax)
  1046c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1046c4:	83 c0 0c             	add    $0xc,%eax
  1046c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1046cb:	8d 45 08             	lea    0x8(%ebp),%eax
  1046ce:	89 04 24             	mov    %eax,(%esp)
  1046d1:	e8 0a fe ff ff       	call   1044e0 <getcallerpcs>
  1046d6:	83 c4 14             	add    $0x14,%esp
  1046d9:	5b                   	pop    %ebx
  1046da:	5d                   	pop    %ebp
  1046db:	c3                   	ret    
  1046dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1046e0:	c7 04 24 ba 77 10 00 	movl   $0x1077ba,(%esp)
  1046e7:	e8 64 c4 ff ff       	call   100b50 <panic>
  1046ec:	90                   	nop
  1046ed:	90                   	nop
  1046ee:	90                   	nop
  1046ef:	90                   	nop

001046f0 <memset>:
  1046f0:	55                   	push   %ebp
  1046f1:	89 e5                	mov    %esp,%ebp
  1046f3:	8b 55 08             	mov    0x8(%ebp),%edx
  1046f6:	57                   	push   %edi
  1046f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1046fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1046fd:	89 d7                	mov    %edx,%edi
  1046ff:	fc                   	cld    
  104700:	f3 aa                	rep stos %al,%es:(%edi)
  104702:	89 d0                	mov    %edx,%eax
  104704:	5f                   	pop    %edi
  104705:	5d                   	pop    %ebp
  104706:	c3                   	ret    
  104707:	89 f6                	mov    %esi,%esi
  104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104710 <memcmp>:
  104710:	55                   	push   %ebp
  104711:	89 e5                	mov    %esp,%ebp
  104713:	57                   	push   %edi
  104714:	56                   	push   %esi
  104715:	53                   	push   %ebx
  104716:	8b 55 10             	mov    0x10(%ebp),%edx
  104719:	8b 75 08             	mov    0x8(%ebp),%esi
  10471c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  10471f:	85 d2                	test   %edx,%edx
  104721:	74 2d                	je     104750 <memcmp+0x40>
  104723:	0f b6 1e             	movzbl (%esi),%ebx
  104726:	0f b6 0f             	movzbl (%edi),%ecx
  104729:	38 cb                	cmp    %cl,%bl
  10472b:	75 2b                	jne    104758 <memcmp+0x48>
  10472d:	83 ea 01             	sub    $0x1,%edx
  104730:	31 c0                	xor    %eax,%eax
  104732:	eb 18                	jmp    10474c <memcmp+0x3c>
  104734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104738:	0f b6 5c 06 01       	movzbl 0x1(%esi,%eax,1),%ebx
  10473d:	83 ea 01             	sub    $0x1,%edx
  104740:	0f b6 4c 07 01       	movzbl 0x1(%edi,%eax,1),%ecx
  104745:	83 c0 01             	add    $0x1,%eax
  104748:	38 cb                	cmp    %cl,%bl
  10474a:	75 0c                	jne    104758 <memcmp+0x48>
  10474c:	85 d2                	test   %edx,%edx
  10474e:	75 e8                	jne    104738 <memcmp+0x28>
  104750:	31 c0                	xor    %eax,%eax
  104752:	5b                   	pop    %ebx
  104753:	5e                   	pop    %esi
  104754:	5f                   	pop    %edi
  104755:	5d                   	pop    %ebp
  104756:	c3                   	ret    
  104757:	90                   	nop
  104758:	0f b6 c3             	movzbl %bl,%eax
  10475b:	0f b6 c9             	movzbl %cl,%ecx
  10475e:	29 c8                	sub    %ecx,%eax
  104760:	5b                   	pop    %ebx
  104761:	5e                   	pop    %esi
  104762:	5f                   	pop    %edi
  104763:	5d                   	pop    %ebp
  104764:	c3                   	ret    
  104765:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104770 <memmove>:
  104770:	55                   	push   %ebp
  104771:	89 e5                	mov    %esp,%ebp
  104773:	57                   	push   %edi
  104774:	56                   	push   %esi
  104775:	53                   	push   %ebx
  104776:	8b 45 08             	mov    0x8(%ebp),%eax
  104779:	8b 75 0c             	mov    0xc(%ebp),%esi
  10477c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  10477f:	39 c6                	cmp    %eax,%esi
  104781:	73 2d                	jae    1047b0 <memmove+0x40>
  104783:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
  104786:	39 f8                	cmp    %edi,%eax
  104788:	73 26                	jae    1047b0 <memmove+0x40>
  10478a:	85 db                	test   %ebx,%ebx
  10478c:	74 1d                	je     1047ab <memmove+0x3b>
  10478e:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  104791:	31 d2                	xor    %edx,%edx
  104793:	90                   	nop
  104794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104798:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
  10479d:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
  1047a1:	83 ea 01             	sub    $0x1,%edx
  1047a4:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
  1047a7:	85 c9                	test   %ecx,%ecx
  1047a9:	75 ed                	jne    104798 <memmove+0x28>
  1047ab:	5b                   	pop    %ebx
  1047ac:	5e                   	pop    %esi
  1047ad:	5f                   	pop    %edi
  1047ae:	5d                   	pop    %ebp
  1047af:	c3                   	ret    
  1047b0:	31 d2                	xor    %edx,%edx
  1047b2:	85 db                	test   %ebx,%ebx
  1047b4:	74 f5                	je     1047ab <memmove+0x3b>
  1047b6:	66 90                	xchg   %ax,%ax
  1047b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
  1047bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1047bf:	83 c2 01             	add    $0x1,%edx
  1047c2:	39 d3                	cmp    %edx,%ebx
  1047c4:	75 f2                	jne    1047b8 <memmove+0x48>
  1047c6:	5b                   	pop    %ebx
  1047c7:	5e                   	pop    %esi
  1047c8:	5f                   	pop    %edi
  1047c9:	5d                   	pop    %ebp
  1047ca:	c3                   	ret    
  1047cb:	90                   	nop
  1047cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001047d0 <memcpy>:
  1047d0:	55                   	push   %ebp
  1047d1:	89 e5                	mov    %esp,%ebp
  1047d3:	5d                   	pop    %ebp
  1047d4:	e9 97 ff ff ff       	jmp    104770 <memmove>
  1047d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001047e0 <strncmp>:
  1047e0:	55                   	push   %ebp
  1047e1:	89 e5                	mov    %esp,%ebp
  1047e3:	57                   	push   %edi
  1047e4:	56                   	push   %esi
  1047e5:	53                   	push   %ebx
  1047e6:	8b 7d 10             	mov    0x10(%ebp),%edi
  1047e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1047ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1047ef:	85 ff                	test   %edi,%edi
  1047f1:	74 3d                	je     104830 <strncmp+0x50>
  1047f3:	0f b6 01             	movzbl (%ecx),%eax
  1047f6:	84 c0                	test   %al,%al
  1047f8:	75 18                	jne    104812 <strncmp+0x32>
  1047fa:	eb 3c                	jmp    104838 <strncmp+0x58>
  1047fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104800:	83 ef 01             	sub    $0x1,%edi
  104803:	74 2b                	je     104830 <strncmp+0x50>
  104805:	83 c1 01             	add    $0x1,%ecx
  104808:	83 c3 01             	add    $0x1,%ebx
  10480b:	0f b6 01             	movzbl (%ecx),%eax
  10480e:	84 c0                	test   %al,%al
  104810:	74 26                	je     104838 <strncmp+0x58>
  104812:	0f b6 33             	movzbl (%ebx),%esi
  104815:	89 f2                	mov    %esi,%edx
  104817:	38 d0                	cmp    %dl,%al
  104819:	74 e5                	je     104800 <strncmp+0x20>
  10481b:	81 e6 ff 00 00 00    	and    $0xff,%esi
  104821:	0f b6 c0             	movzbl %al,%eax
  104824:	29 f0                	sub    %esi,%eax
  104826:	5b                   	pop    %ebx
  104827:	5e                   	pop    %esi
  104828:	5f                   	pop    %edi
  104829:	5d                   	pop    %ebp
  10482a:	c3                   	ret    
  10482b:	90                   	nop
  10482c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104830:	31 c0                	xor    %eax,%eax
  104832:	5b                   	pop    %ebx
  104833:	5e                   	pop    %esi
  104834:	5f                   	pop    %edi
  104835:	5d                   	pop    %ebp
  104836:	c3                   	ret    
  104837:	90                   	nop
  104838:	0f b6 33             	movzbl (%ebx),%esi
  10483b:	eb de                	jmp    10481b <strncmp+0x3b>
  10483d:	8d 76 00             	lea    0x0(%esi),%esi

00104840 <strncpy>:
  104840:	55                   	push   %ebp
  104841:	89 e5                	mov    %esp,%ebp
  104843:	8b 45 08             	mov    0x8(%ebp),%eax
  104846:	56                   	push   %esi
  104847:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10484a:	53                   	push   %ebx
  10484b:	8b 75 0c             	mov    0xc(%ebp),%esi
  10484e:	89 c3                	mov    %eax,%ebx
  104850:	eb 09                	jmp    10485b <strncpy+0x1b>
  104852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104858:	83 c6 01             	add    $0x1,%esi
  10485b:	83 e9 01             	sub    $0x1,%ecx
  10485e:	8d 51 01             	lea    0x1(%ecx),%edx
  104861:	85 d2                	test   %edx,%edx
  104863:	7e 0c                	jle    104871 <strncpy+0x31>
  104865:	0f b6 16             	movzbl (%esi),%edx
  104868:	88 13                	mov    %dl,(%ebx)
  10486a:	83 c3 01             	add    $0x1,%ebx
  10486d:	84 d2                	test   %dl,%dl
  10486f:	75 e7                	jne    104858 <strncpy+0x18>
  104871:	31 d2                	xor    %edx,%edx
  104873:	85 c9                	test   %ecx,%ecx
  104875:	7e 0c                	jle    104883 <strncpy+0x43>
  104877:	90                   	nop
  104878:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
  10487c:	83 c2 01             	add    $0x1,%edx
  10487f:	39 ca                	cmp    %ecx,%edx
  104881:	75 f5                	jne    104878 <strncpy+0x38>
  104883:	5b                   	pop    %ebx
  104884:	5e                   	pop    %esi
  104885:	5d                   	pop    %ebp
  104886:	c3                   	ret    
  104887:	89 f6                	mov    %esi,%esi
  104889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104890 <safestrcpy>:
  104890:	55                   	push   %ebp
  104891:	89 e5                	mov    %esp,%ebp
  104893:	8b 55 10             	mov    0x10(%ebp),%edx
  104896:	56                   	push   %esi
  104897:	8b 45 08             	mov    0x8(%ebp),%eax
  10489a:	53                   	push   %ebx
  10489b:	8b 75 0c             	mov    0xc(%ebp),%esi
  10489e:	85 d2                	test   %edx,%edx
  1048a0:	7e 1f                	jle    1048c1 <safestrcpy+0x31>
  1048a2:	89 c1                	mov    %eax,%ecx
  1048a4:	eb 05                	jmp    1048ab <safestrcpy+0x1b>
  1048a6:	66 90                	xchg   %ax,%ax
  1048a8:	83 c6 01             	add    $0x1,%esi
  1048ab:	83 ea 01             	sub    $0x1,%edx
  1048ae:	85 d2                	test   %edx,%edx
  1048b0:	7e 0c                	jle    1048be <safestrcpy+0x2e>
  1048b2:	0f b6 1e             	movzbl (%esi),%ebx
  1048b5:	88 19                	mov    %bl,(%ecx)
  1048b7:	83 c1 01             	add    $0x1,%ecx
  1048ba:	84 db                	test   %bl,%bl
  1048bc:	75 ea                	jne    1048a8 <safestrcpy+0x18>
  1048be:	c6 01 00             	movb   $0x0,(%ecx)
  1048c1:	5b                   	pop    %ebx
  1048c2:	5e                   	pop    %esi
  1048c3:	5d                   	pop    %ebp
  1048c4:	c3                   	ret    
  1048c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1048c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001048d0 <strlen>:
  1048d0:	55                   	push   %ebp
  1048d1:	31 c0                	xor    %eax,%eax
  1048d3:	89 e5                	mov    %esp,%ebp
  1048d5:	8b 55 08             	mov    0x8(%ebp),%edx
  1048d8:	80 3a 00             	cmpb   $0x0,(%edx)
  1048db:	74 0c                	je     1048e9 <strlen+0x19>
  1048dd:	8d 76 00             	lea    0x0(%esi),%esi
  1048e0:	83 c0 01             	add    $0x1,%eax
  1048e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  1048e7:	75 f7                	jne    1048e0 <strlen+0x10>
  1048e9:	5d                   	pop    %ebp
  1048ea:	c3                   	ret    
  1048eb:	90                   	nop

001048ec <swtch>:
  1048ec:	8b 44 24 04          	mov    0x4(%esp),%eax
  1048f0:	8b 54 24 08          	mov    0x8(%esp),%edx
  1048f4:	55                   	push   %ebp
  1048f5:	53                   	push   %ebx
  1048f6:	56                   	push   %esi
  1048f7:	57                   	push   %edi
  1048f8:	89 20                	mov    %esp,(%eax)
  1048fa:	89 d4                	mov    %edx,%esp
  1048fc:	5f                   	pop    %edi
  1048fd:	5e                   	pop    %esi
  1048fe:	5b                   	pop    %ebx
  1048ff:	5d                   	pop    %ebp
  104900:	c3                   	ret    
  104901:	90                   	nop
  104902:	90                   	nop
  104903:	90                   	nop
  104904:	90                   	nop
  104905:	90                   	nop
  104906:	90                   	nop
  104907:	90                   	nop
  104908:	90                   	nop
  104909:	90                   	nop
  10490a:	90                   	nop
  10490b:	90                   	nop
  10490c:	90                   	nop
  10490d:	90                   	nop
  10490e:	90                   	nop
  10490f:	90                   	nop

00104910 <fetchint>:
  104910:	55                   	push   %ebp
  104911:	89 e5                	mov    %esp,%ebp
  104913:	8b 55 08             	mov    0x8(%ebp),%edx
  104916:	8b 45 0c             	mov    0xc(%ebp),%eax
  104919:	8b 12                	mov    (%edx),%edx
  10491b:	39 c2                	cmp    %eax,%edx
  10491d:	77 09                	ja     104928 <fetchint+0x18>
  10491f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104924:	5d                   	pop    %ebp
  104925:	c3                   	ret    
  104926:	66 90                	xchg   %ax,%ax
  104928:	8d 48 04             	lea    0x4(%eax),%ecx
  10492b:	39 ca                	cmp    %ecx,%edx
  10492d:	72 f0                	jb     10491f <fetchint+0xf>
  10492f:	8b 10                	mov    (%eax),%edx
  104931:	8b 45 10             	mov    0x10(%ebp),%eax
  104934:	89 10                	mov    %edx,(%eax)
  104936:	31 c0                	xor    %eax,%eax
  104938:	5d                   	pop    %ebp
  104939:	c3                   	ret    
  10493a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104940 <fetchstr>:
  104940:	55                   	push   %ebp
  104941:	89 e5                	mov    %esp,%ebp
  104943:	8b 45 08             	mov    0x8(%ebp),%eax
  104946:	8b 55 0c             	mov    0xc(%ebp),%edx
  104949:	53                   	push   %ebx
  10494a:	39 10                	cmp    %edx,(%eax)
  10494c:	77 0a                	ja     104958 <fetchstr+0x18>
  10494e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104953:	5b                   	pop    %ebx
  104954:	5d                   	pop    %ebp
  104955:	c3                   	ret    
  104956:	66 90                	xchg   %ax,%ax
  104958:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10495b:	89 11                	mov    %edx,(%ecx)
  10495d:	8b 18                	mov    (%eax),%ebx
  10495f:	39 da                	cmp    %ebx,%edx
  104961:	73 eb                	jae    10494e <fetchstr+0xe>
  104963:	31 c0                	xor    %eax,%eax
  104965:	89 d1                	mov    %edx,%ecx
  104967:	80 3a 00             	cmpb   $0x0,(%edx)
  10496a:	74 e7                	je     104953 <fetchstr+0x13>
  10496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104970:	83 c1 01             	add    $0x1,%ecx
  104973:	39 cb                	cmp    %ecx,%ebx
  104975:	76 d7                	jbe    10494e <fetchstr+0xe>
  104977:	80 39 00             	cmpb   $0x0,(%ecx)
  10497a:	75 f4                	jne    104970 <fetchstr+0x30>
  10497c:	89 c8                	mov    %ecx,%eax
  10497e:	29 d0                	sub    %edx,%eax
  104980:	eb d1                	jmp    104953 <fetchstr+0x13>
  104982:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104990 <argint>:
  104990:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104996:	55                   	push   %ebp
  104997:	89 e5                	mov    %esp,%ebp
  104999:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10499c:	8b 50 60             	mov    0x60(%eax),%edx
  10499f:	8b 00                	mov    (%eax),%eax
  1049a1:	8b 52 44             	mov    0x44(%edx),%edx
  1049a4:	8d 54 8a 04          	lea    0x4(%edx,%ecx,4),%edx
  1049a8:	39 c2                	cmp    %eax,%edx
  1049aa:	72 0c                	jb     1049b8 <argint+0x28>
  1049ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1049b1:	5d                   	pop    %ebp
  1049b2:	c3                   	ret    
  1049b3:	90                   	nop
  1049b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1049b8:	8d 4a 04             	lea    0x4(%edx),%ecx
  1049bb:	39 c8                	cmp    %ecx,%eax
  1049bd:	72 ed                	jb     1049ac <argint+0x1c>
  1049bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1049c2:	8b 12                	mov    (%edx),%edx
  1049c4:	89 10                	mov    %edx,(%eax)
  1049c6:	31 c0                	xor    %eax,%eax
  1049c8:	5d                   	pop    %ebp
  1049c9:	c3                   	ret    
  1049ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001049d0 <argptr>:
  1049d0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1049d6:	55                   	push   %ebp
  1049d7:	89 e5                	mov    %esp,%ebp
  1049d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1049dc:	8b 50 60             	mov    0x60(%eax),%edx
  1049df:	8b 00                	mov    (%eax),%eax
  1049e1:	8b 52 44             	mov    0x44(%edx),%edx
  1049e4:	8d 54 8a 04          	lea    0x4(%edx,%ecx,4),%edx
  1049e8:	39 c2                	cmp    %eax,%edx
  1049ea:	73 07                	jae    1049f3 <argptr+0x23>
  1049ec:	8d 4a 04             	lea    0x4(%edx),%ecx
  1049ef:	39 c8                	cmp    %ecx,%eax
  1049f1:	73 0d                	jae    104a00 <argptr+0x30>
  1049f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1049f8:	5d                   	pop    %ebp
  1049f9:	c3                   	ret    
  1049fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104a00:	8b 12                	mov    (%edx),%edx
  104a02:	39 c2                	cmp    %eax,%edx
  104a04:	73 ed                	jae    1049f3 <argptr+0x23>
  104a06:	8b 4d 10             	mov    0x10(%ebp),%ecx
  104a09:	01 d1                	add    %edx,%ecx
  104a0b:	39 c1                	cmp    %eax,%ecx
  104a0d:	73 e4                	jae    1049f3 <argptr+0x23>
  104a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  104a12:	89 10                	mov    %edx,(%eax)
  104a14:	31 c0                	xor    %eax,%eax
  104a16:	5d                   	pop    %ebp
  104a17:	c3                   	ret    
  104a18:	90                   	nop
  104a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104a20 <argstr>:
  104a20:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104a27:	55                   	push   %ebp
  104a28:	89 e5                	mov    %esp,%ebp
  104a2a:	53                   	push   %ebx
  104a2b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  104a2e:	8b 42 60             	mov    0x60(%edx),%eax
  104a31:	8b 40 44             	mov    0x44(%eax),%eax
  104a34:	8d 44 88 04          	lea    0x4(%eax,%ecx,4),%eax
  104a38:	8b 0a                	mov    (%edx),%ecx
  104a3a:	39 c8                	cmp    %ecx,%eax
  104a3c:	73 07                	jae    104a45 <argstr+0x25>
  104a3e:	8d 58 04             	lea    0x4(%eax),%ebx
  104a41:	39 d9                	cmp    %ebx,%ecx
  104a43:	73 0b                	jae    104a50 <argstr+0x30>
  104a45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104a4a:	5b                   	pop    %ebx
  104a4b:	5d                   	pop    %ebp
  104a4c:	c3                   	ret    
  104a4d:	8d 76 00             	lea    0x0(%esi),%esi
  104a50:	8b 18                	mov    (%eax),%ebx
  104a52:	39 cb                	cmp    %ecx,%ebx
  104a54:	73 ef                	jae    104a45 <argstr+0x25>
  104a56:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  104a59:	89 d8                	mov    %ebx,%eax
  104a5b:	89 19                	mov    %ebx,(%ecx)
  104a5d:	8b 12                	mov    (%edx),%edx
  104a5f:	39 d3                	cmp    %edx,%ebx
  104a61:	73 e2                	jae    104a45 <argstr+0x25>
  104a63:	80 3b 00             	cmpb   $0x0,(%ebx)
  104a66:	75 12                	jne    104a7a <argstr+0x5a>
  104a68:	eb 1e                	jmp    104a88 <argstr+0x68>
  104a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104a70:	80 38 00             	cmpb   $0x0,(%eax)
  104a73:	90                   	nop
  104a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104a78:	74 0e                	je     104a88 <argstr+0x68>
  104a7a:	83 c0 01             	add    $0x1,%eax
  104a7d:	39 c2                	cmp    %eax,%edx
  104a7f:	90                   	nop
  104a80:	77 ee                	ja     104a70 <argstr+0x50>
  104a82:	eb c1                	jmp    104a45 <argstr+0x25>
  104a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104a88:	29 d8                	sub    %ebx,%eax
  104a8a:	5b                   	pop    %ebx
  104a8b:	5d                   	pop    %ebp
  104a8c:	c3                   	ret    
  104a8d:	8d 76 00             	lea    0x0(%esi),%esi

00104a90 <syscall>:
  104a90:	55                   	push   %ebp
  104a91:	89 e5                	mov    %esp,%ebp
  104a93:	53                   	push   %ebx
  104a94:	83 ec 14             	sub    $0x14,%esp
  104a97:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104a9e:	8b 5a 60             	mov    0x60(%edx),%ebx
  104aa1:	8b 43 1c             	mov    0x1c(%ebx),%eax
  104aa4:	83 f8 1f             	cmp    $0x1f,%eax
  104aa7:	77 17                	ja     104ac0 <syscall+0x30>
  104aa9:	8b 0c 85 e0 77 10 00 	mov    0x1077e0(,%eax,4),%ecx
  104ab0:	85 c9                	test   %ecx,%ecx
  104ab2:	74 0c                	je     104ac0 <syscall+0x30>
  104ab4:	ff d1                	call   *%ecx
  104ab6:	89 43 1c             	mov    %eax,0x1c(%ebx)
  104ab9:	83 c4 14             	add    $0x14,%esp
  104abc:	5b                   	pop    %ebx
  104abd:	5d                   	pop    %ebp
  104abe:	c3                   	ret    
  104abf:	90                   	nop
  104ac0:	8b 4a 58             	mov    0x58(%edx),%ecx
  104ac3:	83 c2 6c             	add    $0x6c,%edx
  104ac6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  104aca:	89 54 24 08          	mov    %edx,0x8(%esp)
  104ace:	c7 04 24 c2 77 10 00 	movl   $0x1077c2,(%esp)
  104ad5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  104ad9:	e8 82 bc ff ff       	call   100760 <cprintf>
  104ade:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104ae4:	8b 40 60             	mov    0x60(%eax),%eax
  104ae7:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  104aee:	83 c4 14             	add    $0x14,%esp
  104af1:	5b                   	pop    %ebx
  104af2:	5d                   	pop    %ebp
  104af3:	c3                   	ret    
  104af4:	90                   	nop
  104af5:	90                   	nop
  104af6:	90                   	nop
  104af7:	90                   	nop
  104af8:	90                   	nop
  104af9:	90                   	nop
  104afa:	90                   	nop
  104afb:	90                   	nop
  104afc:	90                   	nop
  104afd:	90                   	nop
  104afe:	90                   	nop
  104aff:	90                   	nop

00104b00 <sys_pipe>:
  104b00:	55                   	push   %ebp
  104b01:	89 e5                	mov    %esp,%ebp
  104b03:	53                   	push   %ebx
  104b04:	83 ec 24             	sub    $0x24,%esp
  104b07:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104b0a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
  104b11:	00 
  104b12:	89 44 24 04          	mov    %eax,0x4(%esp)
  104b16:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104b1d:	e8 ae fe ff ff       	call   1049d0 <argptr>
  104b22:	85 c0                	test   %eax,%eax
  104b24:	79 12                	jns    104b38 <sys_pipe+0x38>
  104b26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104b2b:	83 c4 24             	add    $0x24,%esp
  104b2e:	5b                   	pop    %ebx
  104b2f:	5d                   	pop    %ebp
  104b30:	c3                   	ret    
  104b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104b38:	8d 45 ec             	lea    -0x14(%ebp),%eax
  104b3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104b3f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  104b42:	89 04 24             	mov    %eax,(%esp)
  104b45:	e8 36 e6 ff ff       	call   103180 <pipealloc>
  104b4a:	85 c0                	test   %eax,%eax
  104b4c:	78 d8                	js     104b26 <sys_pipe+0x26>
  104b4e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  104b51:	31 c0                	xor    %eax,%eax
  104b53:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104b60:	8b 5c 82 08          	mov    0x8(%edx,%eax,4),%ebx
  104b64:	85 db                	test   %ebx,%ebx
  104b66:	74 28                	je     104b90 <sys_pipe+0x90>
  104b68:	83 c0 01             	add    $0x1,%eax
  104b6b:	83 f8 10             	cmp    $0x10,%eax
  104b6e:	75 f0                	jne    104b60 <sys_pipe+0x60>
  104b70:	89 0c 24             	mov    %ecx,(%esp)
  104b73:	e8 88 c6 ff ff       	call   101200 <fileclose>
  104b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104b7b:	89 04 24             	mov    %eax,(%esp)
  104b7e:	e8 7d c6 ff ff       	call   101200 <fileclose>
  104b83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104b88:	eb a1                	jmp    104b2b <sys_pipe+0x2b>
  104b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104b90:	89 4c 82 08          	mov    %ecx,0x8(%edx,%eax,4)
  104b94:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  104b97:	31 d2                	xor    %edx,%edx
  104b99:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
  104ba0:	83 7c 91 08 00       	cmpl   $0x0,0x8(%ecx,%edx,4)
  104ba5:	74 19                	je     104bc0 <sys_pipe+0xc0>
  104ba7:	83 c2 01             	add    $0x1,%edx
  104baa:	83 fa 10             	cmp    $0x10,%edx
  104bad:	75 f1                	jne    104ba0 <sys_pipe+0xa0>
  104baf:	c7 44 81 08 00 00 00 	movl   $0x0,0x8(%ecx,%eax,4)
  104bb6:	00 
  104bb7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  104bba:	eb b4                	jmp    104b70 <sys_pipe+0x70>
  104bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104bc0:	89 5c 91 08          	mov    %ebx,0x8(%ecx,%edx,4)
  104bc4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  104bc7:	89 01                	mov    %eax,(%ecx)
  104bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104bcc:	89 50 04             	mov    %edx,0x4(%eax)
  104bcf:	31 c0                	xor    %eax,%eax
  104bd1:	e9 55 ff ff ff       	jmp    104b2b <sys_pipe+0x2b>
  104bd6:	8d 76 00             	lea    0x0(%esi),%esi
  104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104be0 <sys_exec>:
  104be0:	55                   	push   %ebp
  104be1:	89 e5                	mov    %esp,%ebp
  104be3:	81 ec 88 00 00 00    	sub    $0x88,%esp
  104be9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  104bec:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  104bef:	89 75 f8             	mov    %esi,-0x8(%ebp)
  104bf2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  104bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
  104bf9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104c00:	e8 1b fe ff ff       	call   104a20 <argstr>
  104c05:	85 c0                	test   %eax,%eax
  104c07:	79 17                	jns    104c20 <sys_exec+0x40>
  104c09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104c0e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104c11:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104c14:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104c17:	89 ec                	mov    %ebp,%esp
  104c19:	5d                   	pop    %ebp
  104c1a:	c3                   	ret    
  104c1b:	90                   	nop
  104c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104c20:	8d 45 e0             	lea    -0x20(%ebp),%eax
  104c23:	89 44 24 04          	mov    %eax,0x4(%esp)
  104c27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  104c2e:	e8 5d fd ff ff       	call   104990 <argint>
  104c33:	85 c0                	test   %eax,%eax
  104c35:	78 d2                	js     104c09 <sys_exec+0x29>
  104c37:	8d 7d 8c             	lea    -0x74(%ebp),%edi
  104c3a:	31 f6                	xor    %esi,%esi
  104c3c:	c7 44 24 08 50 00 00 	movl   $0x50,0x8(%esp)
  104c43:	00 
  104c44:	31 db                	xor    %ebx,%ebx
  104c46:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  104c4d:	00 
  104c4e:	89 3c 24             	mov    %edi,(%esp)
  104c51:	e8 9a fa ff ff       	call   1046f0 <memset>
  104c56:	eb 27                	jmp    104c7f <sys_exec+0x9f>
  104c58:	89 44 24 04          	mov    %eax,0x4(%esp)
  104c5c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104c62:	8d 14 b7             	lea    (%edi,%esi,4),%edx
  104c65:	89 54 24 08          	mov    %edx,0x8(%esp)
  104c69:	89 04 24             	mov    %eax,(%esp)
  104c6c:	e8 cf fc ff ff       	call   104940 <fetchstr>
  104c71:	85 c0                	test   %eax,%eax
  104c73:	78 94                	js     104c09 <sys_exec+0x29>
  104c75:	83 c3 01             	add    $0x1,%ebx
  104c78:	83 fb 14             	cmp    $0x14,%ebx
  104c7b:	89 de                	mov    %ebx,%esi
  104c7d:	74 8a                	je     104c09 <sys_exec+0x29>
  104c7f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  104c82:	89 44 24 08          	mov    %eax,0x8(%esp)
  104c86:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  104c8d:	03 45 e0             	add    -0x20(%ebp),%eax
  104c90:	89 44 24 04          	mov    %eax,0x4(%esp)
  104c94:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104c9a:	89 04 24             	mov    %eax,(%esp)
  104c9d:	e8 6e fc ff ff       	call   104910 <fetchint>
  104ca2:	85 c0                	test   %eax,%eax
  104ca4:	0f 88 5f ff ff ff    	js     104c09 <sys_exec+0x29>
  104caa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104cad:	85 c0                	test   %eax,%eax
  104caf:	75 a7                	jne    104c58 <sys_exec+0x78>
  104cb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  104cb4:	c7 44 9d 8c 00 00 00 	movl   $0x0,-0x74(%ebp,%ebx,4)
  104cbb:	00 
  104cbc:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104cc0:	89 04 24             	mov    %eax,(%esp)
  104cc3:	e8 08 bf ff ff       	call   100bd0 <exec>
  104cc8:	e9 41 ff ff ff       	jmp    104c0e <sys_exec+0x2e>
  104ccd:	8d 76 00             	lea    0x0(%esi),%esi

00104cd0 <sys_chdir>:
  104cd0:	55                   	push   %ebp
  104cd1:	89 e5                	mov    %esp,%ebp
  104cd3:	53                   	push   %ebx
  104cd4:	83 ec 24             	sub    $0x24,%esp
  104cd7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104cda:	89 44 24 04          	mov    %eax,0x4(%esp)
  104cde:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104ce5:	e8 36 fd ff ff       	call   104a20 <argstr>
  104cea:	85 c0                	test   %eax,%eax
  104cec:	79 12                	jns    104d00 <sys_chdir+0x30>
  104cee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104cf3:	83 c4 24             	add    $0x24,%esp
  104cf6:	5b                   	pop    %ebx
  104cf7:	5d                   	pop    %ebp
  104cf8:	c3                   	ret    
  104cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104d00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104d03:	89 04 24             	mov    %eax,(%esp)
  104d06:	e8 c5 d3 ff ff       	call   1020d0 <namei>
  104d0b:	85 c0                	test   %eax,%eax
  104d0d:	89 c3                	mov    %eax,%ebx
  104d0f:	74 dd                	je     104cee <sys_chdir+0x1e>
  104d11:	89 04 24             	mov    %eax,(%esp)
  104d14:	e8 17 d1 ff ff       	call   101e30 <ilock>
  104d19:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  104d1e:	75 26                	jne    104d46 <sys_chdir+0x76>
  104d20:	89 1c 24             	mov    %ebx,(%esp)
  104d23:	e8 c8 cc ff ff       	call   1019f0 <iunlock>
  104d28:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104d2e:	8b 40 48             	mov    0x48(%eax),%eax
  104d31:	89 04 24             	mov    %eax,(%esp)
  104d34:	e8 c7 cd ff ff       	call   101b00 <iput>
  104d39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104d3f:	89 58 48             	mov    %ebx,0x48(%eax)
  104d42:	31 c0                	xor    %eax,%eax
  104d44:	eb ad                	jmp    104cf3 <sys_chdir+0x23>
  104d46:	89 1c 24             	mov    %ebx,(%esp)
  104d49:	e8 f2 cf ff ff       	call   101d40 <iunlockput>
  104d4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104d53:	eb 9e                	jmp    104cf3 <sys_chdir+0x23>
  104d55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104d60 <create>:
  104d60:	55                   	push   %ebp
  104d61:	89 e5                	mov    %esp,%ebp
  104d63:	83 ec 58             	sub    $0x58,%esp
  104d66:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  104d69:	8b 4d 08             	mov    0x8(%ebp),%ecx
  104d6c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  104d6f:	8d 75 d6             	lea    -0x2a(%ebp),%esi
  104d72:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  104d75:	31 db                	xor    %ebx,%ebx
  104d77:	89 7d fc             	mov    %edi,-0x4(%ebp)
  104d7a:	89 d7                	mov    %edx,%edi
  104d7c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  104d7f:	89 74 24 04          	mov    %esi,0x4(%esp)
  104d83:	89 04 24             	mov    %eax,(%esp)
  104d86:	e8 25 d3 ff ff       	call   1020b0 <nameiparent>
  104d8b:	85 c0                	test   %eax,%eax
  104d8d:	74 47                	je     104dd6 <create+0x76>
  104d8f:	89 04 24             	mov    %eax,(%esp)
  104d92:	89 45 bc             	mov    %eax,-0x44(%ebp)
  104d95:	e8 96 d0 ff ff       	call   101e30 <ilock>
  104d9a:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104d9d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  104da0:	89 44 24 08          	mov    %eax,0x8(%esp)
  104da4:	89 74 24 04          	mov    %esi,0x4(%esp)
  104da8:	89 14 24             	mov    %edx,(%esp)
  104dab:	e8 40 cb ff ff       	call   1018f0 <dirlookup>
  104db0:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104db3:	85 c0                	test   %eax,%eax
  104db5:	89 c3                	mov    %eax,%ebx
  104db7:	74 3f                	je     104df8 <create+0x98>
  104db9:	89 14 24             	mov    %edx,(%esp)
  104dbc:	e8 7f cf ff ff       	call   101d40 <iunlockput>
  104dc1:	89 1c 24             	mov    %ebx,(%esp)
  104dc4:	e8 67 d0 ff ff       	call   101e30 <ilock>
  104dc9:	66 83 ff 02          	cmp    $0x2,%di
  104dcd:	75 19                	jne    104de8 <create+0x88>
  104dcf:	66 83 7b 10 02       	cmpw   $0x2,0x10(%ebx)
  104dd4:	75 12                	jne    104de8 <create+0x88>
  104dd6:	89 d8                	mov    %ebx,%eax
  104dd8:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104ddb:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104dde:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104de1:	89 ec                	mov    %ebp,%esp
  104de3:	5d                   	pop    %ebp
  104de4:	c3                   	ret    
  104de5:	8d 76 00             	lea    0x0(%esi),%esi
  104de8:	89 1c 24             	mov    %ebx,(%esp)
  104deb:	31 db                	xor    %ebx,%ebx
  104ded:	e8 4e cf ff ff       	call   101d40 <iunlockput>
  104df2:	eb e2                	jmp    104dd6 <create+0x76>
  104df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104df8:	0f bf c7             	movswl %di,%eax
  104dfb:	89 44 24 04          	mov    %eax,0x4(%esp)
  104dff:	8b 02                	mov    (%edx),%eax
  104e01:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104e04:	89 04 24             	mov    %eax,(%esp)
  104e07:	e8 54 cf ff ff       	call   101d60 <ialloc>
  104e0c:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104e0f:	85 c0                	test   %eax,%eax
  104e11:	89 c3                	mov    %eax,%ebx
  104e13:	0f 84 b7 00 00 00    	je     104ed0 <create+0x170>
  104e19:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104e1c:	89 04 24             	mov    %eax,(%esp)
  104e1f:	e8 0c d0 ff ff       	call   101e30 <ilock>
  104e24:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
  104e28:	66 89 43 12          	mov    %ax,0x12(%ebx)
  104e2c:	0f b7 4d c0          	movzwl -0x40(%ebp),%ecx
  104e30:	66 c7 43 16 01 00    	movw   $0x1,0x16(%ebx)
  104e36:	66 89 4b 14          	mov    %cx,0x14(%ebx)
  104e3a:	89 1c 24             	mov    %ebx,(%esp)
  104e3d:	e8 ae c8 ff ff       	call   1016f0 <iupdate>
  104e42:	66 83 ff 01          	cmp    $0x1,%di
  104e46:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104e49:	74 2d                	je     104e78 <create+0x118>
  104e4b:	8b 43 04             	mov    0x4(%ebx),%eax
  104e4e:	89 14 24             	mov    %edx,(%esp)
  104e51:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104e54:	89 74 24 04          	mov    %esi,0x4(%esp)
  104e58:	89 44 24 08          	mov    %eax,0x8(%esp)
  104e5c:	e8 ef cd ff ff       	call   101c50 <dirlink>
  104e61:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104e64:	85 c0                	test   %eax,%eax
  104e66:	78 74                	js     104edc <create+0x17c>
  104e68:	89 14 24             	mov    %edx,(%esp)
  104e6b:	e8 d0 ce ff ff       	call   101d40 <iunlockput>
  104e70:	e9 61 ff ff ff       	jmp    104dd6 <create+0x76>
  104e75:	8d 76 00             	lea    0x0(%esi),%esi
  104e78:	66 83 42 16 01       	addw   $0x1,0x16(%edx)
  104e7d:	89 14 24             	mov    %edx,(%esp)
  104e80:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104e83:	e8 68 c8 ff ff       	call   1016f0 <iupdate>
  104e88:	8b 43 04             	mov    0x4(%ebx),%eax
  104e8b:	c7 44 24 04 70 78 10 	movl   $0x107870,0x4(%esp)
  104e92:	00 
  104e93:	89 1c 24             	mov    %ebx,(%esp)
  104e96:	89 44 24 08          	mov    %eax,0x8(%esp)
  104e9a:	e8 b1 cd ff ff       	call   101c50 <dirlink>
  104e9f:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104ea2:	85 c0                	test   %eax,%eax
  104ea4:	78 1e                	js     104ec4 <create+0x164>
  104ea6:	8b 42 04             	mov    0x4(%edx),%eax
  104ea9:	c7 44 24 04 6f 78 10 	movl   $0x10786f,0x4(%esp)
  104eb0:	00 
  104eb1:	89 1c 24             	mov    %ebx,(%esp)
  104eb4:	89 44 24 08          	mov    %eax,0x8(%esp)
  104eb8:	e8 93 cd ff ff       	call   101c50 <dirlink>
  104ebd:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104ec0:	85 c0                	test   %eax,%eax
  104ec2:	79 87                	jns    104e4b <create+0xeb>
  104ec4:	c7 04 24 72 78 10 00 	movl   $0x107872,(%esp)
  104ecb:	e8 80 bc ff ff       	call   100b50 <panic>
  104ed0:	c7 04 24 60 78 10 00 	movl   $0x107860,(%esp)
  104ed7:	e8 74 bc ff ff       	call   100b50 <panic>
  104edc:	c7 04 24 7e 78 10 00 	movl   $0x10787e,(%esp)
  104ee3:	e8 68 bc ff ff       	call   100b50 <panic>
  104ee8:	90                   	nop
  104ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104ef0 <sys_mknod>:
  104ef0:	55                   	push   %ebp
  104ef1:	89 e5                	mov    %esp,%ebp
  104ef3:	83 ec 28             	sub    $0x28,%esp
  104ef6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104ef9:	89 44 24 04          	mov    %eax,0x4(%esp)
  104efd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104f04:	e8 17 fb ff ff       	call   104a20 <argstr>
  104f09:	85 c0                	test   %eax,%eax
  104f0b:	79 0b                	jns    104f18 <sys_mknod+0x28>
  104f0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104f12:	c9                   	leave  
  104f13:	c3                   	ret    
  104f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104f18:	8d 45 f0             	lea    -0x10(%ebp),%eax
  104f1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f1f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  104f26:	e8 65 fa ff ff       	call   104990 <argint>
  104f2b:	85 c0                	test   %eax,%eax
  104f2d:	78 de                	js     104f0d <sys_mknod+0x1d>
  104f2f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  104f32:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f36:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  104f3d:	e8 4e fa ff ff       	call   104990 <argint>
  104f42:	85 c0                	test   %eax,%eax
  104f44:	78 c7                	js     104f0d <sys_mknod+0x1d>
  104f46:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
  104f4a:	ba 03 00 00 00       	mov    $0x3,%edx
  104f4f:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
  104f53:	89 04 24             	mov    %eax,(%esp)
  104f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104f59:	e8 02 fe ff ff       	call   104d60 <create>
  104f5e:	85 c0                	test   %eax,%eax
  104f60:	74 ab                	je     104f0d <sys_mknod+0x1d>
  104f62:	89 04 24             	mov    %eax,(%esp)
  104f65:	e8 d6 cd ff ff       	call   101d40 <iunlockput>
  104f6a:	31 c0                	xor    %eax,%eax
  104f6c:	c9                   	leave  
  104f6d:	c3                   	ret    
  104f6e:	66 90                	xchg   %ax,%ax

00104f70 <sys_mkdir>:
  104f70:	55                   	push   %ebp
  104f71:	89 e5                	mov    %esp,%ebp
  104f73:	83 ec 28             	sub    $0x28,%esp
  104f76:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104f79:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f7d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104f84:	e8 97 fa ff ff       	call   104a20 <argstr>
  104f89:	85 c0                	test   %eax,%eax
  104f8b:	79 0b                	jns    104f98 <sys_mkdir+0x28>
  104f8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104f92:	c9                   	leave  
  104f93:	c3                   	ret    
  104f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104f98:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104fa2:	31 c9                	xor    %ecx,%ecx
  104fa4:	ba 01 00 00 00       	mov    $0x1,%edx
  104fa9:	e8 b2 fd ff ff       	call   104d60 <create>
  104fae:	85 c0                	test   %eax,%eax
  104fb0:	74 db                	je     104f8d <sys_mkdir+0x1d>
  104fb2:	89 04 24             	mov    %eax,(%esp)
  104fb5:	e8 86 cd ff ff       	call   101d40 <iunlockput>
  104fba:	31 c0                	xor    %eax,%eax
  104fbc:	c9                   	leave  
  104fbd:	c3                   	ret    
  104fbe:	66 90                	xchg   %ax,%ax

00104fc0 <sys_link>:
  104fc0:	55                   	push   %ebp
  104fc1:	89 e5                	mov    %esp,%ebp
  104fc3:	83 ec 48             	sub    $0x48,%esp
  104fc6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  104fc9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  104fcc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  104fcf:	89 7d fc             	mov    %edi,-0x4(%ebp)
  104fd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  104fd6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104fdd:	e8 3e fa ff ff       	call   104a20 <argstr>
  104fe2:	85 c0                	test   %eax,%eax
  104fe4:	79 12                	jns    104ff8 <sys_link+0x38>
  104fe6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104feb:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104fee:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104ff1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104ff4:	89 ec                	mov    %ebp,%esp
  104ff6:	5d                   	pop    %ebp
  104ff7:	c3                   	ret    
  104ff8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  104ffb:	89 44 24 04          	mov    %eax,0x4(%esp)
  104fff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105006:	e8 15 fa ff ff       	call   104a20 <argstr>
  10500b:	85 c0                	test   %eax,%eax
  10500d:	78 d7                	js     104fe6 <sys_link+0x26>
  10500f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  105012:	89 04 24             	mov    %eax,(%esp)
  105015:	e8 b6 d0 ff ff       	call   1020d0 <namei>
  10501a:	85 c0                	test   %eax,%eax
  10501c:	89 c3                	mov    %eax,%ebx
  10501e:	74 c6                	je     104fe6 <sys_link+0x26>
  105020:	89 04 24             	mov    %eax,(%esp)
  105023:	e8 08 ce ff ff       	call   101e30 <ilock>
  105028:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  10502d:	0f 84 86 00 00 00    	je     1050b9 <sys_link+0xf9>
  105033:	66 83 43 16 01       	addw   $0x1,0x16(%ebx)
  105038:	8d 7d d2             	lea    -0x2e(%ebp),%edi
  10503b:	89 1c 24             	mov    %ebx,(%esp)
  10503e:	e8 ad c6 ff ff       	call   1016f0 <iupdate>
  105043:	89 1c 24             	mov    %ebx,(%esp)
  105046:	e8 a5 c9 ff ff       	call   1019f0 <iunlock>
  10504b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10504e:	89 7c 24 04          	mov    %edi,0x4(%esp)
  105052:	89 04 24             	mov    %eax,(%esp)
  105055:	e8 56 d0 ff ff       	call   1020b0 <nameiparent>
  10505a:	85 c0                	test   %eax,%eax
  10505c:	89 c6                	mov    %eax,%esi
  10505e:	74 44                	je     1050a4 <sys_link+0xe4>
  105060:	89 04 24             	mov    %eax,(%esp)
  105063:	e8 c8 cd ff ff       	call   101e30 <ilock>
  105068:	8b 06                	mov    (%esi),%eax
  10506a:	3b 03                	cmp    (%ebx),%eax
  10506c:	75 2e                	jne    10509c <sys_link+0xdc>
  10506e:	8b 43 04             	mov    0x4(%ebx),%eax
  105071:	89 7c 24 04          	mov    %edi,0x4(%esp)
  105075:	89 34 24             	mov    %esi,(%esp)
  105078:	89 44 24 08          	mov    %eax,0x8(%esp)
  10507c:	e8 cf cb ff ff       	call   101c50 <dirlink>
  105081:	85 c0                	test   %eax,%eax
  105083:	78 17                	js     10509c <sys_link+0xdc>
  105085:	89 34 24             	mov    %esi,(%esp)
  105088:	e8 b3 cc ff ff       	call   101d40 <iunlockput>
  10508d:	89 1c 24             	mov    %ebx,(%esp)
  105090:	e8 6b ca ff ff       	call   101b00 <iput>
  105095:	31 c0                	xor    %eax,%eax
  105097:	e9 4f ff ff ff       	jmp    104feb <sys_link+0x2b>
  10509c:	89 34 24             	mov    %esi,(%esp)
  10509f:	e8 9c cc ff ff       	call   101d40 <iunlockput>
  1050a4:	89 1c 24             	mov    %ebx,(%esp)
  1050a7:	e8 84 cd ff ff       	call   101e30 <ilock>
  1050ac:	66 83 6b 16 01       	subw   $0x1,0x16(%ebx)
  1050b1:	89 1c 24             	mov    %ebx,(%esp)
  1050b4:	e8 37 c6 ff ff       	call   1016f0 <iupdate>
  1050b9:	89 1c 24             	mov    %ebx,(%esp)
  1050bc:	e8 7f cc ff ff       	call   101d40 <iunlockput>
  1050c1:	83 c8 ff             	or     $0xffffffff,%eax
  1050c4:	e9 22 ff ff ff       	jmp    104feb <sys_link+0x2b>
  1050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001050d0 <sys_open>:
  1050d0:	55                   	push   %ebp
  1050d1:	89 e5                	mov    %esp,%ebp
  1050d3:	83 ec 38             	sub    $0x38,%esp
  1050d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1050d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  1050dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  1050df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1050e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1050ea:	e8 31 f9 ff ff       	call   104a20 <argstr>
  1050ef:	85 c0                	test   %eax,%eax
  1050f1:	79 15                	jns    105108 <sys_open+0x38>
  1050f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1050f8:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  1050fb:	8b 75 fc             	mov    -0x4(%ebp),%esi
  1050fe:	89 ec                	mov    %ebp,%esp
  105100:	5d                   	pop    %ebp
  105101:	c3                   	ret    
  105102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105108:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10510b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10510f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105116:	e8 75 f8 ff ff       	call   104990 <argint>
  10511b:	85 c0                	test   %eax,%eax
  10511d:	78 d4                	js     1050f3 <sys_open+0x23>
  10511f:	f6 45 f1 02          	testb  $0x2,-0xf(%ebp)
  105123:	74 63                	je     105188 <sys_open+0xb8>
  105125:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105128:	31 c9                	xor    %ecx,%ecx
  10512a:	ba 02 00 00 00       	mov    $0x2,%edx
  10512f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105136:	e8 25 fc ff ff       	call   104d60 <create>
  10513b:	85 c0                	test   %eax,%eax
  10513d:	89 c3                	mov    %eax,%ebx
  10513f:	74 b2                	je     1050f3 <sys_open+0x23>
  105141:	e8 3a c0 ff ff       	call   101180 <filealloc>
  105146:	85 c0                	test   %eax,%eax
  105148:	89 c6                	mov    %eax,%esi
  10514a:	74 24                	je     105170 <sys_open+0xa0>
  10514c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  105153:	31 c0                	xor    %eax,%eax
  105155:	8d 76 00             	lea    0x0(%esi),%esi
  105158:	8b 4c 82 08          	mov    0x8(%edx,%eax,4),%ecx
  10515c:	85 c9                	test   %ecx,%ecx
  10515e:	74 58                	je     1051b8 <sys_open+0xe8>
  105160:	83 c0 01             	add    $0x1,%eax
  105163:	83 f8 10             	cmp    $0x10,%eax
  105166:	75 f0                	jne    105158 <sys_open+0x88>
  105168:	89 34 24             	mov    %esi,(%esp)
  10516b:	e8 90 c0 ff ff       	call   101200 <fileclose>
  105170:	89 1c 24             	mov    %ebx,(%esp)
  105173:	e8 c8 cb ff ff       	call   101d40 <iunlockput>
  105178:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10517d:	e9 76 ff ff ff       	jmp    1050f8 <sys_open+0x28>
  105182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105188:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10518b:	89 04 24             	mov    %eax,(%esp)
  10518e:	e8 3d cf ff ff       	call   1020d0 <namei>
  105193:	85 c0                	test   %eax,%eax
  105195:	89 c3                	mov    %eax,%ebx
  105197:	0f 84 56 ff ff ff    	je     1050f3 <sys_open+0x23>
  10519d:	89 04 24             	mov    %eax,(%esp)
  1051a0:	e8 8b cc ff ff       	call   101e30 <ilock>
  1051a5:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  1051aa:	75 95                	jne    105141 <sys_open+0x71>
  1051ac:	8b 75 f0             	mov    -0x10(%ebp),%esi
  1051af:	85 f6                	test   %esi,%esi
  1051b1:	74 8e                	je     105141 <sys_open+0x71>
  1051b3:	eb bb                	jmp    105170 <sys_open+0xa0>
  1051b5:	8d 76 00             	lea    0x0(%esi),%esi
  1051b8:	89 74 82 08          	mov    %esi,0x8(%edx,%eax,4)
  1051bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1051bf:	89 1c 24             	mov    %ebx,(%esp)
  1051c2:	e8 29 c8 ff ff       	call   1019f0 <iunlock>
  1051c7:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  1051cd:	89 5e 10             	mov    %ebx,0x10(%esi)
  1051d0:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  1051d7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1051da:	83 f2 01             	xor    $0x1,%edx
  1051dd:	83 e2 01             	and    $0x1,%edx
  1051e0:	88 56 08             	mov    %dl,0x8(%esi)
  1051e3:	f6 45 f0 03          	testb  $0x3,-0x10(%ebp)
  1051e7:	0f 95 46 09          	setne  0x9(%esi)
  1051eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1051ee:	e9 05 ff ff ff       	jmp    1050f8 <sys_open+0x28>
  1051f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1051f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105200 <sys_unlink>:
  105200:	55                   	push   %ebp
  105201:	89 e5                	mov    %esp,%ebp
  105203:	83 ec 78             	sub    $0x78,%esp
  105206:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  105209:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  10520c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10520f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  105212:	89 44 24 04          	mov    %eax,0x4(%esp)
  105216:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10521d:	e8 fe f7 ff ff       	call   104a20 <argstr>
  105222:	85 c0                	test   %eax,%eax
  105224:	79 12                	jns    105238 <sys_unlink+0x38>
  105226:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10522b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10522e:	8b 75 f8             	mov    -0x8(%ebp),%esi
  105231:	8b 7d fc             	mov    -0x4(%ebp),%edi
  105234:	89 ec                	mov    %ebp,%esp
  105236:	5d                   	pop    %ebp
  105237:	c3                   	ret    
  105238:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10523b:	8d 5d d2             	lea    -0x2e(%ebp),%ebx
  10523e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  105242:	89 04 24             	mov    %eax,(%esp)
  105245:	e8 66 ce ff ff       	call   1020b0 <nameiparent>
  10524a:	85 c0                	test   %eax,%eax
  10524c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  10524f:	74 d5                	je     105226 <sys_unlink+0x26>
  105251:	89 04 24             	mov    %eax,(%esp)
  105254:	e8 d7 cb ff ff       	call   101e30 <ilock>
  105259:	c7 44 24 04 70 78 10 	movl   $0x107870,0x4(%esp)
  105260:	00 
  105261:	89 1c 24             	mov    %ebx,(%esp)
  105264:	e8 57 c6 ff ff       	call   1018c0 <namecmp>
  105269:	85 c0                	test   %eax,%eax
  10526b:	0f 84 a4 00 00 00    	je     105315 <sys_unlink+0x115>
  105271:	c7 44 24 04 6f 78 10 	movl   $0x10786f,0x4(%esp)
  105278:	00 
  105279:	89 1c 24             	mov    %ebx,(%esp)
  10527c:	e8 3f c6 ff ff       	call   1018c0 <namecmp>
  105281:	85 c0                	test   %eax,%eax
  105283:	0f 84 8c 00 00 00    	je     105315 <sys_unlink+0x115>
  105289:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10528c:	89 44 24 08          	mov    %eax,0x8(%esp)
  105290:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  105293:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  105297:	89 04 24             	mov    %eax,(%esp)
  10529a:	e8 51 c6 ff ff       	call   1018f0 <dirlookup>
  10529f:	85 c0                	test   %eax,%eax
  1052a1:	89 c6                	mov    %eax,%esi
  1052a3:	74 70                	je     105315 <sys_unlink+0x115>
  1052a5:	89 04 24             	mov    %eax,(%esp)
  1052a8:	e8 83 cb ff ff       	call   101e30 <ilock>
  1052ad:	66 83 7e 16 00       	cmpw   $0x0,0x16(%esi)
  1052b2:	0f 8e 0e 01 00 00    	jle    1053c6 <sys_unlink+0x1c6>
  1052b8:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  1052bd:	75 71                	jne    105330 <sys_unlink+0x130>
  1052bf:	83 7e 18 20          	cmpl   $0x20,0x18(%esi)
  1052c3:	76 6b                	jbe    105330 <sys_unlink+0x130>
  1052c5:	8d 7d b2             	lea    -0x4e(%ebp),%edi
  1052c8:	bb 20 00 00 00       	mov    $0x20,%ebx
  1052cd:	8d 76 00             	lea    0x0(%esi),%esi
  1052d0:	eb 0e                	jmp    1052e0 <sys_unlink+0xe0>
  1052d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1052d8:	83 c3 10             	add    $0x10,%ebx
  1052db:	3b 5e 18             	cmp    0x18(%esi),%ebx
  1052de:	73 50                	jae    105330 <sys_unlink+0x130>
  1052e0:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  1052e7:	00 
  1052e8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  1052ec:	89 7c 24 04          	mov    %edi,0x4(%esp)
  1052f0:	89 34 24             	mov    %esi,(%esp)
  1052f3:	e8 f8 c2 ff ff       	call   1015f0 <readi>
  1052f8:	83 f8 10             	cmp    $0x10,%eax
  1052fb:	0f 85 ad 00 00 00    	jne    1053ae <sys_unlink+0x1ae>
  105301:	66 83 7d b2 00       	cmpw   $0x0,-0x4e(%ebp)
  105306:	74 d0                	je     1052d8 <sys_unlink+0xd8>
  105308:	89 34 24             	mov    %esi,(%esp)
  10530b:	90                   	nop
  10530c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105310:	e8 2b ca ff ff       	call   101d40 <iunlockput>
  105315:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  105318:	89 04 24             	mov    %eax,(%esp)
  10531b:	e8 20 ca ff ff       	call   101d40 <iunlockput>
  105320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105325:	e9 01 ff ff ff       	jmp    10522b <sys_unlink+0x2b>
  10532a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105330:	8d 5d c2             	lea    -0x3e(%ebp),%ebx
  105333:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10533a:	00 
  10533b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  105342:	00 
  105343:	89 1c 24             	mov    %ebx,(%esp)
  105346:	e8 a5 f3 ff ff       	call   1046f0 <memset>
  10534b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10534e:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  105355:	00 
  105356:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  10535a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10535e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  105361:	89 04 24             	mov    %eax,(%esp)
  105364:	e8 17 c4 ff ff       	call   101780 <writei>
  105369:	83 f8 10             	cmp    $0x10,%eax
  10536c:	75 4c                	jne    1053ba <sys_unlink+0x1ba>
  10536e:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  105373:	74 27                	je     10539c <sys_unlink+0x19c>
  105375:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  105378:	89 04 24             	mov    %eax,(%esp)
  10537b:	e8 c0 c9 ff ff       	call   101d40 <iunlockput>
  105380:	66 83 6e 16 01       	subw   $0x1,0x16(%esi)
  105385:	89 34 24             	mov    %esi,(%esp)
  105388:	e8 63 c3 ff ff       	call   1016f0 <iupdate>
  10538d:	89 34 24             	mov    %esi,(%esp)
  105390:	e8 ab c9 ff ff       	call   101d40 <iunlockput>
  105395:	31 c0                	xor    %eax,%eax
  105397:	e9 8f fe ff ff       	jmp    10522b <sys_unlink+0x2b>
  10539c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  10539f:	66 83 68 16 01       	subw   $0x1,0x16(%eax)
  1053a4:	89 04 24             	mov    %eax,(%esp)
  1053a7:	e8 44 c3 ff ff       	call   1016f0 <iupdate>
  1053ac:	eb c7                	jmp    105375 <sys_unlink+0x175>
  1053ae:	c7 04 24 a0 78 10 00 	movl   $0x1078a0,(%esp)
  1053b5:	e8 96 b7 ff ff       	call   100b50 <panic>
  1053ba:	c7 04 24 b2 78 10 00 	movl   $0x1078b2,(%esp)
  1053c1:	e8 8a b7 ff ff       	call   100b50 <panic>
  1053c6:	c7 04 24 8e 78 10 00 	movl   $0x10788e,(%esp)
  1053cd:	e8 7e b7 ff ff       	call   100b50 <panic>
  1053d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1053d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001053e0 <T.67>:
  1053e0:	55                   	push   %ebp
  1053e1:	89 e5                	mov    %esp,%ebp
  1053e3:	83 ec 28             	sub    $0x28,%esp
  1053e6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  1053e9:	89 c3                	mov    %eax,%ebx
  1053eb:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1053ee:	89 75 fc             	mov    %esi,-0x4(%ebp)
  1053f1:	89 d6                	mov    %edx,%esi
  1053f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1053f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1053fe:	e8 8d f5 ff ff       	call   104990 <argint>
  105403:	85 c0                	test   %eax,%eax
  105405:	79 11                	jns    105418 <T.67+0x38>
  105407:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10540c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  10540f:	8b 75 fc             	mov    -0x4(%ebp),%esi
  105412:	89 ec                	mov    %ebp,%esp
  105414:	5d                   	pop    %ebp
  105415:	c3                   	ret    
  105416:	66 90                	xchg   %ax,%ax
  105418:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10541b:	83 f8 0f             	cmp    $0xf,%eax
  10541e:	77 e7                	ja     105407 <T.67+0x27>
  105420:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  105427:	8b 54 82 08          	mov    0x8(%edx,%eax,4),%edx
  10542b:	85 d2                	test   %edx,%edx
  10542d:	74 d8                	je     105407 <T.67+0x27>
  10542f:	85 db                	test   %ebx,%ebx
  105431:	74 02                	je     105435 <T.67+0x55>
  105433:	89 03                	mov    %eax,(%ebx)
  105435:	31 c0                	xor    %eax,%eax
  105437:	85 f6                	test   %esi,%esi
  105439:	74 d1                	je     10540c <T.67+0x2c>
  10543b:	89 16                	mov    %edx,(%esi)
  10543d:	eb cd                	jmp    10540c <T.67+0x2c>
  10543f:	90                   	nop

00105440 <sys_dup>:
  105440:	55                   	push   %ebp
  105441:	31 c0                	xor    %eax,%eax
  105443:	89 e5                	mov    %esp,%ebp
  105445:	53                   	push   %ebx
  105446:	83 ec 24             	sub    $0x24,%esp
  105449:	8d 55 f4             	lea    -0xc(%ebp),%edx
  10544c:	e8 8f ff ff ff       	call   1053e0 <T.67>
  105451:	85 c0                	test   %eax,%eax
  105453:	79 13                	jns    105468 <sys_dup+0x28>
  105455:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  10545a:	89 d8                	mov    %ebx,%eax
  10545c:	83 c4 24             	add    $0x24,%esp
  10545f:	5b                   	pop    %ebx
  105460:	5d                   	pop    %ebp
  105461:	c3                   	ret    
  105462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105468:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10546b:	31 db                	xor    %ebx,%ebx
  10546d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105473:	eb 0b                	jmp    105480 <sys_dup+0x40>
  105475:	8d 76 00             	lea    0x0(%esi),%esi
  105478:	83 c3 01             	add    $0x1,%ebx
  10547b:	83 fb 10             	cmp    $0x10,%ebx
  10547e:	74 d5                	je     105455 <sys_dup+0x15>
  105480:	8b 4c 98 08          	mov    0x8(%eax,%ebx,4),%ecx
  105484:	85 c9                	test   %ecx,%ecx
  105486:	75 f0                	jne    105478 <sys_dup+0x38>
  105488:	89 54 98 08          	mov    %edx,0x8(%eax,%ebx,4)
  10548c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10548f:	89 04 24             	mov    %eax,(%esp)
  105492:	e8 99 bc ff ff       	call   101130 <filedup>
  105497:	eb c1                	jmp    10545a <sys_dup+0x1a>
  105499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001054a0 <sys_read>:
  1054a0:	55                   	push   %ebp
  1054a1:	31 c0                	xor    %eax,%eax
  1054a3:	89 e5                	mov    %esp,%ebp
  1054a5:	83 ec 28             	sub    $0x28,%esp
  1054a8:	8d 55 f4             	lea    -0xc(%ebp),%edx
  1054ab:	e8 30 ff ff ff       	call   1053e0 <T.67>
  1054b0:	85 c0                	test   %eax,%eax
  1054b2:	79 0c                	jns    1054c0 <sys_read+0x20>
  1054b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1054b9:	c9                   	leave  
  1054ba:	c3                   	ret    
  1054bb:	90                   	nop
  1054bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1054c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1054c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1054c7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1054ce:	e8 bd f4 ff ff       	call   104990 <argint>
  1054d3:	85 c0                	test   %eax,%eax
  1054d5:	78 dd                	js     1054b4 <sys_read+0x14>
  1054d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1054da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1054e1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1054e5:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1054e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1054ec:	e8 df f4 ff ff       	call   1049d0 <argptr>
  1054f1:	85 c0                	test   %eax,%eax
  1054f3:	78 bf                	js     1054b4 <sys_read+0x14>
  1054f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1054f8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1054fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1054ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  105503:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105506:	89 04 24             	mov    %eax,(%esp)
  105509:	e8 22 bb ff ff       	call   101030 <fileread>
  10550e:	c9                   	leave  
  10550f:	c3                   	ret    

00105510 <sys_write>:
  105510:	55                   	push   %ebp
  105511:	31 c0                	xor    %eax,%eax
  105513:	89 e5                	mov    %esp,%ebp
  105515:	83 ec 28             	sub    $0x28,%esp
  105518:	8d 55 f4             	lea    -0xc(%ebp),%edx
  10551b:	e8 c0 fe ff ff       	call   1053e0 <T.67>
  105520:	85 c0                	test   %eax,%eax
  105522:	79 0c                	jns    105530 <sys_write+0x20>
  105524:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105529:	c9                   	leave  
  10552a:	c3                   	ret    
  10552b:	90                   	nop
  10552c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105530:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105533:	89 44 24 04          	mov    %eax,0x4(%esp)
  105537:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10553e:	e8 4d f4 ff ff       	call   104990 <argint>
  105543:	85 c0                	test   %eax,%eax
  105545:	78 dd                	js     105524 <sys_write+0x14>
  105547:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10554a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105551:	89 44 24 08          	mov    %eax,0x8(%esp)
  105555:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105558:	89 44 24 04          	mov    %eax,0x4(%esp)
  10555c:	e8 6f f4 ff ff       	call   1049d0 <argptr>
  105561:	85 c0                	test   %eax,%eax
  105563:	78 bf                	js     105524 <sys_write+0x14>
  105565:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105568:	89 44 24 08          	mov    %eax,0x8(%esp)
  10556c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10556f:	89 44 24 04          	mov    %eax,0x4(%esp)
  105573:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105576:	89 04 24             	mov    %eax,(%esp)
  105579:	e8 02 ba ff ff       	call   100f80 <filewrite>
  10557e:	c9                   	leave  
  10557f:	c3                   	ret    

00105580 <sys_fstat>:
  105580:	55                   	push   %ebp
  105581:	31 c0                	xor    %eax,%eax
  105583:	89 e5                	mov    %esp,%ebp
  105585:	83 ec 28             	sub    $0x28,%esp
  105588:	8d 55 f4             	lea    -0xc(%ebp),%edx
  10558b:	e8 50 fe ff ff       	call   1053e0 <T.67>
  105590:	85 c0                	test   %eax,%eax
  105592:	79 0c                	jns    1055a0 <sys_fstat+0x20>
  105594:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105599:	c9                   	leave  
  10559a:	c3                   	ret    
  10559b:	90                   	nop
  10559c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1055a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1055a3:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  1055aa:	00 
  1055ab:	89 44 24 04          	mov    %eax,0x4(%esp)
  1055af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1055b6:	e8 15 f4 ff ff       	call   1049d0 <argptr>
  1055bb:	85 c0                	test   %eax,%eax
  1055bd:	78 d5                	js     105594 <sys_fstat+0x14>
  1055bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1055c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1055c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1055c9:	89 04 24             	mov    %eax,(%esp)
  1055cc:	e8 0f bb ff ff       	call   1010e0 <filestat>
  1055d1:	c9                   	leave  
  1055d2:	c3                   	ret    
  1055d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1055d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001055e0 <sys_close>:
  1055e0:	55                   	push   %ebp
  1055e1:	89 e5                	mov    %esp,%ebp
  1055e3:	83 ec 28             	sub    $0x28,%esp
  1055e6:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1055e9:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1055ec:	e8 ef fd ff ff       	call   1053e0 <T.67>
  1055f1:	89 c2                	mov    %eax,%edx
  1055f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1055f8:	85 d2                	test   %edx,%edx
  1055fa:	78 1e                	js     10561a <sys_close+0x3a>
  1055fc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105602:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105605:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  10560c:	00 
  10560d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105610:	89 04 24             	mov    %eax,(%esp)
  105613:	e8 e8 bb ff ff       	call   101200 <fileclose>
  105618:	31 c0                	xor    %eax,%eax
  10561a:	c9                   	leave  
  10561b:	c3                   	ret    
  10561c:	90                   	nop
  10561d:	90                   	nop
  10561e:	90                   	nop
  10561f:	90                   	nop

00105620 <sys_getpid>:
  105620:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105626:	55                   	push   %ebp
  105627:	89 e5                	mov    %esp,%ebp
  105629:	5d                   	pop    %ebp
  10562a:	8b 40 58             	mov    0x58(%eax),%eax
  10562d:	c3                   	ret    
  10562e:	66 90                	xchg   %ax,%ax

00105630 <sys_thread_getid>:
  105630:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105636:	55                   	push   %ebp
  105637:	89 e5                	mov    %esp,%ebp
  105639:	5d                   	pop    %ebp
  10563a:	8b 40 7c             	mov    0x7c(%eax),%eax
  10563d:	c3                   	ret    
  10563e:	66 90                	xchg   %ax,%ax

00105640 <sys_thread_getProcid>:
  105640:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105646:	55                   	push   %ebp
  105647:	89 e5                	mov    %esp,%ebp
  105649:	5d                   	pop    %ebp
  10564a:	8b 40 58             	mov    0x58(%eax),%eax
  10564d:	c3                   	ret    
  10564e:	66 90                	xchg   %ax,%ax

00105650 <sys_exit_all_threads>:
  105650:	55                   	push   %ebp
  105651:	89 e5                	mov    %esp,%ebp
  105653:	83 ec 08             	sub    $0x8,%esp
  105656:	e8 65 e2 ff ff       	call   1038c0 <exit_all_threads>
  10565b:	31 c0                	xor    %eax,%eax
  10565d:	c9                   	leave  
  10565e:	c3                   	ret    
  10565f:	90                   	nop

00105660 <sys_binary_sem_clear>:
  105660:	55                   	push   %ebp
  105661:	89 e5                	mov    %esp,%ebp
  105663:	83 ec 28             	sub    $0x28,%esp
  105666:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105669:	89 44 24 04          	mov    %eax,0x4(%esp)
  10566d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105674:	e8 17 f3 ff ff       	call   104990 <argint>
  105679:	89 c2                	mov    %eax,%edx
  10567b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105680:	85 d2                	test   %edx,%edx
  105682:	78 0b                	js     10568f <sys_binary_sem_clear+0x2f>
  105684:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105687:	89 04 24             	mov    %eax,(%esp)
  10568a:	e8 71 a9 ff ff       	call   100000 <binary_sem_clear>
  10568f:	c9                   	leave  
  105690:	c3                   	ret    
  105691:	eb 0d                	jmp    1056a0 <sys_binary_sem_up>
  105693:	90                   	nop
  105694:	90                   	nop
  105695:	90                   	nop
  105696:	90                   	nop
  105697:	90                   	nop
  105698:	90                   	nop
  105699:	90                   	nop
  10569a:	90                   	nop
  10569b:	90                   	nop
  10569c:	90                   	nop
  10569d:	90                   	nop
  10569e:	90                   	nop
  10569f:	90                   	nop

001056a0 <sys_binary_sem_up>:
  1056a0:	55                   	push   %ebp
  1056a1:	89 e5                	mov    %esp,%ebp
  1056a3:	83 ec 28             	sub    $0x28,%esp
  1056a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1056a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1056ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1056b4:	e8 d7 f2 ff ff       	call   104990 <argint>
  1056b9:	89 c2                	mov    %eax,%edx
  1056bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1056c0:	85 d2                	test   %edx,%edx
  1056c2:	78 0b                	js     1056cf <sys_binary_sem_up+0x2f>
  1056c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1056c7:	89 04 24             	mov    %eax,(%esp)
  1056ca:	e8 41 aa ff ff       	call   100110 <binary_sem_up>
  1056cf:	c9                   	leave  
  1056d0:	c3                   	ret    
  1056d1:	eb 0d                	jmp    1056e0 <sys_binary_sem_down>
  1056d3:	90                   	nop
  1056d4:	90                   	nop
  1056d5:	90                   	nop
  1056d6:	90                   	nop
  1056d7:	90                   	nop
  1056d8:	90                   	nop
  1056d9:	90                   	nop
  1056da:	90                   	nop
  1056db:	90                   	nop
  1056dc:	90                   	nop
  1056dd:	90                   	nop
  1056de:	90                   	nop
  1056df:	90                   	nop

001056e0 <sys_binary_sem_down>:
  1056e0:	55                   	push   %ebp
  1056e1:	89 e5                	mov    %esp,%ebp
  1056e3:	83 ec 28             	sub    $0x28,%esp
  1056e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1056e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1056ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1056f4:	e8 97 f2 ff ff       	call   104990 <argint>
  1056f9:	89 c2                	mov    %eax,%edx
  1056fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105700:	85 d2                	test   %edx,%edx
  105702:	78 0b                	js     10570f <sys_binary_sem_down+0x2f>
  105704:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105707:	89 04 24             	mov    %eax,(%esp)
  10570a:	e8 c1 aa ff ff       	call   1001d0 <binary_sem_down>
  10570f:	c9                   	leave  
  105710:	c3                   	ret    
  105711:	eb 0d                	jmp    105720 <sys_binary_sem_create>
  105713:	90                   	nop
  105714:	90                   	nop
  105715:	90                   	nop
  105716:	90                   	nop
  105717:	90                   	nop
  105718:	90                   	nop
  105719:	90                   	nop
  10571a:	90                   	nop
  10571b:	90                   	nop
  10571c:	90                   	nop
  10571d:	90                   	nop
  10571e:	90                   	nop
  10571f:	90                   	nop

00105720 <sys_binary_sem_create>:
  105720:	55                   	push   %ebp
  105721:	89 e5                	mov    %esp,%ebp
  105723:	83 ec 08             	sub    $0x8,%esp
  105726:	c9                   	leave  
  105727:	e9 34 a9 ff ff       	jmp    100060 <binary_sem_create>
  10572c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105730 <sys_uptime>:
  105730:	55                   	push   %ebp
  105731:	89 e5                	mov    %esp,%ebp
  105733:	53                   	push   %ebx
  105734:	83 ec 14             	sub    $0x14,%esp
  105737:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  10573e:	e8 0d ef ff ff       	call   104650 <acquire>
  105743:	8b 1d 80 6c 11 00    	mov    0x116c80,%ebx
  105749:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  105750:	e8 ab ee ff ff       	call   104600 <release>
  105755:	83 c4 14             	add    $0x14,%esp
  105758:	89 d8                	mov    %ebx,%eax
  10575a:	5b                   	pop    %ebx
  10575b:	5d                   	pop    %ebp
  10575c:	c3                   	ret    
  10575d:	8d 76 00             	lea    0x0(%esi),%esi

00105760 <sys_sleep>:
  105760:	55                   	push   %ebp
  105761:	89 e5                	mov    %esp,%ebp
  105763:	53                   	push   %ebx
  105764:	83 ec 24             	sub    $0x24,%esp
  105767:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10576a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10576e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105775:	e8 16 f2 ff ff       	call   104990 <argint>
  10577a:	89 c2                	mov    %eax,%edx
  10577c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105781:	85 d2                	test   %edx,%edx
  105783:	78 59                	js     1057de <sys_sleep+0x7e>
  105785:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  10578c:	e8 bf ee ff ff       	call   104650 <acquire>
  105791:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105794:	8b 1d 80 6c 11 00    	mov    0x116c80,%ebx
  10579a:	85 d2                	test   %edx,%edx
  10579c:	75 22                	jne    1057c0 <sys_sleep+0x60>
  10579e:	eb 48                	jmp    1057e8 <sys_sleep+0x88>
  1057a0:	c7 44 24 04 40 64 11 	movl   $0x116440,0x4(%esp)
  1057a7:	00 
  1057a8:	c7 04 24 80 6c 11 00 	movl   $0x116c80,(%esp)
  1057af:	e8 6c dc ff ff       	call   103420 <sleep>
  1057b4:	a1 80 6c 11 00       	mov    0x116c80,%eax
  1057b9:	29 d8                	sub    %ebx,%eax
  1057bb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1057be:	73 28                	jae    1057e8 <sys_sleep+0x88>
  1057c0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1057c6:	8b 40 4c             	mov    0x4c(%eax),%eax
  1057c9:	85 c0                	test   %eax,%eax
  1057cb:	74 d3                	je     1057a0 <sys_sleep+0x40>
  1057cd:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  1057d4:	e8 27 ee ff ff       	call   104600 <release>
  1057d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1057de:	83 c4 24             	add    $0x24,%esp
  1057e1:	5b                   	pop    %ebx
  1057e2:	5d                   	pop    %ebp
  1057e3:	c3                   	ret    
  1057e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1057e8:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  1057ef:	e8 0c ee ff ff       	call   104600 <release>
  1057f4:	83 c4 24             	add    $0x24,%esp
  1057f7:	31 c0                	xor    %eax,%eax
  1057f9:	5b                   	pop    %ebx
  1057fa:	5d                   	pop    %ebp
  1057fb:	c3                   	ret    
  1057fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105800 <sys_sbrk>:
  105800:	55                   	push   %ebp
  105801:	89 e5                	mov    %esp,%ebp
  105803:	53                   	push   %ebx
  105804:	83 ec 24             	sub    $0x24,%esp
  105807:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10580a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10580e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105815:	e8 76 f1 ff ff       	call   104990 <argint>
  10581a:	85 c0                	test   %eax,%eax
  10581c:	79 12                	jns    105830 <sys_sbrk+0x30>
  10581e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105823:	83 c4 24             	add    $0x24,%esp
  105826:	5b                   	pop    %ebx
  105827:	5d                   	pop    %ebp
  105828:	c3                   	ret    
  105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105830:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105836:	8b 18                	mov    (%eax),%ebx
  105838:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10583b:	89 04 24             	mov    %eax,(%esp)
  10583e:	e8 0d ea ff ff       	call   104250 <growproc>
  105843:	89 c2                	mov    %eax,%edx
  105845:	89 d8                	mov    %ebx,%eax
  105847:	85 d2                	test   %edx,%edx
  105849:	79 d8                	jns    105823 <sys_sbrk+0x23>
  10584b:	eb d1                	jmp    10581e <sys_sbrk+0x1e>
  10584d:	8d 76 00             	lea    0x0(%esi),%esi

00105850 <sys_thread_exit>:
  105850:	55                   	push   %ebp
  105851:	89 e5                	mov    %esp,%ebp
  105853:	83 ec 28             	sub    $0x28,%esp
  105856:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105859:	89 44 24 04          	mov    %eax,0x4(%esp)
  10585d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105864:	e8 27 f1 ff ff       	call   104990 <argint>
  105869:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10586c:	89 04 24             	mov    %eax,(%esp)
  10586f:	e8 dc e4 ff ff       	call   103d50 <thread_exit>
  105874:	c9                   	leave  
  105875:	c3                   	ret    
  105876:	8d 76 00             	lea    0x0(%esi),%esi
  105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105880 <sys_thread_join>:
  105880:	55                   	push   %ebp
  105881:	89 e5                	mov    %esp,%ebp
  105883:	83 ec 28             	sub    $0x28,%esp
  105886:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105889:	89 44 24 04          	mov    %eax,0x4(%esp)
  10588d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105894:	e8 f7 f0 ff ff       	call   104990 <argint>
  105899:	85 c0                	test   %eax,%eax
  10589b:	79 0b                	jns    1058a8 <sys_thread_join+0x28>
  10589d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1058a2:	c9                   	leave  
  1058a3:	c3                   	ret    
  1058a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1058a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1058ab:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1058b2:	00 
  1058b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1058b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1058be:	e8 0d f1 ff ff       	call   1049d0 <argptr>
  1058c3:	85 c0                	test   %eax,%eax
  1058c5:	78 d6                	js     10589d <sys_thread_join+0x1d>
  1058c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1058ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1058ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1058d1:	89 04 24             	mov    %eax,(%esp)
  1058d4:	e8 f7 dc ff ff       	call   1035d0 <thread_join>
  1058d9:	c9                   	leave  
  1058da:	c3                   	ret    
  1058db:	90                   	nop
  1058dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001058e0 <sys_thread_create>:
  1058e0:	55                   	push   %ebp
  1058e1:	89 e5                	mov    %esp,%ebp
  1058e3:	83 ec 28             	sub    $0x28,%esp
  1058e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1058e9:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1058f0:	00 
  1058f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1058f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1058fc:	e8 cf f0 ff ff       	call   1049d0 <argptr>
  105901:	85 c0                	test   %eax,%eax
  105903:	79 0b                	jns    105910 <sys_thread_create+0x30>
  105905:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10590a:	c9                   	leave  
  10590b:	c3                   	ret    
  10590c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105910:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105913:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  10591a:	00 
  10591b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10591f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105926:	e8 a5 f0 ff ff       	call   1049d0 <argptr>
  10592b:	85 c0                	test   %eax,%eax
  10592d:	78 d6                	js     105905 <sys_thread_create+0x25>
  10592f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105932:	89 44 24 04          	mov    %eax,0x4(%esp)
  105936:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10593d:	e8 4e f0 ff ff       	call   104990 <argint>
  105942:	85 c0                	test   %eax,%eax
  105944:	78 bf                	js     105905 <sys_thread_create+0x25>
  105946:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105949:	89 44 24 08          	mov    %eax,0x8(%esp)
  10594d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105950:	89 44 24 04          	mov    %eax,0x4(%esp)
  105954:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105957:	89 04 24             	mov    %eax,(%esp)
  10595a:	e8 01 e7 ff ff       	call   104060 <thread_create>
  10595f:	c9                   	leave  
  105960:	c3                   	ret    
  105961:	eb 0d                	jmp    105970 <sys_kill>
  105963:	90                   	nop
  105964:	90                   	nop
  105965:	90                   	nop
  105966:	90                   	nop
  105967:	90                   	nop
  105968:	90                   	nop
  105969:	90                   	nop
  10596a:	90                   	nop
  10596b:	90                   	nop
  10596c:	90                   	nop
  10596d:	90                   	nop
  10596e:	90                   	nop
  10596f:	90                   	nop

00105970 <sys_kill>:
  105970:	55                   	push   %ebp
  105971:	89 e5                	mov    %esp,%ebp
  105973:	83 ec 28             	sub    $0x28,%esp
  105976:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105979:	89 44 24 04          	mov    %eax,0x4(%esp)
  10597d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105984:	e8 07 f0 ff ff       	call   104990 <argint>
  105989:	89 c2                	mov    %eax,%edx
  10598b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105990:	85 d2                	test   %edx,%edx
  105992:	78 0b                	js     10599f <sys_kill+0x2f>
  105994:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105997:	89 04 24             	mov    %eax,(%esp)
  10599a:	e8 c1 d8 ff ff       	call   103260 <kill>
  10599f:	c9                   	leave  
  1059a0:	c3                   	ret    
  1059a1:	eb 0d                	jmp    1059b0 <sys_wait>
  1059a3:	90                   	nop
  1059a4:	90                   	nop
  1059a5:	90                   	nop
  1059a6:	90                   	nop
  1059a7:	90                   	nop
  1059a8:	90                   	nop
  1059a9:	90                   	nop
  1059aa:	90                   	nop
  1059ab:	90                   	nop
  1059ac:	90                   	nop
  1059ad:	90                   	nop
  1059ae:	90                   	nop
  1059af:	90                   	nop

001059b0 <sys_wait>:
  1059b0:	55                   	push   %ebp
  1059b1:	89 e5                	mov    %esp,%ebp
  1059b3:	83 ec 08             	sub    $0x8,%esp
  1059b6:	c9                   	leave  
  1059b7:	e9 34 dd ff ff       	jmp    1036f0 <wait>
  1059bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001059c0 <sys_exit>:
  1059c0:	55                   	push   %ebp
  1059c1:	89 e5                	mov    %esp,%ebp
  1059c3:	83 ec 08             	sub    $0x8,%esp
  1059c6:	e8 35 e0 ff ff       	call   103a00 <exit>
  1059cb:	31 c0                	xor    %eax,%eax
  1059cd:	c9                   	leave  
  1059ce:	c3                   	ret    
  1059cf:	90                   	nop

001059d0 <sys_fork>:
  1059d0:	55                   	push   %ebp
  1059d1:	89 e5                	mov    %esp,%ebp
  1059d3:	83 ec 08             	sub    $0x8,%esp
  1059d6:	c9                   	leave  
  1059d7:	e9 84 e5 ff ff       	jmp    103f60 <fork>
  1059dc:	90                   	nop
  1059dd:	90                   	nop
  1059de:	90                   	nop
  1059df:	90                   	nop

001059e0 <timerinit>:
  1059e0:	55                   	push   %ebp
  1059e1:	ba 43 00 00 00       	mov    $0x43,%edx
  1059e6:	89 e5                	mov    %esp,%ebp
  1059e8:	83 ec 18             	sub    $0x18,%esp
  1059eb:	b8 34 00 00 00       	mov    $0x34,%eax
  1059f0:	ee                   	out    %al,(%dx)
  1059f1:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
  1059f6:	b2 40                	mov    $0x40,%dl
  1059f8:	ee                   	out    %al,(%dx)
  1059f9:	b8 2e 00 00 00       	mov    $0x2e,%eax
  1059fe:	ee                   	out    %al,(%dx)
  1059ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105a06:	e8 15 d4 ff ff       	call   102e20 <picenable>
  105a0b:	c9                   	leave  
  105a0c:	c3                   	ret    
  105a0d:	90                   	nop
  105a0e:	90                   	nop
  105a0f:	90                   	nop

00105a10 <alltraps>:
  105a10:	1e                   	push   %ds
  105a11:	06                   	push   %es
  105a12:	0f a0                	push   %fs
  105a14:	0f a8                	push   %gs
  105a16:	60                   	pusha  
  105a17:	66 b8 10 00          	mov    $0x10,%ax
  105a1b:	8e d8                	mov    %eax,%ds
  105a1d:	8e c0                	mov    %eax,%es
  105a1f:	66 b8 18 00          	mov    $0x18,%ax
  105a23:	8e e0                	mov    %eax,%fs
  105a25:	8e e8                	mov    %eax,%gs
  105a27:	54                   	push   %esp
  105a28:	e8 43 00 00 00       	call   105a70 <trap>
  105a2d:	83 c4 04             	add    $0x4,%esp

00105a30 <trapret>:
  105a30:	61                   	popa   
  105a31:	0f a9                	pop    %gs
  105a33:	0f a1                	pop    %fs
  105a35:	07                   	pop    %es
  105a36:	1f                   	pop    %ds
  105a37:	83 c4 08             	add    $0x8,%esp
  105a3a:	cf                   	iret   
  105a3b:	90                   	nop
  105a3c:	90                   	nop
  105a3d:	90                   	nop
  105a3e:	90                   	nop
  105a3f:	90                   	nop

00105a40 <idtinit>:
  105a40:	55                   	push   %ebp
  105a41:	b8 80 64 11 00       	mov    $0x116480,%eax
  105a46:	89 e5                	mov    %esp,%ebp
  105a48:	83 ec 10             	sub    $0x10,%esp
  105a4b:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  105a51:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  105a55:	c1 e8 10             	shr    $0x10,%eax
  105a58:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  105a5c:	8d 45 fa             	lea    -0x6(%ebp),%eax
  105a5f:	0f 01 18             	lidtl  (%eax)
  105a62:	c9                   	leave  
  105a63:	c3                   	ret    
  105a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105a70 <trap>:
  105a70:	55                   	push   %ebp
  105a71:	89 e5                	mov    %esp,%ebp
  105a73:	56                   	push   %esi
  105a74:	53                   	push   %ebx
  105a75:	83 ec 20             	sub    $0x20,%esp
  105a78:	8b 5d 08             	mov    0x8(%ebp),%ebx
  105a7b:	8b 43 30             	mov    0x30(%ebx),%eax
  105a7e:	83 f8 40             	cmp    $0x40,%eax
  105a81:	0f 84 d1 00 00 00    	je     105b58 <trap+0xe8>
  105a87:	8d 50 e0             	lea    -0x20(%eax),%edx
  105a8a:	83 fa 1f             	cmp    $0x1f,%edx
  105a8d:	0f 86 bd 00 00 00    	jbe    105b50 <trap+0xe0>
  105a93:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  105a9a:	85 d2                	test   %edx,%edx
  105a9c:	0f 84 fe 01 00 00    	je     105ca0 <trap+0x230>
  105aa2:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
  105aa6:	0f 84 f4 01 00 00    	je     105ca0 <trap+0x230>
  105aac:	0f 20 d6             	mov    %cr2,%esi
  105aaf:	8b 4a 58             	mov    0x58(%edx),%ecx
  105ab2:	83 c2 6c             	add    $0x6c,%edx
  105ab5:	89 74 24 1c          	mov    %esi,0x1c(%esp)
  105ab9:	8b 73 38             	mov    0x38(%ebx),%esi
  105abc:	89 74 24 18          	mov    %esi,0x18(%esp)
  105ac0:	65 8b 35 00 00 00 00 	mov    %gs:0x0,%esi
  105ac7:	0f b6 36             	movzbl (%esi),%esi
  105aca:	89 74 24 14          	mov    %esi,0x14(%esp)
  105ace:	8b 73 34             	mov    0x34(%ebx),%esi
  105ad1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105ad5:	89 54 24 08          	mov    %edx,0x8(%esp)
  105ad9:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105add:	89 74 24 10          	mov    %esi,0x10(%esp)
  105ae1:	c7 04 24 1c 79 10 00 	movl   $0x10791c,(%esp)
  105ae8:	e8 73 ac ff ff       	call   100760 <cprintf>
  105aed:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105af3:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)
  105afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105b00:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105b06:	85 c0                	test   %eax,%eax
  105b08:	74 70                	je     105b7a <trap+0x10a>
  105b0a:	8b 50 4c             	mov    0x4c(%eax),%edx
  105b0d:	85 d2                	test   %edx,%edx
  105b0f:	74 10                	je     105b21 <trap+0xb1>
  105b11:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
  105b15:	83 e2 03             	and    $0x3,%edx
  105b18:	83 fa 03             	cmp    $0x3,%edx
  105b1b:	0f 84 67 01 00 00    	je     105c88 <trap+0x218>
  105b21:	83 78 54 04          	cmpl   $0x4,0x54(%eax)
  105b25:	0f 84 35 01 00 00    	je     105c60 <trap+0x1f0>
  105b2b:	8b 40 4c             	mov    0x4c(%eax),%eax
  105b2e:	85 c0                	test   %eax,%eax
  105b30:	74 48                	je     105b7a <trap+0x10a>
  105b32:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
  105b36:	83 e0 03             	and    $0x3,%eax
  105b39:	83 f8 03             	cmp    $0x3,%eax
  105b3c:	75 3c                	jne    105b7a <trap+0x10a>
  105b3e:	83 c4 20             	add    $0x20,%esp
  105b41:	5b                   	pop    %ebx
  105b42:	5e                   	pop    %esi
  105b43:	5d                   	pop    %ebp
  105b44:	e9 b7 de ff ff       	jmp    103a00 <exit>
  105b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105b50:	ff 24 95 6c 79 10 00 	jmp    *0x10796c(,%edx,4)
  105b57:	90                   	nop
  105b58:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105b5e:	8b 70 4c             	mov    0x4c(%eax),%esi
  105b61:	85 f6                	test   %esi,%esi
  105b63:	75 23                	jne    105b88 <trap+0x118>
  105b65:	89 58 60             	mov    %ebx,0x60(%eax)
  105b68:	e8 23 ef ff ff       	call   104a90 <syscall>
  105b6d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105b73:	8b 48 4c             	mov    0x4c(%eax),%ecx
  105b76:	85 c9                	test   %ecx,%ecx
  105b78:	75 c4                	jne    105b3e <trap+0xce>
  105b7a:	83 c4 20             	add    $0x20,%esp
  105b7d:	5b                   	pop    %ebx
  105b7e:	5e                   	pop    %esi
  105b7f:	5d                   	pop    %ebp
  105b80:	c3                   	ret    
  105b81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105b88:	e8 73 de ff ff       	call   103a00 <exit>
  105b8d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105b93:	eb d0                	jmp    105b65 <trap+0xf5>
  105b95:	8d 76 00             	lea    0x0(%esi),%esi
  105b98:	8b 43 38             	mov    0x38(%ebx),%eax
  105b9b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105b9f:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
  105ba3:	89 44 24 08          	mov    %eax,0x8(%esp)
  105ba7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  105bad:	0f b6 00             	movzbl (%eax),%eax
  105bb0:	c7 04 24 c4 78 10 00 	movl   $0x1078c4,(%esp)
  105bb7:	89 44 24 04          	mov    %eax,0x4(%esp)
  105bbb:	e8 a0 ab ff ff       	call   100760 <cprintf>
  105bc0:	e8 2b cb ff ff       	call   1026f0 <lapiceoi>
  105bc5:	e9 36 ff ff ff       	jmp    105b00 <trap+0x90>
  105bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105bd0:	e8 cb 01 00 00       	call   105da0 <uartintr>
  105bd5:	8d 76 00             	lea    0x0(%esi),%esi
  105bd8:	e8 13 cb ff ff       	call   1026f0 <lapiceoi>
  105bdd:	8d 76 00             	lea    0x0(%esi),%esi
  105be0:	e9 1b ff ff ff       	jmp    105b00 <trap+0x90>
  105be5:	8d 76 00             	lea    0x0(%esi),%esi
  105be8:	90                   	nop
  105be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105bf0:	e8 9b c6 ff ff       	call   102290 <ideintr>
  105bf5:	8d 76 00             	lea    0x0(%esi),%esi
  105bf8:	e8 f3 ca ff ff       	call   1026f0 <lapiceoi>
  105bfd:	8d 76 00             	lea    0x0(%esi),%esi
  105c00:	e9 fb fe ff ff       	jmp    105b00 <trap+0x90>
  105c05:	8d 76 00             	lea    0x0(%esi),%esi
  105c08:	90                   	nop
  105c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c10:	e8 bb ca ff ff       	call   1026d0 <kbdintr>
  105c15:	8d 76 00             	lea    0x0(%esi),%esi
  105c18:	e8 d3 ca ff ff       	call   1026f0 <lapiceoi>
  105c1d:	8d 76 00             	lea    0x0(%esi),%esi
  105c20:	e9 db fe ff ff       	jmp    105b00 <trap+0x90>
  105c25:	8d 76 00             	lea    0x0(%esi),%esi
  105c28:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  105c2e:	80 38 00             	cmpb   $0x0,(%eax)
  105c31:	75 c2                	jne    105bf5 <trap+0x185>
  105c33:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  105c3a:	e8 11 ea ff ff       	call   104650 <acquire>
  105c3f:	83 05 80 6c 11 00 01 	addl   $0x1,0x116c80
  105c46:	c7 04 24 80 6c 11 00 	movl   $0x116c80,(%esp)
  105c4d:	e8 9e d6 ff ff       	call   1032f0 <wakeup>
  105c52:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  105c59:	e8 a2 e9 ff ff       	call   104600 <release>
  105c5e:	eb 95                	jmp    105bf5 <trap+0x185>
  105c60:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
  105c64:	0f 85 c1 fe ff ff    	jne    105b2b <trap+0xbb>
  105c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105c70:	e8 7b d8 ff ff       	call   1034f0 <yield>
  105c75:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105c7b:	85 c0                	test   %eax,%eax
  105c7d:	0f 85 a8 fe ff ff    	jne    105b2b <trap+0xbb>
  105c83:	e9 f2 fe ff ff       	jmp    105b7a <trap+0x10a>
  105c88:	e8 73 dd ff ff       	call   103a00 <exit>
  105c8d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105c93:	85 c0                	test   %eax,%eax
  105c95:	0f 85 86 fe ff ff    	jne    105b21 <trap+0xb1>
  105c9b:	e9 da fe ff ff       	jmp    105b7a <trap+0x10a>
  105ca0:	0f 20 d2             	mov    %cr2,%edx
  105ca3:	89 54 24 10          	mov    %edx,0x10(%esp)
  105ca7:	8b 53 38             	mov    0x38(%ebx),%edx
  105caa:	89 54 24 0c          	mov    %edx,0xc(%esp)
  105cae:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  105cb5:	0f b6 12             	movzbl (%edx),%edx
  105cb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  105cbc:	c7 04 24 e8 78 10 00 	movl   $0x1078e8,(%esp)
  105cc3:	89 54 24 08          	mov    %edx,0x8(%esp)
  105cc7:	e8 94 aa ff ff       	call   100760 <cprintf>
  105ccc:	c7 04 24 5f 79 10 00 	movl   $0x10795f,(%esp)
  105cd3:	e8 78 ae ff ff       	call   100b50 <panic>
  105cd8:	90                   	nop
  105cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105ce0 <tvinit>:
  105ce0:	55                   	push   %ebp
  105ce1:	31 c0                	xor    %eax,%eax
  105ce3:	89 e5                	mov    %esp,%ebp
  105ce5:	ba 80 64 11 00       	mov    $0x116480,%edx
  105cea:	83 ec 18             	sub    $0x18,%esp
  105ced:	8d 76 00             	lea    0x0(%esi),%esi
  105cf0:	8b 0c 85 e8 8d 10 00 	mov    0x108de8(,%eax,4),%ecx
  105cf7:	66 89 0c c5 80 64 11 	mov    %cx,0x116480(,%eax,8)
  105cfe:	00 
  105cff:	c1 e9 10             	shr    $0x10,%ecx
  105d02:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  105d09:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  105d0e:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  105d13:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
  105d18:	83 c0 01             	add    $0x1,%eax
  105d1b:	3d 00 01 00 00       	cmp    $0x100,%eax
  105d20:	75 ce                	jne    105cf0 <tvinit+0x10>
  105d22:	a1 e8 8e 10 00       	mov    0x108ee8,%eax
  105d27:	c7 44 24 04 64 79 10 	movl   $0x107964,0x4(%esp)
  105d2e:	00 
  105d2f:	c7 04 24 40 64 11 00 	movl   $0x116440,(%esp)
  105d36:	66 c7 05 82 66 11 00 	movw   $0x8,0x116682
  105d3d:	08 00 
  105d3f:	66 a3 80 66 11 00    	mov    %ax,0x116680
  105d45:	c1 e8 10             	shr    $0x10,%eax
  105d48:	c6 05 84 66 11 00 00 	movb   $0x0,0x116684
  105d4f:	c6 05 85 66 11 00 ef 	movb   $0xef,0x116685
  105d56:	66 a3 86 66 11 00    	mov    %ax,0x116686
  105d5c:	e8 5f e7 ff ff       	call   1044c0 <initlock>
  105d61:	c9                   	leave  
  105d62:	c3                   	ret    
  105d63:	90                   	nop
  105d64:	90                   	nop
  105d65:	90                   	nop
  105d66:	90                   	nop
  105d67:	90                   	nop
  105d68:	90                   	nop
  105d69:	90                   	nop
  105d6a:	90                   	nop
  105d6b:	90                   	nop
  105d6c:	90                   	nop
  105d6d:	90                   	nop
  105d6e:	90                   	nop
  105d6f:	90                   	nop

00105d70 <uartgetc>:
  105d70:	a1 2c 93 10 00       	mov    0x10932c,%eax
  105d75:	55                   	push   %ebp
  105d76:	89 e5                	mov    %esp,%ebp
  105d78:	85 c0                	test   %eax,%eax
  105d7a:	75 0c                	jne    105d88 <uartgetc+0x18>
  105d7c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105d81:	5d                   	pop    %ebp
  105d82:	c3                   	ret    
  105d83:	90                   	nop
  105d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105d88:	ba fd 03 00 00       	mov    $0x3fd,%edx
  105d8d:	ec                   	in     (%dx),%al
  105d8e:	a8 01                	test   $0x1,%al
  105d90:	74 ea                	je     105d7c <uartgetc+0xc>
  105d92:	b2 f8                	mov    $0xf8,%dl
  105d94:	ec                   	in     (%dx),%al
  105d95:	0f b6 c0             	movzbl %al,%eax
  105d98:	5d                   	pop    %ebp
  105d99:	c3                   	ret    
  105d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105da0 <uartintr>:
  105da0:	55                   	push   %ebp
  105da1:	89 e5                	mov    %esp,%ebp
  105da3:	83 ec 18             	sub    $0x18,%esp
  105da6:	c7 04 24 70 5d 10 00 	movl   $0x105d70,(%esp)
  105dad:	e8 0e ac ff ff       	call   1009c0 <consoleintr>
  105db2:	c9                   	leave  
  105db3:	c3                   	ret    
  105db4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105dba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105dc0 <uartputc>:
  105dc0:	55                   	push   %ebp
  105dc1:	89 e5                	mov    %esp,%ebp
  105dc3:	56                   	push   %esi
  105dc4:	be fd 03 00 00       	mov    $0x3fd,%esi
  105dc9:	53                   	push   %ebx
  105dca:	31 db                	xor    %ebx,%ebx
  105dcc:	83 ec 10             	sub    $0x10,%esp
  105dcf:	8b 15 2c 93 10 00    	mov    0x10932c,%edx
  105dd5:	85 d2                	test   %edx,%edx
  105dd7:	75 1e                	jne    105df7 <uartputc+0x37>
  105dd9:	eb 2c                	jmp    105e07 <uartputc+0x47>
  105ddb:	90                   	nop
  105ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105de0:	83 c3 01             	add    $0x1,%ebx
  105de3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  105dea:	e8 21 c9 ff ff       	call   102710 <microdelay>
  105def:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
  105df5:	74 07                	je     105dfe <uartputc+0x3e>
  105df7:	89 f2                	mov    %esi,%edx
  105df9:	ec                   	in     (%dx),%al
  105dfa:	a8 20                	test   $0x20,%al
  105dfc:	74 e2                	je     105de0 <uartputc+0x20>
  105dfe:	ba f8 03 00 00       	mov    $0x3f8,%edx
  105e03:	8b 45 08             	mov    0x8(%ebp),%eax
  105e06:	ee                   	out    %al,(%dx)
  105e07:	83 c4 10             	add    $0x10,%esp
  105e0a:	5b                   	pop    %ebx
  105e0b:	5e                   	pop    %esi
  105e0c:	5d                   	pop    %ebp
  105e0d:	c3                   	ret    
  105e0e:	66 90                	xchg   %ax,%ax

00105e10 <uartinit>:
  105e10:	55                   	push   %ebp
  105e11:	31 c9                	xor    %ecx,%ecx
  105e13:	89 e5                	mov    %esp,%ebp
  105e15:	89 c8                	mov    %ecx,%eax
  105e17:	57                   	push   %edi
  105e18:	bf fa 03 00 00       	mov    $0x3fa,%edi
  105e1d:	56                   	push   %esi
  105e1e:	89 fa                	mov    %edi,%edx
  105e20:	53                   	push   %ebx
  105e21:	83 ec 1c             	sub    $0x1c,%esp
  105e24:	ee                   	out    %al,(%dx)
  105e25:	bb fb 03 00 00       	mov    $0x3fb,%ebx
  105e2a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  105e2f:	89 da                	mov    %ebx,%edx
  105e31:	ee                   	out    %al,(%dx)
  105e32:	b8 0c 00 00 00       	mov    $0xc,%eax
  105e37:	b2 f8                	mov    $0xf8,%dl
  105e39:	ee                   	out    %al,(%dx)
  105e3a:	be f9 03 00 00       	mov    $0x3f9,%esi
  105e3f:	89 c8                	mov    %ecx,%eax
  105e41:	89 f2                	mov    %esi,%edx
  105e43:	ee                   	out    %al,(%dx)
  105e44:	b8 03 00 00 00       	mov    $0x3,%eax
  105e49:	89 da                	mov    %ebx,%edx
  105e4b:	ee                   	out    %al,(%dx)
  105e4c:	b2 fc                	mov    $0xfc,%dl
  105e4e:	89 c8                	mov    %ecx,%eax
  105e50:	ee                   	out    %al,(%dx)
  105e51:	b8 01 00 00 00       	mov    $0x1,%eax
  105e56:	89 f2                	mov    %esi,%edx
  105e58:	ee                   	out    %al,(%dx)
  105e59:	b2 fd                	mov    $0xfd,%dl
  105e5b:	ec                   	in     (%dx),%al
  105e5c:	3c ff                	cmp    $0xff,%al
  105e5e:	74 55                	je     105eb5 <uartinit+0xa5>
  105e60:	c7 05 2c 93 10 00 01 	movl   $0x1,0x10932c
  105e67:	00 00 00 
  105e6a:	89 fa                	mov    %edi,%edx
  105e6c:	ec                   	in     (%dx),%al
  105e6d:	b2 f8                	mov    $0xf8,%dl
  105e6f:	ec                   	in     (%dx),%al
  105e70:	bb ec 79 10 00       	mov    $0x1079ec,%ebx
  105e75:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  105e7c:	e8 9f cf ff ff       	call   102e20 <picenable>
  105e81:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  105e88:	00 
  105e89:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  105e90:	e8 4b c5 ff ff       	call   1023e0 <ioapicenable>
  105e95:	b8 78 00 00 00       	mov    $0x78,%eax
  105e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105ea0:	0f be c0             	movsbl %al,%eax
  105ea3:	83 c3 01             	add    $0x1,%ebx
  105ea6:	89 04 24             	mov    %eax,(%esp)
  105ea9:	e8 12 ff ff ff       	call   105dc0 <uartputc>
  105eae:	0f b6 03             	movzbl (%ebx),%eax
  105eb1:	84 c0                	test   %al,%al
  105eb3:	75 eb                	jne    105ea0 <uartinit+0x90>
  105eb5:	83 c4 1c             	add    $0x1c,%esp
  105eb8:	5b                   	pop    %ebx
  105eb9:	5e                   	pop    %esi
  105eba:	5f                   	pop    %edi
  105ebb:	5d                   	pop    %ebp
  105ebc:	c3                   	ret    
  105ebd:	90                   	nop
  105ebe:	90                   	nop
  105ebf:	90                   	nop

00105ec0 <vector0>:
  105ec0:	6a 00                	push   $0x0
  105ec2:	6a 00                	push   $0x0
  105ec4:	e9 47 fb ff ff       	jmp    105a10 <alltraps>

00105ec9 <vector1>:
  105ec9:	6a 00                	push   $0x0
  105ecb:	6a 01                	push   $0x1
  105ecd:	e9 3e fb ff ff       	jmp    105a10 <alltraps>

00105ed2 <vector2>:
  105ed2:	6a 00                	push   $0x0
  105ed4:	6a 02                	push   $0x2
  105ed6:	e9 35 fb ff ff       	jmp    105a10 <alltraps>

00105edb <vector3>:
  105edb:	6a 00                	push   $0x0
  105edd:	6a 03                	push   $0x3
  105edf:	e9 2c fb ff ff       	jmp    105a10 <alltraps>

00105ee4 <vector4>:
  105ee4:	6a 00                	push   $0x0
  105ee6:	6a 04                	push   $0x4
  105ee8:	e9 23 fb ff ff       	jmp    105a10 <alltraps>

00105eed <vector5>:
  105eed:	6a 00                	push   $0x0
  105eef:	6a 05                	push   $0x5
  105ef1:	e9 1a fb ff ff       	jmp    105a10 <alltraps>

00105ef6 <vector6>:
  105ef6:	6a 00                	push   $0x0
  105ef8:	6a 06                	push   $0x6
  105efa:	e9 11 fb ff ff       	jmp    105a10 <alltraps>

00105eff <vector7>:
  105eff:	6a 00                	push   $0x0
  105f01:	6a 07                	push   $0x7
  105f03:	e9 08 fb ff ff       	jmp    105a10 <alltraps>

00105f08 <vector8>:
  105f08:	6a 08                	push   $0x8
  105f0a:	e9 01 fb ff ff       	jmp    105a10 <alltraps>

00105f0f <vector9>:
  105f0f:	6a 00                	push   $0x0
  105f11:	6a 09                	push   $0x9
  105f13:	e9 f8 fa ff ff       	jmp    105a10 <alltraps>

00105f18 <vector10>:
  105f18:	6a 0a                	push   $0xa
  105f1a:	e9 f1 fa ff ff       	jmp    105a10 <alltraps>

00105f1f <vector11>:
  105f1f:	6a 0b                	push   $0xb
  105f21:	e9 ea fa ff ff       	jmp    105a10 <alltraps>

00105f26 <vector12>:
  105f26:	6a 0c                	push   $0xc
  105f28:	e9 e3 fa ff ff       	jmp    105a10 <alltraps>

00105f2d <vector13>:
  105f2d:	6a 0d                	push   $0xd
  105f2f:	e9 dc fa ff ff       	jmp    105a10 <alltraps>

00105f34 <vector14>:
  105f34:	6a 0e                	push   $0xe
  105f36:	e9 d5 fa ff ff       	jmp    105a10 <alltraps>

00105f3b <vector15>:
  105f3b:	6a 00                	push   $0x0
  105f3d:	6a 0f                	push   $0xf
  105f3f:	e9 cc fa ff ff       	jmp    105a10 <alltraps>

00105f44 <vector16>:
  105f44:	6a 00                	push   $0x0
  105f46:	6a 10                	push   $0x10
  105f48:	e9 c3 fa ff ff       	jmp    105a10 <alltraps>

00105f4d <vector17>:
  105f4d:	6a 11                	push   $0x11
  105f4f:	e9 bc fa ff ff       	jmp    105a10 <alltraps>

00105f54 <vector18>:
  105f54:	6a 00                	push   $0x0
  105f56:	6a 12                	push   $0x12
  105f58:	e9 b3 fa ff ff       	jmp    105a10 <alltraps>

00105f5d <vector19>:
  105f5d:	6a 00                	push   $0x0
  105f5f:	6a 13                	push   $0x13
  105f61:	e9 aa fa ff ff       	jmp    105a10 <alltraps>

00105f66 <vector20>:
  105f66:	6a 00                	push   $0x0
  105f68:	6a 14                	push   $0x14
  105f6a:	e9 a1 fa ff ff       	jmp    105a10 <alltraps>

00105f6f <vector21>:
  105f6f:	6a 00                	push   $0x0
  105f71:	6a 15                	push   $0x15
  105f73:	e9 98 fa ff ff       	jmp    105a10 <alltraps>

00105f78 <vector22>:
  105f78:	6a 00                	push   $0x0
  105f7a:	6a 16                	push   $0x16
  105f7c:	e9 8f fa ff ff       	jmp    105a10 <alltraps>

00105f81 <vector23>:
  105f81:	6a 00                	push   $0x0
  105f83:	6a 17                	push   $0x17
  105f85:	e9 86 fa ff ff       	jmp    105a10 <alltraps>

00105f8a <vector24>:
  105f8a:	6a 00                	push   $0x0
  105f8c:	6a 18                	push   $0x18
  105f8e:	e9 7d fa ff ff       	jmp    105a10 <alltraps>

00105f93 <vector25>:
  105f93:	6a 00                	push   $0x0
  105f95:	6a 19                	push   $0x19
  105f97:	e9 74 fa ff ff       	jmp    105a10 <alltraps>

00105f9c <vector26>:
  105f9c:	6a 00                	push   $0x0
  105f9e:	6a 1a                	push   $0x1a
  105fa0:	e9 6b fa ff ff       	jmp    105a10 <alltraps>

00105fa5 <vector27>:
  105fa5:	6a 00                	push   $0x0
  105fa7:	6a 1b                	push   $0x1b
  105fa9:	e9 62 fa ff ff       	jmp    105a10 <alltraps>

00105fae <vector28>:
  105fae:	6a 00                	push   $0x0
  105fb0:	6a 1c                	push   $0x1c
  105fb2:	e9 59 fa ff ff       	jmp    105a10 <alltraps>

00105fb7 <vector29>:
  105fb7:	6a 00                	push   $0x0
  105fb9:	6a 1d                	push   $0x1d
  105fbb:	e9 50 fa ff ff       	jmp    105a10 <alltraps>

00105fc0 <vector30>:
  105fc0:	6a 00                	push   $0x0
  105fc2:	6a 1e                	push   $0x1e
  105fc4:	e9 47 fa ff ff       	jmp    105a10 <alltraps>

00105fc9 <vector31>:
  105fc9:	6a 00                	push   $0x0
  105fcb:	6a 1f                	push   $0x1f
  105fcd:	e9 3e fa ff ff       	jmp    105a10 <alltraps>

00105fd2 <vector32>:
  105fd2:	6a 00                	push   $0x0
  105fd4:	6a 20                	push   $0x20
  105fd6:	e9 35 fa ff ff       	jmp    105a10 <alltraps>

00105fdb <vector33>:
  105fdb:	6a 00                	push   $0x0
  105fdd:	6a 21                	push   $0x21
  105fdf:	e9 2c fa ff ff       	jmp    105a10 <alltraps>

00105fe4 <vector34>:
  105fe4:	6a 00                	push   $0x0
  105fe6:	6a 22                	push   $0x22
  105fe8:	e9 23 fa ff ff       	jmp    105a10 <alltraps>

00105fed <vector35>:
  105fed:	6a 00                	push   $0x0
  105fef:	6a 23                	push   $0x23
  105ff1:	e9 1a fa ff ff       	jmp    105a10 <alltraps>

00105ff6 <vector36>:
  105ff6:	6a 00                	push   $0x0
  105ff8:	6a 24                	push   $0x24
  105ffa:	e9 11 fa ff ff       	jmp    105a10 <alltraps>

00105fff <vector37>:
  105fff:	6a 00                	push   $0x0
  106001:	6a 25                	push   $0x25
  106003:	e9 08 fa ff ff       	jmp    105a10 <alltraps>

00106008 <vector38>:
  106008:	6a 00                	push   $0x0
  10600a:	6a 26                	push   $0x26
  10600c:	e9 ff f9 ff ff       	jmp    105a10 <alltraps>

00106011 <vector39>:
  106011:	6a 00                	push   $0x0
  106013:	6a 27                	push   $0x27
  106015:	e9 f6 f9 ff ff       	jmp    105a10 <alltraps>

0010601a <vector40>:
  10601a:	6a 00                	push   $0x0
  10601c:	6a 28                	push   $0x28
  10601e:	e9 ed f9 ff ff       	jmp    105a10 <alltraps>

00106023 <vector41>:
  106023:	6a 00                	push   $0x0
  106025:	6a 29                	push   $0x29
  106027:	e9 e4 f9 ff ff       	jmp    105a10 <alltraps>

0010602c <vector42>:
  10602c:	6a 00                	push   $0x0
  10602e:	6a 2a                	push   $0x2a
  106030:	e9 db f9 ff ff       	jmp    105a10 <alltraps>

00106035 <vector43>:
  106035:	6a 00                	push   $0x0
  106037:	6a 2b                	push   $0x2b
  106039:	e9 d2 f9 ff ff       	jmp    105a10 <alltraps>

0010603e <vector44>:
  10603e:	6a 00                	push   $0x0
  106040:	6a 2c                	push   $0x2c
  106042:	e9 c9 f9 ff ff       	jmp    105a10 <alltraps>

00106047 <vector45>:
  106047:	6a 00                	push   $0x0
  106049:	6a 2d                	push   $0x2d
  10604b:	e9 c0 f9 ff ff       	jmp    105a10 <alltraps>

00106050 <vector46>:
  106050:	6a 00                	push   $0x0
  106052:	6a 2e                	push   $0x2e
  106054:	e9 b7 f9 ff ff       	jmp    105a10 <alltraps>

00106059 <vector47>:
  106059:	6a 00                	push   $0x0
  10605b:	6a 2f                	push   $0x2f
  10605d:	e9 ae f9 ff ff       	jmp    105a10 <alltraps>

00106062 <vector48>:
  106062:	6a 00                	push   $0x0
  106064:	6a 30                	push   $0x30
  106066:	e9 a5 f9 ff ff       	jmp    105a10 <alltraps>

0010606b <vector49>:
  10606b:	6a 00                	push   $0x0
  10606d:	6a 31                	push   $0x31
  10606f:	e9 9c f9 ff ff       	jmp    105a10 <alltraps>

00106074 <vector50>:
  106074:	6a 00                	push   $0x0
  106076:	6a 32                	push   $0x32
  106078:	e9 93 f9 ff ff       	jmp    105a10 <alltraps>

0010607d <vector51>:
  10607d:	6a 00                	push   $0x0
  10607f:	6a 33                	push   $0x33
  106081:	e9 8a f9 ff ff       	jmp    105a10 <alltraps>

00106086 <vector52>:
  106086:	6a 00                	push   $0x0
  106088:	6a 34                	push   $0x34
  10608a:	e9 81 f9 ff ff       	jmp    105a10 <alltraps>

0010608f <vector53>:
  10608f:	6a 00                	push   $0x0
  106091:	6a 35                	push   $0x35
  106093:	e9 78 f9 ff ff       	jmp    105a10 <alltraps>

00106098 <vector54>:
  106098:	6a 00                	push   $0x0
  10609a:	6a 36                	push   $0x36
  10609c:	e9 6f f9 ff ff       	jmp    105a10 <alltraps>

001060a1 <vector55>:
  1060a1:	6a 00                	push   $0x0
  1060a3:	6a 37                	push   $0x37
  1060a5:	e9 66 f9 ff ff       	jmp    105a10 <alltraps>

001060aa <vector56>:
  1060aa:	6a 00                	push   $0x0
  1060ac:	6a 38                	push   $0x38
  1060ae:	e9 5d f9 ff ff       	jmp    105a10 <alltraps>

001060b3 <vector57>:
  1060b3:	6a 00                	push   $0x0
  1060b5:	6a 39                	push   $0x39
  1060b7:	e9 54 f9 ff ff       	jmp    105a10 <alltraps>

001060bc <vector58>:
  1060bc:	6a 00                	push   $0x0
  1060be:	6a 3a                	push   $0x3a
  1060c0:	e9 4b f9 ff ff       	jmp    105a10 <alltraps>

001060c5 <vector59>:
  1060c5:	6a 00                	push   $0x0
  1060c7:	6a 3b                	push   $0x3b
  1060c9:	e9 42 f9 ff ff       	jmp    105a10 <alltraps>

001060ce <vector60>:
  1060ce:	6a 00                	push   $0x0
  1060d0:	6a 3c                	push   $0x3c
  1060d2:	e9 39 f9 ff ff       	jmp    105a10 <alltraps>

001060d7 <vector61>:
  1060d7:	6a 00                	push   $0x0
  1060d9:	6a 3d                	push   $0x3d
  1060db:	e9 30 f9 ff ff       	jmp    105a10 <alltraps>

001060e0 <vector62>:
  1060e0:	6a 00                	push   $0x0
  1060e2:	6a 3e                	push   $0x3e
  1060e4:	e9 27 f9 ff ff       	jmp    105a10 <alltraps>

001060e9 <vector63>:
  1060e9:	6a 00                	push   $0x0
  1060eb:	6a 3f                	push   $0x3f
  1060ed:	e9 1e f9 ff ff       	jmp    105a10 <alltraps>

001060f2 <vector64>:
  1060f2:	6a 00                	push   $0x0
  1060f4:	6a 40                	push   $0x40
  1060f6:	e9 15 f9 ff ff       	jmp    105a10 <alltraps>

001060fb <vector65>:
  1060fb:	6a 00                	push   $0x0
  1060fd:	6a 41                	push   $0x41
  1060ff:	e9 0c f9 ff ff       	jmp    105a10 <alltraps>

00106104 <vector66>:
  106104:	6a 00                	push   $0x0
  106106:	6a 42                	push   $0x42
  106108:	e9 03 f9 ff ff       	jmp    105a10 <alltraps>

0010610d <vector67>:
  10610d:	6a 00                	push   $0x0
  10610f:	6a 43                	push   $0x43
  106111:	e9 fa f8 ff ff       	jmp    105a10 <alltraps>

00106116 <vector68>:
  106116:	6a 00                	push   $0x0
  106118:	6a 44                	push   $0x44
  10611a:	e9 f1 f8 ff ff       	jmp    105a10 <alltraps>

0010611f <vector69>:
  10611f:	6a 00                	push   $0x0
  106121:	6a 45                	push   $0x45
  106123:	e9 e8 f8 ff ff       	jmp    105a10 <alltraps>

00106128 <vector70>:
  106128:	6a 00                	push   $0x0
  10612a:	6a 46                	push   $0x46
  10612c:	e9 df f8 ff ff       	jmp    105a10 <alltraps>

00106131 <vector71>:
  106131:	6a 00                	push   $0x0
  106133:	6a 47                	push   $0x47
  106135:	e9 d6 f8 ff ff       	jmp    105a10 <alltraps>

0010613a <vector72>:
  10613a:	6a 00                	push   $0x0
  10613c:	6a 48                	push   $0x48
  10613e:	e9 cd f8 ff ff       	jmp    105a10 <alltraps>

00106143 <vector73>:
  106143:	6a 00                	push   $0x0
  106145:	6a 49                	push   $0x49
  106147:	e9 c4 f8 ff ff       	jmp    105a10 <alltraps>

0010614c <vector74>:
  10614c:	6a 00                	push   $0x0
  10614e:	6a 4a                	push   $0x4a
  106150:	e9 bb f8 ff ff       	jmp    105a10 <alltraps>

00106155 <vector75>:
  106155:	6a 00                	push   $0x0
  106157:	6a 4b                	push   $0x4b
  106159:	e9 b2 f8 ff ff       	jmp    105a10 <alltraps>

0010615e <vector76>:
  10615e:	6a 00                	push   $0x0
  106160:	6a 4c                	push   $0x4c
  106162:	e9 a9 f8 ff ff       	jmp    105a10 <alltraps>

00106167 <vector77>:
  106167:	6a 00                	push   $0x0
  106169:	6a 4d                	push   $0x4d
  10616b:	e9 a0 f8 ff ff       	jmp    105a10 <alltraps>

00106170 <vector78>:
  106170:	6a 00                	push   $0x0
  106172:	6a 4e                	push   $0x4e
  106174:	e9 97 f8 ff ff       	jmp    105a10 <alltraps>

00106179 <vector79>:
  106179:	6a 00                	push   $0x0
  10617b:	6a 4f                	push   $0x4f
  10617d:	e9 8e f8 ff ff       	jmp    105a10 <alltraps>

00106182 <vector80>:
  106182:	6a 00                	push   $0x0
  106184:	6a 50                	push   $0x50
  106186:	e9 85 f8 ff ff       	jmp    105a10 <alltraps>

0010618b <vector81>:
  10618b:	6a 00                	push   $0x0
  10618d:	6a 51                	push   $0x51
  10618f:	e9 7c f8 ff ff       	jmp    105a10 <alltraps>

00106194 <vector82>:
  106194:	6a 00                	push   $0x0
  106196:	6a 52                	push   $0x52
  106198:	e9 73 f8 ff ff       	jmp    105a10 <alltraps>

0010619d <vector83>:
  10619d:	6a 00                	push   $0x0
  10619f:	6a 53                	push   $0x53
  1061a1:	e9 6a f8 ff ff       	jmp    105a10 <alltraps>

001061a6 <vector84>:
  1061a6:	6a 00                	push   $0x0
  1061a8:	6a 54                	push   $0x54
  1061aa:	e9 61 f8 ff ff       	jmp    105a10 <alltraps>

001061af <vector85>:
  1061af:	6a 00                	push   $0x0
  1061b1:	6a 55                	push   $0x55
  1061b3:	e9 58 f8 ff ff       	jmp    105a10 <alltraps>

001061b8 <vector86>:
  1061b8:	6a 00                	push   $0x0
  1061ba:	6a 56                	push   $0x56
  1061bc:	e9 4f f8 ff ff       	jmp    105a10 <alltraps>

001061c1 <vector87>:
  1061c1:	6a 00                	push   $0x0
  1061c3:	6a 57                	push   $0x57
  1061c5:	e9 46 f8 ff ff       	jmp    105a10 <alltraps>

001061ca <vector88>:
  1061ca:	6a 00                	push   $0x0
  1061cc:	6a 58                	push   $0x58
  1061ce:	e9 3d f8 ff ff       	jmp    105a10 <alltraps>

001061d3 <vector89>:
  1061d3:	6a 00                	push   $0x0
  1061d5:	6a 59                	push   $0x59
  1061d7:	e9 34 f8 ff ff       	jmp    105a10 <alltraps>

001061dc <vector90>:
  1061dc:	6a 00                	push   $0x0
  1061de:	6a 5a                	push   $0x5a
  1061e0:	e9 2b f8 ff ff       	jmp    105a10 <alltraps>

001061e5 <vector91>:
  1061e5:	6a 00                	push   $0x0
  1061e7:	6a 5b                	push   $0x5b
  1061e9:	e9 22 f8 ff ff       	jmp    105a10 <alltraps>

001061ee <vector92>:
  1061ee:	6a 00                	push   $0x0
  1061f0:	6a 5c                	push   $0x5c
  1061f2:	e9 19 f8 ff ff       	jmp    105a10 <alltraps>

001061f7 <vector93>:
  1061f7:	6a 00                	push   $0x0
  1061f9:	6a 5d                	push   $0x5d
  1061fb:	e9 10 f8 ff ff       	jmp    105a10 <alltraps>

00106200 <vector94>:
  106200:	6a 00                	push   $0x0
  106202:	6a 5e                	push   $0x5e
  106204:	e9 07 f8 ff ff       	jmp    105a10 <alltraps>

00106209 <vector95>:
  106209:	6a 00                	push   $0x0
  10620b:	6a 5f                	push   $0x5f
  10620d:	e9 fe f7 ff ff       	jmp    105a10 <alltraps>

00106212 <vector96>:
  106212:	6a 00                	push   $0x0
  106214:	6a 60                	push   $0x60
  106216:	e9 f5 f7 ff ff       	jmp    105a10 <alltraps>

0010621b <vector97>:
  10621b:	6a 00                	push   $0x0
  10621d:	6a 61                	push   $0x61
  10621f:	e9 ec f7 ff ff       	jmp    105a10 <alltraps>

00106224 <vector98>:
  106224:	6a 00                	push   $0x0
  106226:	6a 62                	push   $0x62
  106228:	e9 e3 f7 ff ff       	jmp    105a10 <alltraps>

0010622d <vector99>:
  10622d:	6a 00                	push   $0x0
  10622f:	6a 63                	push   $0x63
  106231:	e9 da f7 ff ff       	jmp    105a10 <alltraps>

00106236 <vector100>:
  106236:	6a 00                	push   $0x0
  106238:	6a 64                	push   $0x64
  10623a:	e9 d1 f7 ff ff       	jmp    105a10 <alltraps>

0010623f <vector101>:
  10623f:	6a 00                	push   $0x0
  106241:	6a 65                	push   $0x65
  106243:	e9 c8 f7 ff ff       	jmp    105a10 <alltraps>

00106248 <vector102>:
  106248:	6a 00                	push   $0x0
  10624a:	6a 66                	push   $0x66
  10624c:	e9 bf f7 ff ff       	jmp    105a10 <alltraps>

00106251 <vector103>:
  106251:	6a 00                	push   $0x0
  106253:	6a 67                	push   $0x67
  106255:	e9 b6 f7 ff ff       	jmp    105a10 <alltraps>

0010625a <vector104>:
  10625a:	6a 00                	push   $0x0
  10625c:	6a 68                	push   $0x68
  10625e:	e9 ad f7 ff ff       	jmp    105a10 <alltraps>

00106263 <vector105>:
  106263:	6a 00                	push   $0x0
  106265:	6a 69                	push   $0x69
  106267:	e9 a4 f7 ff ff       	jmp    105a10 <alltraps>

0010626c <vector106>:
  10626c:	6a 00                	push   $0x0
  10626e:	6a 6a                	push   $0x6a
  106270:	e9 9b f7 ff ff       	jmp    105a10 <alltraps>

00106275 <vector107>:
  106275:	6a 00                	push   $0x0
  106277:	6a 6b                	push   $0x6b
  106279:	e9 92 f7 ff ff       	jmp    105a10 <alltraps>

0010627e <vector108>:
  10627e:	6a 00                	push   $0x0
  106280:	6a 6c                	push   $0x6c
  106282:	e9 89 f7 ff ff       	jmp    105a10 <alltraps>

00106287 <vector109>:
  106287:	6a 00                	push   $0x0
  106289:	6a 6d                	push   $0x6d
  10628b:	e9 80 f7 ff ff       	jmp    105a10 <alltraps>

00106290 <vector110>:
  106290:	6a 00                	push   $0x0
  106292:	6a 6e                	push   $0x6e
  106294:	e9 77 f7 ff ff       	jmp    105a10 <alltraps>

00106299 <vector111>:
  106299:	6a 00                	push   $0x0
  10629b:	6a 6f                	push   $0x6f
  10629d:	e9 6e f7 ff ff       	jmp    105a10 <alltraps>

001062a2 <vector112>:
  1062a2:	6a 00                	push   $0x0
  1062a4:	6a 70                	push   $0x70
  1062a6:	e9 65 f7 ff ff       	jmp    105a10 <alltraps>

001062ab <vector113>:
  1062ab:	6a 00                	push   $0x0
  1062ad:	6a 71                	push   $0x71
  1062af:	e9 5c f7 ff ff       	jmp    105a10 <alltraps>

001062b4 <vector114>:
  1062b4:	6a 00                	push   $0x0
  1062b6:	6a 72                	push   $0x72
  1062b8:	e9 53 f7 ff ff       	jmp    105a10 <alltraps>

001062bd <vector115>:
  1062bd:	6a 00                	push   $0x0
  1062bf:	6a 73                	push   $0x73
  1062c1:	e9 4a f7 ff ff       	jmp    105a10 <alltraps>

001062c6 <vector116>:
  1062c6:	6a 00                	push   $0x0
  1062c8:	6a 74                	push   $0x74
  1062ca:	e9 41 f7 ff ff       	jmp    105a10 <alltraps>

001062cf <vector117>:
  1062cf:	6a 00                	push   $0x0
  1062d1:	6a 75                	push   $0x75
  1062d3:	e9 38 f7 ff ff       	jmp    105a10 <alltraps>

001062d8 <vector118>:
  1062d8:	6a 00                	push   $0x0
  1062da:	6a 76                	push   $0x76
  1062dc:	e9 2f f7 ff ff       	jmp    105a10 <alltraps>

001062e1 <vector119>:
  1062e1:	6a 00                	push   $0x0
  1062e3:	6a 77                	push   $0x77
  1062e5:	e9 26 f7 ff ff       	jmp    105a10 <alltraps>

001062ea <vector120>:
  1062ea:	6a 00                	push   $0x0
  1062ec:	6a 78                	push   $0x78
  1062ee:	e9 1d f7 ff ff       	jmp    105a10 <alltraps>

001062f3 <vector121>:
  1062f3:	6a 00                	push   $0x0
  1062f5:	6a 79                	push   $0x79
  1062f7:	e9 14 f7 ff ff       	jmp    105a10 <alltraps>

001062fc <vector122>:
  1062fc:	6a 00                	push   $0x0
  1062fe:	6a 7a                	push   $0x7a
  106300:	e9 0b f7 ff ff       	jmp    105a10 <alltraps>

00106305 <vector123>:
  106305:	6a 00                	push   $0x0
  106307:	6a 7b                	push   $0x7b
  106309:	e9 02 f7 ff ff       	jmp    105a10 <alltraps>

0010630e <vector124>:
  10630e:	6a 00                	push   $0x0
  106310:	6a 7c                	push   $0x7c
  106312:	e9 f9 f6 ff ff       	jmp    105a10 <alltraps>

00106317 <vector125>:
  106317:	6a 00                	push   $0x0
  106319:	6a 7d                	push   $0x7d
  10631b:	e9 f0 f6 ff ff       	jmp    105a10 <alltraps>

00106320 <vector126>:
  106320:	6a 00                	push   $0x0
  106322:	6a 7e                	push   $0x7e
  106324:	e9 e7 f6 ff ff       	jmp    105a10 <alltraps>

00106329 <vector127>:
  106329:	6a 00                	push   $0x0
  10632b:	6a 7f                	push   $0x7f
  10632d:	e9 de f6 ff ff       	jmp    105a10 <alltraps>

00106332 <vector128>:
  106332:	6a 00                	push   $0x0
  106334:	68 80 00 00 00       	push   $0x80
  106339:	e9 d2 f6 ff ff       	jmp    105a10 <alltraps>

0010633e <vector129>:
  10633e:	6a 00                	push   $0x0
  106340:	68 81 00 00 00       	push   $0x81
  106345:	e9 c6 f6 ff ff       	jmp    105a10 <alltraps>

0010634a <vector130>:
  10634a:	6a 00                	push   $0x0
  10634c:	68 82 00 00 00       	push   $0x82
  106351:	e9 ba f6 ff ff       	jmp    105a10 <alltraps>

00106356 <vector131>:
  106356:	6a 00                	push   $0x0
  106358:	68 83 00 00 00       	push   $0x83
  10635d:	e9 ae f6 ff ff       	jmp    105a10 <alltraps>

00106362 <vector132>:
  106362:	6a 00                	push   $0x0
  106364:	68 84 00 00 00       	push   $0x84
  106369:	e9 a2 f6 ff ff       	jmp    105a10 <alltraps>

0010636e <vector133>:
  10636e:	6a 00                	push   $0x0
  106370:	68 85 00 00 00       	push   $0x85
  106375:	e9 96 f6 ff ff       	jmp    105a10 <alltraps>

0010637a <vector134>:
  10637a:	6a 00                	push   $0x0
  10637c:	68 86 00 00 00       	push   $0x86
  106381:	e9 8a f6 ff ff       	jmp    105a10 <alltraps>

00106386 <vector135>:
  106386:	6a 00                	push   $0x0
  106388:	68 87 00 00 00       	push   $0x87
  10638d:	e9 7e f6 ff ff       	jmp    105a10 <alltraps>

00106392 <vector136>:
  106392:	6a 00                	push   $0x0
  106394:	68 88 00 00 00       	push   $0x88
  106399:	e9 72 f6 ff ff       	jmp    105a10 <alltraps>

0010639e <vector137>:
  10639e:	6a 00                	push   $0x0
  1063a0:	68 89 00 00 00       	push   $0x89
  1063a5:	e9 66 f6 ff ff       	jmp    105a10 <alltraps>

001063aa <vector138>:
  1063aa:	6a 00                	push   $0x0
  1063ac:	68 8a 00 00 00       	push   $0x8a
  1063b1:	e9 5a f6 ff ff       	jmp    105a10 <alltraps>

001063b6 <vector139>:
  1063b6:	6a 00                	push   $0x0
  1063b8:	68 8b 00 00 00       	push   $0x8b
  1063bd:	e9 4e f6 ff ff       	jmp    105a10 <alltraps>

001063c2 <vector140>:
  1063c2:	6a 00                	push   $0x0
  1063c4:	68 8c 00 00 00       	push   $0x8c
  1063c9:	e9 42 f6 ff ff       	jmp    105a10 <alltraps>

001063ce <vector141>:
  1063ce:	6a 00                	push   $0x0
  1063d0:	68 8d 00 00 00       	push   $0x8d
  1063d5:	e9 36 f6 ff ff       	jmp    105a10 <alltraps>

001063da <vector142>:
  1063da:	6a 00                	push   $0x0
  1063dc:	68 8e 00 00 00       	push   $0x8e
  1063e1:	e9 2a f6 ff ff       	jmp    105a10 <alltraps>

001063e6 <vector143>:
  1063e6:	6a 00                	push   $0x0
  1063e8:	68 8f 00 00 00       	push   $0x8f
  1063ed:	e9 1e f6 ff ff       	jmp    105a10 <alltraps>

001063f2 <vector144>:
  1063f2:	6a 00                	push   $0x0
  1063f4:	68 90 00 00 00       	push   $0x90
  1063f9:	e9 12 f6 ff ff       	jmp    105a10 <alltraps>

001063fe <vector145>:
  1063fe:	6a 00                	push   $0x0
  106400:	68 91 00 00 00       	push   $0x91
  106405:	e9 06 f6 ff ff       	jmp    105a10 <alltraps>

0010640a <vector146>:
  10640a:	6a 00                	push   $0x0
  10640c:	68 92 00 00 00       	push   $0x92
  106411:	e9 fa f5 ff ff       	jmp    105a10 <alltraps>

00106416 <vector147>:
  106416:	6a 00                	push   $0x0
  106418:	68 93 00 00 00       	push   $0x93
  10641d:	e9 ee f5 ff ff       	jmp    105a10 <alltraps>

00106422 <vector148>:
  106422:	6a 00                	push   $0x0
  106424:	68 94 00 00 00       	push   $0x94
  106429:	e9 e2 f5 ff ff       	jmp    105a10 <alltraps>

0010642e <vector149>:
  10642e:	6a 00                	push   $0x0
  106430:	68 95 00 00 00       	push   $0x95
  106435:	e9 d6 f5 ff ff       	jmp    105a10 <alltraps>

0010643a <vector150>:
  10643a:	6a 00                	push   $0x0
  10643c:	68 96 00 00 00       	push   $0x96
  106441:	e9 ca f5 ff ff       	jmp    105a10 <alltraps>

00106446 <vector151>:
  106446:	6a 00                	push   $0x0
  106448:	68 97 00 00 00       	push   $0x97
  10644d:	e9 be f5 ff ff       	jmp    105a10 <alltraps>

00106452 <vector152>:
  106452:	6a 00                	push   $0x0
  106454:	68 98 00 00 00       	push   $0x98
  106459:	e9 b2 f5 ff ff       	jmp    105a10 <alltraps>

0010645e <vector153>:
  10645e:	6a 00                	push   $0x0
  106460:	68 99 00 00 00       	push   $0x99
  106465:	e9 a6 f5 ff ff       	jmp    105a10 <alltraps>

0010646a <vector154>:
  10646a:	6a 00                	push   $0x0
  10646c:	68 9a 00 00 00       	push   $0x9a
  106471:	e9 9a f5 ff ff       	jmp    105a10 <alltraps>

00106476 <vector155>:
  106476:	6a 00                	push   $0x0
  106478:	68 9b 00 00 00       	push   $0x9b
  10647d:	e9 8e f5 ff ff       	jmp    105a10 <alltraps>

00106482 <vector156>:
  106482:	6a 00                	push   $0x0
  106484:	68 9c 00 00 00       	push   $0x9c
  106489:	e9 82 f5 ff ff       	jmp    105a10 <alltraps>

0010648e <vector157>:
  10648e:	6a 00                	push   $0x0
  106490:	68 9d 00 00 00       	push   $0x9d
  106495:	e9 76 f5 ff ff       	jmp    105a10 <alltraps>

0010649a <vector158>:
  10649a:	6a 00                	push   $0x0
  10649c:	68 9e 00 00 00       	push   $0x9e
  1064a1:	e9 6a f5 ff ff       	jmp    105a10 <alltraps>

001064a6 <vector159>:
  1064a6:	6a 00                	push   $0x0
  1064a8:	68 9f 00 00 00       	push   $0x9f
  1064ad:	e9 5e f5 ff ff       	jmp    105a10 <alltraps>

001064b2 <vector160>:
  1064b2:	6a 00                	push   $0x0
  1064b4:	68 a0 00 00 00       	push   $0xa0
  1064b9:	e9 52 f5 ff ff       	jmp    105a10 <alltraps>

001064be <vector161>:
  1064be:	6a 00                	push   $0x0
  1064c0:	68 a1 00 00 00       	push   $0xa1
  1064c5:	e9 46 f5 ff ff       	jmp    105a10 <alltraps>

001064ca <vector162>:
  1064ca:	6a 00                	push   $0x0
  1064cc:	68 a2 00 00 00       	push   $0xa2
  1064d1:	e9 3a f5 ff ff       	jmp    105a10 <alltraps>

001064d6 <vector163>:
  1064d6:	6a 00                	push   $0x0
  1064d8:	68 a3 00 00 00       	push   $0xa3
  1064dd:	e9 2e f5 ff ff       	jmp    105a10 <alltraps>

001064e2 <vector164>:
  1064e2:	6a 00                	push   $0x0
  1064e4:	68 a4 00 00 00       	push   $0xa4
  1064e9:	e9 22 f5 ff ff       	jmp    105a10 <alltraps>

001064ee <vector165>:
  1064ee:	6a 00                	push   $0x0
  1064f0:	68 a5 00 00 00       	push   $0xa5
  1064f5:	e9 16 f5 ff ff       	jmp    105a10 <alltraps>

001064fa <vector166>:
  1064fa:	6a 00                	push   $0x0
  1064fc:	68 a6 00 00 00       	push   $0xa6
  106501:	e9 0a f5 ff ff       	jmp    105a10 <alltraps>

00106506 <vector167>:
  106506:	6a 00                	push   $0x0
  106508:	68 a7 00 00 00       	push   $0xa7
  10650d:	e9 fe f4 ff ff       	jmp    105a10 <alltraps>

00106512 <vector168>:
  106512:	6a 00                	push   $0x0
  106514:	68 a8 00 00 00       	push   $0xa8
  106519:	e9 f2 f4 ff ff       	jmp    105a10 <alltraps>

0010651e <vector169>:
  10651e:	6a 00                	push   $0x0
  106520:	68 a9 00 00 00       	push   $0xa9
  106525:	e9 e6 f4 ff ff       	jmp    105a10 <alltraps>

0010652a <vector170>:
  10652a:	6a 00                	push   $0x0
  10652c:	68 aa 00 00 00       	push   $0xaa
  106531:	e9 da f4 ff ff       	jmp    105a10 <alltraps>

00106536 <vector171>:
  106536:	6a 00                	push   $0x0
  106538:	68 ab 00 00 00       	push   $0xab
  10653d:	e9 ce f4 ff ff       	jmp    105a10 <alltraps>

00106542 <vector172>:
  106542:	6a 00                	push   $0x0
  106544:	68 ac 00 00 00       	push   $0xac
  106549:	e9 c2 f4 ff ff       	jmp    105a10 <alltraps>

0010654e <vector173>:
  10654e:	6a 00                	push   $0x0
  106550:	68 ad 00 00 00       	push   $0xad
  106555:	e9 b6 f4 ff ff       	jmp    105a10 <alltraps>

0010655a <vector174>:
  10655a:	6a 00                	push   $0x0
  10655c:	68 ae 00 00 00       	push   $0xae
  106561:	e9 aa f4 ff ff       	jmp    105a10 <alltraps>

00106566 <vector175>:
  106566:	6a 00                	push   $0x0
  106568:	68 af 00 00 00       	push   $0xaf
  10656d:	e9 9e f4 ff ff       	jmp    105a10 <alltraps>

00106572 <vector176>:
  106572:	6a 00                	push   $0x0
  106574:	68 b0 00 00 00       	push   $0xb0
  106579:	e9 92 f4 ff ff       	jmp    105a10 <alltraps>

0010657e <vector177>:
  10657e:	6a 00                	push   $0x0
  106580:	68 b1 00 00 00       	push   $0xb1
  106585:	e9 86 f4 ff ff       	jmp    105a10 <alltraps>

0010658a <vector178>:
  10658a:	6a 00                	push   $0x0
  10658c:	68 b2 00 00 00       	push   $0xb2
  106591:	e9 7a f4 ff ff       	jmp    105a10 <alltraps>

00106596 <vector179>:
  106596:	6a 00                	push   $0x0
  106598:	68 b3 00 00 00       	push   $0xb3
  10659d:	e9 6e f4 ff ff       	jmp    105a10 <alltraps>

001065a2 <vector180>:
  1065a2:	6a 00                	push   $0x0
  1065a4:	68 b4 00 00 00       	push   $0xb4
  1065a9:	e9 62 f4 ff ff       	jmp    105a10 <alltraps>

001065ae <vector181>:
  1065ae:	6a 00                	push   $0x0
  1065b0:	68 b5 00 00 00       	push   $0xb5
  1065b5:	e9 56 f4 ff ff       	jmp    105a10 <alltraps>

001065ba <vector182>:
  1065ba:	6a 00                	push   $0x0
  1065bc:	68 b6 00 00 00       	push   $0xb6
  1065c1:	e9 4a f4 ff ff       	jmp    105a10 <alltraps>

001065c6 <vector183>:
  1065c6:	6a 00                	push   $0x0
  1065c8:	68 b7 00 00 00       	push   $0xb7
  1065cd:	e9 3e f4 ff ff       	jmp    105a10 <alltraps>

001065d2 <vector184>:
  1065d2:	6a 00                	push   $0x0
  1065d4:	68 b8 00 00 00       	push   $0xb8
  1065d9:	e9 32 f4 ff ff       	jmp    105a10 <alltraps>

001065de <vector185>:
  1065de:	6a 00                	push   $0x0
  1065e0:	68 b9 00 00 00       	push   $0xb9
  1065e5:	e9 26 f4 ff ff       	jmp    105a10 <alltraps>

001065ea <vector186>:
  1065ea:	6a 00                	push   $0x0
  1065ec:	68 ba 00 00 00       	push   $0xba
  1065f1:	e9 1a f4 ff ff       	jmp    105a10 <alltraps>

001065f6 <vector187>:
  1065f6:	6a 00                	push   $0x0
  1065f8:	68 bb 00 00 00       	push   $0xbb
  1065fd:	e9 0e f4 ff ff       	jmp    105a10 <alltraps>

00106602 <vector188>:
  106602:	6a 00                	push   $0x0
  106604:	68 bc 00 00 00       	push   $0xbc
  106609:	e9 02 f4 ff ff       	jmp    105a10 <alltraps>

0010660e <vector189>:
  10660e:	6a 00                	push   $0x0
  106610:	68 bd 00 00 00       	push   $0xbd
  106615:	e9 f6 f3 ff ff       	jmp    105a10 <alltraps>

0010661a <vector190>:
  10661a:	6a 00                	push   $0x0
  10661c:	68 be 00 00 00       	push   $0xbe
  106621:	e9 ea f3 ff ff       	jmp    105a10 <alltraps>

00106626 <vector191>:
  106626:	6a 00                	push   $0x0
  106628:	68 bf 00 00 00       	push   $0xbf
  10662d:	e9 de f3 ff ff       	jmp    105a10 <alltraps>

00106632 <vector192>:
  106632:	6a 00                	push   $0x0
  106634:	68 c0 00 00 00       	push   $0xc0
  106639:	e9 d2 f3 ff ff       	jmp    105a10 <alltraps>

0010663e <vector193>:
  10663e:	6a 00                	push   $0x0
  106640:	68 c1 00 00 00       	push   $0xc1
  106645:	e9 c6 f3 ff ff       	jmp    105a10 <alltraps>

0010664a <vector194>:
  10664a:	6a 00                	push   $0x0
  10664c:	68 c2 00 00 00       	push   $0xc2
  106651:	e9 ba f3 ff ff       	jmp    105a10 <alltraps>

00106656 <vector195>:
  106656:	6a 00                	push   $0x0
  106658:	68 c3 00 00 00       	push   $0xc3
  10665d:	e9 ae f3 ff ff       	jmp    105a10 <alltraps>

00106662 <vector196>:
  106662:	6a 00                	push   $0x0
  106664:	68 c4 00 00 00       	push   $0xc4
  106669:	e9 a2 f3 ff ff       	jmp    105a10 <alltraps>

0010666e <vector197>:
  10666e:	6a 00                	push   $0x0
  106670:	68 c5 00 00 00       	push   $0xc5
  106675:	e9 96 f3 ff ff       	jmp    105a10 <alltraps>

0010667a <vector198>:
  10667a:	6a 00                	push   $0x0
  10667c:	68 c6 00 00 00       	push   $0xc6
  106681:	e9 8a f3 ff ff       	jmp    105a10 <alltraps>

00106686 <vector199>:
  106686:	6a 00                	push   $0x0
  106688:	68 c7 00 00 00       	push   $0xc7
  10668d:	e9 7e f3 ff ff       	jmp    105a10 <alltraps>

00106692 <vector200>:
  106692:	6a 00                	push   $0x0
  106694:	68 c8 00 00 00       	push   $0xc8
  106699:	e9 72 f3 ff ff       	jmp    105a10 <alltraps>

0010669e <vector201>:
  10669e:	6a 00                	push   $0x0
  1066a0:	68 c9 00 00 00       	push   $0xc9
  1066a5:	e9 66 f3 ff ff       	jmp    105a10 <alltraps>

001066aa <vector202>:
  1066aa:	6a 00                	push   $0x0
  1066ac:	68 ca 00 00 00       	push   $0xca
  1066b1:	e9 5a f3 ff ff       	jmp    105a10 <alltraps>

001066b6 <vector203>:
  1066b6:	6a 00                	push   $0x0
  1066b8:	68 cb 00 00 00       	push   $0xcb
  1066bd:	e9 4e f3 ff ff       	jmp    105a10 <alltraps>

001066c2 <vector204>:
  1066c2:	6a 00                	push   $0x0
  1066c4:	68 cc 00 00 00       	push   $0xcc
  1066c9:	e9 42 f3 ff ff       	jmp    105a10 <alltraps>

001066ce <vector205>:
  1066ce:	6a 00                	push   $0x0
  1066d0:	68 cd 00 00 00       	push   $0xcd
  1066d5:	e9 36 f3 ff ff       	jmp    105a10 <alltraps>

001066da <vector206>:
  1066da:	6a 00                	push   $0x0
  1066dc:	68 ce 00 00 00       	push   $0xce
  1066e1:	e9 2a f3 ff ff       	jmp    105a10 <alltraps>

001066e6 <vector207>:
  1066e6:	6a 00                	push   $0x0
  1066e8:	68 cf 00 00 00       	push   $0xcf
  1066ed:	e9 1e f3 ff ff       	jmp    105a10 <alltraps>

001066f2 <vector208>:
  1066f2:	6a 00                	push   $0x0
  1066f4:	68 d0 00 00 00       	push   $0xd0
  1066f9:	e9 12 f3 ff ff       	jmp    105a10 <alltraps>

001066fe <vector209>:
  1066fe:	6a 00                	push   $0x0
  106700:	68 d1 00 00 00       	push   $0xd1
  106705:	e9 06 f3 ff ff       	jmp    105a10 <alltraps>

0010670a <vector210>:
  10670a:	6a 00                	push   $0x0
  10670c:	68 d2 00 00 00       	push   $0xd2
  106711:	e9 fa f2 ff ff       	jmp    105a10 <alltraps>

00106716 <vector211>:
  106716:	6a 00                	push   $0x0
  106718:	68 d3 00 00 00       	push   $0xd3
  10671d:	e9 ee f2 ff ff       	jmp    105a10 <alltraps>

00106722 <vector212>:
  106722:	6a 00                	push   $0x0
  106724:	68 d4 00 00 00       	push   $0xd4
  106729:	e9 e2 f2 ff ff       	jmp    105a10 <alltraps>

0010672e <vector213>:
  10672e:	6a 00                	push   $0x0
  106730:	68 d5 00 00 00       	push   $0xd5
  106735:	e9 d6 f2 ff ff       	jmp    105a10 <alltraps>

0010673a <vector214>:
  10673a:	6a 00                	push   $0x0
  10673c:	68 d6 00 00 00       	push   $0xd6
  106741:	e9 ca f2 ff ff       	jmp    105a10 <alltraps>

00106746 <vector215>:
  106746:	6a 00                	push   $0x0
  106748:	68 d7 00 00 00       	push   $0xd7
  10674d:	e9 be f2 ff ff       	jmp    105a10 <alltraps>

00106752 <vector216>:
  106752:	6a 00                	push   $0x0
  106754:	68 d8 00 00 00       	push   $0xd8
  106759:	e9 b2 f2 ff ff       	jmp    105a10 <alltraps>

0010675e <vector217>:
  10675e:	6a 00                	push   $0x0
  106760:	68 d9 00 00 00       	push   $0xd9
  106765:	e9 a6 f2 ff ff       	jmp    105a10 <alltraps>

0010676a <vector218>:
  10676a:	6a 00                	push   $0x0
  10676c:	68 da 00 00 00       	push   $0xda
  106771:	e9 9a f2 ff ff       	jmp    105a10 <alltraps>

00106776 <vector219>:
  106776:	6a 00                	push   $0x0
  106778:	68 db 00 00 00       	push   $0xdb
  10677d:	e9 8e f2 ff ff       	jmp    105a10 <alltraps>

00106782 <vector220>:
  106782:	6a 00                	push   $0x0
  106784:	68 dc 00 00 00       	push   $0xdc
  106789:	e9 82 f2 ff ff       	jmp    105a10 <alltraps>

0010678e <vector221>:
  10678e:	6a 00                	push   $0x0
  106790:	68 dd 00 00 00       	push   $0xdd
  106795:	e9 76 f2 ff ff       	jmp    105a10 <alltraps>

0010679a <vector222>:
  10679a:	6a 00                	push   $0x0
  10679c:	68 de 00 00 00       	push   $0xde
  1067a1:	e9 6a f2 ff ff       	jmp    105a10 <alltraps>

001067a6 <vector223>:
  1067a6:	6a 00                	push   $0x0
  1067a8:	68 df 00 00 00       	push   $0xdf
  1067ad:	e9 5e f2 ff ff       	jmp    105a10 <alltraps>

001067b2 <vector224>:
  1067b2:	6a 00                	push   $0x0
  1067b4:	68 e0 00 00 00       	push   $0xe0
  1067b9:	e9 52 f2 ff ff       	jmp    105a10 <alltraps>

001067be <vector225>:
  1067be:	6a 00                	push   $0x0
  1067c0:	68 e1 00 00 00       	push   $0xe1
  1067c5:	e9 46 f2 ff ff       	jmp    105a10 <alltraps>

001067ca <vector226>:
  1067ca:	6a 00                	push   $0x0
  1067cc:	68 e2 00 00 00       	push   $0xe2
  1067d1:	e9 3a f2 ff ff       	jmp    105a10 <alltraps>

001067d6 <vector227>:
  1067d6:	6a 00                	push   $0x0
  1067d8:	68 e3 00 00 00       	push   $0xe3
  1067dd:	e9 2e f2 ff ff       	jmp    105a10 <alltraps>

001067e2 <vector228>:
  1067e2:	6a 00                	push   $0x0
  1067e4:	68 e4 00 00 00       	push   $0xe4
  1067e9:	e9 22 f2 ff ff       	jmp    105a10 <alltraps>

001067ee <vector229>:
  1067ee:	6a 00                	push   $0x0
  1067f0:	68 e5 00 00 00       	push   $0xe5
  1067f5:	e9 16 f2 ff ff       	jmp    105a10 <alltraps>

001067fa <vector230>:
  1067fa:	6a 00                	push   $0x0
  1067fc:	68 e6 00 00 00       	push   $0xe6
  106801:	e9 0a f2 ff ff       	jmp    105a10 <alltraps>

00106806 <vector231>:
  106806:	6a 00                	push   $0x0
  106808:	68 e7 00 00 00       	push   $0xe7
  10680d:	e9 fe f1 ff ff       	jmp    105a10 <alltraps>

00106812 <vector232>:
  106812:	6a 00                	push   $0x0
  106814:	68 e8 00 00 00       	push   $0xe8
  106819:	e9 f2 f1 ff ff       	jmp    105a10 <alltraps>

0010681e <vector233>:
  10681e:	6a 00                	push   $0x0
  106820:	68 e9 00 00 00       	push   $0xe9
  106825:	e9 e6 f1 ff ff       	jmp    105a10 <alltraps>

0010682a <vector234>:
  10682a:	6a 00                	push   $0x0
  10682c:	68 ea 00 00 00       	push   $0xea
  106831:	e9 da f1 ff ff       	jmp    105a10 <alltraps>

00106836 <vector235>:
  106836:	6a 00                	push   $0x0
  106838:	68 eb 00 00 00       	push   $0xeb
  10683d:	e9 ce f1 ff ff       	jmp    105a10 <alltraps>

00106842 <vector236>:
  106842:	6a 00                	push   $0x0
  106844:	68 ec 00 00 00       	push   $0xec
  106849:	e9 c2 f1 ff ff       	jmp    105a10 <alltraps>

0010684e <vector237>:
  10684e:	6a 00                	push   $0x0
  106850:	68 ed 00 00 00       	push   $0xed
  106855:	e9 b6 f1 ff ff       	jmp    105a10 <alltraps>

0010685a <vector238>:
  10685a:	6a 00                	push   $0x0
  10685c:	68 ee 00 00 00       	push   $0xee
  106861:	e9 aa f1 ff ff       	jmp    105a10 <alltraps>

00106866 <vector239>:
  106866:	6a 00                	push   $0x0
  106868:	68 ef 00 00 00       	push   $0xef
  10686d:	e9 9e f1 ff ff       	jmp    105a10 <alltraps>

00106872 <vector240>:
  106872:	6a 00                	push   $0x0
  106874:	68 f0 00 00 00       	push   $0xf0
  106879:	e9 92 f1 ff ff       	jmp    105a10 <alltraps>

0010687e <vector241>:
  10687e:	6a 00                	push   $0x0
  106880:	68 f1 00 00 00       	push   $0xf1
  106885:	e9 86 f1 ff ff       	jmp    105a10 <alltraps>

0010688a <vector242>:
  10688a:	6a 00                	push   $0x0
  10688c:	68 f2 00 00 00       	push   $0xf2
  106891:	e9 7a f1 ff ff       	jmp    105a10 <alltraps>

00106896 <vector243>:
  106896:	6a 00                	push   $0x0
  106898:	68 f3 00 00 00       	push   $0xf3
  10689d:	e9 6e f1 ff ff       	jmp    105a10 <alltraps>

001068a2 <vector244>:
  1068a2:	6a 00                	push   $0x0
  1068a4:	68 f4 00 00 00       	push   $0xf4
  1068a9:	e9 62 f1 ff ff       	jmp    105a10 <alltraps>

001068ae <vector245>:
  1068ae:	6a 00                	push   $0x0
  1068b0:	68 f5 00 00 00       	push   $0xf5
  1068b5:	e9 56 f1 ff ff       	jmp    105a10 <alltraps>

001068ba <vector246>:
  1068ba:	6a 00                	push   $0x0
  1068bc:	68 f6 00 00 00       	push   $0xf6
  1068c1:	e9 4a f1 ff ff       	jmp    105a10 <alltraps>

001068c6 <vector247>:
  1068c6:	6a 00                	push   $0x0
  1068c8:	68 f7 00 00 00       	push   $0xf7
  1068cd:	e9 3e f1 ff ff       	jmp    105a10 <alltraps>

001068d2 <vector248>:
  1068d2:	6a 00                	push   $0x0
  1068d4:	68 f8 00 00 00       	push   $0xf8
  1068d9:	e9 32 f1 ff ff       	jmp    105a10 <alltraps>

001068de <vector249>:
  1068de:	6a 00                	push   $0x0
  1068e0:	68 f9 00 00 00       	push   $0xf9
  1068e5:	e9 26 f1 ff ff       	jmp    105a10 <alltraps>

001068ea <vector250>:
  1068ea:	6a 00                	push   $0x0
  1068ec:	68 fa 00 00 00       	push   $0xfa
  1068f1:	e9 1a f1 ff ff       	jmp    105a10 <alltraps>

001068f6 <vector251>:
  1068f6:	6a 00                	push   $0x0
  1068f8:	68 fb 00 00 00       	push   $0xfb
  1068fd:	e9 0e f1 ff ff       	jmp    105a10 <alltraps>

00106902 <vector252>:
  106902:	6a 00                	push   $0x0
  106904:	68 fc 00 00 00       	push   $0xfc
  106909:	e9 02 f1 ff ff       	jmp    105a10 <alltraps>

0010690e <vector253>:
  10690e:	6a 00                	push   $0x0
  106910:	68 fd 00 00 00       	push   $0xfd
  106915:	e9 f6 f0 ff ff       	jmp    105a10 <alltraps>

0010691a <vector254>:
  10691a:	6a 00                	push   $0x0
  10691c:	68 fe 00 00 00       	push   $0xfe
  106921:	e9 ea f0 ff ff       	jmp    105a10 <alltraps>

00106926 <vector255>:
  106926:	6a 00                	push   $0x0
  106928:	68 ff 00 00 00       	push   $0xff
  10692d:	e9 de f0 ff ff       	jmp    105a10 <alltraps>
  106932:	90                   	nop
  106933:	90                   	nop
  106934:	90                   	nop
  106935:	90                   	nop
  106936:	90                   	nop
  106937:	90                   	nop
  106938:	90                   	nop
  106939:	90                   	nop
  10693a:	90                   	nop
  10693b:	90                   	nop
  10693c:	90                   	nop
  10693d:	90                   	nop
  10693e:	90                   	nop
  10693f:	90                   	nop

00106940 <vmenable>:
  106940:	55                   	push   %ebp
  106941:	a1 30 93 10 00       	mov    0x109330,%eax
  106946:	89 e5                	mov    %esp,%ebp
  106948:	0f 22 d8             	mov    %eax,%cr3
  10694b:	0f 20 c0             	mov    %cr0,%eax
  10694e:	0d 00 00 00 80       	or     $0x80000000,%eax
  106953:	0f 22 c0             	mov    %eax,%cr0
  106956:	5d                   	pop    %ebp
  106957:	c3                   	ret    
  106958:	90                   	nop
  106959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106960 <switchkvm>:
  106960:	55                   	push   %ebp
  106961:	a1 30 93 10 00       	mov    0x109330,%eax
  106966:	89 e5                	mov    %esp,%ebp
  106968:	0f 22 d8             	mov    %eax,%cr3
  10696b:	5d                   	pop    %ebp
  10696c:	c3                   	ret    
  10696d:	8d 76 00             	lea    0x0(%esi),%esi

00106970 <walkpgdir>:
  106970:	55                   	push   %ebp
  106971:	89 e5                	mov    %esp,%ebp
  106973:	83 ec 28             	sub    $0x28,%esp
  106976:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  106979:	89 d3                	mov    %edx,%ebx
  10697b:	c1 eb 16             	shr    $0x16,%ebx
  10697e:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
  106981:	89 75 fc             	mov    %esi,-0x4(%ebp)
  106984:	8b 33                	mov    (%ebx),%esi
  106986:	f7 c6 01 00 00 00    	test   $0x1,%esi
  10698c:	74 22                	je     1069b0 <walkpgdir+0x40>
  10698e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  106994:	c1 ea 0a             	shr    $0xa,%edx
  106997:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
  10699d:	8d 04 16             	lea    (%esi,%edx,1),%eax
  1069a0:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  1069a3:	8b 75 fc             	mov    -0x4(%ebp),%esi
  1069a6:	89 ec                	mov    %ebp,%esp
  1069a8:	5d                   	pop    %ebp
  1069a9:	c3                   	ret    
  1069aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1069b0:	85 c9                	test   %ecx,%ecx
  1069b2:	75 04                	jne    1069b8 <walkpgdir+0x48>
  1069b4:	31 c0                	xor    %eax,%eax
  1069b6:	eb e8                	jmp    1069a0 <walkpgdir+0x30>
  1069b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1069bb:	90                   	nop
  1069bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1069c0:	e8 2b bb ff ff       	call   1024f0 <kalloc>
  1069c5:	85 c0                	test   %eax,%eax
  1069c7:	74 eb                	je     1069b4 <walkpgdir+0x44>
  1069c9:	89 c6                	mov    %eax,%esi
  1069cb:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  1069d2:	00 
  1069d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1069da:	00 
  1069db:	89 04 24             	mov    %eax,(%esp)
  1069de:	e8 0d dd ff ff       	call   1046f0 <memset>
  1069e3:	89 f0                	mov    %esi,%eax
  1069e5:	83 c8 07             	or     $0x7,%eax
  1069e8:	89 03                	mov    %eax,(%ebx)
  1069ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1069ed:	eb a5                	jmp    106994 <walkpgdir+0x24>
  1069ef:	90                   	nop

001069f0 <mappages>:
  1069f0:	55                   	push   %ebp
  1069f1:	89 e5                	mov    %esp,%ebp
  1069f3:	57                   	push   %edi
  1069f4:	56                   	push   %esi
  1069f5:	53                   	push   %ebx
  1069f6:	89 d3                	mov    %edx,%ebx
  1069f8:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
  1069fc:	83 ec 2c             	sub    $0x2c,%esp
  1069ff:	8b 75 08             	mov    0x8(%ebp),%esi
  106a02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106a05:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  106a0b:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  106a11:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
  106a15:	eb 1d                	jmp    106a34 <mappages+0x44>
  106a17:	90                   	nop
  106a18:	f6 00 01             	testb  $0x1,(%eax)
  106a1b:	75 48                	jne    106a65 <mappages+0x75>
  106a1d:	8b 55 0c             	mov    0xc(%ebp),%edx
  106a20:	09 f2                	or     %esi,%edx
  106a22:	39 fb                	cmp    %edi,%ebx
  106a24:	89 10                	mov    %edx,(%eax)
  106a26:	74 30                	je     106a58 <mappages+0x68>
  106a28:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106a2e:	81 c6 00 10 00 00    	add    $0x1000,%esi
  106a34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106a37:	b9 01 00 00 00       	mov    $0x1,%ecx
  106a3c:	89 da                	mov    %ebx,%edx
  106a3e:	e8 2d ff ff ff       	call   106970 <walkpgdir>
  106a43:	85 c0                	test   %eax,%eax
  106a45:	75 d1                	jne    106a18 <mappages+0x28>
  106a47:	83 c4 2c             	add    $0x2c,%esp
  106a4a:	31 c0                	xor    %eax,%eax
  106a4c:	5b                   	pop    %ebx
  106a4d:	5e                   	pop    %esi
  106a4e:	5f                   	pop    %edi
  106a4f:	5d                   	pop    %ebp
  106a50:	c3                   	ret    
  106a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106a58:	83 c4 2c             	add    $0x2c,%esp
  106a5b:	b8 01 00 00 00       	mov    $0x1,%eax
  106a60:	5b                   	pop    %ebx
  106a61:	5e                   	pop    %esi
  106a62:	5f                   	pop    %edi
  106a63:	5d                   	pop    %ebp
  106a64:	c3                   	ret    
  106a65:	c7 04 24 f4 79 10 00 	movl   $0x1079f4,(%esp)
  106a6c:	e8 df a0 ff ff       	call   100b50 <panic>
  106a71:	eb 0d                	jmp    106a80 <uva2ka>
  106a73:	90                   	nop
  106a74:	90                   	nop
  106a75:	90                   	nop
  106a76:	90                   	nop
  106a77:	90                   	nop
  106a78:	90                   	nop
  106a79:	90                   	nop
  106a7a:	90                   	nop
  106a7b:	90                   	nop
  106a7c:	90                   	nop
  106a7d:	90                   	nop
  106a7e:	90                   	nop
  106a7f:	90                   	nop

00106a80 <uva2ka>:
  106a80:	55                   	push   %ebp
  106a81:	31 c9                	xor    %ecx,%ecx
  106a83:	89 e5                	mov    %esp,%ebp
  106a85:	83 ec 08             	sub    $0x8,%esp
  106a88:	8b 55 0c             	mov    0xc(%ebp),%edx
  106a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  106a8e:	e8 dd fe ff ff       	call   106970 <walkpgdir>
  106a93:	89 c2                	mov    %eax,%edx
  106a95:	31 c0                	xor    %eax,%eax
  106a97:	85 d2                	test   %edx,%edx
  106a99:	74 07                	je     106aa2 <uva2ka+0x22>
  106a9b:	8b 02                	mov    (%edx),%eax
  106a9d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  106aa2:	c9                   	leave  
  106aa3:	c3                   	ret    
  106aa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106aaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00106ab0 <inituvm>:
  106ab0:	55                   	push   %ebp
  106ab1:	89 e5                	mov    %esp,%ebp
  106ab3:	83 ec 38             	sub    $0x38,%esp
  106ab6:	8b 45 08             	mov    0x8(%ebp),%eax
  106ab9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  106abc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  106abf:	8b 75 10             	mov    0x10(%ebp),%esi
  106ac2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  106ac5:	8b 7d 0c             	mov    0xc(%ebp),%edi
  106ac8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106acb:	e8 20 ba ff ff       	call   1024f0 <kalloc>
  106ad0:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
  106ad6:	89 c3                	mov    %eax,%ebx
  106ad8:	77 4c                	ja     106b26 <inituvm+0x76>
  106ada:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106ae1:	00 
  106ae2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106ae9:	00 
  106aea:	89 04 24             	mov    %eax,(%esp)
  106aed:	e8 fe db ff ff       	call   1046f0 <memset>
  106af2:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106af7:	31 d2                	xor    %edx,%edx
  106af9:	89 1c 24             	mov    %ebx,(%esp)
  106afc:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106b03:	00 
  106b04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106b07:	e8 e4 fe ff ff       	call   1069f0 <mappages>
  106b0c:	89 75 10             	mov    %esi,0x10(%ebp)
  106b0f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  106b12:	89 7d 0c             	mov    %edi,0xc(%ebp)
  106b15:	8b 7d fc             	mov    -0x4(%ebp),%edi
  106b18:	89 5d 08             	mov    %ebx,0x8(%ebp)
  106b1b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  106b1e:	89 ec                	mov    %ebp,%esp
  106b20:	5d                   	pop    %ebp
  106b21:	e9 4a dc ff ff       	jmp    104770 <memmove>
  106b26:	c7 04 24 fa 79 10 00 	movl   $0x1079fa,(%esp)
  106b2d:	e8 1e a0 ff ff       	call   100b50 <panic>
  106b32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106b40 <setupkvm>:
  106b40:	55                   	push   %ebp
  106b41:	89 e5                	mov    %esp,%ebp
  106b43:	53                   	push   %ebx
  106b44:	83 ec 14             	sub    $0x14,%esp
  106b47:	e8 a4 b9 ff ff       	call   1024f0 <kalloc>
  106b4c:	85 c0                	test   %eax,%eax
  106b4e:	89 c3                	mov    %eax,%ebx
  106b50:	75 0e                	jne    106b60 <setupkvm+0x20>
  106b52:	89 d8                	mov    %ebx,%eax
  106b54:	83 c4 14             	add    $0x14,%esp
  106b57:	5b                   	pop    %ebx
  106b58:	5d                   	pop    %ebp
  106b59:	c3                   	ret    
  106b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106b60:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106b67:	00 
  106b68:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106b6f:	00 
  106b70:	89 04 24             	mov    %eax,(%esp)
  106b73:	e8 78 db ff ff       	call   1046f0 <memset>
  106b78:	b9 00 00 06 00       	mov    $0x60000,%ecx
  106b7d:	ba 00 00 0a 00       	mov    $0xa0000,%edx
  106b82:	89 d8                	mov    %ebx,%eax
  106b84:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106b8b:	00 
  106b8c:	c7 04 24 00 00 0a 00 	movl   $0xa0000,(%esp)
  106b93:	e8 58 fe ff ff       	call   1069f0 <mappages>
  106b98:	85 c0                	test   %eax,%eax
  106b9a:	75 0a                	jne    106ba6 <setupkvm+0x66>
  106b9c:	31 db                	xor    %ebx,%ebx
  106b9e:	83 c4 14             	add    $0x14,%esp
  106ba1:	89 d8                	mov    %ebx,%eax
  106ba3:	5b                   	pop    %ebx
  106ba4:	5d                   	pop    %ebp
  106ba5:	c3                   	ret    
  106ba6:	b9 00 00 f0 00       	mov    $0xf00000,%ecx
  106bab:	ba 00 00 10 00       	mov    $0x100000,%edx
  106bb0:	89 d8                	mov    %ebx,%eax
  106bb2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106bb9:	00 
  106bba:	c7 04 24 00 00 10 00 	movl   $0x100000,(%esp)
  106bc1:	e8 2a fe ff ff       	call   1069f0 <mappages>
  106bc6:	85 c0                	test   %eax,%eax
  106bc8:	74 d2                	je     106b9c <setupkvm+0x5c>
  106bca:	b9 00 00 00 02       	mov    $0x2000000,%ecx
  106bcf:	ba 00 00 00 fe       	mov    $0xfe000000,%edx
  106bd4:	89 d8                	mov    %ebx,%eax
  106bd6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106bdd:	00 
  106bde:	c7 04 24 00 00 00 fe 	movl   $0xfe000000,(%esp)
  106be5:	e8 06 fe ff ff       	call   1069f0 <mappages>
  106bea:	85 c0                	test   %eax,%eax
  106bec:	0f 85 60 ff ff ff    	jne    106b52 <setupkvm+0x12>
  106bf2:	eb a8                	jmp    106b9c <setupkvm+0x5c>
  106bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00106c00 <kvmalloc>:
  106c00:	55                   	push   %ebp
  106c01:	89 e5                	mov    %esp,%ebp
  106c03:	83 ec 08             	sub    $0x8,%esp
  106c06:	e8 35 ff ff ff       	call   106b40 <setupkvm>
  106c0b:	a3 30 93 10 00       	mov    %eax,0x109330
  106c10:	c9                   	leave  
  106c11:	c3                   	ret    
  106c12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106c20 <deallocuvm>:
  106c20:	55                   	push   %ebp
  106c21:	89 e5                	mov    %esp,%ebp
  106c23:	57                   	push   %edi
  106c24:	56                   	push   %esi
  106c25:	53                   	push   %ebx
  106c26:	83 ec 2c             	sub    $0x2c,%esp
  106c29:	8b 5d 10             	mov    0x10(%ebp),%ebx
  106c2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  106c2f:	8b 7d 08             	mov    0x8(%ebp),%edi
  106c32:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
  106c38:	83 ee 01             	sub    $0x1,%esi
  106c3b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  106c41:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  106c47:	39 f3                	cmp    %esi,%ebx
  106c49:	77 41                	ja     106c8c <deallocuvm+0x6c>
  106c4b:	90                   	nop
  106c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106c50:	31 c9                	xor    %ecx,%ecx
  106c52:	89 da                	mov    %ebx,%edx
  106c54:	89 f8                	mov    %edi,%eax
  106c56:	e8 15 fd ff ff       	call   106970 <walkpgdir>
  106c5b:	85 c0                	test   %eax,%eax
  106c5d:	74 23                	je     106c82 <deallocuvm+0x62>
  106c5f:	8b 10                	mov    (%eax),%edx
  106c61:	f6 c2 01             	test   $0x1,%dl
  106c64:	74 1c                	je     106c82 <deallocuvm+0x62>
  106c66:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  106c6c:	74 3d                	je     106cab <deallocuvm+0x8b>
  106c6e:	89 14 24             	mov    %edx,(%esp)
  106c71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106c74:	e8 b7 b8 ff ff       	call   102530 <kfree>
  106c79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106c7c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  106c82:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106c88:	39 de                	cmp    %ebx,%esi
  106c8a:	73 c4                	jae    106c50 <deallocuvm+0x30>
  106c8c:	8b 45 10             	mov    0x10(%ebp),%eax
  106c8f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  106c92:	77 0c                	ja     106ca0 <deallocuvm+0x80>
  106c94:	83 c4 2c             	add    $0x2c,%esp
  106c97:	5b                   	pop    %ebx
  106c98:	5e                   	pop    %esi
  106c99:	5f                   	pop    %edi
  106c9a:	5d                   	pop    %ebp
  106c9b:	c3                   	ret    
  106c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
  106ca3:	83 c4 2c             	add    $0x2c,%esp
  106ca6:	5b                   	pop    %ebx
  106ca7:	5e                   	pop    %esi
  106ca8:	5f                   	pop    %edi
  106ca9:	5d                   	pop    %ebp
  106caa:	c3                   	ret    
  106cab:	c7 04 24 6e 73 10 00 	movl   $0x10736e,(%esp)
  106cb2:	e8 99 9e ff ff       	call   100b50 <panic>
  106cb7:	89 f6                	mov    %esi,%esi
  106cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106cc0 <freevm>:
  106cc0:	55                   	push   %ebp
  106cc1:	89 e5                	mov    %esp,%ebp
  106cc3:	56                   	push   %esi
  106cc4:	53                   	push   %ebx
  106cc5:	83 ec 10             	sub    $0x10,%esp
  106cc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  106ccb:	85 db                	test   %ebx,%ebx
  106ccd:	74 59                	je     106d28 <freevm+0x68>
  106ccf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  106cd6:	00 
  106cd7:	31 f6                	xor    %esi,%esi
  106cd9:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
  106ce0:	00 
  106ce1:	89 1c 24             	mov    %ebx,(%esp)
  106ce4:	e8 37 ff ff ff       	call   106c20 <deallocuvm>
  106ce9:	eb 10                	jmp    106cfb <freevm+0x3b>
  106ceb:	90                   	nop
  106cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106cf0:	83 c6 01             	add    $0x1,%esi
  106cf3:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  106cf9:	74 1f                	je     106d1a <freevm+0x5a>
  106cfb:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
  106cfe:	a8 01                	test   $0x1,%al
  106d00:	74 ee                	je     106cf0 <freevm+0x30>
  106d02:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  106d07:	83 c6 01             	add    $0x1,%esi
  106d0a:	89 04 24             	mov    %eax,(%esp)
  106d0d:	e8 1e b8 ff ff       	call   102530 <kfree>
  106d12:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  106d18:	75 e1                	jne    106cfb <freevm+0x3b>
  106d1a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  106d1d:	83 c4 10             	add    $0x10,%esp
  106d20:	5b                   	pop    %ebx
  106d21:	5e                   	pop    %esi
  106d22:	5d                   	pop    %ebp
  106d23:	e9 08 b8 ff ff       	jmp    102530 <kfree>
  106d28:	c7 04 24 14 7a 10 00 	movl   $0x107a14,(%esp)
  106d2f:	e8 1c 9e ff ff       	call   100b50 <panic>
  106d34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106d3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00106d40 <copyuvm>:
  106d40:	55                   	push   %ebp
  106d41:	89 e5                	mov    %esp,%ebp
  106d43:	57                   	push   %edi
  106d44:	56                   	push   %esi
  106d45:	53                   	push   %ebx
  106d46:	83 ec 2c             	sub    $0x2c,%esp
  106d49:	e8 f2 fd ff ff       	call   106b40 <setupkvm>
  106d4e:	85 c0                	test   %eax,%eax
  106d50:	89 c6                	mov    %eax,%esi
  106d52:	0f 84 84 00 00 00    	je     106ddc <copyuvm+0x9c>
  106d58:	8b 45 0c             	mov    0xc(%ebp),%eax
  106d5b:	85 c0                	test   %eax,%eax
  106d5d:	74 7d                	je     106ddc <copyuvm+0x9c>
  106d5f:	31 db                	xor    %ebx,%ebx
  106d61:	eb 47                	jmp    106daa <copyuvm+0x6a>
  106d63:	90                   	nop
  106d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106d68:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  106d6e:	89 54 24 04          	mov    %edx,0x4(%esp)
  106d72:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106d79:	00 
  106d7a:	89 04 24             	mov    %eax,(%esp)
  106d7d:	e8 ee d9 ff ff       	call   104770 <memmove>
  106d82:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106d87:	89 da                	mov    %ebx,%edx
  106d89:	89 f0                	mov    %esi,%eax
  106d8b:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106d92:	00 
  106d93:	89 3c 24             	mov    %edi,(%esp)
  106d96:	e8 55 fc ff ff       	call   1069f0 <mappages>
  106d9b:	85 c0                	test   %eax,%eax
  106d9d:	74 33                	je     106dd2 <copyuvm+0x92>
  106d9f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106da5:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
  106da8:	76 32                	jbe    106ddc <copyuvm+0x9c>
  106daa:	8b 45 08             	mov    0x8(%ebp),%eax
  106dad:	31 c9                	xor    %ecx,%ecx
  106daf:	89 da                	mov    %ebx,%edx
  106db1:	e8 ba fb ff ff       	call   106970 <walkpgdir>
  106db6:	85 c0                	test   %eax,%eax
  106db8:	74 2c                	je     106de6 <copyuvm+0xa6>
  106dba:	8b 10                	mov    (%eax),%edx
  106dbc:	f6 c2 01             	test   $0x1,%dl
  106dbf:	74 31                	je     106df2 <copyuvm+0xb2>
  106dc1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  106dc4:	e8 27 b7 ff ff       	call   1024f0 <kalloc>
  106dc9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106dcc:	85 c0                	test   %eax,%eax
  106dce:	89 c7                	mov    %eax,%edi
  106dd0:	75 96                	jne    106d68 <copyuvm+0x28>
  106dd2:	89 34 24             	mov    %esi,(%esp)
  106dd5:	31 f6                	xor    %esi,%esi
  106dd7:	e8 e4 fe ff ff       	call   106cc0 <freevm>
  106ddc:	83 c4 2c             	add    $0x2c,%esp
  106ddf:	89 f0                	mov    %esi,%eax
  106de1:	5b                   	pop    %ebx
  106de2:	5e                   	pop    %esi
  106de3:	5f                   	pop    %edi
  106de4:	5d                   	pop    %ebp
  106de5:	c3                   	ret    
  106de6:	c7 04 24 25 7a 10 00 	movl   $0x107a25,(%esp)
  106ded:	e8 5e 9d ff ff       	call   100b50 <panic>
  106df2:	c7 04 24 40 7a 10 00 	movl   $0x107a40,(%esp)
  106df9:	e8 52 9d ff ff       	call   100b50 <panic>
  106dfe:	66 90                	xchg   %ax,%ax

00106e00 <allocuvm>:
  106e00:	55                   	push   %ebp
  106e01:	31 c0                	xor    %eax,%eax
  106e03:	89 e5                	mov    %esp,%ebp
  106e05:	57                   	push   %edi
  106e06:	56                   	push   %esi
  106e07:	53                   	push   %ebx
  106e08:	83 ec 2c             	sub    $0x2c,%esp
  106e0b:	8b 7d 08             	mov    0x8(%ebp),%edi
  106e0e:	81 7d 10 00 00 0a 00 	cmpl   $0xa0000,0x10(%ebp)
  106e15:	0f 87 93 00 00 00    	ja     106eae <allocuvm+0xae>
  106e1b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  106e1e:	8b 75 10             	mov    0x10(%ebp),%esi
  106e21:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
  106e27:	83 ee 01             	sub    $0x1,%esi
  106e2a:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  106e30:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  106e36:	39 f3                	cmp    %esi,%ebx
  106e38:	76 47                	jbe    106e81 <allocuvm+0x81>
  106e3a:	eb 7c                	jmp    106eb8 <allocuvm+0xb8>
  106e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106e40:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106e47:	00 
  106e48:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106e4f:	00 
  106e50:	89 04 24             	mov    %eax,(%esp)
  106e53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106e56:	e8 95 d8 ff ff       	call   1046f0 <memset>
  106e5b:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106e60:	89 f8                	mov    %edi,%eax
  106e62:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106e69:	00 
  106e6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106e6d:	89 14 24             	mov    %edx,(%esp)
  106e70:	89 da                	mov    %ebx,%edx
  106e72:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106e78:	e8 73 fb ff ff       	call   1069f0 <mappages>
  106e7d:	39 de                	cmp    %ebx,%esi
  106e7f:	72 37                	jb     106eb8 <allocuvm+0xb8>
  106e81:	e8 6a b6 ff ff       	call   1024f0 <kalloc>
  106e86:	85 c0                	test   %eax,%eax
  106e88:	75 b6                	jne    106e40 <allocuvm+0x40>
  106e8a:	c7 04 24 5b 7a 10 00 	movl   $0x107a5b,(%esp)
  106e91:	e8 ca 98 ff ff       	call   100760 <cprintf>
  106e96:	8b 45 0c             	mov    0xc(%ebp),%eax
  106e99:	89 44 24 08          	mov    %eax,0x8(%esp)
  106e9d:	8b 45 10             	mov    0x10(%ebp),%eax
  106ea0:	89 3c 24             	mov    %edi,(%esp)
  106ea3:	89 44 24 04          	mov    %eax,0x4(%esp)
  106ea7:	e8 74 fd ff ff       	call   106c20 <deallocuvm>
  106eac:	31 c0                	xor    %eax,%eax
  106eae:	83 c4 2c             	add    $0x2c,%esp
  106eb1:	5b                   	pop    %ebx
  106eb2:	5e                   	pop    %esi
  106eb3:	5f                   	pop    %edi
  106eb4:	5d                   	pop    %ebp
  106eb5:	c3                   	ret    
  106eb6:	66 90                	xchg   %ax,%ax
  106eb8:	8b 45 10             	mov    0x10(%ebp),%eax
  106ebb:	3b 45 0c             	cmp    0xc(%ebp),%eax
  106ebe:	73 ee                	jae    106eae <allocuvm+0xae>
  106ec0:	8b 45 0c             	mov    0xc(%ebp),%eax
  106ec3:	83 c4 2c             	add    $0x2c,%esp
  106ec6:	5b                   	pop    %ebx
  106ec7:	5e                   	pop    %esi
  106ec8:	5f                   	pop    %edi
  106ec9:	5d                   	pop    %ebp
  106eca:	c3                   	ret    
  106ecb:	90                   	nop
  106ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106ed0 <loaduvm>:
  106ed0:	55                   	push   %ebp
  106ed1:	89 e5                	mov    %esp,%ebp
  106ed3:	57                   	push   %edi
  106ed4:	56                   	push   %esi
  106ed5:	53                   	push   %ebx
  106ed6:	83 ec 3c             	sub    $0x3c,%esp
  106ed9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  106edc:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
  106ee2:	0f 85 99 00 00 00    	jne    106f81 <loaduvm+0xb1>
  106ee8:	8b 75 18             	mov    0x18(%ebp),%esi
  106eeb:	31 db                	xor    %ebx,%ebx
  106eed:	85 f6                	test   %esi,%esi
  106eef:	74 77                	je     106f68 <loaduvm+0x98>
  106ef1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  106ef4:	eb 13                	jmp    106f09 <loaduvm+0x39>
  106ef6:	66 90                	xchg   %ax,%ax
  106ef8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106efe:	81 ee 00 10 00 00    	sub    $0x1000,%esi
  106f04:	39 5d 18             	cmp    %ebx,0x18(%ebp)
  106f07:	76 5f                	jbe    106f68 <loaduvm+0x98>
  106f09:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  106f0c:	31 c9                	xor    %ecx,%ecx
  106f0e:	8b 45 08             	mov    0x8(%ebp),%eax
  106f11:	01 da                	add    %ebx,%edx
  106f13:	e8 58 fa ff ff       	call   106970 <walkpgdir>
  106f18:	85 c0                	test   %eax,%eax
  106f1a:	74 59                	je     106f75 <loaduvm+0xa5>
  106f1c:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
  106f22:	8b 00                	mov    (%eax),%eax
  106f24:	ba 00 10 00 00       	mov    $0x1000,%edx
  106f29:	77 02                	ja     106f2d <loaduvm+0x5d>
  106f2b:	89 f2                	mov    %esi,%edx
  106f2d:	89 54 24 0c          	mov    %edx,0xc(%esp)
  106f31:	8b 7d 14             	mov    0x14(%ebp),%edi
  106f34:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  106f39:	89 44 24 04          	mov    %eax,0x4(%esp)
  106f3d:	8d 0c 3b             	lea    (%ebx,%edi,1),%ecx
  106f40:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  106f44:	8b 45 10             	mov    0x10(%ebp),%eax
  106f47:	89 04 24             	mov    %eax,(%esp)
  106f4a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  106f4d:	e8 9e a6 ff ff       	call   1015f0 <readi>
  106f52:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106f55:	39 d0                	cmp    %edx,%eax
  106f57:	74 9f                	je     106ef8 <loaduvm+0x28>
  106f59:	83 c4 3c             	add    $0x3c,%esp
  106f5c:	31 c0                	xor    %eax,%eax
  106f5e:	5b                   	pop    %ebx
  106f5f:	5e                   	pop    %esi
  106f60:	5f                   	pop    %edi
  106f61:	5d                   	pop    %ebp
  106f62:	c3                   	ret    
  106f63:	90                   	nop
  106f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106f68:	83 c4 3c             	add    $0x3c,%esp
  106f6b:	b8 01 00 00 00       	mov    $0x1,%eax
  106f70:	5b                   	pop    %ebx
  106f71:	5e                   	pop    %esi
  106f72:	5f                   	pop    %edi
  106f73:	5d                   	pop    %ebp
  106f74:	c3                   	ret    
  106f75:	c7 04 24 ac 7a 10 00 	movl   $0x107aac,(%esp)
  106f7c:	e8 cf 9b ff ff       	call   100b50 <panic>
  106f81:	c7 04 24 88 7a 10 00 	movl   $0x107a88,(%esp)
  106f88:	e8 c3 9b ff ff       	call   100b50 <panic>
  106f8d:	8d 76 00             	lea    0x0(%esi),%esi

00106f90 <switchuvm>:
  106f90:	55                   	push   %ebp
  106f91:	89 e5                	mov    %esp,%ebp
  106f93:	53                   	push   %ebx
  106f94:	83 ec 14             	sub    $0x14,%esp
  106f97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  106f9a:	e8 c1 d5 ff ff       	call   104560 <pushcli>
  106f9f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106fa5:	8d 50 08             	lea    0x8(%eax),%edx
  106fa8:	89 d1                	mov    %edx,%ecx
  106faa:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
  106fb1:	c1 e9 10             	shr    $0x10,%ecx
  106fb4:	c1 ea 18             	shr    $0x18,%edx
  106fb7:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  106fbd:	c6 80 a5 00 00 00 99 	movb   $0x99,0xa5(%eax)
  106fc4:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  106fca:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
  106fd1:	67 00 
  106fd3:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  106fda:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106fe0:	80 a0 a5 00 00 00 ef 	andb   $0xef,0xa5(%eax)
  106fe7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106fed:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  106ff3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106ff9:	8b 50 50             	mov    0x50(%eax),%edx
  106ffc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  107002:	81 c2 00 10 00 00    	add    $0x1000,%edx
  107008:	89 50 0c             	mov    %edx,0xc(%eax)
  10700b:	b8 30 00 00 00       	mov    $0x30,%eax
  107010:	0f 00 d8             	ltr    %ax
  107013:	8b 43 04             	mov    0x4(%ebx),%eax
  107016:	85 c0                	test   %eax,%eax
  107018:	74 0d                	je     107027 <switchuvm+0x97>
  10701a:	0f 22 d8             	mov    %eax,%cr3
  10701d:	83 c4 14             	add    $0x14,%esp
  107020:	5b                   	pop    %ebx
  107021:	5d                   	pop    %ebp
  107022:	e9 79 d5 ff ff       	jmp    1045a0 <popcli>
  107027:	c7 04 24 73 7a 10 00 	movl   $0x107a73,(%esp)
  10702e:	e8 1d 9b ff ff       	call   100b50 <panic>
  107033:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  107039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00107040 <ksegment>:
  107040:	55                   	push   %ebp
  107041:	89 e5                	mov    %esp,%ebp
  107043:	83 ec 18             	sub    $0x18,%esp
  107046:	e8 85 b7 ff ff       	call   1027d0 <cpunum>
  10704b:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  107051:	05 c0 3a 11 00       	add    $0x113ac0,%eax
  107056:	8d 90 b4 00 00 00    	lea    0xb4(%eax),%edx
  10705c:	66 89 90 8a 00 00 00 	mov    %dx,0x8a(%eax)
  107063:	89 d1                	mov    %edx,%ecx
  107065:	c1 ea 18             	shr    $0x18,%edx
  107068:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)
  10706e:	c1 e9 10             	shr    $0x10,%ecx
  107071:	8d 50 70             	lea    0x70(%eax),%edx
  107074:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
  10707a:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
  107080:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
  107084:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
  107088:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  10708c:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  107090:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
  107097:	ff ff 
  107099:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
  1070a0:	00 00 
  1070a2:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
  1070a9:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
  1070b0:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  1070b7:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  1070be:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
  1070c5:	ff ff 
  1070c7:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
  1070ce:	00 00 
  1070d0:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
  1070d7:	c6 80 95 00 00 00 fa 	movb   $0xfa,0x95(%eax)
  1070de:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  1070e5:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  1070ec:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
  1070f3:	ff ff 
  1070f5:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
  1070fc:	00 00 
  1070fe:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
  107105:	c6 80 9d 00 00 00 f2 	movb   $0xf2,0x9d(%eax)
  10710c:	c6 80 9e 00 00 00 cf 	movb   $0xcf,0x9e(%eax)
  107113:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)
  10711a:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
  107121:	00 00 
  107123:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
  107129:	c6 80 8d 00 00 00 92 	movb   $0x92,0x8d(%eax)
  107130:	c6 80 8e 00 00 00 c0 	movb   $0xc0,0x8e(%eax)
  107137:	66 c7 45 f2 37 00    	movw   $0x37,-0xe(%ebp)
  10713d:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  107141:	c1 ea 10             	shr    $0x10,%edx
  107144:	66 89 55 f6          	mov    %dx,-0xa(%ebp)
  107148:	8d 55 f2             	lea    -0xe(%ebp),%edx
  10714b:	0f 01 12             	lgdtl  (%edx)
  10714e:	ba 18 00 00 00       	mov    $0x18,%edx
  107153:	8e ea                	mov    %edx,%gs
  107155:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  10715b:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
  107162:	00 00 00 00 
  107166:	c9                   	leave  
  107167:	c3                   	ret    
