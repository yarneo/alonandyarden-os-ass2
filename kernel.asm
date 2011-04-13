
kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <binary_sem_clear>:
		release(&bstbl.bsem[binary_sem_id].lock);
	}
	return 0;
}

int binary_sem_clear(int binary_sem_id) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	8b 5d 08             	mov    0x8(%ebp),%ebx
	acquire(&bstbl.lock);
  10000a:	c7 04 24 80 92 10 00 	movl   $0x109280,(%esp)
  100011:	e8 7a 45 00 00       	call   104590 <acquire>

	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0)) {//invalid id
  100016:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10001b:	83 fb 63             	cmp    $0x63,%ebx
  10001e:	77 12                	ja     100032 <binary_sem_clear+0x32>
		return -1;
	}
	if(bstbl.bsem[binary_sem_id].used == 0) {//nothing to clear
  100020:	69 db d4 01 00 00    	imul   $0x1d4,%ebx,%ebx
  100026:	31 c0                	xor    %eax,%eax
  100028:	8b 93 ec 92 10 00    	mov    0x1092ec(%ebx),%edx
  10002e:	85 d2                	test   %edx,%edx
  100030:	75 06                	jne    100038 <binary_sem_clear+0x38>
		return 0;
	}
	bstbl.bsem[binary_sem_id].used = 0;
	release(&bstbl.lock);
	return 0;
}
  100032:	83 c4 14             	add    $0x14,%esp
  100035:	5b                   	pop    %ebx
  100036:	5d                   	pop    %ebp
  100037:	c3                   	ret    
		return -1;
	}
	if(bstbl.bsem[binary_sem_id].used == 0) {//nothing to clear
		return 0;
	}
	bstbl.bsem[binary_sem_id].used = 0;
  100038:	c7 83 ec 92 10 00 00 	movl   $0x0,0x1092ec(%ebx)
  10003f:	00 00 00 
	release(&bstbl.lock);
  100042:	c7 04 24 80 92 10 00 	movl   $0x109280,(%esp)
  100049:	e8 f2 44 00 00       	call   104540 <release>
	return 0;
}
  10004e:	83 c4 14             	add    $0x14,%esp
	}
	if(bstbl.bsem[binary_sem_id].used == 0) {//nothing to clear
		return 0;
	}
	bstbl.bsem[binary_sem_id].used = 0;
	release(&bstbl.lock);
  100051:	31 c0                	xor    %eax,%eax
	return 0;
}
  100053:	5b                   	pop    %ebx
  100054:	5d                   	pop    %ebp
  100055:	c3                   	ret    
  100056:	8d 76 00             	lea    0x0(%esi),%esi
  100059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100060 <binary_sem_create>:
	struct spinlock lock;
	struct binsemaphore bsem[BSEMCOUNT];
} bstbl;


int binary_sem_create() {
  100060:	55                   	push   %ebp
  100061:	89 e5                	mov    %esp,%ebp
  100063:	53                   	push   %ebx
	int i;
	acquire(&bstbl.lock);
  100064:	31 db                	xor    %ebx,%ebx
	struct spinlock lock;
	struct binsemaphore bsem[BSEMCOUNT];
} bstbl;


int binary_sem_create() {
  100066:	83 ec 14             	sub    $0x14,%esp
	int i;
	acquire(&bstbl.lock);
  100069:	c7 04 24 80 92 10 00 	movl   $0x109280,(%esp)
  100070:	e8 1b 45 00 00       	call   104590 <acquire>
  100075:	b8 ec 92 10 00       	mov    $0x1092ec,%eax
  10007a:	eb 11                	jmp    10008d <binary_sem_create+0x2d>
  10007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (i = 0; i < BSEMCOUNT; i++) {
  100080:	83 c3 01             	add    $0x1,%ebx
  100083:	05 d4 01 00 00       	add    $0x1d4,%eax
  100088:	83 fb 64             	cmp    $0x64,%ebx
  10008b:	74 68                	je     1000f5 <binary_sem_create+0x95>
		if(bstbl.bsem[i].used == 0) {
  10008d:	8b 08                	mov    (%eax),%ecx
  10008f:	85 c9                	test   %ecx,%ecx
  100091:	75 ed                	jne    100080 <binary_sem_create+0x20>
			int j;
			bstbl.bsem[i].value = 1;
  100093:	69 cb d4 01 00 00    	imul   $0x1d4,%ebx,%ecx
			bstbl.bsem[i].used = 1;
			bstbl.bsem[i].insert = 0;
			bstbl.bsem[i].remove = 0;
  100099:	31 d2                	xor    %edx,%edx
	int i;
	acquire(&bstbl.lock);
	for (i = 0; i < BSEMCOUNT; i++) {
		if(bstbl.bsem[i].used == 0) {
			int j;
			bstbl.bsem[i].value = 1;
  10009b:	c7 81 b4 92 10 00 01 	movl   $0x1,0x1092b4(%ecx)
  1000a2:	00 00 00 
			bstbl.bsem[i].used = 1;
  1000a5:	c7 81 ec 92 10 00 01 	movl   $0x1,0x1092ec(%ecx)
  1000ac:	00 00 00 
			bstbl.bsem[i].insert = 0;
  1000af:	c7 81 84 94 10 00 00 	movl   $0x0,0x109484(%ecx)
  1000b6:	00 00 00 
			bstbl.bsem[i].remove = 0;
  1000b9:	c7 81 80 94 10 00 00 	movl   $0x0,0x109480(%ecx)
  1000c0:	00 00 00 
  1000c3:	81 c1 f0 92 10 00    	add    $0x1092f0,%ecx
  1000c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			for(j=0;j<BQUEUESEMCOUNT;j++) {
  1000d0:	83 c2 01             	add    $0x1,%edx
				bstbl.bsem[i].queue[j] = 0;
  1000d3:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
			int j;
			bstbl.bsem[i].value = 1;
			bstbl.bsem[i].used = 1;
			bstbl.bsem[i].insert = 0;
			bstbl.bsem[i].remove = 0;
			for(j=0;j<BQUEUESEMCOUNT;j++) {
  1000d9:	83 c1 04             	add    $0x4,%ecx
  1000dc:	83 fa 64             	cmp    $0x64,%edx
  1000df:	75 ef                	jne    1000d0 <binary_sem_create+0x70>
				bstbl.bsem[i].queue[j] = 0;
			}
			release(&bstbl.lock);
  1000e1:	c7 04 24 80 92 10 00 	movl   $0x109280,(%esp)
  1000e8:	e8 53 44 00 00       	call   104540 <release>
		}
	}

	release(&bstbl.lock);
	return -1;
}
  1000ed:	89 d8                	mov    %ebx,%eax
  1000ef:	83 c4 14             	add    $0x14,%esp
  1000f2:	5b                   	pop    %ebx
  1000f3:	5d                   	pop    %ebp
  1000f4:	c3                   	ret    
			//cprintf("returning %d",i);
			return i;
		}
	}

	release(&bstbl.lock);
  1000f5:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  1000fa:	c7 04 24 80 92 10 00 	movl   $0x109280,(%esp)
  100101:	e8 3a 44 00 00       	call   104540 <release>
	return -1;
}
  100106:	89 d8                	mov    %ebx,%eax
  100108:	83 c4 14             	add    $0x14,%esp
  10010b:	5b                   	pop    %ebx
  10010c:	5d                   	pop    %ebp
  10010d:	c3                   	ret    
  10010e:	66 90                	xchg   %ax,%ax

00100110 <binary_sem_up>:
	}
	release(&bstbl.bsem[binary_sem_id].lock); // release queue mutex
	return 0;
}

int binary_sem_up(int binary_sem_id) {
  100110:	55                   	push   %ebp
  100111:	89 e5                	mov    %esp,%ebp
  100113:	83 ec 28             	sub    $0x28,%esp
  100116:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  100119:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10011c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10011f:	89 7d fc             	mov    %edi,-0x4(%ebp)
	int remove;
	struct proc* p;

	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
  100122:	83 fb 63             	cmp    $0x63,%ebx
  100125:	76 19                	jbe    100140 <binary_sem_up+0x30>
		wakeup(p);
		release(&bstbl.bsem[binary_sem_id].lock);

	} else {
		bstbl.bsem[binary_sem_id].value = 1;
		release(&bstbl.bsem[binary_sem_id].lock);
  100127:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
	}
	return 0;
}
  10012c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10012f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  100132:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100135:	89 ec                	mov    %ebp,%esp
  100137:	5d                   	pop    %ebp
  100138:	c3                   	ret    
  100139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int binary_sem_up(int binary_sem_id) {
	int remove;
	struct proc* p;

	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
  100140:	69 f3 d4 01 00 00    	imul   $0x1d4,%ebx,%esi
  100146:	8b be ec 92 10 00    	mov    0x1092ec(%esi),%edi
  10014c:	85 ff                	test   %edi,%edi
  10014e:	74 d7                	je     100127 <binary_sem_up+0x17>
		return -1;
	}

	acquire(&bstbl.bsem[binary_sem_id].lock);
  100150:	8d be b8 92 10 00    	lea    0x1092b8(%esi),%edi
	remove = bstbl.bsem[binary_sem_id].remove;
	p = bstbl.bsem[binary_sem_id].queue[remove];
  100156:	6b db 75             	imul   $0x75,%ebx,%ebx
	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
		return -1;
	}

	acquire(&bstbl.bsem[binary_sem_id].lock);
  100159:	89 3c 24             	mov    %edi,(%esp)
  10015c:	e8 2f 44 00 00       	call   104590 <acquire>
	remove = bstbl.bsem[binary_sem_id].remove;
  100161:	8b 96 80 94 10 00    	mov    0x109480(%esi),%edx
	p = bstbl.bsem[binary_sem_id].queue[remove];
  100167:	8d 4c 1a 18          	lea    0x18(%edx,%ebx,1),%ecx
  10016b:	8b 04 8d 90 92 10 00 	mov    0x109290(,%ecx,4),%eax

	if (p != 0) { //there is a process waiting in the queue
  100172:	85 c0                	test   %eax,%eax
  100174:	74 37                	je     1001ad <binary_sem_up+0x9d>
		bstbl.bsem[binary_sem_id].queue[remove] = 0;
		if(remove == (BQUEUESEMCOUNT -1)) {
  100176:	83 fa 63             	cmp    $0x63,%edx
	acquire(&bstbl.bsem[binary_sem_id].lock);
	remove = bstbl.bsem[binary_sem_id].remove;
	p = bstbl.bsem[binary_sem_id].queue[remove];

	if (p != 0) { //there is a process waiting in the queue
		bstbl.bsem[binary_sem_id].queue[remove] = 0;
  100179:	c7 04 8d 90 92 10 00 	movl   $0x0,0x109290(,%ecx,4)
  100180:	00 00 00 00 
		if(remove == (BQUEUESEMCOUNT -1)) {
  100184:	74 1b                	je     1001a1 <binary_sem_up+0x91>
			bstbl.bsem[binary_sem_id].remove=0;
		}
		else {
			bstbl.bsem[binary_sem_id].remove++;
  100186:	83 86 80 94 10 00 01 	addl   $0x1,0x109480(%esi)
		}
		wakeup(p);
  10018d:	89 04 24             	mov    %eax,(%esp)
  100190:	e8 5b 31 00 00       	call   1032f0 <wakeup>
		release(&bstbl.bsem[binary_sem_id].lock);
  100195:	89 3c 24             	mov    %edi,(%esp)
  100198:	e8 a3 43 00 00       	call   104540 <release>
  10019d:	31 c0                	xor    %eax,%eax
  10019f:	eb 8b                	jmp    10012c <binary_sem_up+0x1c>
	p = bstbl.bsem[binary_sem_id].queue[remove];

	if (p != 0) { //there is a process waiting in the queue
		bstbl.bsem[binary_sem_id].queue[remove] = 0;
		if(remove == (BQUEUESEMCOUNT -1)) {
			bstbl.bsem[binary_sem_id].remove=0;
  1001a1:	c7 86 80 94 10 00 00 	movl   $0x0,0x109480(%esi)
  1001a8:	00 00 00 
  1001ab:	eb e0                	jmp    10018d <binary_sem_up+0x7d>
		}
		wakeup(p);
		release(&bstbl.bsem[binary_sem_id].lock);

	} else {
		bstbl.bsem[binary_sem_id].value = 1;
  1001ad:	c7 86 b4 92 10 00 01 	movl   $0x1,0x1092b4(%esi)
  1001b4:	00 00 00 
		release(&bstbl.bsem[binary_sem_id].lock);
  1001b7:	89 3c 24             	mov    %edi,(%esp)
  1001ba:	e8 81 43 00 00       	call   104540 <release>
  1001bf:	31 c0                	xor    %eax,%eax
  1001c1:	e9 66 ff ff ff       	jmp    10012c <binary_sem_up+0x1c>
  1001c6:	8d 76 00             	lea    0x0(%esi),%esi
  1001c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001001d0 <binary_sem_down>:

	release(&bstbl.lock);
	return -1;
}

int binary_sem_down(int binary_sem_id) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 38             	sub    $0x38,%esp
  1001d6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  1001d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1001dc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  1001df:	89 7d fc             	mov    %edi,-0x4(%ebp)
	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
  1001e2:	83 fb 63             	cmp    $0x63,%ebx
  1001e5:	76 19                	jbe    100200 <binary_sem_down+0x30>
			}
		}
		sleep(proc, &bstbl.bsem[binary_sem_id].lock);
	}
	release(&bstbl.bsem[binary_sem_id].lock); // release queue mutex
	return 0;
  1001e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1001ec:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1001ef:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1001f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1001f5:	89 ec                	mov    %ebp,%esp
  1001f7:	5d                   	pop    %ebp
  1001f8:	c3                   	ret    
  1001f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	return -1;
}

int binary_sem_down(int binary_sem_id) {
	//if the semaphore isnt being used or isnt a valid id
	if((binary_sem_id >= BSEMCOUNT) || (binary_sem_id < 0) || (bstbl.bsem[binary_sem_id].used == 0)) {
  100200:	69 f3 d4 01 00 00    	imul   $0x1d4,%ebx,%esi
  100206:	8b 96 ec 92 10 00    	mov    0x1092ec(%esi),%edx
  10020c:	85 d2                	test   %edx,%edx
  10020e:	74 d7                	je     1001e7 <binary_sem_down+0x17>
		return -1;
	}
	//aquire the lock on the semaphore
	acquire(&bstbl.bsem[binary_sem_id].lock);
  100210:	8d be b0 92 10 00    	lea    0x1092b0(%esi),%edi
  100216:	8d 57 08             	lea    0x8(%edi),%edx
  100219:	89 14 24             	mov    %edx,(%esp)
  10021c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10021f:	e8 6c 43 00 00       	call   104590 <acquire>
xchg(volatile uint *addr, uint newval)
{
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  100224:	31 c0                	xor    %eax,%eax
  100226:	f0 87 47 04          	lock xchg %eax,0x4(%edi)
	int insert;
	if (xchg(&bstbl.bsem[binary_sem_id].value, 0) != 1) { //was already 0
  10022a:	83 f8 01             	cmp    $0x1,%eax
  10022d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100230:	74 43                	je     100275 <binary_sem_down+0xa5>
		insert = bstbl.bsem[binary_sem_id].insert;
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
  100232:	6b db 75             	imul   $0x75,%ebx,%ebx
	}
	//aquire the lock on the semaphore
	acquire(&bstbl.bsem[binary_sem_id].lock);
	int insert;
	if (xchg(&bstbl.bsem[binary_sem_id].value, 0) != 1) { //was already 0
		insert = bstbl.bsem[binary_sem_id].insert;
  100235:	8b 8e 84 94 10 00    	mov    0x109484(%esi),%ecx
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
  10023b:	8d 5c 19 18          	lea    0x18(%ecx,%ebx,1),%ebx
  10023f:	8b 04 9d 90 92 10 00 	mov    0x109290(,%ebx,4),%eax
  100246:	85 c0                	test   %eax,%eax
  100248:	75 46                	jne    100290 <binary_sem_down+0xc0>
			panic("semaphore queue is full");
		} else {
			bstbl.bsem[binary_sem_id].queue[insert] = proc;
  10024a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
			if(insert == (BQUEUESEMCOUNT -1)) {
  100250:	83 f9 63             	cmp    $0x63,%ecx
	if (xchg(&bstbl.bsem[binary_sem_id].value, 0) != 1) { //was already 0
		insert = bstbl.bsem[binary_sem_id].insert;
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
			panic("semaphore queue is full");
		} else {
			bstbl.bsem[binary_sem_id].queue[insert] = proc;
  100253:	89 04 9d 90 92 10 00 	mov    %eax,0x109290(,%ebx,4)
			if(insert == (BQUEUESEMCOUNT -1)) {
  10025a:	74 28                	je     100284 <binary_sem_down+0xb4>
				bstbl.bsem[binary_sem_id].insert = 0;
			}
			else {
				bstbl.bsem[binary_sem_id].insert++;
  10025c:	83 86 84 94 10 00 01 	addl   $0x1,0x109484(%esi)
			}
		}
		sleep(proc, &bstbl.bsem[binary_sem_id].lock);
  100263:	89 54 24 04          	mov    %edx,0x4(%esp)
  100267:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10026a:	89 04 24             	mov    %eax,(%esp)
  10026d:	e8 ae 31 00 00       	call   103420 <sleep>
  100272:	8b 55 e4             	mov    -0x1c(%ebp),%edx
	}
	release(&bstbl.bsem[binary_sem_id].lock); // release queue mutex
  100275:	89 14 24             	mov    %edx,(%esp)
  100278:	e8 c3 42 00 00       	call   104540 <release>
  10027d:	31 c0                	xor    %eax,%eax
	return 0;
  10027f:	e9 68 ff ff ff       	jmp    1001ec <binary_sem_down+0x1c>
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
			panic("semaphore queue is full");
		} else {
			bstbl.bsem[binary_sem_id].queue[insert] = proc;
			if(insert == (BQUEUESEMCOUNT -1)) {
				bstbl.bsem[binary_sem_id].insert = 0;
  100284:	c7 86 84 94 10 00 00 	movl   $0x0,0x109484(%esi)
  10028b:	00 00 00 
  10028e:	eb d3                	jmp    100263 <binary_sem_down+0x93>
	acquire(&bstbl.bsem[binary_sem_id].lock);
	int insert;
	if (xchg(&bstbl.bsem[binary_sem_id].value, 0) != 1) { //was already 0
		insert = bstbl.bsem[binary_sem_id].insert;
		if (bstbl.bsem[binary_sem_id].queue[insert] != 0) { // if queue is full
			panic("semaphore queue is full");
  100290:	c7 04 24 c0 70 10 00 	movl   $0x1070c0,(%esp)
  100297:	e8 b4 08 00 00       	call   100b50 <panic>
  10029c:	90                   	nop
  10029d:	90                   	nop
  10029e:	90                   	nop
  10029f:	90                   	nop

001002a0 <brelse>:
}

// Release the buffer b.
void
brelse(struct buf *b)
{
  1002a0:	55                   	push   %ebp
  1002a1:	89 e5                	mov    %esp,%ebp
  1002a3:	53                   	push   %ebx
  1002a4:	83 ec 14             	sub    $0x14,%esp
  1002a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((b->flags & B_BUSY) == 0)
  1002aa:	f6 03 01             	testb  $0x1,(%ebx)
  1002ad:	74 57                	je     100306 <brelse+0x66>
    panic("brelse");

  acquire(&bcache.lock);
  1002af:	c7 04 24 a0 49 11 00 	movl   $0x1149a0,(%esp)
  1002b6:	e8 d5 42 00 00       	call   104590 <acquire>

  b->next->prev = b->prev;
  1002bb:	8b 43 10             	mov    0x10(%ebx),%eax
  1002be:	8b 53 0c             	mov    0xc(%ebx),%edx
  1002c1:	89 50 0c             	mov    %edx,0xc(%eax)
  b->prev->next = b->next;
  1002c4:	8b 43 0c             	mov    0xc(%ebx),%eax
  1002c7:	8b 53 10             	mov    0x10(%ebx),%edx
  1002ca:	89 50 10             	mov    %edx,0x10(%eax)
  b->next = bcache.head.next;
  1002cd:	a1 d4 5e 11 00       	mov    0x115ed4,%eax
  b->prev = &bcache.head;
  1002d2:	c7 43 0c c4 5e 11 00 	movl   $0x115ec4,0xc(%ebx)

  acquire(&bcache.lock);

  b->next->prev = b->prev;
  b->prev->next = b->next;
  b->next = bcache.head.next;
  1002d9:	89 43 10             	mov    %eax,0x10(%ebx)
  b->prev = &bcache.head;
  bcache.head.next->prev = b;
  1002dc:	a1 d4 5e 11 00       	mov    0x115ed4,%eax
  1002e1:	89 58 0c             	mov    %ebx,0xc(%eax)
  bcache.head.next = b;
  1002e4:	89 1d d4 5e 11 00    	mov    %ebx,0x115ed4

  b->flags &= ~B_BUSY;
  1002ea:	83 23 fe             	andl   $0xfffffffe,(%ebx)
  wakeup(b);
  1002ed:	89 1c 24             	mov    %ebx,(%esp)
  1002f0:	e8 fb 2f 00 00       	call   1032f0 <wakeup>

  release(&bcache.lock);
  1002f5:	c7 45 08 a0 49 11 00 	movl   $0x1149a0,0x8(%ebp)
}
  1002fc:	83 c4 14             	add    $0x14,%esp
  1002ff:	5b                   	pop    %ebx
  100300:	5d                   	pop    %ebp
  bcache.head.next = b;

  b->flags &= ~B_BUSY;
  wakeup(b);

  release(&bcache.lock);
  100301:	e9 3a 42 00 00       	jmp    104540 <release>
// Release the buffer b.
void
brelse(struct buf *b)
{
  if((b->flags & B_BUSY) == 0)
    panic("brelse");
  100306:	c7 04 24 d8 70 10 00 	movl   $0x1070d8,(%esp)
  10030d:	e8 3e 08 00 00       	call   100b50 <panic>
  100312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100320 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  100320:	55                   	push   %ebp
  100321:	89 e5                	mov    %esp,%ebp
  100323:	83 ec 18             	sub    $0x18,%esp
  100326:	8b 45 08             	mov    0x8(%ebp),%eax
  if((b->flags & B_BUSY) == 0)
  100329:	8b 10                	mov    (%eax),%edx
  10032b:	f6 c2 01             	test   $0x1,%dl
  10032e:	74 0e                	je     10033e <bwrite+0x1e>
    panic("bwrite");
  b->flags |= B_DIRTY;
  100330:	83 ca 04             	or     $0x4,%edx
  100333:	89 10                	mov    %edx,(%eax)
  iderw(b);
  100335:	89 45 08             	mov    %eax,0x8(%ebp)
}
  100338:	c9                   	leave  
bwrite(struct buf *b)
{
  if((b->flags & B_BUSY) == 0)
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
  100339:	e9 82 1e 00 00       	jmp    1021c0 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if((b->flags & B_BUSY) == 0)
    panic("bwrite");
  10033e:	c7 04 24 df 70 10 00 	movl   $0x1070df,(%esp)
  100345:	e8 06 08 00 00       	call   100b50 <panic>
  10034a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100350 <bread>:
}

// Return a B_BUSY buf with the contents of the indicated disk sector.
struct buf*
bread(uint dev, uint sector)
{
  100350:	55                   	push   %ebp
  100351:	89 e5                	mov    %esp,%ebp
  100353:	57                   	push   %edi
  100354:	56                   	push   %esi
  100355:	53                   	push   %ebx
  100356:	83 ec 1c             	sub    $0x1c,%esp
  100359:	8b 75 08             	mov    0x8(%ebp),%esi
  10035c:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint sector)
{
  struct buf *b;

  acquire(&bcache.lock);
  10035f:	c7 04 24 a0 49 11 00 	movl   $0x1149a0,(%esp)
  100366:	e8 25 42 00 00       	call   104590 <acquire>

 loop:
  // Try for cached block.
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
  10036b:	8b 1d d4 5e 11 00    	mov    0x115ed4,%ebx
  100371:	81 fb c4 5e 11 00    	cmp    $0x115ec4,%ebx
  100377:	75 12                	jne    10038b <bread+0x3b>
  100379:	eb 35                	jmp    1003b0 <bread+0x60>
  10037b:	90                   	nop
  10037c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100380:	8b 5b 10             	mov    0x10(%ebx),%ebx
  100383:	81 fb c4 5e 11 00    	cmp    $0x115ec4,%ebx
  100389:	74 25                	je     1003b0 <bread+0x60>
    if(b->dev == dev && b->sector == sector){
  10038b:	3b 73 04             	cmp    0x4(%ebx),%esi
  10038e:	66 90                	xchg   %ax,%ax
  100390:	75 ee                	jne    100380 <bread+0x30>
  100392:	3b 7b 08             	cmp    0x8(%ebx),%edi
  100395:	75 e9                	jne    100380 <bread+0x30>
      if(!(b->flags & B_BUSY)){
  100397:	8b 03                	mov    (%ebx),%eax
  100399:	a8 01                	test   $0x1,%al
  10039b:	74 64                	je     100401 <bread+0xb1>
        b->flags |= B_BUSY;
        release(&bcache.lock);
        return b;
      }
      sleep(b, &bcache.lock);
  10039d:	c7 44 24 04 a0 49 11 	movl   $0x1149a0,0x4(%esp)
  1003a4:	00 
  1003a5:	89 1c 24             	mov    %ebx,(%esp)
  1003a8:	e8 73 30 00 00       	call   103420 <sleep>
  1003ad:	eb bc                	jmp    10036b <bread+0x1b>
  1003af:	90                   	nop
      goto loop;
    }
  }

  // Allocate fresh block.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
  1003b0:	8b 1d d0 5e 11 00    	mov    0x115ed0,%ebx
  1003b6:	81 fb c4 5e 11 00    	cmp    $0x115ec4,%ebx
  1003bc:	75 0d                	jne    1003cb <bread+0x7b>
  1003be:	eb 54                	jmp    100414 <bread+0xc4>
  1003c0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
  1003c3:	81 fb c4 5e 11 00    	cmp    $0x115ec4,%ebx
  1003c9:	74 49                	je     100414 <bread+0xc4>
    if((b->flags & B_BUSY) == 0){
  1003cb:	f6 03 01             	testb  $0x1,(%ebx)
  1003ce:	66 90                	xchg   %ax,%ax
  1003d0:	75 ee                	jne    1003c0 <bread+0x70>
      b->dev = dev;
  1003d2:	89 73 04             	mov    %esi,0x4(%ebx)
      b->sector = sector;
  1003d5:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = B_BUSY;
  1003d8:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
      release(&bcache.lock);
  1003de:	c7 04 24 a0 49 11 00 	movl   $0x1149a0,(%esp)
  1003e5:	e8 56 41 00 00       	call   104540 <release>
bread(uint dev, uint sector)
{
  struct buf *b;

  b = bget(dev, sector);
  if(!(b->flags & B_VALID))
  1003ea:	f6 03 02             	testb  $0x2,(%ebx)
  1003ed:	75 08                	jne    1003f7 <bread+0xa7>
    iderw(b);
  1003ef:	89 1c 24             	mov    %ebx,(%esp)
  1003f2:	e8 c9 1d 00 00       	call   1021c0 <iderw>
  return b;
}
  1003f7:	83 c4 1c             	add    $0x1c,%esp
  1003fa:	89 d8                	mov    %ebx,%eax
  1003fc:	5b                   	pop    %ebx
  1003fd:	5e                   	pop    %esi
  1003fe:	5f                   	pop    %edi
  1003ff:	5d                   	pop    %ebp
  100400:	c3                   	ret    
 loop:
  // Try for cached block.
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    if(b->dev == dev && b->sector == sector){
      if(!(b->flags & B_BUSY)){
        b->flags |= B_BUSY;
  100401:	83 c8 01             	or     $0x1,%eax
  100404:	89 03                	mov    %eax,(%ebx)
        release(&bcache.lock);
  100406:	c7 04 24 a0 49 11 00 	movl   $0x1149a0,(%esp)
  10040d:	e8 2e 41 00 00       	call   104540 <release>
  100412:	eb d6                	jmp    1003ea <bread+0x9a>
      b->flags = B_BUSY;
      release(&bcache.lock);
      return b;
    }
  }
  panic("bget: no buffers");
  100414:	c7 04 24 e6 70 10 00 	movl   $0x1070e6,(%esp)
  10041b:	e8 30 07 00 00       	call   100b50 <panic>

00100420 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
  100420:	55                   	push   %ebp
  100421:	89 e5                	mov    %esp,%ebp
  100423:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
  100426:	c7 44 24 04 f7 70 10 	movl   $0x1070f7,0x4(%esp)
  10042d:	00 
  10042e:	c7 04 24 a0 49 11 00 	movl   $0x1149a0,(%esp)
  100435:	e8 c6 3f 00 00       	call   104400 <initlock>
  // head.next is most recently used.
  struct buf head;
} bcache;

void
binit(void)
  10043a:	ba c4 5e 11 00       	mov    $0x115ec4,%edx
  10043f:	b8 d4 49 11 00       	mov    $0x1149d4,%eax
  struct buf *b;

  initlock(&bcache.lock, "bcache");

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  100444:	c7 05 d0 5e 11 00 c4 	movl   $0x115ec4,0x115ed0
  10044b:	5e 11 00 
  bcache.head.next = &bcache.head;
  10044e:	c7 05 d4 5e 11 00 c4 	movl   $0x115ec4,0x115ed4
  100455:	5e 11 00 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
  100458:	89 50 10             	mov    %edx,0x10(%eax)
    b->prev = &bcache.head;
  10045b:	c7 40 0c c4 5e 11 00 	movl   $0x115ec4,0xc(%eax)
    b->dev = -1;
  100462:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    bcache.head.next->prev = b;
  100469:	8b 15 d4 5e 11 00    	mov    0x115ed4,%edx
  10046f:	89 42 0c             	mov    %eax,0xc(%edx)
  initlock(&bcache.lock, "bcache");

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  100472:	89 c2                	mov    %eax,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    b->dev = -1;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  100474:	a3 d4 5e 11 00       	mov    %eax,0x115ed4
  initlock(&bcache.lock, "bcache");

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
  100479:	05 18 02 00 00       	add    $0x218,%eax
  10047e:	3d c4 5e 11 00       	cmp    $0x115ec4,%eax
  100483:	75 d3                	jne    100458 <binit+0x38>
    b->prev = &bcache.head;
    b->dev = -1;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
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
  return n;
}

void
consoleinit(void)
{
  100490:	55                   	push   %ebp
  100491:	89 e5                	mov    %esp,%ebp
  100493:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
  100496:	c7 44 24 04 fe 70 10 	movl   $0x1070fe,0x4(%esp)
  10049d:	00 
  10049e:	c7 04 24 e0 91 10 00 	movl   $0x1091e0,(%esp)
  1004a5:	e8 56 3f 00 00       	call   104400 <initlock>
  initlock(&input.lock, "input");
  1004aa:	c7 44 24 04 06 71 10 	movl   $0x107106,0x4(%esp)
  1004b1:	00 
  1004b2:	c7 04 24 e0 60 11 00 	movl   $0x1160e0,(%esp)
  1004b9:	e8 42 3f 00 00       	call   104400 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
  1004be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
consoleinit(void)
{
  initlock(&cons.lock, "console");
  initlock(&input.lock, "input");

  devsw[CONSOLE].write = consolewrite;
  1004c5:	c7 05 4c 6b 11 00 70 	movl   $0x100670,0x116b4c
  1004cc:	06 10 00 
  devsw[CONSOLE].read = consoleread;
  1004cf:	c7 05 48 6b 11 00 c0 	movl   $0x1008c0,0x116b48
  1004d6:	08 10 00 
  cons.locking = 1;
  1004d9:	c7 05 14 92 10 00 01 	movl   $0x1,0x109214
  1004e0:	00 00 00 

  picenable(IRQ_KBD);
  1004e3:	e8 38 29 00 00       	call   102e20 <picenable>
  ioapicenable(IRQ_KBD, 0);
  1004e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1004ef:	00 
  1004f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1004f7:	e8 e4 1e 00 00       	call   1023e0 <ioapicenable>
}
  1004fc:	c9                   	leave  
  1004fd:	c3                   	ret    
  1004fe:	66 90                	xchg   %ax,%ax

00100500 <consputc>:
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
  100500:	55                   	push   %ebp
  100501:	89 e5                	mov    %esp,%ebp
  100503:	57                   	push   %edi
  100504:	56                   	push   %esi
  100505:	89 c6                	mov    %eax,%esi
  100507:	53                   	push   %ebx
  100508:	83 ec 1c             	sub    $0x1c,%esp
  if(panicked){
  10050b:	83 3d c0 91 10 00 00 	cmpl   $0x0,0x1091c0
  100512:	74 03                	je     100517 <consputc+0x17>
}

static inline void
cli(void)
{
  asm volatile("cli");
  100514:	fa                   	cli    
  100515:	eb fe                	jmp    100515 <consputc+0x15>
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
  100517:	3d 00 01 00 00       	cmp    $0x100,%eax
  10051c:	0f 84 a0 00 00 00    	je     1005c2 <consputc+0xc2>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  100522:	89 04 24             	mov    %eax,(%esp)
  100525:	e8 d6 57 00 00       	call   105d00 <uartputc>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  10052a:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
  10052f:	b8 0e 00 00 00       	mov    $0xe,%eax
  100534:	89 ca                	mov    %ecx,%edx
  100536:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  100537:	bf d5 03 00 00       	mov    $0x3d5,%edi
  10053c:	89 fa                	mov    %edi,%edx
  10053e:	ec                   	in     (%dx),%al
{
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
  10053f:	0f b6 d8             	movzbl %al,%ebx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  100542:	89 ca                	mov    %ecx,%edx
  100544:	c1 e3 08             	shl    $0x8,%ebx
  100547:	b8 0f 00 00 00       	mov    $0xf,%eax
  10054c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10054d:	89 fa                	mov    %edi,%edx
  10054f:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
  100550:	0f b6 c0             	movzbl %al,%eax
  100553:	09 c3                	or     %eax,%ebx

  if(c == '\n')
  100555:	83 fe 0a             	cmp    $0xa,%esi
  100558:	0f 84 ee 00 00 00    	je     10064c <consputc+0x14c>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
  10055e:	81 fe 00 01 00 00    	cmp    $0x100,%esi
  100564:	0f 84 cb 00 00 00    	je     100635 <consputc+0x135>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  10056a:	66 81 e6 ff 00       	and    $0xff,%si
  10056f:	66 81 ce 00 07       	or     $0x700,%si
  100574:	66 89 b4 1b 00 80 0b 	mov    %si,0xb8000(%ebx,%ebx,1)
  10057b:	00 
  10057c:	83 c3 01             	add    $0x1,%ebx
  
  if((pos/80) >= 24){  // Scroll up.
  10057f:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
  100585:	8d 8c 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%ecx
  10058c:	7f 5d                	jg     1005eb <consputc+0xeb>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  
  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
  1005b5:	66 c7 01 20 07       	movw   $0x720,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
  1005ba:	83 c4 1c             	add    $0x1c,%esp
  1005bd:	5b                   	pop    %ebx
  1005be:	5e                   	pop    %esi
  1005bf:	5f                   	pop    %edi
  1005c0:	5d                   	pop    %ebp
  1005c1:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  1005c2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1005c9:	e8 32 57 00 00       	call   105d00 <uartputc>
  1005ce:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1005d5:	e8 26 57 00 00       	call   105d00 <uartputc>
  1005da:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1005e1:	e8 1a 57 00 00       	call   105d00 <uartputc>
  1005e6:	e9 3f ff ff ff       	jmp    10052a <consputc+0x2a>
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  
  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
    pos -= 80;
  1005eb:	83 eb 50             	sub    $0x50,%ebx
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  
  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
  1005ee:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
  1005f5:	00 
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
  1005f6:	8d b4 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%esi
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  
  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
  1005fd:	c7 44 24 04 a0 80 0b 	movl   $0xb80a0,0x4(%esp)
  100604:	00 
  100605:	c7 04 24 00 80 0b 00 	movl   $0xb8000,(%esp)
  10060c:	e8 9f 40 00 00       	call   1046b0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
  100611:	b8 80 07 00 00       	mov    $0x780,%eax
  100616:	29 d8                	sub    %ebx,%eax
  100618:	01 c0                	add    %eax,%eax
  10061a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10061e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100625:	00 
  100626:	89 34 24             	mov    %esi,(%esp)
  100629:	e8 02 40 00 00       	call   104630 <memset>
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
  10062e:	89 f1                	mov    %esi,%ecx
  100630:	e9 59 ff ff ff       	jmp    10058e <consputc+0x8e>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
  100635:	85 db                	test   %ebx,%ebx
  100637:	8d 8c 1b 00 80 0b 00 	lea    0xb8000(%ebx,%ebx,1),%ecx
  10063e:	0f 8e 4a ff ff ff    	jle    10058e <consputc+0x8e>
  100644:	83 eb 01             	sub    $0x1,%ebx
  100647:	e9 33 ff ff ff       	jmp    10057f <consputc+0x7f>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
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
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
  100670:	55                   	push   %ebp
  100671:	89 e5                	mov    %esp,%ebp
  100673:	57                   	push   %edi
  100674:	56                   	push   %esi
  100675:	53                   	push   %ebx
  100676:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
  100679:	8b 45 08             	mov    0x8(%ebp),%eax
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
  10067c:	8b 75 10             	mov    0x10(%ebp),%esi
  10067f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  iunlock(ip);
  100682:	89 04 24             	mov    %eax,(%esp)
  100685:	e8 66 13 00 00       	call   1019f0 <iunlock>
  acquire(&cons.lock);
  10068a:	c7 04 24 e0 91 10 00 	movl   $0x1091e0,(%esp)
  100691:	e8 fa 3e 00 00       	call   104590 <acquire>
  for(i = 0; i < n; i++)
  100696:	85 f6                	test   %esi,%esi
  100698:	7e 16                	jle    1006b0 <consolewrite+0x40>
  10069a:	31 db                	xor    %ebx,%ebx
  10069c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i] & 0xff);
  1006a0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
  1006a4:	83 c3 01             	add    $0x1,%ebx
    consputc(buf[i] & 0xff);
  1006a7:	e8 54 fe ff ff       	call   100500 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
  1006ac:	39 de                	cmp    %ebx,%esi
  1006ae:	7f f0                	jg     1006a0 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
  1006b0:	c7 04 24 e0 91 10 00 	movl   $0x1091e0,(%esp)
  1006b7:	e8 84 3e 00 00       	call   104540 <release>
  ilock(ip);
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 04 24             	mov    %eax,(%esp)
  1006c2:	e8 69 17 00 00       	call   101e30 <ilock>

  return n;
}
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
  int locking;
} cons;

static void
printint(int xx, int base, int sgn)
{
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	57                   	push   %edi
  1006e4:	56                   	push   %esi
  1006e5:	89 d6                	mov    %edx,%esi
  1006e7:	53                   	push   %ebx
  1006e8:	83 ec 1c             	sub    $0x1c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i = 0, neg = 0;
  uint x;

  if(sgn && xx < 0){
  1006eb:	85 c9                	test   %ecx,%ecx
  1006ed:	74 04                	je     1006f3 <printint+0x13>
  1006ef:	85 c0                	test   %eax,%eax
  1006f1:	78 55                	js     100748 <printint+0x68>
    neg = 1;
    x = -xx;
  } else
    x = xx;
  1006f3:	31 ff                	xor    %edi,%edi
  1006f5:	31 c9                	xor    %ecx,%ecx
  1006f7:	8d 5d d8             	lea    -0x28(%ebp),%ebx
  1006fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  do{
    buf[i++] = digits[x % base];
  100700:	31 d2                	xor    %edx,%edx
  100702:	f7 f6                	div    %esi
  100704:	0f b6 92 26 71 10 00 	movzbl 0x107126(%edx),%edx
  10070b:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  10070e:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
  100711:	85 c0                	test   %eax,%eax
  100713:	75 eb                	jne    100700 <printint+0x20>
  if(neg)
  100715:	85 ff                	test   %edi,%edi
  100717:	74 08                	je     100721 <printint+0x41>
    buf[i++] = '-';
  100719:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
  10071e:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
  100721:	8d 71 ff             	lea    -0x1(%ecx),%esi
  100724:	01 f3                	add    %esi,%ebx
  100726:	66 90                	xchg   %ax,%ax
    consputc(buf[i]);
  100728:	0f be 03             	movsbl (%ebx),%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
  10072b:	83 ee 01             	sub    $0x1,%esi
  10072e:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
  100731:	e8 ca fd ff ff       	call   100500 <consputc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
  100736:	83 fe ff             	cmp    $0xffffffff,%esi
  100739:	75 ed                	jne    100728 <printint+0x48>
    consputc(buf[i]);
}
  10073b:	83 c4 1c             	add    $0x1c,%esp
  10073e:	5b                   	pop    %ebx
  10073f:	5e                   	pop    %esi
  100740:	5f                   	pop    %edi
  100741:	5d                   	pop    %ebp
  100742:	c3                   	ret    
  100743:	90                   	nop
  100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i = 0, neg = 0;
  uint x;

  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
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
}

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
  100760:	55                   	push   %ebp
  100761:	89 e5                	mov    %esp,%ebp
  100763:	57                   	push   %edi
  100764:	56                   	push   %esi
  100765:	53                   	push   %ebx
  100766:	83 ec 2c             	sub    $0x2c,%esp
  int i, c, state, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
  100769:	8b 3d 14 92 10 00    	mov    0x109214,%edi
  if(locking)
  10076f:	85 ff                	test   %edi,%edi
  100771:	0f 85 29 01 00 00    	jne    1008a0 <cprintf+0x140>
    acquire(&cons.lock);

  argp = (uint*)(void*)(&fmt + 1);
  state = 0;
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  100777:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10077a:	0f b6 01             	movzbl (%ecx),%eax
  10077d:	85 c0                	test   %eax,%eax
  10077f:	0f 84 93 00 00 00    	je     100818 <cprintf+0xb8>

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  argp = (uint*)(void*)(&fmt + 1);
  100785:	8d 75 0c             	lea    0xc(%ebp),%esi
  100788:	31 db                	xor    %ebx,%ebx
  10078a:	eb 3f                	jmp    1007cb <cprintf+0x6b>
  10078c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
  100790:	83 fa 25             	cmp    $0x25,%edx
  100793:	0f 84 b7 00 00 00    	je     100850 <cprintf+0xf0>
  100799:	83 fa 64             	cmp    $0x64,%edx
  10079c:	0f 84 8e 00 00 00    	je     100830 <cprintf+0xd0>
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
  1007a2:	b8 25 00 00 00       	mov    $0x25,%eax
  1007a7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1007aa:	e8 51 fd ff ff       	call   100500 <consputc>
      consputc(c);
  1007af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1007b2:	89 d0                	mov    %edx,%eax
  1007b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1007b8:	e8 43 fd ff ff       	call   100500 <consputc>
  1007bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(locking)
    acquire(&cons.lock);

  argp = (uint*)(void*)(&fmt + 1);
  state = 0;
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  1007c0:	83 c3 01             	add    $0x1,%ebx
  1007c3:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
  1007c7:	85 c0                	test   %eax,%eax
  1007c9:	74 4d                	je     100818 <cprintf+0xb8>
    if(c != '%'){
  1007cb:	83 f8 25             	cmp    $0x25,%eax
  1007ce:	75 e8                	jne    1007b8 <cprintf+0x58>
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
  1007d0:	83 c3 01             	add    $0x1,%ebx
  1007d3:	0f b6 14 19          	movzbl (%ecx,%ebx,1),%edx
    if(c == 0)
  1007d7:	85 d2                	test   %edx,%edx
  1007d9:	74 3d                	je     100818 <cprintf+0xb8>
      break;
    switch(c){
  1007db:	83 fa 70             	cmp    $0x70,%edx
  1007de:	74 12                	je     1007f2 <cprintf+0x92>
  1007e0:	7e ae                	jle    100790 <cprintf+0x30>
  1007e2:	83 fa 73             	cmp    $0x73,%edx
  1007e5:	8d 76 00             	lea    0x0(%esi),%esi
  1007e8:	74 7e                	je     100868 <cprintf+0x108>
  1007ea:	83 fa 78             	cmp    $0x78,%edx
  1007ed:	8d 76 00             	lea    0x0(%esi),%esi
  1007f0:	75 b0                	jne    1007a2 <cprintf+0x42>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
  1007f2:	8b 06                	mov    (%esi),%eax
  1007f4:	31 c9                	xor    %ecx,%ecx
  1007f6:	ba 10 00 00 00       	mov    $0x10,%edx
  if(locking)
    acquire(&cons.lock);

  argp = (uint*)(void*)(&fmt + 1);
  state = 0;
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  1007fb:	83 c3 01             	add    $0x1,%ebx
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
  1007fe:	83 c6 04             	add    $0x4,%esi
  100801:	e8 da fe ff ff       	call   1006e0 <printint>
  100806:	8b 4d 08             	mov    0x8(%ebp),%ecx
  if(locking)
    acquire(&cons.lock);

  argp = (uint*)(void*)(&fmt + 1);
  state = 0;
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
  100809:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
  10080d:	85 c0                	test   %eax,%eax
  10080f:	75 ba                	jne    1007cb <cprintf+0x6b>
  100811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      consputc(c);
      break;
    }
  }

  if(locking)
  100818:	85 ff                	test   %edi,%edi
  10081a:	74 0c                	je     100828 <cprintf+0xc8>
    release(&cons.lock);
  10081c:	c7 04 24 e0 91 10 00 	movl   $0x1091e0,(%esp)
  100823:	e8 18 3d 00 00       	call   104540 <release>
}
  100828:	83 c4 2c             	add    $0x2c,%esp
  10082b:	5b                   	pop    %ebx
  10082c:	5e                   	pop    %esi
  10082d:	5f                   	pop    %edi
  10082e:	5d                   	pop    %ebp
  10082f:	c3                   	ret    
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
    case 'd':
      printint(*argp++, 10, 1);
  100830:	8b 06                	mov    (%esi),%eax
  100832:	b9 01 00 00 00       	mov    $0x1,%ecx
  100837:	ba 0a 00 00 00       	mov    $0xa,%edx
  10083c:	83 c6 04             	add    $0x4,%esi
  10083f:	e8 9c fe ff ff       	call   1006e0 <printint>
  100844:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
  100847:	e9 74 ff ff ff       	jmp    1007c0 <cprintf+0x60>
  10084c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
  100850:	b8 25 00 00 00       	mov    $0x25,%eax
  100855:	e8 a6 fc ff ff       	call   100500 <consputc>
  10085a:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
  10085d:	e9 5e ff ff ff       	jmp    1007c0 <cprintf+0x60>
  100862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
  100868:	8b 16                	mov    (%esi),%edx
  10086a:	83 c6 04             	add    $0x4,%esi
  10086d:	85 d2                	test   %edx,%edx
  10086f:	74 47                	je     1008b8 <cprintf+0x158>
        s = "(null)";
      for(; *s; s++)
  100871:	0f b6 02             	movzbl (%edx),%eax
  100874:	84 c0                	test   %al,%al
  100876:	0f 84 44 ff ff ff    	je     1007c0 <cprintf+0x60>
  10087c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        consputc(*s);
  100880:	0f be c0             	movsbl %al,%eax
  100883:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  100886:	e8 75 fc ff ff       	call   100500 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
  10088b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10088e:	83 c2 01             	add    $0x1,%edx
  100891:	0f b6 02             	movzbl (%edx),%eax
  100894:	84 c0                	test   %al,%al
  100896:	75 e8                	jne    100880 <cprintf+0x120>
  100898:	e9 20 ff ff ff       	jmp    1007bd <cprintf+0x5d>
  10089d:	8d 76 00             	lea    0x0(%esi),%esi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
  1008a0:	c7 04 24 e0 91 10 00 	movl   $0x1091e0,(%esp)
  1008a7:	e8 e4 3c 00 00       	call   104590 <acquire>
  1008ac:	e9 c6 fe ff ff       	jmp    100777 <cprintf+0x17>
  1008b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
  1008b8:	ba 0c 71 10 00       	mov    $0x10710c,%edx
  1008bd:	eb b2                	jmp    100871 <cprintf+0x111>
  1008bf:	90                   	nop

001008c0 <consoleread>:
  release(&input.lock);
}

int
consoleread(struct inode *ip, char *dst, int n)
{
  1008c0:	55                   	push   %ebp
  1008c1:	89 e5                	mov    %esp,%ebp
  1008c3:	57                   	push   %edi
  1008c4:	56                   	push   %esi
  1008c5:	53                   	push   %ebx
  1008c6:	83 ec 3c             	sub    $0x3c,%esp
  1008c9:	8b 5d 10             	mov    0x10(%ebp),%ebx
  1008cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  1008cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
  1008d2:	89 3c 24             	mov    %edi,(%esp)
  1008d5:	e8 16 11 00 00       	call   1019f0 <iunlock>
  target = n;
  1008da:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  acquire(&input.lock);
  1008dd:	c7 04 24 e0 60 11 00 	movl   $0x1160e0,(%esp)
  1008e4:	e8 a7 3c 00 00       	call   104590 <acquire>
  while(n > 0){
  1008e9:	85 db                	test   %ebx,%ebx
  1008eb:	7f 2c                	jg     100919 <consoleread+0x59>
  1008ed:	e9 c0 00 00 00       	jmp    1009b2 <consoleread+0xf2>
  1008f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(input.r == input.w){
      if(proc->killed){
  1008f8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1008fe:	8b 40 4c             	mov    0x4c(%eax),%eax
  100901:	85 c0                	test   %eax,%eax
  100903:	75 5b                	jne    100960 <consoleread+0xa0>
        release(&input.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
  100905:	c7 44 24 04 e0 60 11 	movl   $0x1160e0,0x4(%esp)
  10090c:	00 
  10090d:	c7 04 24 94 61 11 00 	movl   $0x116194,(%esp)
  100914:	e8 07 2b 00 00       	call   103420 <sleep>

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
  100919:	a1 94 61 11 00       	mov    0x116194,%eax
  10091e:	3b 05 98 61 11 00    	cmp    0x116198,%eax
  100924:	74 d2                	je     1008f8 <consoleread+0x38>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
  100926:	89 c2                	mov    %eax,%edx
  100928:	83 e2 7f             	and    $0x7f,%edx
  10092b:	0f b6 8a 14 61 11 00 	movzbl 0x116114(%edx),%ecx
  100932:	0f be d1             	movsbl %cl,%edx
  100935:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  100938:	8d 50 01             	lea    0x1(%eax),%edx
    if(c == C('D')){  // EOF
  10093b:	83 7d d4 04          	cmpl   $0x4,-0x2c(%ebp)
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
  10093f:	89 15 94 61 11 00    	mov    %edx,0x116194
    if(c == C('D')){  // EOF
  100945:	74 3a                	je     100981 <consoleread+0xc1>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
  100947:	88 0e                	mov    %cl,(%esi)
    --n;
  100949:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
  10094c:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
  100950:	74 39                	je     10098b <consoleread+0xcb>
  int c;

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
  100952:	85 db                	test   %ebx,%ebx
  100954:	7e 35                	jle    10098b <consoleread+0xcb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
  100956:	83 c6 01             	add    $0x1,%esi
  100959:	eb be                	jmp    100919 <consoleread+0x59>
  10095b:	90                   	nop
  10095c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
        release(&input.lock);
  100960:	c7 04 24 e0 60 11 00 	movl   $0x1160e0,(%esp)
  100967:	e8 d4 3b 00 00       	call   104540 <release>
        ilock(ip);
  10096c:	89 3c 24             	mov    %edi,(%esp)
  10096f:	e8 bc 14 00 00       	call   101e30 <ilock>
  }
  release(&input.lock);
  ilock(ip);

  return target - n;
}
  100974:	83 c4 3c             	add    $0x3c,%esp
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
        release(&input.lock);
        ilock(ip);
  100977:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&input.lock);
  ilock(ip);

  return target - n;
}
  10097c:	5b                   	pop    %ebx
  10097d:	5e                   	pop    %esi
  10097e:	5f                   	pop    %edi
  10097f:	5d                   	pop    %ebp
  100980:	c3                   	ret    
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
  100981:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  100984:	76 05                	jbe    10098b <consoleread+0xcb>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
  100986:	a3 94 61 11 00       	mov    %eax,0x116194
  10098b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10098e:	29 d8                	sub    %ebx,%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&input.lock);
  100990:	c7 04 24 e0 60 11 00 	movl   $0x1160e0,(%esp)
  100997:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10099a:	e8 a1 3b 00 00       	call   104540 <release>
  ilock(ip);
  10099f:	89 3c 24             	mov    %edi,(%esp)
  1009a2:	e8 89 14 00 00       	call   101e30 <ilock>
  1009a7:	8b 45 e0             	mov    -0x20(%ebp),%eax

  return target - n;
}
  1009aa:	83 c4 3c             	add    $0x3c,%esp
  1009ad:	5b                   	pop    %ebx
  1009ae:	5e                   	pop    %esi
  1009af:	5f                   	pop    %edi
  1009b0:	5d                   	pop    %ebp
  1009b1:	c3                   	ret    
  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
  1009b2:	31 c0                	xor    %eax,%eax
  1009b4:	eb da                	jmp    100990 <consoleread+0xd0>
  1009b6:	8d 76 00             	lea    0x0(%esi),%esi
  1009b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001009c0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
  1009c0:	55                   	push   %ebp
  1009c1:	89 e5                	mov    %esp,%ebp
  1009c3:	57                   	push   %edi
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
  1009c4:	bf 10 61 11 00       	mov    $0x116110,%edi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
  1009c9:	56                   	push   %esi
  1009ca:	53                   	push   %ebx
  1009cb:	83 ec 1c             	sub    $0x1c,%esp
  1009ce:	8b 75 08             	mov    0x8(%ebp),%esi
  int c;

  acquire(&input.lock);
  1009d1:	c7 04 24 e0 60 11 00 	movl   $0x1160e0,(%esp)
  1009d8:	e8 b3 3b 00 00       	call   104590 <acquire>
  1009dd:	8d 76 00             	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
  1009e0:	ff d6                	call   *%esi
  1009e2:	85 c0                	test   %eax,%eax
  1009e4:	89 c3                	mov    %eax,%ebx
  1009e6:	0f 88 9c 00 00 00    	js     100a88 <consoleintr+0xc8>
    switch(c){
  1009ec:	83 fb 10             	cmp    $0x10,%ebx
  1009ef:	90                   	nop
  1009f0:	0f 84 1a 01 00 00    	je     100b10 <consoleintr+0x150>
  1009f6:	0f 8f a4 00 00 00    	jg     100aa0 <consoleintr+0xe0>
  1009fc:	83 fb 08             	cmp    $0x8,%ebx
  1009ff:	90                   	nop
  100a00:	0f 84 a8 00 00 00    	je     100aae <consoleintr+0xee>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
  100a06:	85 db                	test   %ebx,%ebx
  100a08:	74 d6                	je     1009e0 <consoleintr+0x20>
  100a0a:	a1 9c 61 11 00       	mov    0x11619c,%eax
  100a0f:	89 c2                	mov    %eax,%edx
  100a11:	2b 15 94 61 11 00    	sub    0x116194,%edx
  100a17:	83 fa 7f             	cmp    $0x7f,%edx
  100a1a:	77 c4                	ja     1009e0 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
  100a1c:	83 fb 0d             	cmp    $0xd,%ebx
  100a1f:	0f 84 f8 00 00 00    	je     100b1d <consoleintr+0x15d>
        input.buf[input.e++ % INPUT_BUF] = c;
  100a25:	89 c2                	mov    %eax,%edx
  100a27:	83 c0 01             	add    $0x1,%eax
  100a2a:	83 e2 7f             	and    $0x7f,%edx
  100a2d:	88 5c 17 04          	mov    %bl,0x4(%edi,%edx,1)
  100a31:	a3 9c 61 11 00       	mov    %eax,0x11619c
        consputc(c);
  100a36:	89 d8                	mov    %ebx,%eax
  100a38:	e8 c3 fa ff ff       	call   100500 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
  100a3d:	83 fb 04             	cmp    $0x4,%ebx
  100a40:	0f 84 f3 00 00 00    	je     100b39 <consoleintr+0x179>
  100a46:	83 fb 0a             	cmp    $0xa,%ebx
  100a49:	0f 84 ea 00 00 00    	je     100b39 <consoleintr+0x179>
  100a4f:	8b 15 94 61 11 00    	mov    0x116194,%edx
  100a55:	a1 9c 61 11 00       	mov    0x11619c,%eax
  100a5a:	83 ea 80             	sub    $0xffffff80,%edx
  100a5d:	39 d0                	cmp    %edx,%eax
  100a5f:	0f 85 7b ff ff ff    	jne    1009e0 <consoleintr+0x20>
          input.w = input.e;
  100a65:	a3 98 61 11 00       	mov    %eax,0x116198
          wakeup(&input.r);
  100a6a:	c7 04 24 94 61 11 00 	movl   $0x116194,(%esp)
  100a71:	e8 7a 28 00 00       	call   1032f0 <wakeup>
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0){
  100a76:	ff d6                	call   *%esi
  100a78:	85 c0                	test   %eax,%eax
  100a7a:	89 c3                	mov    %eax,%ebx
  100a7c:	0f 89 6a ff ff ff    	jns    1009ec <consoleintr+0x2c>
  100a82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        }
      }
      break;
    }
  }
  release(&input.lock);
  100a88:	c7 45 08 e0 60 11 00 	movl   $0x1160e0,0x8(%ebp)
}
  100a8f:	83 c4 1c             	add    $0x1c,%esp
  100a92:	5b                   	pop    %ebx
  100a93:	5e                   	pop    %esi
  100a94:	5f                   	pop    %edi
  100a95:	5d                   	pop    %ebp
        }
      }
      break;
    }
  }
  release(&input.lock);
  100a96:	e9 a5 3a 00 00       	jmp    104540 <release>
  100a9b:	90                   	nop
  100a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0){
    switch(c){
  100aa0:	83 fb 15             	cmp    $0x15,%ebx
  100aa3:	74 57                	je     100afc <consoleintr+0x13c>
  100aa5:	83 fb 7f             	cmp    $0x7f,%ebx
  100aa8:	0f 85 58 ff ff ff    	jne    100a06 <consoleintr+0x46>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
  100aae:	a1 9c 61 11 00       	mov    0x11619c,%eax
  100ab3:	3b 05 98 61 11 00    	cmp    0x116198,%eax
  100ab9:	0f 84 21 ff ff ff    	je     1009e0 <consoleintr+0x20>
        input.e--;
  100abf:	83 e8 01             	sub    $0x1,%eax
  100ac2:	a3 9c 61 11 00       	mov    %eax,0x11619c
        consputc(BACKSPACE);
  100ac7:	b8 00 01 00 00       	mov    $0x100,%eax
  100acc:	e8 2f fa ff ff       	call   100500 <consputc>
  100ad1:	e9 0a ff ff ff       	jmp    1009e0 <consoleintr+0x20>
  100ad6:	66 90                	xchg   %ax,%ax
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
  100ad8:	83 e8 01             	sub    $0x1,%eax
  100adb:	89 c2                	mov    %eax,%edx
  100add:	83 e2 7f             	and    $0x7f,%edx
  100ae0:	80 ba 14 61 11 00 0a 	cmpb   $0xa,0x116114(%edx)
  100ae7:	0f 84 f3 fe ff ff    	je     1009e0 <consoleintr+0x20>
        input.e--;
  100aed:	a3 9c 61 11 00       	mov    %eax,0x11619c
        consputc(BACKSPACE);
  100af2:	b8 00 01 00 00       	mov    $0x100,%eax
  100af7:	e8 04 fa ff ff       	call   100500 <consputc>
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
  100afc:	a1 9c 61 11 00       	mov    0x11619c,%eax
  100b01:	3b 05 98 61 11 00    	cmp    0x116198,%eax
  100b07:	75 cf                	jne    100ad8 <consoleintr+0x118>
  100b09:	e9 d2 fe ff ff       	jmp    1009e0 <consoleintr+0x20>
  100b0e:	66 90                	xchg   %ax,%ax

  acquire(&input.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      procdump();
  100b10:	e8 fb 37 00 00       	call   104310 <procdump>
  100b15:	8d 76 00             	lea    0x0(%esi),%esi
      break;
  100b18:	e9 c3 fe ff ff       	jmp    1009e0 <consoleintr+0x20>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
  100b1d:	89 c2                	mov    %eax,%edx
  100b1f:	83 c0 01             	add    $0x1,%eax
  100b22:	83 e2 7f             	and    $0x7f,%edx
  100b25:	c6 44 17 04 0a       	movb   $0xa,0x4(%edi,%edx,1)
  100b2a:	a3 9c 61 11 00       	mov    %eax,0x11619c
        consputc(c);
  100b2f:	b8 0a 00 00 00       	mov    $0xa,%eax
  100b34:	e8 c7 f9 ff ff       	call   100500 <consputc>
  100b39:	a1 9c 61 11 00       	mov    0x11619c,%eax
  100b3e:	e9 22 ff ff ff       	jmp    100a65 <consoleintr+0xa5>
  100b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00100b50 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
  100b50:	55                   	push   %ebp
  100b51:	89 e5                	mov    %esp,%ebp
  100b53:	56                   	push   %esi
  100b54:	53                   	push   %ebx
  100b55:	83 ec 40             	sub    $0x40,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
  100b58:	fa                   	cli    
  int i;
  uint pcs[10];
  
  cli();
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  100b59:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  100b5f:	8d 75 d0             	lea    -0x30(%ebp),%esi
  100b62:	31 db                	xor    %ebx,%ebx
{
  int i;
  uint pcs[10];
  
  cli();
  cons.locking = 0;
  100b64:	c7 05 14 92 10 00 00 	movl   $0x0,0x109214
  100b6b:	00 00 00 
  cprintf("cpu%d: panic: ", cpu->id);
  100b6e:	0f b6 00             	movzbl (%eax),%eax
  100b71:	c7 04 24 13 71 10 00 	movl   $0x107113,(%esp)
  100b78:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b7c:	e8 df fb ff ff       	call   100760 <cprintf>
  cprintf(s);
  100b81:	8b 45 08             	mov    0x8(%ebp),%eax
  100b84:	89 04 24             	mov    %eax,(%esp)
  100b87:	e8 d4 fb ff ff       	call   100760 <cprintf>
  cprintf("\n");
  100b8c:	c7 04 24 36 75 10 00 	movl   $0x107536,(%esp)
  100b93:	e8 c8 fb ff ff       	call   100760 <cprintf>
  getcallerpcs(&s, pcs);
  100b98:	8d 45 08             	lea    0x8(%ebp),%eax
  100b9b:	89 74 24 04          	mov    %esi,0x4(%esp)
  100b9f:	89 04 24             	mov    %eax,(%esp)
  100ba2:	e8 79 38 00 00       	call   104420 <getcallerpcs>
  100ba7:	90                   	nop
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
  100ba8:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
  100bab:	83 c3 01             	add    $0x1,%ebx
    cprintf(" %p", pcs[i]);
  100bae:	c7 04 24 22 71 10 00 	movl   $0x107122,(%esp)
  100bb5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bb9:	e8 a2 fb ff ff       	call   100760 <cprintf>
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
  100bbe:	83 fb 0a             	cmp    $0xa,%ebx
  100bc1:	75 e5                	jne    100ba8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
  100bc3:	c7 05 c0 91 10 00 01 	movl   $0x1,0x1091c0
  100bca:	00 00 00 
  100bcd:	eb fe                	jmp    100bcd <panic+0x7d>
  100bcf:	90                   	nop

00100bd0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
  100bd0:	55                   	push   %ebp
  100bd1:	89 e5                	mov    %esp,%ebp
  100bd3:	57                   	push   %edi
  100bd4:	56                   	push   %esi
  100bd5:	53                   	push   %ebx
  100bd6:	81 ec ac 00 00 00    	sub    $0xac,%esp
  pde_t *pgdir, *oldpgdir;

  pgdir = 0;
  sz = 0;

  if((ip = namei(path)) == 0)
  100bdc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdf:	89 04 24             	mov    %eax,(%esp)
  100be2:	e8 e9 14 00 00       	call   1020d0 <namei>
  100be7:	89 c7                	mov    %eax,%edi
  100be9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100bee:	85 ff                	test   %edi,%edi
  100bf0:	0f 84 1a 01 00 00    	je     100d10 <exec+0x140>
    return -1;
  ilock(ip);
  100bf6:	89 3c 24             	mov    %edi,(%esp)
  100bf9:	e8 32 12 00 00       	call   101e30 <ilock>

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
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
    goto bad;
  if(elf.magic != ELF_MAGIC)
  100c26:	81 7d 94 7f 45 4c 46 	cmpl   $0x464c457f,-0x6c(%ebp)
  100c2d:	0f 85 d0 00 00 00    	jne    100d03 <exec+0x133>
  100c33:	90                   	nop
  100c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    goto bad;

  if(!(pgdir = setupkvm()))
  100c38:	e8 43 5e 00 00       	call   106a80 <setupkvm>
  100c3d:	85 c0                	test   %eax,%eax
  100c3f:	89 45 80             	mov    %eax,-0x80(%ebp)
  100c42:	0f 84 bb 00 00 00    	je     100d03 <exec+0x133>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
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
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
  100c7a:	8d 55 c8             	lea    -0x38(%ebp),%edx
  100c7d:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
  100c84:	00 
  100c85:	89 74 24 08          	mov    %esi,0x8(%esp)
  100c89:	89 54 24 04          	mov    %edx,0x4(%esp)
  100c8d:	89 3c 24             	mov    %edi,(%esp)
  100c90:	e8 5b 09 00 00       	call   1015f0 <readi>
  100c95:	83 f8 20             	cmp    $0x20,%eax
  100c98:	75 5e                	jne    100cf8 <exec+0x128>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
  100c9a:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
  100c9e:	75 c8                	jne    100c68 <exec+0x98>
      continue;
    if(ph.memsz < ph.filesz)
  100ca0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ca3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  100ca6:	72 50                	jb     100cf8 <exec+0x128>
      goto bad;
    if(!(sz = allocuvm(pgdir, sz, ph.va + ph.memsz)))
  100ca8:	03 45 d0             	add    -0x30(%ebp),%eax
  100cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  100caf:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100cb2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100cb6:	8b 45 80             	mov    -0x80(%ebp),%eax
  100cb9:	89 04 24             	mov    %eax,(%esp)
  100cbc:	e8 7f 60 00 00       	call   106d40 <allocuvm>
  100cc1:	85 c0                	test   %eax,%eax
  100cc3:	89 45 84             	mov    %eax,-0x7c(%ebp)
  100cc6:	74 30                	je     100cf8 <exec+0x128>
      goto bad;
    if(!loaduvm(pgdir, (char *)ph.va, ip, ph.offset, ph.filesz))
  100cc8:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100ccb:	89 44 24 10          	mov    %eax,0x10(%esp)
  100ccf:	8b 45 cc             	mov    -0x34(%ebp),%eax
  100cd2:	89 7c 24 08          	mov    %edi,0x8(%esp)
  100cd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100cda:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce1:	8b 55 80             	mov    -0x80(%ebp),%edx
  100ce4:	89 14 24             	mov    %edx,(%esp)
  100ce7:	e8 24 61 00 00       	call   106e10 <loaduvm>
  100cec:	85 c0                	test   %eax,%eax
  100cee:	0f 85 74 ff ff ff    	jne    100c68 <exec+0x98>
  100cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  freevm(oldpgdir);

  return 0;

 bad:
  if(pgdir) freevm(pgdir);
  100cf8:	8b 45 80             	mov    -0x80(%ebp),%eax
  100cfb:	89 04 24             	mov    %eax,(%esp)
  100cfe:	e8 fd 5e 00 00       	call   106c00 <freevm>
  iunlockput(ip);
  100d03:	89 3c 24             	mov    %edi,(%esp)
  100d06:	e8 35 10 00 00       	call   101d40 <iunlockput>
  100d0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return -1;
}
  100d10:	81 c4 ac 00 00 00    	add    $0xac,%esp
  100d16:	5b                   	pop    %ebx
  100d17:	5e                   	pop    %esi
  100d18:	5f                   	pop    %edi
  100d19:	5d                   	pop    %ebp
  100d1a:	c3                   	ret    
  100d1b:	90                   	nop
  100d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  if(!(pgdir = setupkvm()))
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
  100d20:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100d23:	81 c1 ff 0f 00 00    	add    $0xfff,%ecx
  100d29:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  100d2f:	89 cb                	mov    %ecx,%ebx
  100d31:	89 4d 84             	mov    %ecx,-0x7c(%ebp)
  100d34:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(!(sz = allocuvm(pgdir, sz, ph.va + ph.memsz)))
      goto bad;
    if(!loaduvm(pgdir, (char *)ph.va, ip, ph.offset, ph.filesz))
      goto bad;
  }
  iunlockput(ip);
  100d3a:	89 3c 24             	mov    %edi,(%esp)
  100d3d:	e8 fe 0f 00 00       	call   101d40 <iunlockput>

  // Allocate and initialize stack at sz
  sz = spbottom = PGROUNDUP(sz);
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
  100d42:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  100d46:	8b 45 84             	mov    -0x7c(%ebp),%eax
  100d49:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d4d:	8b 55 80             	mov    -0x80(%ebp),%edx
  100d50:	89 14 24             	mov    %edx,(%esp)
  100d53:	e8 e8 5f 00 00       	call   106d40 <allocuvm>
  100d58:	85 c0                	test   %eax,%eax
  100d5a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  100d60:	74 96                	je     100cf8 <exec+0x128>
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);
  100d62:	8b 4d 84             	mov    -0x7c(%ebp),%ecx
  100d65:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100d69:	8b 45 80             	mov    -0x80(%ebp),%eax
  100d6c:	89 04 24             	mov    %eax,(%esp)
  100d6f:	e8 4c 5c 00 00       	call   1069c0 <uva2ka>

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100d74:	8b 4d 0c             	mov    0xc(%ebp),%ecx

  // Allocate and initialize stack at sz
  sz = spbottom = PGROUNDUP(sz);
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);
  100d77:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100d7d:	8b 11                	mov    (%ecx),%edx
  100d7f:	85 d2                	test   %edx,%edx
  100d81:	0f 84 ac 01 00 00    	je     100f33 <exec+0x363>
  100d87:	31 f6                	xor    %esi,%esi
  100d89:	31 db                	xor    %ebx,%ebx
  100d8b:	89 cf                	mov    %ecx,%edi
  100d8d:	8d 76 00             	lea    0x0(%esi),%esi
    arglen += strlen(argv[argc]) + 1;
  100d90:	89 14 24             	mov    %edx,(%esp)
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100d93:	83 c3 01             	add    $0x1,%ebx
    arglen += strlen(argv[argc]) + 1;
  100d96:	e8 75 3a 00 00       	call   104810 <strlen>
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100d9b:	8b 14 9f             	mov    (%edi,%ebx,4),%edx
    arglen += strlen(argv[argc]) + 1;
  100d9e:	01 f0                	add    %esi,%eax
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100da0:	85 d2                	test   %edx,%edx
    arglen += strlen(argv[argc]) + 1;
  100da2:	8d 70 01             	lea    0x1(%eax),%esi
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100da5:	75 e9                	jne    100d90 <exec+0x1c0>
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100da7:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100dad:	89 da                	mov    %ebx,%edx
  100daf:	83 c0 04             	add    $0x4,%eax
  100db2:	f7 d2                	not    %edx
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100db4:	83 e0 fc             	and    $0xfffffffc,%eax
  100db7:	89 9d 70 ff ff ff    	mov    %ebx,-0x90(%ebp)
  if(!(sz = allocuvm(pgdir, sz, sz + PGSIZE)))
    goto bad;
  mem = uva2ka(pgdir, (char *)spbottom);

  arglen = 0;
  for(argc=0; argv[argc]; argc++)
  100dbd:	89 df                	mov    %ebx,%edi
  100dbf:	83 ef 01             	sub    $0x1,%edi
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100dc2:	8d 14 91             	lea    (%ecx,%edx,4),%edx
  100dc5:	29 c2                	sub    %eax,%edx
  100dc7:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
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
  for(i=argc-1; i>=0; i--){
    len = strlen(argv[i]) + 1;
  100e00:	8b 06                	mov    (%esi),%eax
  sp = sz;
  argp = sz - arglen - 4*(argc+1);

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  for(i=argc-1; i>=0; i--){
  100e02:	83 ef 01             	sub    $0x1,%edi
    len = strlen(argv[i]) + 1;
  100e05:	89 04 24             	mov    %eax,(%esp)
  100e08:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
  100e0e:	e8 fd 39 00 00       	call   104810 <strlen>
    sp -= len;
  100e13:	83 c0 01             	add    $0x1,%eax
  100e16:	29 c3                	sub    %eax,%ebx
    memmove(mem+sp-spbottom, argv[i], len);
  100e18:	89 44 24 08          	mov    %eax,0x8(%esp)
  100e1c:	8b 06                	mov    (%esi),%eax
  sp = sz;
  argp = sz - arglen - 4*(argc+1);

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  for(i=argc-1; i>=0; i--){
  100e1e:	83 ee 04             	sub    $0x4,%esi
    len = strlen(argv[i]) + 1;
    sp -= len;
    memmove(mem+sp-spbottom, argv[i], len);
  100e21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100e25:	89 d8                	mov    %ebx,%eax
  100e27:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e2a:	03 85 7c ff ff ff    	add    -0x84(%ebp),%eax
  100e30:	89 04 24             	mov    %eax,(%esp)
  100e33:	e8 78 38 00 00       	call   1046b0 <memmove>
    *(uint*)(mem+argp-spbottom + 4*i) = sp;  // argv[i]
  100e38:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
  100e3e:	89 1a                	mov    %ebx,(%edx)
  sp = sz;
  argp = sz - arglen - 4*(argc+1);

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  for(i=argc-1; i>=0; i--){
  100e40:	83 ea 04             	sub    $0x4,%edx
  100e43:	83 ff ff             	cmp    $0xffffffff,%edi
  100e46:	75 b8                	jne    100e00 <exec+0x230>
    *(uint*)(mem+argp-spbottom + 4*i) = sp;  // argv[i]
  }

  // Stack frame for main(argc, argv), below arguments.
  sp = argp;
  sp -= 4;
  100e48:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
  *(uint*)(mem+sp-spbottom) = argp;
  100e4e:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
  100e54:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
    *(uint*)(mem+argp-spbottom + 4*i) = sp;  // argv[i]
  }

  // Stack frame for main(argc, argv), below arguments.
  sp = argp;
  sp -= 4;
  100e5a:	83 e8 04             	sub    $0x4,%eax
  *(uint*)(mem+sp-spbottom) = argp;
  100e5d:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e60:	89 14 01             	mov    %edx,(%ecx,%eax,1)
  sp -= 4;
  100e63:	89 d0                	mov    %edx,%eax
  *(uint*)(mem+sp-spbottom) = argc;
  100e65:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx

  // Stack frame for main(argc, argv), below arguments.
  sp = argp;
  sp -= 4;
  *(uint*)(mem+sp-spbottom) = argp;
  sp -= 4;
  100e6b:	83 e8 08             	sub    $0x8,%eax
  *(uint*)(mem+sp-spbottom) = argc;
  100e6e:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e71:	89 14 01             	mov    %edx,(%ecx,%eax,1)
  sp -= 4;
  100e74:	8b 9d 78 ff ff ff    	mov    -0x88(%ebp),%ebx
  100e7a:	83 eb 0c             	sub    $0xc,%ebx
  *(uint*)(mem+sp-spbottom) = 0xffffffff;   // fake return pc
  100e7d:	89 d8                	mov    %ebx,%eax
  100e7f:	2b 45 84             	sub    -0x7c(%ebp),%eax
  100e82:	c7 04 01 ff ff ff ff 	movl   $0xffffffff,(%ecx,%eax,1)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
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
    if(*s == '/')
  100eaa:	80 fa 2f             	cmp    $0x2f,%dl
  100ead:	75 f1                	jne    100ea0 <exec+0x2d0>
  *(uint*)(mem+sp-spbottom) = argc;
  sp -= 4;
  *(uint*)(mem+sp-spbottom) = 0xffffffff;   // fake return pc

  // Save program name for debugging.
  for(last=s=path; *s; s++)
  100eaf:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
  100eb2:	89 c1                	mov    %eax,%ecx
  *(uint*)(mem+sp-spbottom) = argc;
  sp -= 4;
  *(uint*)(mem+sp-spbottom) = 0xffffffff;   // fake return pc

  // Save program name for debugging.
  for(last=s=path; *s; s++)
  100eb4:	83 c0 01             	add    $0x1,%eax
  100eb7:	84 d2                	test   %dl,%dl
  100eb9:	75 ef                	jne    100eaa <exec+0x2da>
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
  100ebb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ec1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100ec5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  100ecc:	00 
  100ecd:	83 c0 6c             	add    $0x6c,%eax
  100ed0:	89 04 24             	mov    %eax,(%esp)
  100ed3:	e8 f8 38 00 00       	call   1047d0 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
  100ed8:	8b 55 80             	mov    -0x80(%ebp),%edx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  100edb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ee1:	8b 70 04             	mov    0x4(%eax),%esi
  proc->pgdir = pgdir;
  100ee4:	89 50 04             	mov    %edx,0x4(%eax)
  proc->sz = sz;
  100ee7:	8b 8d 74 ff ff ff    	mov    -0x8c(%ebp),%ecx
  100eed:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100ef3:	89 08                	mov    %ecx,(%eax)
  proc->tf->eip = elf.entry;  // main
  100ef5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100efb:	8b 55 ac             	mov    -0x54(%ebp),%edx
  100efe:	8b 40 60             	mov    0x60(%eax),%eax
  100f01:	89 50 38             	mov    %edx,0x38(%eax)
  proc->tf->esp = sp;
  100f04:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100f0a:	8b 40 60             	mov    0x60(%eax),%eax
  100f0d:	89 58 44             	mov    %ebx,0x44(%eax)

  switchuvm(proc); 
  100f10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  100f16:	89 04 24             	mov    %eax,(%esp)
  100f19:	e8 b2 5f 00 00       	call   106ed0 <switchuvm>

  freevm(oldpgdir);
  100f1e:	89 34 24             	mov    %esi,(%esp)
  100f21:	e8 da 5c 00 00       	call   106c00 <freevm>

 bad:
  if(pgdir) freevm(pgdir);
  iunlockput(ip);
  return -1;
}
  100f26:	81 c4 ac 00 00 00    	add    $0xac,%esp
  proc->tf->eip = elf.entry;  // main
  proc->tf->esp = sp;

  switchuvm(proc); 

  freevm(oldpgdir);
  100f2c:	31 c0                	xor    %eax,%eax

 bad:
  if(pgdir) freevm(pgdir);
  iunlockput(ip);
  return -1;
}
  100f2e:	5b                   	pop    %ebx
  100f2f:	5e                   	pop    %esi
  100f30:	5f                   	pop    %edi
  100f31:	5d                   	pop    %ebp
  100f32:	c3                   	ret    
  for(argc=0; argv[argc]; argc++)
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100f33:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  100f39:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
  for(argc=0; argv[argc]; argc++)
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100f3f:	83 ea 04             	sub    $0x4,%edx

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  100f42:	89 d0                	mov    %edx,%eax
  100f44:	2b 45 84             	sub    -0x7c(%ebp),%eax
  for(argc=0; argv[argc]; argc++)
    arglen += strlen(argv[argc]) + 1;
  arglen = (arglen+3) & ~3;

  sp = sz;
  argp = sz - arglen - 4*(argc+1);
  100f47:	89 95 78 ff ff ff    	mov    %edx,-0x88(%ebp)

  // Copy argv strings and pointers to stack.
  *(uint*)(mem+argp-spbottom + 4*argc) = 0;  // argv[argc]
  100f4d:	c7 04 01 00 00 00 00 	movl   $0x0,(%ecx,%eax,1)
  100f54:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
  100f5b:	00 00 00 
  100f5e:	e9 e5 fe ff ff       	jmp    100e48 <exec+0x278>

  if(!(pgdir = setupkvm()))
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
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
}

// Write to file f.  Addr is kernel address.
int
filewrite(struct file *f, char *addr, int n)
{
  100f80:	55                   	push   %ebp
  100f81:	89 e5                	mov    %esp,%ebp
  100f83:	83 ec 38             	sub    $0x38,%esp
  100f86:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  100f89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  100f8c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  100f8f:	8b 75 0c             	mov    0xc(%ebp),%esi
  100f92:	89 7d fc             	mov    %edi,-0x4(%ebp)
  100f95:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->writable == 0)
  100f98:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
  100f9c:	74 5a                	je     100ff8 <filewrite+0x78>
    return -1;
  if(f->type == FD_PIPE)
  100f9e:	8b 03                	mov    (%ebx),%eax
  100fa0:	83 f8 01             	cmp    $0x1,%eax
  100fa3:	74 5b                	je     101000 <filewrite+0x80>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
  100fa5:	83 f8 02             	cmp    $0x2,%eax
  100fa8:	75 6d                	jne    101017 <filewrite+0x97>
    ilock(f->ip);
  100faa:	8b 43 10             	mov    0x10(%ebx),%eax
  100fad:	89 04 24             	mov    %eax,(%esp)
  100fb0:	e8 7b 0e 00 00       	call   101e30 <ilock>
    if((r = writei(f->ip, addr, f->off, n)) > 0)
  100fb5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  100fb9:	8b 43 14             	mov    0x14(%ebx),%eax
  100fbc:	89 74 24 04          	mov    %esi,0x4(%esp)
  100fc0:	89 44 24 08          	mov    %eax,0x8(%esp)
  100fc4:	8b 43 10             	mov    0x10(%ebx),%eax
  100fc7:	89 04 24             	mov    %eax,(%esp)
  100fca:	e8 b1 07 00 00       	call   101780 <writei>
  100fcf:	85 c0                	test   %eax,%eax
  100fd1:	7e 03                	jle    100fd6 <filewrite+0x56>
      f->off += r;
  100fd3:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
  100fd6:	8b 53 10             	mov    0x10(%ebx),%edx
  100fd9:	89 14 24             	mov    %edx,(%esp)
  100fdc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100fdf:	e8 0c 0a 00 00       	call   1019f0 <iunlock>
    return r;
  100fe4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }
  panic("filewrite");
}
  100fe7:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  100fea:	8b 75 f8             	mov    -0x8(%ebp),%esi
  100fed:	8b 7d fc             	mov    -0x4(%ebp),%edi
  100ff0:	89 ec                	mov    %ebp,%esp
  100ff2:	5d                   	pop    %ebp
  100ff3:	c3                   	ret    
  100ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((r = writei(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("filewrite");
  100ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100ffd:	eb e8                	jmp    100fe7 <filewrite+0x67>
  100fff:	90                   	nop
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
  101000:	8b 43 0c             	mov    0xc(%ebx),%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("filewrite");
}
  101003:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101006:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101009:	8b 7d fc             	mov    -0x4(%ebp),%edi
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
  10100c:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("filewrite");
}
  10100f:	89 ec                	mov    %ebp,%esp
  101011:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
  101012:	e9 d9 1f 00 00       	jmp    102ff0 <pipewrite>
    if((r = writei(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("filewrite");
  101017:	c7 04 24 37 71 10 00 	movl   $0x107137,(%esp)
  10101e:	e8 2d fb ff ff       	call   100b50 <panic>
  101023:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101030 <fileread>:
}

// Read from file f.  Addr is kernel address.
int
fileread(struct file *f, char *addr, int n)
{
  101030:	55                   	push   %ebp
  101031:	89 e5                	mov    %esp,%ebp
  101033:	83 ec 38             	sub    $0x38,%esp
  101036:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101039:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10103c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10103f:	8b 75 0c             	mov    0xc(%ebp),%esi
  101042:	89 7d fc             	mov    %edi,-0x4(%ebp)
  101045:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
  101048:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
  10104c:	74 5a                	je     1010a8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
  10104e:	8b 03                	mov    (%ebx),%eax
  101050:	83 f8 01             	cmp    $0x1,%eax
  101053:	74 5b                	je     1010b0 <fileread+0x80>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
  101055:	83 f8 02             	cmp    $0x2,%eax
  101058:	75 6d                	jne    1010c7 <fileread+0x97>
    ilock(f->ip);
  10105a:	8b 43 10             	mov    0x10(%ebx),%eax
  10105d:	89 04 24             	mov    %eax,(%esp)
  101060:	e8 cb 0d 00 00       	call   101e30 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
  101065:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  101069:	8b 43 14             	mov    0x14(%ebx),%eax
  10106c:	89 74 24 04          	mov    %esi,0x4(%esp)
  101070:	89 44 24 08          	mov    %eax,0x8(%esp)
  101074:	8b 43 10             	mov    0x10(%ebx),%eax
  101077:	89 04 24             	mov    %eax,(%esp)
  10107a:	e8 71 05 00 00       	call   1015f0 <readi>
  10107f:	85 c0                	test   %eax,%eax
  101081:	7e 03                	jle    101086 <fileread+0x56>
      f->off += r;
  101083:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
  101086:	8b 53 10             	mov    0x10(%ebx),%edx
  101089:	89 14 24             	mov    %edx,(%esp)
  10108c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10108f:	e8 5c 09 00 00       	call   1019f0 <iunlock>
    return r;
  101094:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }
  panic("fileread");
}
  101097:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10109a:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10109d:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1010a0:	89 ec                	mov    %ebp,%esp
  1010a2:	5d                   	pop    %ebp
  1010a3:	c3                   	ret    
  1010a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
  1010a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1010ad:	eb e8                	jmp    101097 <fileread+0x67>
  1010af:	90                   	nop
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  1010b0:	8b 43 0c             	mov    0xc(%ebx),%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
  1010b3:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1010b6:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1010b9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  1010bc:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
  1010bf:	89 ec                	mov    %ebp,%esp
  1010c1:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  1010c2:	e9 29 1e 00 00       	jmp    102ef0 <piperead>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
  1010c7:	c7 04 24 41 71 10 00 	movl   $0x107141,(%esp)
  1010ce:	e8 7d fa ff ff       	call   100b50 <panic>
  1010d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1010d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001010e0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  1010e0:	55                   	push   %ebp
  if(f->type == FD_INODE){
  1010e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  1010e6:	89 e5                	mov    %esp,%ebp
  1010e8:	53                   	push   %ebx
  1010e9:	83 ec 14             	sub    $0x14,%esp
  1010ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
  1010ef:	83 3b 02             	cmpl   $0x2,(%ebx)
  1010f2:	74 0c                	je     101100 <filestat+0x20>
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
}
  1010f4:	83 c4 14             	add    $0x14,%esp
  1010f7:	5b                   	pop    %ebx
  1010f8:	5d                   	pop    %ebp
  1010f9:	c3                   	ret    
  1010fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
  if(f->type == FD_INODE){
    ilock(f->ip);
  101100:	8b 43 10             	mov    0x10(%ebx),%eax
  101103:	89 04 24             	mov    %eax,(%esp)
  101106:	e8 25 0d 00 00       	call   101e30 <ilock>
    stati(f->ip, st);
  10110b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10110e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101112:	8b 43 10             	mov    0x10(%ebx),%eax
  101115:	89 04 24             	mov    %eax,(%esp)
  101118:	e8 e3 01 00 00       	call   101300 <stati>
    iunlock(f->ip);
  10111d:	8b 43 10             	mov    0x10(%ebx),%eax
  101120:	89 04 24             	mov    %eax,(%esp)
  101123:	e8 c8 08 00 00       	call   1019f0 <iunlock>
    return 0;
  }
  return -1;
}
  101128:	83 c4 14             	add    $0x14,%esp
filestat(struct file *f, struct stat *st)
{
  if(f->type == FD_INODE){
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
  10112b:	31 c0                	xor    %eax,%eax
    return 0;
  }
  return -1;
}
  10112d:	5b                   	pop    %ebx
  10112e:	5d                   	pop    %ebp
  10112f:	c3                   	ret    

00101130 <filedup>:
}

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	53                   	push   %ebx
  101134:	83 ec 14             	sub    $0x14,%esp
  101137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
  10113a:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  101141:	e8 4a 34 00 00       	call   104590 <acquire>
  if(f->ref < 1)
  101146:	8b 43 04             	mov    0x4(%ebx),%eax
  101149:	85 c0                	test   %eax,%eax
  10114b:	7e 1a                	jle    101167 <filedup+0x37>
    panic("filedup");
  f->ref++;
  10114d:	83 c0 01             	add    $0x1,%eax
  101150:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
  101153:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  10115a:	e8 e1 33 00 00       	call   104540 <release>
  return f;
}
  10115f:	89 d8                	mov    %ebx,%eax
  101161:	83 c4 14             	add    $0x14,%esp
  101164:	5b                   	pop    %ebx
  101165:	5d                   	pop    %ebp
  101166:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  101167:	c7 04 24 4a 71 10 00 	movl   $0x10714a,(%esp)
  10116e:	e8 dd f9 ff ff       	call   100b50 <panic>
  101173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101180 <filealloc>:
}

// Allocate a file structure.
struct file*
filealloc(void)
{
  101180:	55                   	push   %ebp
  101181:	89 e5                	mov    %esp,%ebp
  101183:	53                   	push   %ebx
  initlock(&ftable.lock, "ftable");
}

// Allocate a file structure.
struct file*
filealloc(void)
  101184:	bb ec 61 11 00       	mov    $0x1161ec,%ebx
{
  101189:	83 ec 14             	sub    $0x14,%esp
  struct file *f;

  acquire(&ftable.lock);
  10118c:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  101193:	e8 f8 33 00 00       	call   104590 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
  101198:	8b 15 d8 61 11 00    	mov    0x1161d8,%edx
  10119e:	85 d2                	test   %edx,%edx
  1011a0:	75 11                	jne    1011b3 <filealloc+0x33>
  1011a2:	eb 4a                	jmp    1011ee <filealloc+0x6e>
  1011a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
  1011a8:	83 c3 18             	add    $0x18,%ebx
  1011ab:	81 fb 34 6b 11 00    	cmp    $0x116b34,%ebx
  1011b1:	74 25                	je     1011d8 <filealloc+0x58>
    if(f->ref == 0){
  1011b3:	8b 43 04             	mov    0x4(%ebx),%eax
  1011b6:	85 c0                	test   %eax,%eax
  1011b8:	75 ee                	jne    1011a8 <filealloc+0x28>
      f->ref = 1;
  1011ba:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
  1011c1:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  1011c8:	e8 73 33 00 00       	call   104540 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
  1011cd:	89 d8                	mov    %ebx,%eax
  1011cf:	83 c4 14             	add    $0x14,%esp
  1011d2:	5b                   	pop    %ebx
  1011d3:	5d                   	pop    %ebp
  1011d4:	c3                   	ret    
  1011d5:	8d 76 00             	lea    0x0(%esi),%esi
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
  1011d8:	31 db                	xor    %ebx,%ebx
  1011da:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  1011e1:	e8 5a 33 00 00       	call   104540 <release>
  return 0;
}
  1011e6:	89 d8                	mov    %ebx,%eax
  1011e8:	83 c4 14             	add    $0x14,%esp
  1011eb:	5b                   	pop    %ebx
  1011ec:	5d                   	pop    %ebp
  1011ed:	c3                   	ret    
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
  1011ee:	bb d4 61 11 00       	mov    $0x1161d4,%ebx
  1011f3:	eb c5                	jmp    1011ba <filealloc+0x3a>
  1011f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1011f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101200 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
  101200:	55                   	push   %ebp
  101201:	89 e5                	mov    %esp,%ebp
  101203:	83 ec 38             	sub    $0x38,%esp
  101206:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  101209:	8b 5d 08             	mov    0x8(%ebp),%ebx
  10120c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10120f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct file ff;

  acquire(&ftable.lock);
  101212:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  101219:	e8 72 33 00 00       	call   104590 <acquire>
  if(f->ref < 1)
  10121e:	8b 43 04             	mov    0x4(%ebx),%eax
  101221:	85 c0                	test   %eax,%eax
  101223:	0f 8e 9c 00 00 00    	jle    1012c5 <fileclose+0xc5>
    panic("fileclose");
  if(--f->ref > 0){
  101229:	83 e8 01             	sub    $0x1,%eax
  10122c:	85 c0                	test   %eax,%eax
  10122e:	89 43 04             	mov    %eax,0x4(%ebx)
  101231:	74 1d                	je     101250 <fileclose+0x50>
    release(&ftable.lock);
  101233:	c7 45 08 a0 61 11 00 	movl   $0x1161a0,0x8(%ebp)
  
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE)
    iput(ff.ip);
}
  10123a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10123d:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101240:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101243:	89 ec                	mov    %ebp,%esp
  101245:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
  101246:	e9 f5 32 00 00       	jmp    104540 <release>
  10124b:	90                   	nop
  10124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
  101250:	8b 43 0c             	mov    0xc(%ebx),%eax
  101253:	8b 7b 10             	mov    0x10(%ebx),%edi
  101256:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101259:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
  10125d:	88 45 e7             	mov    %al,-0x19(%ebp)
  101260:	8b 33                	mov    (%ebx),%esi
  f->ref = 0;
  101262:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  f->type = FD_NONE;
  101269:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  release(&ftable.lock);
  10126f:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  101276:	e8 c5 32 00 00       	call   104540 <release>
  
  if(ff.type == FD_PIPE)
  10127b:	83 fe 01             	cmp    $0x1,%esi
  10127e:	74 30                	je     1012b0 <fileclose+0xb0>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE)
  101280:	83 fe 02             	cmp    $0x2,%esi
  101283:	74 13                	je     101298 <fileclose+0x98>
    iput(ff.ip);
}
  101285:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101288:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10128b:	8b 7d fc             	mov    -0x4(%ebp),%edi
  10128e:	89 ec                	mov    %ebp,%esp
  101290:	5d                   	pop    %ebp
  101291:	c3                   	ret    
  101292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ftable.lock);
  
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE)
    iput(ff.ip);
  101298:	89 7d 08             	mov    %edi,0x8(%ebp)
}
  10129b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10129e:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1012a1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1012a4:	89 ec                	mov    %ebp,%esp
  1012a6:	5d                   	pop    %ebp
  release(&ftable.lock);
  
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE)
    iput(ff.ip);
  1012a7:	e9 54 08 00 00       	jmp    101b00 <iput>
  1012ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
  
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  1012b0:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  1012b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1012b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1012bb:	89 04 24             	mov    %eax,(%esp)
  1012be:	e8 1d 1e 00 00       	call   1030e0 <pipeclose>
  1012c3:	eb c0                	jmp    101285 <fileclose+0x85>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  1012c5:	c7 04 24 52 71 10 00 	movl   $0x107152,(%esp)
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
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
  1012e0:	55                   	push   %ebp
  1012e1:	89 e5                	mov    %esp,%ebp
  1012e3:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
  1012e6:	c7 44 24 04 5c 71 10 	movl   $0x10715c,0x4(%esp)
  1012ed:	00 
  1012ee:	c7 04 24 a0 61 11 00 	movl   $0x1161a0,(%esp)
  1012f5:	e8 06 31 00 00       	call   104400 <initlock>
}
  1012fa:	c9                   	leave  
  1012fb:	c3                   	ret    
  1012fc:	90                   	nop
  1012fd:	90                   	nop
  1012fe:	90                   	nop
  1012ff:	90                   	nop

00101300 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	8b 55 08             	mov    0x8(%ebp),%edx
  101306:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
  101309:	8b 0a                	mov    (%edx),%ecx
  10130b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
  10130e:	8b 4a 04             	mov    0x4(%edx),%ecx
  101311:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
  101314:	0f b7 4a 10          	movzwl 0x10(%edx),%ecx
  101318:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
  10131b:	0f b7 4a 16          	movzwl 0x16(%edx),%ecx
  10131f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
  101323:	8b 52 18             	mov    0x18(%edx),%edx
  101326:	89 50 10             	mov    %edx,0x10(%eax)
}
  101329:	5d                   	pop    %ebp
  10132a:	c3                   	ret    
  10132b:	90                   	nop
  10132c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00101330 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  101330:	55                   	push   %ebp
  101331:	89 e5                	mov    %esp,%ebp
  101333:	53                   	push   %ebx
  101334:	83 ec 14             	sub    $0x14,%esp
  101337:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
  10133a:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101341:	e8 4a 32 00 00       	call   104590 <acquire>
  ip->ref++;
  101346:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
  10134a:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101351:	e8 ea 31 00 00       	call   104540 <release>
  return ip;
}
  101356:	89 d8                	mov    %ebx,%eax
  101358:	83 c4 14             	add    $0x14,%esp
  10135b:	5b                   	pop    %ebx
  10135c:	5d                   	pop    %ebp
  10135d:	c3                   	ret    
  10135e:	66 90                	xchg   %ax,%ax

00101360 <iget>:

// Find the inode with number inum on device dev
// and return the in-memory copy.
static struct inode*
iget(uint dev, uint inum)
{
  101360:	55                   	push   %ebp
  101361:	89 e5                	mov    %esp,%ebp
  101363:	57                   	push   %edi
  101364:	89 d7                	mov    %edx,%edi
  101366:	56                   	push   %esi
}

// Find the inode with number inum on device dev
// and return the in-memory copy.
static struct inode*
iget(uint dev, uint inum)
  101367:	31 f6                	xor    %esi,%esi
{
  101369:	53                   	push   %ebx
  10136a:	89 c3                	mov    %eax,%ebx
  10136c:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
  10136f:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101376:	e8 15 32 00 00       	call   104590 <acquire>
}

// Find the inode with number inum on device dev
// and return the in-memory copy.
static struct inode*
iget(uint dev, uint inum)
  10137b:	b8 d4 6b 11 00       	mov    $0x116bd4,%eax
  101380:	eb 14                	jmp    101396 <iget+0x36>
  101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  101388:	85 f6                	test   %esi,%esi
  10138a:	74 3c                	je     1013c8 <iget+0x68>

  acquire(&icache.lock);

  // Try for cached inode.
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  10138c:	83 c0 50             	add    $0x50,%eax
  10138f:	3d 74 7b 11 00       	cmp    $0x117b74,%eax
  101394:	74 42                	je     1013d8 <iget+0x78>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
  101396:	8b 48 08             	mov    0x8(%eax),%ecx
  101399:	85 c9                	test   %ecx,%ecx
  10139b:	7e eb                	jle    101388 <iget+0x28>
  10139d:	39 18                	cmp    %ebx,(%eax)
  10139f:	75 e7                	jne    101388 <iget+0x28>
  1013a1:	39 78 04             	cmp    %edi,0x4(%eax)
  1013a4:	75 e2                	jne    101388 <iget+0x28>
      ip->ref++;
  1013a6:	83 c1 01             	add    $0x1,%ecx
  1013a9:	89 48 08             	mov    %ecx,0x8(%eax)
      release(&icache.lock);
  1013ac:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  1013b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1013b6:	e8 85 31 00 00       	call   104540 <release>
      return ip;
  1013bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
  1013be:	83 c4 2c             	add    $0x2c,%esp
  1013c1:	5b                   	pop    %ebx
  1013c2:	5e                   	pop    %esi
  1013c3:	5f                   	pop    %edi
  1013c4:	5d                   	pop    %ebp
  1013c5:	c3                   	ret    
  1013c6:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
  1013c8:	85 c9                	test   %ecx,%ecx
  1013ca:	75 c0                	jne    10138c <iget+0x2c>
  1013cc:	89 c6                	mov    %eax,%esi

  acquire(&icache.lock);

  // Try for cached inode.
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
  1013ce:	83 c0 50             	add    $0x50,%eax
  1013d1:	3d 74 7b 11 00       	cmp    $0x117b74,%eax
  1013d6:	75 be                	jne    101396 <iget+0x36>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Allocate fresh inode.
  if(empty == 0)
  1013d8:	85 f6                	test   %esi,%esi
  1013da:	74 29                	je     101405 <iget+0xa5>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
  1013dc:	89 1e                	mov    %ebx,(%esi)
  ip->inum = inum;
  1013de:	89 7e 04             	mov    %edi,0x4(%esi)
  ip->ref = 1;
  1013e1:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
  1013e8:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  release(&icache.lock);
  1013ef:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  1013f6:	e8 45 31 00 00       	call   104540 <release>

  return ip;
}
  1013fb:	83 c4 2c             	add    $0x2c,%esp
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
  1013fe:	89 f0                	mov    %esi,%eax

  return ip;
}
  101400:	5b                   	pop    %ebx
  101401:	5e                   	pop    %esi
  101402:	5f                   	pop    %edi
  101403:	5d                   	pop    %ebp
  101404:	c3                   	ret    
      empty = ip;
  }

  // Allocate fresh inode.
  if(empty == 0)
    panic("iget: no inodes");
  101405:	c7 04 24 63 71 10 00 	movl   $0x107163,(%esp)
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
static void itrunc(struct inode*);

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
  101420:	55                   	push   %ebp
  101421:	89 e5                	mov    %esp,%ebp
  101423:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;
  
  bp = bread(dev, 1);
  101426:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  10142d:	00 
static void itrunc(struct inode*);

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
  10142e:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  101431:	89 75 fc             	mov    %esi,-0x4(%ebp)
  101434:	89 d6                	mov    %edx,%esi
  struct buf *bp;
  
  bp = bread(dev, 1);
  101436:	89 04 24             	mov    %eax,(%esp)
  101439:	e8 12 ef ff ff       	call   100350 <bread>
  memmove(sb, bp->data, sizeof(*sb));
  10143e:	89 34 24             	mov    %esi,(%esp)
  101441:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
  101448:	00 
static void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;
  
  bp = bread(dev, 1);
  101449:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
  10144b:	8d 40 18             	lea    0x18(%eax),%eax
  10144e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101452:	e8 59 32 00 00       	call   1046b0 <memmove>
  brelse(bp);
  101457:	89 1c 24             	mov    %ebx,(%esp)
  10145a:	e8 41 ee ff ff       	call   1002a0 <brelse>
}
  10145f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  101462:	8b 75 fc             	mov    -0x4(%ebp),%esi
  101465:	89 ec                	mov    %ebp,%esp
  101467:	5d                   	pop    %ebp
  101468:	c3                   	ret    
  101469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101470 <balloc>:
// Blocks. 

// Allocate a disk block.
static uint
balloc(uint dev)
{
  101470:	55                   	push   %ebp
  101471:	89 e5                	mov    %esp,%ebp
  101473:	57                   	push   %edi
  101474:	56                   	push   %esi
  101475:	53                   	push   %ebx
  101476:	83 ec 3c             	sub    $0x3c,%esp
  int b, bi, m;
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  101479:	8d 55 dc             	lea    -0x24(%ebp),%edx
// Blocks. 

// Allocate a disk block.
static uint
balloc(uint dev)
{
  10147c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  int b, bi, m;
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  10147f:	e8 9c ff ff ff       	call   101420 <readsb>
  for(b = 0; b < sb.size; b += BPB){
  101484:	8b 45 dc             	mov    -0x24(%ebp),%eax
  101487:	85 c0                	test   %eax,%eax
  101489:	0f 84 9c 00 00 00    	je     10152b <balloc+0xbb>
  10148f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    bp = bread(dev, BBLOCK(b, sb.ninodes));
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
    for(bi = 0; bi < BPB; bi++){
  1014c0:	83 c3 01             	add    $0x1,%ebx
  1014c3:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
  1014c9:	74 45                	je     101510 <balloc+0xa0>
      m = 1 << (bi % 8);
  1014cb:	89 d9                	mov    %ebx,%ecx
  1014cd:	ba 01 00 00 00       	mov    $0x1,%edx
  1014d2:	83 e1 07             	and    $0x7,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  1014d5:	89 d8                	mov    %ebx,%eax
  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb.ninodes));
    for(bi = 0; bi < BPB; bi++){
      m = 1 << (bi % 8);
  1014d7:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  1014d9:	c1 f8 03             	sar    $0x3,%eax
  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb.ninodes));
    for(bi = 0; bi < BPB; bi++){
      m = 1 << (bi % 8);
  1014dc:	89 d1                	mov    %edx,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
  1014de:	0f b6 54 06 18       	movzbl 0x18(%esi,%eax,1),%edx
  1014e3:	0f b6 fa             	movzbl %dl,%edi
  1014e6:	85 cf                	test   %ecx,%edi
  1014e8:	75 d6                	jne    1014c0 <balloc+0x50>
        bp->data[bi/8] |= m;  // Mark block in use on disk.
  1014ea:	09 d1                	or     %edx,%ecx
  1014ec:	88 4c 06 18          	mov    %cl,0x18(%esi,%eax,1)
        bwrite(bp);
  1014f0:	89 34 24             	mov    %esi,(%esp)
  1014f3:	e8 28 ee ff ff       	call   100320 <bwrite>
        brelse(bp);
  1014f8:	89 34 24             	mov    %esi,(%esp)
  1014fb:	e8 a0 ed ff ff       	call   1002a0 <brelse>
  101500:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
  101503:	83 c4 3c             	add    $0x3c,%esp
    for(bi = 0; bi < BPB; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use on disk.
        bwrite(bp);
        brelse(bp);
  101506:	8d 04 13             	lea    (%ebx,%edx,1),%eax
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
  101509:	5b                   	pop    %ebx
  10150a:	5e                   	pop    %esi
  10150b:	5f                   	pop    %edi
  10150c:	5d                   	pop    %ebp
  10150d:	c3                   	ret    
  10150e:	66 90                	xchg   %ax,%ax
        bwrite(bp);
        brelse(bp);
        return b + bi;
      }
    }
    brelse(bp);
  101510:	89 34 24             	mov    %esi,(%esp)
  101513:	e8 88 ed ff ff       	call   1002a0 <brelse>
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
  101518:	81 45 d4 00 10 00 00 	addl   $0x1000,-0x2c(%ebp)
  10151f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  101522:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  101525:	0f 87 6b ff ff ff    	ja     101496 <balloc+0x26>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
  10152b:	c7 04 24 73 71 10 00 	movl   $0x107173,(%esp)
  101532:	e8 19 f6 ff ff       	call   100b50 <panic>
  101537:	89 f6                	mov    %esi,%esi
  101539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101540 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  101540:	55                   	push   %ebp
  101541:	89 e5                	mov    %esp,%ebp
  101543:	83 ec 38             	sub    $0x38,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  101546:	83 fa 0b             	cmp    $0xb,%edx

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
  101549:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  10154c:	89 c3                	mov    %eax,%ebx
  10154e:	89 75 f8             	mov    %esi,-0x8(%ebp)
  101551:	89 7d fc             	mov    %edi,-0x4(%ebp)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
  101554:	77 1a                	ja     101570 <bmap+0x30>
    if((addr = ip->addrs[bn]) == 0)
  101556:	8d 7a 04             	lea    0x4(%edx),%edi
  101559:	8b 44 b8 0c          	mov    0xc(%eax,%edi,4),%eax
  10155d:	85 c0                	test   %eax,%eax
  10155f:	74 5f                	je     1015c0 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
  101561:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101564:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101567:	8b 7d fc             	mov    -0x4(%ebp),%edi
  10156a:	89 ec                	mov    %ebp,%esp
  10156c:	5d                   	pop    %ebp
  10156d:	c3                   	ret    
  10156e:	66 90                	xchg   %ax,%ax
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
  101570:	8d 7a f4             	lea    -0xc(%edx),%edi

  if(bn < NINDIRECT){
  101573:	83 ff 7f             	cmp    $0x7f,%edi
  101576:	77 64                	ja     1015dc <bmap+0x9c>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
  101578:	8b 40 4c             	mov    0x4c(%eax),%eax
  10157b:	85 c0                	test   %eax,%eax
  10157d:	74 51                	je     1015d0 <bmap+0x90>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
  10157f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101583:	8b 03                	mov    (%ebx),%eax
  101585:	89 04 24             	mov    %eax,(%esp)
  101588:	e8 c3 ed ff ff       	call   100350 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
  10158d:	8d 7c b8 18          	lea    0x18(%eax,%edi,4),%edi

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
  101591:	89 c6                	mov    %eax,%esi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
  101593:	8b 07                	mov    (%edi),%eax
  101595:	85 c0                	test   %eax,%eax
  101597:	75 17                	jne    1015b0 <bmap+0x70>
      a[bn] = addr = balloc(ip->dev);
  101599:	8b 03                	mov    (%ebx),%eax
  10159b:	e8 d0 fe ff ff       	call   101470 <balloc>
  1015a0:	89 07                	mov    %eax,(%edi)
      bwrite(bp);
  1015a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1015a5:	89 34 24             	mov    %esi,(%esp)
  1015a8:	e8 73 ed ff ff       	call   100320 <bwrite>
  1015ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    brelse(bp);
  1015b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1015b3:	89 34 24             	mov    %esi,(%esp)
  1015b6:	e8 e5 ec ff ff       	call   1002a0 <brelse>
    return addr;
  1015bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1015be:	eb a1                	jmp    101561 <bmap+0x21>
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
  1015c0:	8b 03                	mov    (%ebx),%eax
  1015c2:	e8 a9 fe ff ff       	call   101470 <balloc>
  1015c7:	89 44 bb 0c          	mov    %eax,0xc(%ebx,%edi,4)
  1015cb:	eb 94                	jmp    101561 <bmap+0x21>
  1015cd:	8d 76 00             	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
  1015d0:	8b 03                	mov    (%ebx),%eax
  1015d2:	e8 99 fe ff ff       	call   101470 <balloc>
  1015d7:	89 43 4c             	mov    %eax,0x4c(%ebx)
  1015da:	eb a3                	jmp    10157f <bmap+0x3f>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
  1015dc:	c7 04 24 89 71 10 00 	movl   $0x107189,(%esp)
  1015e3:	e8 68 f5 ff ff       	call   100b50 <panic>
  1015e8:	90                   	nop
  1015e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001015f0 <readi>:
}

// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
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
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
  10160b:	66 83 7b 10 03       	cmpw   $0x3,0x10(%ebx)
  101610:	74 1e                	je     101630 <readi+0x40>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
  101612:	8b 43 18             	mov    0x18(%ebx),%eax
  101615:	39 f0                	cmp    %esi,%eax
  101617:	73 3f                	jae    101658 <readi+0x68>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
  101619:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  10161e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  101621:	8b 75 f8             	mov    -0x8(%ebp),%esi
  101624:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101627:	89 ec                	mov    %ebp,%esp
  101629:	5d                   	pop    %ebp
  10162a:	c3                   	ret    
  10162b:	90                   	nop
  10162c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
  101630:	0f b7 43 12          	movzwl 0x12(%ebx),%eax
  101634:	66 83 f8 09          	cmp    $0x9,%ax
  101638:	77 df                	ja     101619 <readi+0x29>
  10163a:	98                   	cwtl   
  10163b:	8b 04 c5 40 6b 11 00 	mov    0x116b40(,%eax,8),%eax
  101642:	85 c0                	test   %eax,%eax
  101644:	74 d3                	je     101619 <readi+0x29>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  101646:	89 4d 10             	mov    %ecx,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
  101649:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10164c:	8b 75 f8             	mov    -0x8(%ebp),%esi
  10164f:	8b 7d fc             	mov    -0x4(%ebp),%edi
  101652:	89 ec                	mov    %ebp,%esp
  101654:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  101655:	ff e0                	jmp    *%eax
  101657:	90                   	nop
  }

  if(off > ip->size || off + n < off)
  101658:	89 ca                	mov    %ecx,%edx
  10165a:	01 f2                	add    %esi,%edx
  10165c:	72 bb                	jb     101619 <readi+0x29>
    return -1;
  if(off + n > ip->size)
  10165e:	39 d0                	cmp    %edx,%eax
  101660:	73 04                	jae    101666 <readi+0x76>
    n = ip->size - off;
  101662:	89 c1                	mov    %eax,%ecx
  101664:	29 f1                	sub    %esi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  101666:	85 c9                	test   %ecx,%ecx
  101668:	74 7c                	je     1016e6 <readi+0xf6>
  10166a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
  101671:	89 7d e0             	mov    %edi,-0x20(%ebp)
  101674:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  101677:	90                   	nop
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  101678:	89 f2                	mov    %esi,%edx
  10167a:	89 d8                	mov    %ebx,%eax
  10167c:	c1 ea 09             	shr    $0x9,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
  10167f:	bf 00 02 00 00       	mov    $0x200,%edi
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  101684:	e8 b7 fe ff ff       	call   101540 <bmap>
  101689:	89 44 24 04          	mov    %eax,0x4(%esp)
  10168d:	8b 03                	mov    (%ebx),%eax
  10168f:	89 04 24             	mov    %eax,(%esp)
  101692:	e8 b9 ec ff ff       	call   100350 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
  101697:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10169a:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  10169d:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
  10169f:	89 f0                	mov    %esi,%eax
  1016a1:	25 ff 01 00 00       	and    $0x1ff,%eax
  1016a6:	29 c7                	sub    %eax,%edi
  1016a8:	39 cf                	cmp    %ecx,%edi
  1016aa:	76 02                	jbe    1016ae <readi+0xbe>
  1016ac:	89 cf                	mov    %ecx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
  1016ae:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  1016b2:	01 fe                	add    %edi,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
  1016b4:	89 7c 24 08          	mov    %edi,0x8(%esp)
  1016b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1016bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1016bf:	89 04 24             	mov    %eax,(%esp)
  1016c2:	89 55 d8             	mov    %edx,-0x28(%ebp)
  1016c5:	e8 e6 2f 00 00       	call   1046b0 <memmove>
    brelse(bp);
  1016ca:	8b 55 d8             	mov    -0x28(%ebp),%edx
  1016cd:	89 14 24             	mov    %edx,(%esp)
  1016d0:	e8 cb eb ff ff       	call   1002a0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
  1016d5:	01 7d e4             	add    %edi,-0x1c(%ebp)
  1016d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1016db:	01 7d e0             	add    %edi,-0x20(%ebp)
  1016de:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  1016e1:	77 95                	ja     101678 <readi+0x88>
  1016e3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
  1016e6:	89 c8                	mov    %ecx,%eax
  1016e8:	e9 31 ff ff ff       	jmp    10161e <readi+0x2e>
  1016ed:	8d 76 00             	lea    0x0(%esi),%esi

001016f0 <iupdate>:
}

// Copy inode, which has changed, from memory to disk.
void
iupdate(struct inode *ip)
{
  1016f0:	55                   	push   %ebp
  1016f1:	89 e5                	mov    %esp,%ebp
  1016f3:	56                   	push   %esi
  1016f4:	53                   	push   %ebx
  1016f5:	83 ec 10             	sub    $0x10,%esp
  1016f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum));
  1016fb:	8b 43 04             	mov    0x4(%ebx),%eax
  1016fe:	c1 e8 03             	shr    $0x3,%eax
  101701:	83 c0 02             	add    $0x2,%eax
  101704:	89 44 24 04          	mov    %eax,0x4(%esp)
  101708:	8b 03                	mov    (%ebx),%eax
  10170a:	89 04 24             	mov    %eax,(%esp)
  10170d:	e8 3e ec ff ff       	call   100350 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  101712:	0f b7 53 10          	movzwl 0x10(%ebx),%edx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum));
  101716:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  101718:	8b 43 04             	mov    0x4(%ebx),%eax
  10171b:	83 e0 07             	and    $0x7,%eax
  10171e:	c1 e0 06             	shl    $0x6,%eax
  101721:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
  dip->type = ip->type;
  101725:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
  101728:	0f b7 53 12          	movzwl 0x12(%ebx),%edx
  10172c:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
  101730:	0f b7 53 14          	movzwl 0x14(%ebx),%edx
  101734:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
  101738:	0f b7 53 16          	movzwl 0x16(%ebx),%edx
  10173c:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
  101740:	8b 53 18             	mov    0x18(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  101743:	83 c3 1c             	add    $0x1c,%ebx
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  101746:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  101749:	83 c0 0c             	add    $0xc,%eax
  10174c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  101750:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
  101757:	00 
  101758:	89 04 24             	mov    %eax,(%esp)
  10175b:	e8 50 2f 00 00       	call   1046b0 <memmove>
  bwrite(bp);
  101760:	89 34 24             	mov    %esi,(%esp)
  101763:	e8 b8 eb ff ff       	call   100320 <bwrite>
  brelse(bp);
  101768:	89 75 08             	mov    %esi,0x8(%ebp)
}
  10176b:	83 c4 10             	add    $0x10,%esp
  10176e:	5b                   	pop    %ebx
  10176f:	5e                   	pop    %esi
  101770:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  bwrite(bp);
  brelse(bp);
  101771:	e9 2a eb ff ff       	jmp    1002a0 <brelse>
  101776:	8d 76 00             	lea    0x0(%esi),%esi
  101779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101780 <writei>:
}

// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
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
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
  10179b:	66 83 7b 10 03       	cmpw   $0x3,0x10(%ebx)
  1017a0:	74 1e                	je     1017c0 <writei+0x40>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
  1017a2:	39 73 18             	cmp    %esi,0x18(%ebx)
  1017a5:	73 41                	jae    1017e8 <writei+0x68>

  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
  1017a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1017ac:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1017af:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1017b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1017b5:	89 ec                	mov    %ebp,%esp
  1017b7:	5d                   	pop    %ebp
  1017b8:	c3                   	ret    
  1017b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
  1017c0:	0f b7 43 12          	movzwl 0x12(%ebx),%eax
  1017c4:	66 83 f8 09          	cmp    $0x9,%ax
  1017c8:	77 dd                	ja     1017a7 <writei+0x27>
  1017ca:	98                   	cwtl   
  1017cb:	8b 04 c5 44 6b 11 00 	mov    0x116b44(,%eax,8),%eax
  1017d2:	85 c0                	test   %eax,%eax
  1017d4:	74 d1                	je     1017a7 <writei+0x27>
      return -1;
    return devsw[ip->major].write(ip, src, n);
  1017d6:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
  1017d9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  1017dc:	8b 75 f8             	mov    -0x8(%ebp),%esi
  1017df:	8b 7d fc             	mov    -0x4(%ebp),%edi
  1017e2:	89 ec                	mov    %ebp,%esp
  1017e4:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  1017e5:	ff e0                	jmp    *%eax
  1017e7:	90                   	nop
  }

  if(off > ip->size || off + n < off)
  1017e8:	89 c8                	mov    %ecx,%eax
  1017ea:	01 f0                	add    %esi,%eax
  1017ec:	72 b9                	jb     1017a7 <writei+0x27>
    return -1;
  if(off + n > MAXFILE*BSIZE)
  1017ee:	3d 00 18 01 00       	cmp    $0x11800,%eax
  1017f3:	76 07                	jbe    1017fc <writei+0x7c>
    n = MAXFILE*BSIZE - off;
  1017f5:	b9 00 18 01 00       	mov    $0x11800,%ecx
  1017fa:	29 f1                	sub    %esi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  1017fc:	85 c9                	test   %ecx,%ecx
  1017fe:	0f 84 92 00 00 00    	je     101896 <writei+0x116>
  101804:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
  10180b:	89 7d e0             	mov    %edi,-0x20(%ebp)
  10180e:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  101811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(off + n > MAXFILE*BSIZE)
    n = MAXFILE*BSIZE - off;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  101818:	89 f2                	mov    %esi,%edx
  10181a:	89 d8                	mov    %ebx,%eax
  10181c:	c1 ea 09             	shr    $0x9,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
  10181f:	bf 00 02 00 00       	mov    $0x200,%edi
    return -1;
  if(off + n > MAXFILE*BSIZE)
    n = MAXFILE*BSIZE - off;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  101824:	e8 17 fd ff ff       	call   101540 <bmap>
  101829:	89 44 24 04          	mov    %eax,0x4(%esp)
  10182d:	8b 03                	mov    (%ebx),%eax
  10182f:	89 04 24             	mov    %eax,(%esp)
  101832:	e8 19 eb ff ff       	call   100350 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
  101837:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10183a:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    n = MAXFILE*BSIZE - off;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
  10183d:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
  10183f:	89 f0                	mov    %esi,%eax
  101841:	25 ff 01 00 00       	and    $0x1ff,%eax
  101846:	29 c7                	sub    %eax,%edi
  101848:	39 cf                	cmp    %ecx,%edi
  10184a:	76 02                	jbe    10184e <writei+0xce>
  10184c:	89 cf                	mov    %ecx,%edi
    memmove(bp->data + off%BSIZE, src, m);
  10184e:	89 7c 24 08          	mov    %edi,0x8(%esp)
  101852:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  101855:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
  101859:	89 04 24             	mov    %eax,(%esp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    n = MAXFILE*BSIZE - off;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  10185c:	01 fe                	add    %edi,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
  10185e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  101862:	89 55 d8             	mov    %edx,-0x28(%ebp)
  101865:	e8 46 2e 00 00       	call   1046b0 <memmove>
    bwrite(bp);
  10186a:	8b 55 d8             	mov    -0x28(%ebp),%edx
  10186d:	89 14 24             	mov    %edx,(%esp)
  101870:	e8 ab ea ff ff       	call   100320 <bwrite>
    brelse(bp);
  101875:	8b 55 d8             	mov    -0x28(%ebp),%edx
  101878:	89 14 24             	mov    %edx,(%esp)
  10187b:	e8 20 ea ff ff       	call   1002a0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    n = MAXFILE*BSIZE - off;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
  101880:	01 7d e4             	add    %edi,-0x1c(%ebp)
  101883:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101886:	01 7d e0             	add    %edi,-0x20(%ebp)
  101889:	39 45 dc             	cmp    %eax,-0x24(%ebp)
  10188c:	77 8a                	ja     101818 <writei+0x98>
    memmove(bp->data + off%BSIZE, src, m);
    bwrite(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
  10188e:	3b 73 18             	cmp    0x18(%ebx),%esi
  101891:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  101894:	77 07                	ja     10189d <writei+0x11d>
    ip->size = off;
    iupdate(ip);
  }
  return n;
  101896:	89 c8                	mov    %ecx,%eax
  101898:	e9 0f ff ff ff       	jmp    1017ac <writei+0x2c>
    bwrite(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
  10189d:	89 73 18             	mov    %esi,0x18(%ebx)
    iupdate(ip);
  1018a0:	89 1c 24             	mov    %ebx,(%esp)
  1018a3:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1018a6:	e8 45 fe ff ff       	call   1016f0 <iupdate>
  1018ab:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  }
  return n;
  1018ae:	89 c8                	mov    %ecx,%eax
  1018b0:	e9 f7 fe ff ff       	jmp    1017ac <writei+0x2c>
  1018b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1018b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001018c0 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
  1018c0:	55                   	push   %ebp
  1018c1:	89 e5                	mov    %esp,%ebp
  1018c3:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
  1018c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1018c9:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  1018d0:	00 
  1018d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d8:	89 04 24             	mov    %eax,(%esp)
  1018db:	e8 40 2e 00 00       	call   104720 <strncmp>
}
  1018e0:	c9                   	leave  
  1018e1:	c3                   	ret    
  1018e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1018e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001018f0 <dirlookup>:
// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
// Caller must have already locked dp.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
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
  uint off, inum;
  struct buf *bp;
  struct dirent *de;

  if(dp->type != T_DIR)
  101908:	66 83 78 10 01       	cmpw   $0x1,0x10(%eax)
  10190d:	0f 85 d0 00 00 00    	jne    1019e3 <dirlookup+0xf3>
    panic("dirlookup not DIR");
  101913:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

  for(off = 0; off < dp->size; off += BSIZE){
  10191a:	8b 48 18             	mov    0x18(%eax),%ecx
  10191d:	85 c9                	test   %ecx,%ecx
  10191f:	0f 84 b4 00 00 00    	je     1019d9 <dirlookup+0xe9>
    bp = bread(dp->dev, bmap(dp, off / BSIZE));
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

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
// Caller must have already locked dp.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
  101947:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += BSIZE){
    bp = bread(dp->dev, bmap(dp, off / BSIZE));
    for(de = (struct dirent*)bp->data;
  10194a:	83 c0 18             	add    $0x18,%eax
  10194d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  101950:	89 c6                	mov    %eax,%esi

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
// Caller must have already locked dp.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
  101952:	81 c7 18 02 00 00    	add    $0x218,%edi
  101958:	eb 0d                	jmp    101967 <dirlookup+0x77>
  10195a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(off = 0; off < dp->size; off += BSIZE){
    bp = bread(dp->dev, bmap(dp, off / BSIZE));
    for(de = (struct dirent*)bp->data;
        de < (struct dirent*)(bp->data + BSIZE);
        de++){
  101960:	83 c6 10             	add    $0x10,%esi
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += BSIZE){
    bp = bread(dp->dev, bmap(dp, off / BSIZE));
    for(de = (struct dirent*)bp->data;
  101963:	39 fe                	cmp    %edi,%esi
  101965:	74 51                	je     1019b8 <dirlookup+0xc8>
        de < (struct dirent*)(bp->data + BSIZE);
        de++){
      if(de->inum == 0)
  101967:	66 83 3e 00          	cmpw   $0x0,(%esi)
  10196b:	74 f3                	je     101960 <dirlookup+0x70>
        continue;
      if(namecmp(name, de->name) == 0){
  10196d:	8d 46 02             	lea    0x2(%esi),%eax
  101970:	89 44 24 04          	mov    %eax,0x4(%esp)
  101974:	89 1c 24             	mov    %ebx,(%esp)
  101977:	e8 44 ff ff ff       	call   1018c0 <namecmp>
  10197c:	85 c0                	test   %eax,%eax
  10197e:	75 e0                	jne    101960 <dirlookup+0x70>
        // entry matches path element
        if(poff)
  101980:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  101983:	85 d2                	test   %edx,%edx
  101985:	74 0e                	je     101995 <dirlookup+0xa5>
          *poff = off + (uchar*)de - bp->data;
  101987:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10198a:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  10198d:	8d 04 16             	lea    (%esi,%edx,1),%eax
  101990:	2b 45 d8             	sub    -0x28(%ebp),%eax
  101993:	89 01                	mov    %eax,(%ecx)
        inum = de->inum;
        brelse(bp);
  101995:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        continue;
      if(namecmp(name, de->name) == 0){
        // entry matches path element
        if(poff)
          *poff = off + (uchar*)de - bp->data;
        inum = de->inum;
  101998:	0f b7 1e             	movzwl (%esi),%ebx
        brelse(bp);
  10199b:	89 04 24             	mov    %eax,(%esp)
  10199e:	e8 fd e8 ff ff       	call   1002a0 <brelse>
        return iget(dp->dev, inum);
  1019a3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1019a6:	89 da                	mov    %ebx,%edx
  1019a8:	8b 01                	mov    (%ecx),%eax
      }
    }
    brelse(bp);
  }
  return 0;
}
  1019aa:	83 c4 3c             	add    $0x3c,%esp
  1019ad:	5b                   	pop    %ebx
  1019ae:	5e                   	pop    %esi
  1019af:	5f                   	pop    %edi
  1019b0:	5d                   	pop    %ebp
        // entry matches path element
        if(poff)
          *poff = off + (uchar*)de - bp->data;
        inum = de->inum;
        brelse(bp);
        return iget(dp->dev, inum);
  1019b1:	e9 aa f9 ff ff       	jmp    101360 <iget>
  1019b6:	66 90                	xchg   %ax,%ax
      }
    }
    brelse(bp);
  1019b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1019bb:	89 04 24             	mov    %eax,(%esp)
  1019be:	e8 dd e8 ff ff       	call   1002a0 <brelse>
  struct dirent *de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += BSIZE){
  1019c3:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1019c6:	81 45 e0 00 02 00 00 	addl   $0x200,-0x20(%ebp)
  1019cd:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  1019d0:	39 4a 18             	cmp    %ecx,0x18(%edx)
  1019d3:	0f 87 4c ff ff ff    	ja     101925 <dirlookup+0x35>
      }
    }
    brelse(bp);
  }
  return 0;
}
  1019d9:	83 c4 3c             	add    $0x3c,%esp
  1019dc:	31 c0                	xor    %eax,%eax
  1019de:	5b                   	pop    %ebx
  1019df:	5e                   	pop    %esi
  1019e0:	5f                   	pop    %edi
  1019e1:	5d                   	pop    %ebp
  1019e2:	c3                   	ret    
  uint off, inum;
  struct buf *bp;
  struct dirent *de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
  1019e3:	c7 04 24 9c 71 10 00 	movl   $0x10719c,(%esp)
  1019ea:	e8 61 f1 ff ff       	call   100b50 <panic>
  1019ef:	90                   	nop

001019f0 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  1019f0:	55                   	push   %ebp
  1019f1:	89 e5                	mov    %esp,%ebp
  1019f3:	53                   	push   %ebx
  1019f4:	83 ec 14             	sub    $0x14,%esp
  1019f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
  1019fa:	85 db                	test   %ebx,%ebx
  1019fc:	74 36                	je     101a34 <iunlock+0x44>
  1019fe:	f6 43 0c 01          	testb  $0x1,0xc(%ebx)
  101a02:	74 30                	je     101a34 <iunlock+0x44>
  101a04:	8b 43 08             	mov    0x8(%ebx),%eax
  101a07:	85 c0                	test   %eax,%eax
  101a09:	7e 29                	jle    101a34 <iunlock+0x44>
    panic("iunlock");

  acquire(&icache.lock);
  101a0b:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101a12:	e8 79 2b 00 00       	call   104590 <acquire>
  ip->flags &= ~I_BUSY;
  101a17:	83 63 0c fe          	andl   $0xfffffffe,0xc(%ebx)
  wakeup(ip);
  101a1b:	89 1c 24             	mov    %ebx,(%esp)
  101a1e:	e8 cd 18 00 00       	call   1032f0 <wakeup>
  release(&icache.lock);
  101a23:	c7 45 08 a0 6b 11 00 	movl   $0x116ba0,0x8(%ebp)
}
  101a2a:	83 c4 14             	add    $0x14,%esp
  101a2d:	5b                   	pop    %ebx
  101a2e:	5d                   	pop    %ebp
    panic("iunlock");

  acquire(&icache.lock);
  ip->flags &= ~I_BUSY;
  wakeup(ip);
  release(&icache.lock);
  101a2f:	e9 0c 2b 00 00       	jmp    104540 <release>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
    panic("iunlock");
  101a34:	c7 04 24 ae 71 10 00 	movl   $0x1071ae,(%esp)
  101a3b:	e8 10 f1 ff ff       	call   100b50 <panic>

00101a40 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
  101a40:	55                   	push   %ebp
  101a41:	89 e5                	mov    %esp,%ebp
  101a43:	57                   	push   %edi
  101a44:	56                   	push   %esi
  101a45:	89 c6                	mov    %eax,%esi
  101a47:	53                   	push   %ebx
  101a48:	89 d3                	mov    %edx,%ebx
  101a4a:	83 ec 2c             	sub    $0x2c,%esp
static void
bzero(int dev, int bno)
{
  struct buf *bp;
  
  bp = bread(dev, bno);
  101a4d:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a51:	89 04 24             	mov    %eax,(%esp)
  101a54:	e8 f7 e8 ff ff       	call   100350 <bread>
  memset(bp->data, 0, BSIZE);
  101a59:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  101a60:	00 
  101a61:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  101a68:	00 
static void
bzero(int dev, int bno)
{
  struct buf *bp;
  
  bp = bread(dev, bno);
  101a69:	89 c7                	mov    %eax,%edi
  memset(bp->data, 0, BSIZE);
  101a6b:	8d 40 18             	lea    0x18(%eax),%eax
  101a6e:	89 04 24             	mov    %eax,(%esp)
  101a71:	e8 ba 2b 00 00       	call   104630 <memset>
  bwrite(bp);
  101a76:	89 3c 24             	mov    %edi,(%esp)
  101a79:	e8 a2 e8 ff ff       	call   100320 <bwrite>
  brelse(bp);
  101a7e:	89 3c 24             	mov    %edi,(%esp)
  101a81:	e8 1a e8 ff ff       	call   1002a0 <brelse>
  struct superblock sb;
  int bi, m;

  bzero(dev, b);

  readsb(dev, &sb);
  101a86:	89 f0                	mov    %esi,%eax
  101a88:	8d 55 dc             	lea    -0x24(%ebp),%edx
  101a8b:	e8 90 f9 ff ff       	call   101420 <readsb>
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  101a90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101a93:	89 da                	mov    %ebx,%edx
  101a95:	c1 ea 0c             	shr    $0xc,%edx
  101a98:	89 34 24             	mov    %esi,(%esp)
  bi = b % BPB;
  m = 1 << (bi % 8);
  101a9b:	be 01 00 00 00       	mov    $0x1,%esi
  int bi, m;

  bzero(dev, b);

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  101aa0:	c1 e8 03             	shr    $0x3,%eax
  101aa3:	8d 44 10 03          	lea    0x3(%eax,%edx,1),%eax
  101aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aab:	e8 a0 e8 ff ff       	call   100350 <bread>
  bi = b % BPB;
  101ab0:	89 da                	mov    %ebx,%edx
  m = 1 << (bi % 8);
  101ab2:	89 d9                	mov    %ebx,%ecx

  bzero(dev, b);

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  bi = b % BPB;
  101ab4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  m = 1 << (bi % 8);
  101aba:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
  101abd:	c1 fa 03             	sar    $0x3,%edx
  bzero(dev, b);

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  bi = b % BPB;
  m = 1 << (bi % 8);
  101ac0:	d3 e6                	shl    %cl,%esi
  if((bp->data[bi/8] & m) == 0)
  101ac2:	0f b6 4c 10 18       	movzbl 0x18(%eax,%edx,1),%ecx
  int bi, m;

  bzero(dev, b);

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  101ac7:	89 c7                	mov    %eax,%edi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
  101ac9:	0f b6 c1             	movzbl %cl,%eax
  101acc:	85 f0                	test   %esi,%eax
  101ace:	74 22                	je     101af2 <bfree+0xb2>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;  // Mark block free on disk.
  101ad0:	89 f0                	mov    %esi,%eax
  101ad2:	f7 d0                	not    %eax
  101ad4:	21 c8                	and    %ecx,%eax
  101ad6:	88 44 17 18          	mov    %al,0x18(%edi,%edx,1)
  bwrite(bp);
  101ada:	89 3c 24             	mov    %edi,(%esp)
  101add:	e8 3e e8 ff ff       	call   100320 <bwrite>
  brelse(bp);
  101ae2:	89 3c 24             	mov    %edi,(%esp)
  101ae5:	e8 b6 e7 ff ff       	call   1002a0 <brelse>
}
  101aea:	83 c4 2c             	add    $0x2c,%esp
  101aed:	5b                   	pop    %ebx
  101aee:	5e                   	pop    %esi
  101aef:	5f                   	pop    %edi
  101af0:	5d                   	pop    %ebp
  101af1:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb.ninodes));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  101af2:	c7 04 24 b6 71 10 00 	movl   $0x1071b6,(%esp)
  101af9:	e8 52 f0 ff ff       	call   100b50 <panic>
  101afe:	66 90                	xchg   %ax,%ax

00101b00 <iput>:
}

// Caller holds reference to unlocked ip.  Drop reference.
void
iput(struct inode *ip)
{
  101b00:	55                   	push   %ebp
  101b01:	89 e5                	mov    %esp,%ebp
  101b03:	57                   	push   %edi
  101b04:	56                   	push   %esi
  101b05:	53                   	push   %ebx
  101b06:	83 ec 2c             	sub    $0x2c,%esp
  101b09:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
  101b0c:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101b13:	e8 78 2a 00 00       	call   104590 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
  101b18:	8b 46 08             	mov    0x8(%esi),%eax
  101b1b:	83 f8 01             	cmp    $0x1,%eax
  101b1e:	0f 85 a1 00 00 00    	jne    101bc5 <iput+0xc5>
  101b24:	8b 56 0c             	mov    0xc(%esi),%edx
  101b27:	f6 c2 02             	test   $0x2,%dl
  101b2a:	0f 84 95 00 00 00    	je     101bc5 <iput+0xc5>
  101b30:	66 83 7e 16 00       	cmpw   $0x0,0x16(%esi)
  101b35:	0f 85 8a 00 00 00    	jne    101bc5 <iput+0xc5>
    // inode is no longer used: truncate and free inode.
    if(ip->flags & I_BUSY)
  101b3b:	f6 c2 01             	test   $0x1,%dl
  101b3e:	66 90                	xchg   %ax,%ax
  101b40:	0f 85 f8 00 00 00    	jne    101c3e <iput+0x13e>
      panic("iput busy");
    ip->flags |= I_BUSY;
  101b46:	83 ca 01             	or     $0x1,%edx
    release(&icache.lock);
  101b49:	89 f3                	mov    %esi,%ebx
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode is no longer used: truncate and free inode.
    if(ip->flags & I_BUSY)
      panic("iput busy");
    ip->flags |= I_BUSY;
  101b4b:	89 56 0c             	mov    %edx,0xc(%esi)
  release(&icache.lock);
}

// Caller holds reference to unlocked ip.  Drop reference.
void
iput(struct inode *ip)
  101b4e:	8d 7e 30             	lea    0x30(%esi),%edi
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode is no longer used: truncate and free inode.
    if(ip->flags & I_BUSY)
      panic("iput busy");
    ip->flags |= I_BUSY;
    release(&icache.lock);
  101b51:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101b58:	e8 e3 29 00 00       	call   104540 <release>
  101b5d:	eb 08                	jmp    101b67 <iput+0x67>
  101b5f:	90                   	nop
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    if(ip->addrs[i]){
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
  101b60:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  101b63:	39 fb                	cmp    %edi,%ebx
  101b65:	74 1c                	je     101b83 <iput+0x83>
    if(ip->addrs[i]){
  101b67:	8b 53 1c             	mov    0x1c(%ebx),%edx
  101b6a:	85 d2                	test   %edx,%edx
  101b6c:	74 f2                	je     101b60 <iput+0x60>
      bfree(ip->dev, ip->addrs[i]);
  101b6e:	8b 06                	mov    (%esi),%eax
  101b70:	e8 cb fe ff ff       	call   101a40 <bfree>
      ip->addrs[i] = 0;
  101b75:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
  101b7c:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
  101b7f:	39 fb                	cmp    %edi,%ebx
  101b81:	75 e4                	jne    101b67 <iput+0x67>
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
  101b83:	8b 46 4c             	mov    0x4c(%esi),%eax
  101b86:	85 c0                	test   %eax,%eax
  101b88:	75 56                	jne    101be0 <iput+0xe0>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  101b8a:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
  iupdate(ip);
  101b91:	89 34 24             	mov    %esi,(%esp)
  101b94:	e8 57 fb ff ff       	call   1016f0 <iupdate>
    if(ip->flags & I_BUSY)
      panic("iput busy");
    ip->flags |= I_BUSY;
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
  101b99:	66 c7 46 10 00 00    	movw   $0x0,0x10(%esi)
    iupdate(ip);
  101b9f:	89 34 24             	mov    %esi,(%esp)
  101ba2:	e8 49 fb ff ff       	call   1016f0 <iupdate>
    acquire(&icache.lock);
  101ba7:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101bae:	e8 dd 29 00 00       	call   104590 <acquire>
    ip->flags = 0;
  101bb3:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
    wakeup(ip);
  101bba:	89 34 24             	mov    %esi,(%esp)
  101bbd:	e8 2e 17 00 00       	call   1032f0 <wakeup>
  101bc2:	8b 46 08             	mov    0x8(%esi),%eax
  }
  ip->ref--;
  101bc5:	83 e8 01             	sub    $0x1,%eax
  101bc8:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
  101bcb:	c7 45 08 a0 6b 11 00 	movl   $0x116ba0,0x8(%ebp)
}
  101bd2:	83 c4 2c             	add    $0x2c,%esp
  101bd5:	5b                   	pop    %ebx
  101bd6:	5e                   	pop    %esi
  101bd7:	5f                   	pop    %edi
  101bd8:	5d                   	pop    %ebp
    acquire(&icache.lock);
    ip->flags = 0;
    wakeup(ip);
  }
  ip->ref--;
  release(&icache.lock);
  101bd9:	e9 62 29 00 00       	jmp    104540 <release>
  101bde:	66 90                	xchg   %ax,%ax
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
  101be0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be4:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
  101be6:	31 db                	xor    %ebx,%ebx
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
  101be8:	89 04 24             	mov    %eax,(%esp)
  101beb:	e8 60 e7 ff ff       	call   100350 <bread>
    a = (uint*)bp->data;
  101bf0:	89 c7                	mov    %eax,%edi
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
  101bf2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
  101bf5:	83 c7 18             	add    $0x18,%edi
  101bf8:	31 c0                	xor    %eax,%eax
  101bfa:	eb 11                	jmp    101c0d <iput+0x10d>
  101bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(j = 0; j < NINDIRECT; j++){
  101c00:	83 c3 01             	add    $0x1,%ebx
  101c03:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
  101c09:	89 d8                	mov    %ebx,%eax
  101c0b:	74 10                	je     101c1d <iput+0x11d>
      if(a[j])
  101c0d:	8b 14 87             	mov    (%edi,%eax,4),%edx
  101c10:	85 d2                	test   %edx,%edx
  101c12:	74 ec                	je     101c00 <iput+0x100>
        bfree(ip->dev, a[j]);
  101c14:	8b 06                	mov    (%esi),%eax
  101c16:	e8 25 fe ff ff       	call   101a40 <bfree>
  101c1b:	eb e3                	jmp    101c00 <iput+0x100>
    }
    brelse(bp);
  101c1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101c20:	89 04 24             	mov    %eax,(%esp)
  101c23:	e8 78 e6 ff ff       	call   1002a0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
  101c28:	8b 56 4c             	mov    0x4c(%esi),%edx
  101c2b:	8b 06                	mov    (%esi),%eax
  101c2d:	e8 0e fe ff ff       	call   101a40 <bfree>
    ip->addrs[NDIRECT] = 0;
  101c32:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  101c39:	e9 4c ff ff ff       	jmp    101b8a <iput+0x8a>
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode is no longer used: truncate and free inode.
    if(ip->flags & I_BUSY)
      panic("iput busy");
  101c3e:	c7 04 24 c9 71 10 00 	movl   $0x1071c9,(%esp)
  101c45:	e8 06 ef ff ff       	call   100b50 <panic>
  101c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101c50 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
  101c50:	55                   	push   %ebp
  101c51:	89 e5                	mov    %esp,%ebp
  101c53:	57                   	push   %edi
  101c54:	56                   	push   %esi
  101c55:	53                   	push   %ebx
  101c56:	83 ec 2c             	sub    $0x2c,%esp
  101c59:	8b 75 08             	mov    0x8(%ebp),%esi
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
  101c5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  101c5f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  101c66:	00 
  101c67:	89 34 24             	mov    %esi,(%esp)
  101c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6e:	e8 7d fc ff ff       	call   1018f0 <dirlookup>
  101c73:	85 c0                	test   %eax,%eax
  101c75:	0f 85 89 00 00 00    	jne    101d04 <dirlink+0xb4>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  101c7b:	8b 56 18             	mov    0x18(%esi),%edx
  101c7e:	85 d2                	test   %edx,%edx
  101c80:	0f 84 8d 00 00 00    	je     101d13 <dirlink+0xc3>
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
    return -1;
  101c86:	8d 7d d8             	lea    -0x28(%ebp),%edi
  101c89:	31 db                	xor    %ebx,%ebx
  101c8b:	eb 0b                	jmp    101c98 <dirlink+0x48>
  101c8d:	8d 76 00             	lea    0x0(%esi),%esi
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  101c90:	83 c3 10             	add    $0x10,%ebx
  101c93:	39 5e 18             	cmp    %ebx,0x18(%esi)
  101c96:	76 24                	jbe    101cbc <dirlink+0x6c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  101c98:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  101c9f:	00 
  101ca0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  101ca4:	89 7c 24 04          	mov    %edi,0x4(%esp)
  101ca8:	89 34 24             	mov    %esi,(%esp)
  101cab:	e8 40 f9 ff ff       	call   1015f0 <readi>
  101cb0:	83 f8 10             	cmp    $0x10,%eax
  101cb3:	75 65                	jne    101d1a <dirlink+0xca>
      panic("dirlink read");
    if(de.inum == 0)
  101cb5:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
  101cba:	75 d4                	jne    101c90 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  101cbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  101cbf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  101cc6:	00 
  101cc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ccb:	8d 45 da             	lea    -0x26(%ebp),%eax
  101cce:	89 04 24             	mov    %eax,(%esp)
  101cd1:	e8 aa 2a 00 00       	call   104780 <strncpy>
  de.inum = inum;
  101cd6:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  101cd9:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  101ce0:	00 
  101ce1:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  101ce5:	89 7c 24 04          	mov    %edi,0x4(%esp)
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  101ce9:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  101ced:	89 34 24             	mov    %esi,(%esp)
  101cf0:	e8 8b fa ff ff       	call   101780 <writei>
  101cf5:	83 f8 10             	cmp    $0x10,%eax
  101cf8:	75 2c                	jne    101d26 <dirlink+0xd6>
    panic("dirlink");
  101cfa:	31 c0                	xor    %eax,%eax
  
  return 0;
}
  101cfc:	83 c4 2c             	add    $0x2c,%esp
  101cff:	5b                   	pop    %ebx
  101d00:	5e                   	pop    %esi
  101d01:	5f                   	pop    %edi
  101d02:	5d                   	pop    %ebp
  101d03:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
  101d04:	89 04 24             	mov    %eax,(%esp)
  101d07:	e8 f4 fd ff ff       	call   101b00 <iput>
  101d0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
  101d11:	eb e9                	jmp    101cfc <dirlink+0xac>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
  101d13:	8d 7d d8             	lea    -0x28(%ebp),%edi
  101d16:	31 db                	xor    %ebx,%ebx
  101d18:	eb a2                	jmp    101cbc <dirlink+0x6c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
  101d1a:	c7 04 24 d3 71 10 00 	movl   $0x1071d3,(%esp)
  101d21:	e8 2a ee ff ff       	call   100b50 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
  101d26:	c7 04 24 c6 77 10 00 	movl   $0x1077c6,(%esp)
  101d2d:	e8 1e ee ff ff       	call   100b50 <panic>
  101d32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101d40 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  101d40:	55                   	push   %ebp
  101d41:	89 e5                	mov    %esp,%ebp
  101d43:	53                   	push   %ebx
  101d44:	83 ec 14             	sub    $0x14,%esp
  101d47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
  101d4a:	89 1c 24             	mov    %ebx,(%esp)
  101d4d:	e8 9e fc ff ff       	call   1019f0 <iunlock>
  iput(ip);
  101d52:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
  101d55:	83 c4 14             	add    $0x14,%esp
  101d58:	5b                   	pop    %ebx
  101d59:	5d                   	pop    %ebp
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
  101d5a:	e9 a1 fd ff ff       	jmp    101b00 <iput>
  101d5f:	90                   	nop

00101d60 <ialloc>:
static struct inode* iget(uint dev, uint inum);

// Allocate a new inode with the given type on device dev.
struct inode*
ialloc(uint dev, short type)
{
  101d60:	55                   	push   %ebp
  101d61:	89 e5                	mov    %esp,%ebp
  101d63:	57                   	push   %edi
  101d64:	56                   	push   %esi
  101d65:	53                   	push   %ebx
  101d66:	83 ec 3c             	sub    $0x3c,%esp
  101d69:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
  int inum;
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
  101d6d:	8d 55 dc             	lea    -0x24(%ebp),%edx
static struct inode* iget(uint dev, uint inum);

// Allocate a new inode with the given type on device dev.
struct inode*
ialloc(uint dev, short type)
{
  101d70:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
  101d74:	8b 45 08             	mov    0x8(%ebp),%eax
  101d77:	e8 a4 f6 ff ff       	call   101420 <readsb>
  for(inum = 1; inum < sb.ninodes; inum++){  // loop over inode blocks
  101d7c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
  101d80:	0f 86 96 00 00 00    	jbe    101e1c <ialloc+0xbc>
  101d86:	be 01 00 00 00       	mov    $0x1,%esi
  101d8b:	bb 01 00 00 00       	mov    $0x1,%ebx
  101d90:	eb 18                	jmp    101daa <ialloc+0x4a>
  101d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101d98:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      bwrite(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  101d9b:	89 3c 24             	mov    %edi,(%esp)
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
  for(inum = 1; inum < sb.ninodes; inum++){  // loop over inode blocks
  101d9e:	89 de                	mov    %ebx,%esi
      dip->type = type;
      bwrite(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  101da0:	e8 fb e4 ff ff       	call   1002a0 <brelse>
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
  for(inum = 1; inum < sb.ninodes; inum++){  // loop over inode blocks
  101da5:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  101da8:	76 72                	jbe    101e1c <ialloc+0xbc>
    bp = bread(dev, IBLOCK(inum));
  101daa:	89 f0                	mov    %esi,%eax
  101dac:	c1 e8 03             	shr    $0x3,%eax
  101daf:	83 c0 02             	add    $0x2,%eax
  101db2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101db6:	8b 45 08             	mov    0x8(%ebp),%eax
  101db9:	89 04 24             	mov    %eax,(%esp)
  101dbc:	e8 8f e5 ff ff       	call   100350 <bread>
  101dc1:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
  101dc3:	89 f0                	mov    %esi,%eax
  101dc5:	83 e0 07             	and    $0x7,%eax
  101dc8:	c1 e0 06             	shl    $0x6,%eax
  101dcb:	8d 54 07 18          	lea    0x18(%edi,%eax,1),%edx
    if(dip->type == 0){  // a free inode
  101dcf:	66 83 3a 00          	cmpw   $0x0,(%edx)
  101dd3:	75 c3                	jne    101d98 <ialloc+0x38>
      memset(dip, 0, sizeof(*dip));
  101dd5:	89 14 24             	mov    %edx,(%esp)
  101dd8:	89 55 d0             	mov    %edx,-0x30(%ebp)
  101ddb:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
  101de2:	00 
  101de3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  101dea:	00 
  101deb:	e8 40 28 00 00       	call   104630 <memset>
      dip->type = type;
  101df0:	8b 55 d0             	mov    -0x30(%ebp),%edx
  101df3:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  101df7:	66 89 02             	mov    %ax,(%edx)
      bwrite(bp);   // mark it allocated on the disk
  101dfa:	89 3c 24             	mov    %edi,(%esp)
  101dfd:	e8 1e e5 ff ff       	call   100320 <bwrite>
      brelse(bp);
  101e02:	89 3c 24             	mov    %edi,(%esp)
  101e05:	e8 96 e4 ff ff       	call   1002a0 <brelse>
      return iget(dev, inum);
  101e0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0d:	89 f2                	mov    %esi,%edx
  101e0f:	e8 4c f5 ff ff       	call   101360 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
  101e14:	83 c4 3c             	add    $0x3c,%esp
  101e17:	5b                   	pop    %ebx
  101e18:	5e                   	pop    %esi
  101e19:	5f                   	pop    %edi
  101e1a:	5d                   	pop    %ebp
  101e1b:	c3                   	ret    
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
  101e1c:	c7 04 24 e0 71 10 00 	movl   $0x1071e0,(%esp)
  101e23:	e8 28 ed ff ff       	call   100b50 <panic>
  101e28:	90                   	nop
  101e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101e30 <ilock>:
}

// Lock the given inode.
void
ilock(struct inode *ip)
{
  101e30:	55                   	push   %ebp
  101e31:	89 e5                	mov    %esp,%ebp
  101e33:	56                   	push   %esi
  101e34:	53                   	push   %ebx
  101e35:	83 ec 10             	sub    $0x10,%esp
  101e38:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
  101e3b:	85 db                	test   %ebx,%ebx
  101e3d:	0f 84 e5 00 00 00    	je     101f28 <ilock+0xf8>
  101e43:	8b 4b 08             	mov    0x8(%ebx),%ecx
  101e46:	85 c9                	test   %ecx,%ecx
  101e48:	0f 8e da 00 00 00    	jle    101f28 <ilock+0xf8>
    panic("ilock");

  acquire(&icache.lock);
  101e4e:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101e55:	e8 36 27 00 00       	call   104590 <acquire>
  while(ip->flags & I_BUSY)
  101e5a:	8b 43 0c             	mov    0xc(%ebx),%eax
  101e5d:	a8 01                	test   $0x1,%al
  101e5f:	74 1e                	je     101e7f <ilock+0x4f>
  101e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(ip, &icache.lock);
  101e68:	c7 44 24 04 a0 6b 11 	movl   $0x116ba0,0x4(%esp)
  101e6f:	00 
  101e70:	89 1c 24             	mov    %ebx,(%esp)
  101e73:	e8 a8 15 00 00       	call   103420 <sleep>

  if(ip == 0 || ip->ref < 1)
    panic("ilock");

  acquire(&icache.lock);
  while(ip->flags & I_BUSY)
  101e78:	8b 43 0c             	mov    0xc(%ebx),%eax
  101e7b:	a8 01                	test   $0x1,%al
  101e7d:	75 e9                	jne    101e68 <ilock+0x38>
    sleep(ip, &icache.lock);
  ip->flags |= I_BUSY;
  101e7f:	83 c8 01             	or     $0x1,%eax
  101e82:	89 43 0c             	mov    %eax,0xc(%ebx)
  release(&icache.lock);
  101e85:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  101e8c:	e8 af 26 00 00       	call   104540 <release>

  if(!(ip->flags & I_VALID)){
  101e91:	f6 43 0c 02          	testb  $0x2,0xc(%ebx)
  101e95:	74 09                	je     101ea0 <ilock+0x70>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
  101e97:	83 c4 10             	add    $0x10,%esp
  101e9a:	5b                   	pop    %ebx
  101e9b:	5e                   	pop    %esi
  101e9c:	5d                   	pop    %ebp
  101e9d:	c3                   	ret    
  101e9e:	66 90                	xchg   %ax,%ax
    sleep(ip, &icache.lock);
  ip->flags |= I_BUSY;
  release(&icache.lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum));
  101ea0:	8b 43 04             	mov    0x4(%ebx),%eax
  101ea3:	c1 e8 03             	shr    $0x3,%eax
  101ea6:	83 c0 02             	add    $0x2,%eax
  101ea9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ead:	8b 03                	mov    (%ebx),%eax
  101eaf:	89 04 24             	mov    %eax,(%esp)
  101eb2:	e8 99 e4 ff ff       	call   100350 <bread>
  101eb7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
  101eb9:	8b 43 04             	mov    0x4(%ebx),%eax
  101ebc:	83 e0 07             	and    $0x7,%eax
  101ebf:	c1 e0 06             	shl    $0x6,%eax
  101ec2:	8d 44 06 18          	lea    0x18(%esi,%eax,1),%eax
    ip->type = dip->type;
  101ec6:	0f b7 10             	movzwl (%eax),%edx
  101ec9:	66 89 53 10          	mov    %dx,0x10(%ebx)
    ip->major = dip->major;
  101ecd:	0f b7 50 02          	movzwl 0x2(%eax),%edx
  101ed1:	66 89 53 12          	mov    %dx,0x12(%ebx)
    ip->minor = dip->minor;
  101ed5:	0f b7 50 04          	movzwl 0x4(%eax),%edx
  101ed9:	66 89 53 14          	mov    %dx,0x14(%ebx)
    ip->nlink = dip->nlink;
  101edd:	0f b7 50 06          	movzwl 0x6(%eax),%edx
  101ee1:	66 89 53 16          	mov    %dx,0x16(%ebx)
    ip->size = dip->size;
  101ee5:	8b 50 08             	mov    0x8(%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  101ee8:	83 c0 0c             	add    $0xc,%eax
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
  101eeb:	89 53 18             	mov    %edx,0x18(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  101eee:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ef2:	8d 43 1c             	lea    0x1c(%ebx),%eax
  101ef5:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
  101efc:	00 
  101efd:	89 04 24             	mov    %eax,(%esp)
  101f00:	e8 ab 27 00 00       	call   1046b0 <memmove>
    brelse(bp);
  101f05:	89 34 24             	mov    %esi,(%esp)
  101f08:	e8 93 e3 ff ff       	call   1002a0 <brelse>
    ip->flags |= I_VALID;
  101f0d:	83 4b 0c 02          	orl    $0x2,0xc(%ebx)
    if(ip->type == 0)
  101f11:	66 83 7b 10 00       	cmpw   $0x0,0x10(%ebx)
  101f16:	0f 85 7b ff ff ff    	jne    101e97 <ilock+0x67>
      panic("ilock: no type");
  101f1c:	c7 04 24 f8 71 10 00 	movl   $0x1071f8,(%esp)
  101f23:	e8 28 ec ff ff       	call   100b50 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
  101f28:	c7 04 24 f2 71 10 00 	movl   $0x1071f2,(%esp)
  101f2f:	e8 1c ec ff ff       	call   100b50 <panic>
  101f34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101f3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00101f40 <namex>:
// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
static struct inode*
namex(char *path, int nameiparent, char *name)
{
  101f40:	55                   	push   %ebp
  101f41:	89 e5                	mov    %esp,%ebp
  101f43:	57                   	push   %edi
  101f44:	56                   	push   %esi
  101f45:	53                   	push   %ebx
  101f46:	89 c3                	mov    %eax,%ebx
  101f48:	83 ec 2c             	sub    $0x2c,%esp
  101f4b:	89 55 e0             	mov    %edx,-0x20(%ebp)
  101f4e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
  101f51:	80 38 2f             	cmpb   $0x2f,(%eax)
  101f54:	0f 84 14 01 00 00    	je     10206e <namex+0x12e>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
  101f5a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  101f60:	8b 40 48             	mov    0x48(%eax),%eax
  101f63:	89 04 24             	mov    %eax,(%esp)
  101f66:	e8 c5 f3 ff ff       	call   101330 <idup>
  101f6b:	89 c7                	mov    %eax,%edi
  101f6d:	eb 04                	jmp    101f73 <namex+0x33>
  101f6f:	90                   	nop
{
  char *s;
  int len;

  while(*path == '/')
    path++;
  101f70:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
  101f73:	0f b6 03             	movzbl (%ebx),%eax
  101f76:	3c 2f                	cmp    $0x2f,%al
  101f78:	74 f6                	je     101f70 <namex+0x30>
    path++;
  if(*path == 0)
  101f7a:	84 c0                	test   %al,%al
  101f7c:	75 1a                	jne    101f98 <namex+0x58>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
  101f7e:	8b 5d e0             	mov    -0x20(%ebp),%ebx
  101f81:	85 db                	test   %ebx,%ebx
  101f83:	0f 85 0d 01 00 00    	jne    102096 <namex+0x156>
    iput(ip);
    return 0;
  }
  return ip;
}
  101f89:	83 c4 2c             	add    $0x2c,%esp
  101f8c:	89 f8                	mov    %edi,%eax
  101f8e:	5b                   	pop    %ebx
  101f8f:	5e                   	pop    %esi
  101f90:	5f                   	pop    %edi
  101f91:	5d                   	pop    %ebp
  101f92:	c3                   	ret    
  101f93:	90                   	nop
  101f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
  101f98:	3c 2f                	cmp    $0x2f,%al
  101f9a:	0f 84 94 00 00 00    	je     102034 <namex+0xf4>
  101fa0:	89 de                	mov    %ebx,%esi
  101fa2:	eb 08                	jmp    101fac <namex+0x6c>
  101fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101fa8:	3c 2f                	cmp    $0x2f,%al
  101faa:	74 0a                	je     101fb6 <namex+0x76>
    path++;
  101fac:	83 c6 01             	add    $0x1,%esi
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
  101faf:	0f b6 06             	movzbl (%esi),%eax
  101fb2:	84 c0                	test   %al,%al
  101fb4:	75 f2                	jne    101fa8 <namex+0x68>
  101fb6:	89 f2                	mov    %esi,%edx
  101fb8:	29 da                	sub    %ebx,%edx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
  101fba:	83 fa 0d             	cmp    $0xd,%edx
  101fbd:	7e 79                	jle    102038 <namex+0xf8>
    memmove(name, s, DIRSIZ);
  101fbf:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
  101fc6:	00 
  101fc7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  101fcb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  101fce:	89 04 24             	mov    %eax,(%esp)
  101fd1:	e8 da 26 00 00       	call   1046b0 <memmove>
  101fd6:	eb 03                	jmp    101fdb <namex+0x9b>
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
    path++;
  101fd8:	83 c6 01             	add    $0x1,%esi
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
  101fdb:	80 3e 2f             	cmpb   $0x2f,(%esi)
  101fde:	74 f8                	je     101fd8 <namex+0x98>
  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
  101fe0:	85 f6                	test   %esi,%esi
  101fe2:	74 9a                	je     101f7e <namex+0x3e>
    ilock(ip);
  101fe4:	89 3c 24             	mov    %edi,(%esp)
  101fe7:	e8 44 fe ff ff       	call   101e30 <ilock>
    if(ip->type != T_DIR){
  101fec:	66 83 7f 10 01       	cmpw   $0x1,0x10(%edi)
  101ff1:	75 67                	jne    10205a <namex+0x11a>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
  101ff3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  101ff6:	85 c0                	test   %eax,%eax
  101ff8:	74 0c                	je     102006 <namex+0xc6>
  101ffa:	80 3e 00             	cmpb   $0x0,(%esi)
  101ffd:	8d 76 00             	lea    0x0(%esi),%esi
  102000:	0f 84 7e 00 00 00    	je     102084 <namex+0x144>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
  102006:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10200d:	00 
  10200e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102011:	89 3c 24             	mov    %edi,(%esp)
  102014:	89 44 24 04          	mov    %eax,0x4(%esp)
  102018:	e8 d3 f8 ff ff       	call   1018f0 <dirlookup>
  10201d:	85 c0                	test   %eax,%eax
  10201f:	89 c3                	mov    %eax,%ebx
  102021:	74 37                	je     10205a <namex+0x11a>
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
  102023:	89 3c 24             	mov    %edi,(%esp)
  102026:	89 df                	mov    %ebx,%edi
  102028:	89 f3                	mov    %esi,%ebx
  10202a:	e8 11 fd ff ff       	call   101d40 <iunlockput>
  10202f:	e9 3f ff ff ff       	jmp    101f73 <namex+0x33>
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
  102034:	89 de                	mov    %ebx,%esi
  102036:	31 d2                	xor    %edx,%edx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
  102038:	89 54 24 08          	mov    %edx,0x8(%esp)
  10203c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  102040:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102043:	89 04 24             	mov    %eax,(%esp)
  102046:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102049:	e8 62 26 00 00       	call   1046b0 <memmove>
    name[len] = 0;
  10204e:	8b 55 dc             	mov    -0x24(%ebp),%edx
  102051:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102054:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
  102058:	eb 81                	jmp    101fdb <namex+0x9b>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
  10205a:	89 3c 24             	mov    %edi,(%esp)
  10205d:	31 ff                	xor    %edi,%edi
  10205f:	e8 dc fc ff ff       	call   101d40 <iunlockput>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
  102064:	83 c4 2c             	add    $0x2c,%esp
  102067:	89 f8                	mov    %edi,%eax
  102069:	5b                   	pop    %ebx
  10206a:	5e                   	pop    %esi
  10206b:	5f                   	pop    %edi
  10206c:	5d                   	pop    %ebp
  10206d:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  10206e:	ba 01 00 00 00       	mov    $0x1,%edx
  102073:	b8 01 00 00 00       	mov    $0x1,%eax
  102078:	e8 e3 f2 ff ff       	call   101360 <iget>
  10207d:	89 c7                	mov    %eax,%edi
  10207f:	e9 ef fe ff ff       	jmp    101f73 <namex+0x33>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
  102084:	89 3c 24             	mov    %edi,(%esp)
  102087:	e8 64 f9 ff ff       	call   1019f0 <iunlock>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
  10208c:	83 c4 2c             	add    $0x2c,%esp
  10208f:	89 f8                	mov    %edi,%eax
  102091:	5b                   	pop    %ebx
  102092:	5e                   	pop    %esi
  102093:	5f                   	pop    %edi
  102094:	5d                   	pop    %ebp
  102095:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
  102096:	89 3c 24             	mov    %edi,(%esp)
  102099:	31 ff                	xor    %edi,%edi
  10209b:	e8 60 fa ff ff       	call   101b00 <iput>
    return 0;
  1020a0:	e9 e4 fe ff ff       	jmp    101f89 <namex+0x49>
  1020a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1020a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020b0 <nameiparent>:
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
  1020b0:	55                   	push   %ebp
  return namex(path, 1, name);
  1020b1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
  1020b6:	89 e5                	mov    %esp,%ebp
  1020b8:	83 ec 08             	sub    $0x8,%esp
  return namex(path, 1, name);
  1020bb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1020be:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1020c1:	c9                   	leave  
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
  1020c2:	e9 79 fe ff ff       	jmp    101f40 <namex>
  1020c7:	89 f6                	mov    %esi,%esi
  1020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020d0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
  1020d0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
  1020d1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
  1020d3:	89 e5                	mov    %esp,%ebp
  1020d5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
  1020d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1020db:	8d 4d ea             	lea    -0x16(%ebp),%ecx
  1020de:	e8 5d fe ff ff       	call   101f40 <namex>
}
  1020e3:	c9                   	leave  
  1020e4:	c3                   	ret    
  1020e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1020e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001020f0 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(void)
{
  1020f0:	55                   	push   %ebp
  1020f1:	89 e5                	mov    %esp,%ebp
  1020f3:	83 ec 18             	sub    $0x18,%esp
  initlock(&icache.lock, "icache");
  1020f6:	c7 44 24 04 07 72 10 	movl   $0x107207,0x4(%esp)
  1020fd:	00 
  1020fe:	c7 04 24 a0 6b 11 00 	movl   $0x116ba0,(%esp)
  102105:	e8 f6 22 00 00       	call   104400 <initlock>
}
  10210a:	c9                   	leave  
  10210b:	c3                   	ret    
  10210c:	90                   	nop
  10210d:	90                   	nop
  10210e:	90                   	nop
  10210f:	90                   	nop

00102110 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  102110:	55                   	push   %ebp
  102111:	89 e5                	mov    %esp,%ebp
  102113:	56                   	push   %esi
  102114:	89 c6                	mov    %eax,%esi
  102116:	83 ec 14             	sub    $0x14,%esp
  if(b == 0)
  102119:	85 c0                	test   %eax,%eax
  10211b:	0f 84 8d 00 00 00    	je     1021ae <idestart+0x9e>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  102121:	ba f7 01 00 00       	mov    $0x1f7,%edx
  102126:	66 90                	xchg   %ax,%ax
  102128:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
  102129:	25 c0 00 00 00       	and    $0xc0,%eax
  10212e:	83 f8 40             	cmp    $0x40,%eax
  102131:	75 f5                	jne    102128 <idestart+0x18>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  102133:	ba f6 03 00 00       	mov    $0x3f6,%edx
  102138:	31 c0                	xor    %eax,%eax
  10213a:	ee                   	out    %al,(%dx)
  10213b:	ba f2 01 00 00       	mov    $0x1f2,%edx
  102140:	b8 01 00 00 00       	mov    $0x1,%eax
  102145:	ee                   	out    %al,(%dx)
    panic("idestart");

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, 1);  // number of sectors
  outb(0x1f3, b->sector & 0xff);
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
  outb(0x1f4, (b->sector >> 8) & 0xff);
  outb(0x1f5, (b->sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((b->sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
  102175:	f6 06 04             	testb  $0x4,(%esi)
  102178:	75 16                	jne    102190 <idestart+0x80>
  10217a:	ba f7 01 00 00       	mov    $0x1f7,%edx
  10217f:	b8 20 00 00 00       	mov    $0x20,%eax
  102184:	ee                   	out    %al,(%dx)
    outb(0x1f7, IDE_CMD_WRITE);
    outsl(0x1f0, b->data, 512/4);
  } else {
    outb(0x1f7, IDE_CMD_READ);
  }
}
  102185:	83 c4 14             	add    $0x14,%esp
  102188:	5e                   	pop    %esi
  102189:	5d                   	pop    %ebp
  10218a:	c3                   	ret    
  10218b:	90                   	nop
  10218c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102190:	b2 f7                	mov    $0xf7,%dl
  102192:	b8 30 00 00 00       	mov    $0x30,%eax
  102197:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
  102198:	b9 80 00 00 00       	mov    $0x80,%ecx
  10219d:	83 c6 18             	add    $0x18,%esi
  1021a0:	ba f0 01 00 00       	mov    $0x1f0,%edx
  1021a5:	fc                   	cld    
  1021a6:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  1021a8:	83 c4 14             	add    $0x14,%esp
  1021ab:	5e                   	pop    %esi
  1021ac:	5d                   	pop    %ebp
  1021ad:	c3                   	ret    
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  1021ae:	c7 04 24 0e 72 10 00 	movl   $0x10720e,(%esp)
  1021b5:	e8 96 e9 ff ff       	call   100b50 <panic>
  1021ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001021c0 <iderw>:
// Sync buf with disk. 
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
  1021c0:	55                   	push   %ebp
  1021c1:	89 e5                	mov    %esp,%ebp
  1021c3:	53                   	push   %ebx
  1021c4:	83 ec 14             	sub    $0x14,%esp
  1021c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!(b->flags & B_BUSY))
  1021ca:	8b 03                	mov    (%ebx),%eax
  1021cc:	a8 01                	test   $0x1,%al
  1021ce:	0f 84 90 00 00 00    	je     102264 <iderw+0xa4>
    panic("iderw: buf not busy");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
  1021d4:	83 e0 06             	and    $0x6,%eax
  1021d7:	83 f8 02             	cmp    $0x2,%eax
  1021da:	0f 84 9c 00 00 00    	je     10227c <iderw+0xbc>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
  1021e0:	8b 53 04             	mov    0x4(%ebx),%edx
  1021e3:	85 d2                	test   %edx,%edx
  1021e5:	74 0d                	je     1021f4 <iderw+0x34>
  1021e7:	a1 58 92 10 00       	mov    0x109258,%eax
  1021ec:	85 c0                	test   %eax,%eax
  1021ee:	0f 84 7c 00 00 00    	je     102270 <iderw+0xb0>
    panic("idrw: ide disk 1 not present");

  acquire(&idelock);
  1021f4:	c7 04 24 20 92 10 00 	movl   $0x109220,(%esp)
  1021fb:	e8 90 23 00 00       	call   104590 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)
  102200:	ba 54 92 10 00       	mov    $0x109254,%edx
    panic("idrw: ide disk 1 not present");

  acquire(&idelock);

  // Append b to idequeue.
  b->qnext = 0;
  102205:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  10220c:	a1 54 92 10 00       	mov    0x109254,%eax
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)
  102211:	85 c0                	test   %eax,%eax
  102213:	74 0d                	je     102222 <iderw+0x62>
  102215:	8d 76 00             	lea    0x0(%esi),%esi
  102218:	8d 50 14             	lea    0x14(%eax),%edx
  10221b:	8b 40 14             	mov    0x14(%eax),%eax
  10221e:	85 c0                	test   %eax,%eax
  102220:	75 f6                	jne    102218 <iderw+0x58>
    ;
  *pp = b;
  102222:	89 1a                	mov    %ebx,(%edx)
  
  // Start disk if necessary.
  if(idequeue == b)
  102224:	39 1d 54 92 10 00    	cmp    %ebx,0x109254
  10222a:	75 14                	jne    102240 <iderw+0x80>
  10222c:	eb 2d                	jmp    10225b <iderw+0x9b>
  10222e:	66 90                	xchg   %ax,%ax
    idestart(b);
  
  // Wait for request to finish.
  // Assuming will not sleep too long: ignore proc->killed.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID) {
    sleep(b, &idelock);
  102230:	c7 44 24 04 20 92 10 	movl   $0x109220,0x4(%esp)
  102237:	00 
  102238:	89 1c 24             	mov    %ebx,(%esp)
  10223b:	e8 e0 11 00 00       	call   103420 <sleep>
  if(idequeue == b)
    idestart(b);
  
  // Wait for request to finish.
  // Assuming will not sleep too long: ignore proc->killed.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID) {
  102240:	8b 03                	mov    (%ebx),%eax
  102242:	83 e0 06             	and    $0x6,%eax
  102245:	83 f8 02             	cmp    $0x2,%eax
  102248:	75 e6                	jne    102230 <iderw+0x70>
    sleep(b, &idelock);
  }

  release(&idelock);
  10224a:	c7 45 08 20 92 10 00 	movl   $0x109220,0x8(%ebp)
}
  102251:	83 c4 14             	add    $0x14,%esp
  102254:	5b                   	pop    %ebx
  102255:	5d                   	pop    %ebp
  // Assuming will not sleep too long: ignore proc->killed.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID) {
    sleep(b, &idelock);
  }

  release(&idelock);
  102256:	e9 e5 22 00 00       	jmp    104540 <release>
    ;
  *pp = b;
  
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
  10225b:	89 d8                	mov    %ebx,%eax
  10225d:	e8 ae fe ff ff       	call   102110 <idestart>
  102262:	eb dc                	jmp    102240 <iderw+0x80>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!(b->flags & B_BUSY))
    panic("iderw: buf not busy");
  102264:	c7 04 24 17 72 10 00 	movl   $0x107217,(%esp)
  10226b:	e8 e0 e8 ff ff       	call   100b50 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("idrw: ide disk 1 not present");
  102270:	c7 04 24 40 72 10 00 	movl   $0x107240,(%esp)
  102277:	e8 d4 e8 ff ff       	call   100b50 <panic>
  struct buf **pp;

  if(!(b->flags & B_BUSY))
    panic("iderw: buf not busy");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  10227c:	c7 04 24 2b 72 10 00 	movl   $0x10722b,(%esp)
  102283:	e8 c8 e8 ff ff       	call   100b50 <panic>
  102288:	90                   	nop
  102289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102290 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
  102290:	55                   	push   %ebp
  102291:	89 e5                	mov    %esp,%ebp
  102293:	57                   	push   %edi
  102294:	53                   	push   %ebx
  102295:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // Take first buffer off queue.
  acquire(&idelock);
  102298:	c7 04 24 20 92 10 00 	movl   $0x109220,(%esp)
  10229f:	e8 ec 22 00 00       	call   104590 <acquire>
  if((b = idequeue) == 0){
  1022a4:	8b 1d 54 92 10 00    	mov    0x109254,%ebx
  1022aa:	85 db                	test   %ebx,%ebx
  1022ac:	74 7a                	je     102328 <ideintr+0x98>
    release(&idelock);
    cprintf("Spurious IDE interrupt.\n");
    return;
  }
  idequeue = b->qnext;
  1022ae:	8b 43 14             	mov    0x14(%ebx),%eax
  1022b1:	a3 54 92 10 00       	mov    %eax,0x109254

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
  1022b6:	8b 0b                	mov    (%ebx),%ecx
  1022b8:	f6 c1 04             	test   $0x4,%cl
  1022bb:	74 33                	je     1022f0 <ideintr+0x60>
    insl(0x1f0, b->data, 512/4);
  
  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
  1022bd:	83 c9 02             	or     $0x2,%ecx
  1022c0:	83 e1 fb             	and    $0xfffffffb,%ecx
  1022c3:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
  1022c5:	89 1c 24             	mov    %ebx,(%esp)
  1022c8:	e8 23 10 00 00       	call   1032f0 <wakeup>
  
  // Start disk on next buf in queue.
  if(idequeue != 0)
  1022cd:	a1 54 92 10 00       	mov    0x109254,%eax
  1022d2:	85 c0                	test   %eax,%eax
  1022d4:	74 05                	je     1022db <ideintr+0x4b>
    idestart(idequeue);
  1022d6:	e8 35 fe ff ff       	call   102110 <idestart>

  release(&idelock);
  1022db:	c7 04 24 20 92 10 00 	movl   $0x109220,(%esp)
  1022e2:	e8 59 22 00 00       	call   104540 <release>
}
  1022e7:	83 c4 10             	add    $0x10,%esp
  1022ea:	5b                   	pop    %ebx
  1022eb:	5f                   	pop    %edi
  1022ec:	5d                   	pop    %ebp
  1022ed:	c3                   	ret    
  1022ee:	66 90                	xchg   %ax,%ax
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1022f0:	ba f7 01 00 00       	mov    $0x1f7,%edx
  1022f5:	8d 76 00             	lea    0x0(%esi),%esi
  1022f8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
  1022f9:	0f b6 c0             	movzbl %al,%eax
  1022fc:	89 c7                	mov    %eax,%edi
  1022fe:	81 e7 c0 00 00 00    	and    $0xc0,%edi
  102304:	83 ff 40             	cmp    $0x40,%edi
  102307:	75 ef                	jne    1022f8 <ideintr+0x68>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
  102309:	a8 21                	test   $0x21,%al
  10230b:	75 b0                	jne    1022bd <ideintr+0x2d>
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
  10230d:	8d 7b 18             	lea    0x18(%ebx),%edi
  102310:	b9 80 00 00 00       	mov    $0x80,%ecx
  102315:	ba f0 01 00 00       	mov    $0x1f0,%edx
  10231a:	fc                   	cld    
  10231b:	f3 6d                	rep insl (%dx),%es:(%edi)
  10231d:	8b 0b                	mov    (%ebx),%ecx
  10231f:	eb 9c                	jmp    1022bd <ideintr+0x2d>
  102321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct buf *b;

  // Take first buffer off queue.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
  102328:	c7 04 24 20 92 10 00 	movl   $0x109220,(%esp)
  10232f:	e8 0c 22 00 00       	call   104540 <release>
    cprintf("Spurious IDE interrupt.\n");
  102334:	c7 04 24 5d 72 10 00 	movl   $0x10725d,(%esp)
  10233b:	e8 20 e4 ff ff       	call   100760 <cprintf>
    return;
  102340:	eb a5                	jmp    1022e7 <ideintr+0x57>
  102342:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  102349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102350 <ideinit>:
  return 0;
}

void
ideinit(void)
{
  102350:	55                   	push   %ebp
  102351:	89 e5                	mov    %esp,%ebp
  102353:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
  102356:	c7 44 24 04 76 72 10 	movl   $0x107276,0x4(%esp)
  10235d:	00 
  10235e:	c7 04 24 20 92 10 00 	movl   $0x109220,(%esp)
  102365:	e8 96 20 00 00       	call   104400 <initlock>
  picenable(IRQ_IDE);
  10236a:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  102371:	e8 aa 0a 00 00       	call   102e20 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
  102376:	a1 c0 81 11 00       	mov    0x1181c0,%eax
  10237b:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  102382:	83 e8 01             	sub    $0x1,%eax
  102385:	89 44 24 04          	mov    %eax,0x4(%esp)
  102389:	e8 52 00 00 00       	call   1023e0 <ioapicenable>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  10238e:	ba f7 01 00 00       	mov    $0x1f7,%edx
  102393:	90                   	nop
  102394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102398:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
  102399:	25 c0 00 00 00       	and    $0xc0,%eax
  10239e:	83 f8 40             	cmp    $0x40,%eax
  1023a1:	75 f5                	jne    102398 <ideinit+0x48>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1023a3:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1023a8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  1023ad:	ee                   	out    %al,(%dx)
  1023ae:	31 c9                	xor    %ecx,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  1023b0:	b2 f7                	mov    $0xf7,%dl
  1023b2:	eb 0f                	jmp    1023c3 <ideinit+0x73>
  1023b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
  1023b8:	83 c1 01             	add    $0x1,%ecx
  1023bb:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
  1023c1:	74 0f                	je     1023d2 <ideinit+0x82>
  1023c3:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
  1023c4:	84 c0                	test   %al,%al
  1023c6:	74 f0                	je     1023b8 <ideinit+0x68>
      havedisk1 = 1;
  1023c8:	c7 05 58 92 10 00 01 	movl   $0x1,0x109258
  1023cf:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  1023d2:	ba f6 01 00 00       	mov    $0x1f6,%edx
  1023d7:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
  1023dc:	ee                   	out    %al,(%dx)
    }
  }
  
  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
  1023dd:	c9                   	leave  
  1023de:	c3                   	ret    
  1023df:	90                   	nop

001023e0 <ioapicenable>:
}

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
  1023e0:	8b 15 c4 7b 11 00    	mov    0x117bc4,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
  1023e6:	55                   	push   %ebp
  1023e7:	89 e5                	mov    %esp,%ebp
  1023e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
  1023ec:	85 d2                	test   %edx,%edx
  1023ee:	74 31                	je     102421 <ioapicenable+0x41>
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  1023f0:	8b 15 74 7b 11 00    	mov    0x117b74,%edx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  1023f6:	8d 48 20             	lea    0x20(%eax),%ecx
  1023f9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  1023fd:	89 02                	mov    %eax,(%edx)
  ioapic->data = data;
  1023ff:	8b 15 74 7b 11 00    	mov    0x117b74,%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  102405:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
  102408:	89 4a 10             	mov    %ecx,0x10(%edx)
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  10240b:	8b 0d 74 7b 11 00    	mov    0x117b74,%ecx

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
  102411:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  102414:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
  102416:	a1 74 7b 11 00       	mov    0x117b74,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
  10241b:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
  10241e:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
  102421:	5d                   	pop    %ebp
  102422:	c3                   	ret    
  102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102430 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
  102430:	55                   	push   %ebp
  102431:	89 e5                	mov    %esp,%ebp
  102433:	56                   	push   %esi
  102434:	53                   	push   %ebx
  102435:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  if(!ismp)
  102438:	8b 0d c4 7b 11 00    	mov    0x117bc4,%ecx
  10243e:	85 c9                	test   %ecx,%ecx
  102440:	0f 84 9e 00 00 00    	je     1024e4 <ioapicinit+0xb4>
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  102446:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
  10244d:	00 00 00 
  return ioapic->data;
  102450:	8b 35 10 00 c0 fe    	mov    0xfec00010,%esi
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
  102456:	bb 00 00 c0 fe       	mov    $0xfec00000,%ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  10245b:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
  102462:	00 00 00 
  return ioapic->data;
  102465:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
  10246a:	0f b6 15 c0 7b 11 00 	movzbl 0x117bc0,%edx
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  102471:	c7 05 74 7b 11 00 00 	movl   $0xfec00000,0x117b74
  102478:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  10247b:	c1 ee 10             	shr    $0x10,%esi
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
  10247e:	c1 e8 18             	shr    $0x18,%eax

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  102481:	81 e6 ff 00 00 00    	and    $0xff,%esi
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
  102487:	39 c2                	cmp    %eax,%edx
  102489:	74 12                	je     10249d <ioapicinit+0x6d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
  10248b:	c7 04 24 7c 72 10 00 	movl   $0x10727c,(%esp)
  102492:	e8 c9 e2 ff ff       	call   100760 <cprintf>
  102497:	8b 1d 74 7b 11 00    	mov    0x117b74,%ebx
  10249d:	ba 10 00 00 00       	mov    $0x10,%edx
  1024a2:	31 c0                	xor    %eax,%eax
  1024a4:	eb 08                	jmp    1024ae <ioapicinit+0x7e>
  1024a6:	66 90                	xchg   %ax,%ax

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  1024a8:	8b 1d 74 7b 11 00    	mov    0x117b74,%ebx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  1024ae:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
  1024b0:	8b 1d 74 7b 11 00    	mov    0x117b74,%ebx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
  1024b6:	8d 48 20             	lea    0x20(%eax),%ecx
  1024b9:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  1024bf:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
  1024c2:	89 4b 10             	mov    %ecx,0x10(%ebx)
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  1024c5:	8b 0d 74 7b 11 00    	mov    0x117b74,%ecx
  1024cb:	8d 5a 01             	lea    0x1(%edx),%ebx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  1024ce:	83 c2 02             	add    $0x2,%edx
  1024d1:	39 c6                	cmp    %eax,%esi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  1024d3:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
  1024d5:	8b 0d 74 7b 11 00    	mov    0x117b74,%ecx
  1024db:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
  1024e2:	7d c4                	jge    1024a8 <ioapicinit+0x78>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
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
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc()
{
  1024f0:	55                   	push   %ebp
  1024f1:	89 e5                	mov    %esp,%ebp
  1024f3:	53                   	push   %ebx
  1024f4:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  acquire(&kmem.lock);
  1024f7:	c7 04 24 80 7b 11 00 	movl   $0x117b80,(%esp)
  1024fe:	e8 8d 20 00 00       	call   104590 <acquire>
  r = kmem.freelist;
  102503:	8b 1d b4 7b 11 00    	mov    0x117bb4,%ebx
  if(r)
  102509:	85 db                	test   %ebx,%ebx
  10250b:	74 07                	je     102514 <kalloc+0x24>
    kmem.freelist = r->next;
  10250d:	8b 03                	mov    (%ebx),%eax
  10250f:	a3 b4 7b 11 00       	mov    %eax,0x117bb4
  release(&kmem.lock);
  102514:	c7 04 24 80 7b 11 00 	movl   $0x117b80,(%esp)
  10251b:	e8 20 20 00 00       	call   104540 <release>
  return (char*) r;
}
  102520:	89 d8                	mov    %ebx,%eax
  102522:	83 c4 14             	add    $0x14,%esp
  102525:	5b                   	pop    %ebx
  102526:	5d                   	pop    %ebp
  102527:	c3                   	ret    
  102528:	90                   	nop
  102529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102530 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
  102530:	55                   	push   %ebp
  102531:	89 e5                	mov    %esp,%ebp
  102533:	53                   	push   %ebx
  102534:	83 ec 14             	sub    $0x14,%esp
  102537:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;
  if(((uint) v) % PGSIZE || (uint)v < 1024*1024 || (uint)v >= PHYSTOP) 
  10253a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
  102540:	75 52                	jne    102594 <kfree+0x64>
  102542:	81 fb ff ff 0f 00    	cmp    $0xfffff,%ebx
  102548:	76 4a                	jbe    102594 <kfree+0x64>
  10254a:	81 fb ff ff ff 00    	cmp    $0xffffff,%ebx
  102550:	77 42                	ja     102594 <kfree+0x64>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
  102552:	89 1c 24             	mov    %ebx,(%esp)
  102555:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  10255c:	00 
  10255d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  102564:	00 
  102565:	e8 c6 20 00 00       	call   104630 <memset>

  acquire(&kmem.lock);
  10256a:	c7 04 24 80 7b 11 00 	movl   $0x117b80,(%esp)
  102571:	e8 1a 20 00 00       	call   104590 <acquire>
  r = (struct run *) v;
  r->next = kmem.freelist;
  102576:	a1 b4 7b 11 00       	mov    0x117bb4,%eax
  10257b:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  10257d:	89 1d b4 7b 11 00    	mov    %ebx,0x117bb4
  release(&kmem.lock);
  102583:	c7 45 08 80 7b 11 00 	movl   $0x117b80,0x8(%ebp)
}
  10258a:	83 c4 14             	add    $0x14,%esp
  10258d:	5b                   	pop    %ebx
  10258e:	5d                   	pop    %ebp

  acquire(&kmem.lock);
  r = (struct run *) v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  release(&kmem.lock);
  10258f:	e9 ac 1f 00 00       	jmp    104540 <release>
void
kfree(char *v)
{
  struct run *r;
  if(((uint) v) % PGSIZE || (uint)v < 1024*1024 || (uint)v >= PHYSTOP) 
    panic("kfree");
  102594:	c7 04 24 ae 72 10 00 	movl   $0x1072ae,(%esp)
  10259b:	e8 b0 e5 ff ff       	call   100b50 <panic>

001025a0 <kinit>:
} kmem;

// Initialize free list of physical pages.
void
kinit(void)
{
  1025a0:	55                   	push   %ebp
  1025a1:	89 e5                	mov    %esp,%ebp
  1025a3:	53                   	push   %ebx
  extern char end[];

  initlock(&kmem.lock, "kmem");
  char *p = (char*)PGROUNDUP((uint)end);
  1025a4:	bb 63 bc 11 00       	mov    $0x11bc63,%ebx
} kmem;

// Initialize free list of physical pages.
void
kinit(void)
{
  1025a9:	83 ec 14             	sub    $0x14,%esp
  extern char end[];

  initlock(&kmem.lock, "kmem");
  char *p = (char*)PGROUNDUP((uint)end);
  1025ac:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
void
kinit(void)
{
  extern char end[];

  initlock(&kmem.lock, "kmem");
  1025b2:	c7 44 24 04 b4 72 10 	movl   $0x1072b4,0x4(%esp)
  1025b9:	00 
  1025ba:	c7 04 24 80 7b 11 00 	movl   $0x117b80,(%esp)
  1025c1:	e8 3a 1e 00 00       	call   104400 <initlock>
  char *p = (char*)PGROUNDUP((uint)end);
  for( ; p + PGSIZE - 1 < (char*) PHYSTOP; p += PGSIZE)
  1025c6:	8d 83 ff 0f 00 00    	lea    0xfff(%ebx),%eax
  1025cc:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  1025d1:	77 20                	ja     1025f3 <kinit+0x53>
  1025d3:	90                   	nop
  1025d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
  1025d8:	89 1c 24             	mov    %ebx,(%esp)
{
  extern char end[];

  initlock(&kmem.lock, "kmem");
  char *p = (char*)PGROUNDUP((uint)end);
  for( ; p + PGSIZE - 1 < (char*) PHYSTOP; p += PGSIZE)
  1025db:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
  1025e1:	e8 4a ff ff ff       	call   102530 <kfree>
{
  extern char end[];

  initlock(&kmem.lock, "kmem");
  char *p = (char*)PGROUNDUP((uint)end);
  for( ; p + PGSIZE - 1 < (char*) PHYSTOP; p += PGSIZE)
  1025e6:	8d 83 ff 0f 00 00    	lea    0xfff(%ebx),%eax
  1025ec:	3d ff ff ff 00       	cmp    $0xffffff,%eax
  1025f1:	76 e5                	jbe    1025d8 <kinit+0x38>
    kfree(p);
}
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
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
  102600:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  102601:	ba 64 00 00 00       	mov    $0x64,%edx
  102606:	89 e5                	mov    %esp,%ebp
  102608:	ec                   	in     (%dx),%al
  102609:	89 c2                	mov    %eax,%edx
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
  10260b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  102610:	83 e2 01             	and    $0x1,%edx
  102613:	74 3e                	je     102653 <kbdgetc+0x53>
  102615:	ba 60 00 00 00       	mov    $0x60,%edx
  10261a:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
  10261b:	0f b6 c0             	movzbl %al,%eax

  if(data == 0xE0){
  10261e:	3d e0 00 00 00       	cmp    $0xe0,%eax
  102623:	0f 84 7f 00 00 00    	je     1026a8 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
  102629:	84 c0                	test   %al,%al
  10262b:	79 2b                	jns    102658 <kbdgetc+0x58>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
  10262d:	8b 15 5c 92 10 00    	mov    0x10925c,%edx
  102633:	f6 c2 40             	test   $0x40,%dl
  102636:	75 03                	jne    10263b <kbdgetc+0x3b>
  102638:	83 e0 7f             	and    $0x7f,%eax
    shift &= ~(shiftcode[data] | E0ESC);
  10263b:	0f b6 80 c0 72 10 00 	movzbl 0x1072c0(%eax),%eax
  102642:	83 c8 40             	or     $0x40,%eax
  102645:	0f b6 c0             	movzbl %al,%eax
  102648:	f7 d0                	not    %eax
  10264a:	21 d0                	and    %edx,%eax
  10264c:	a3 5c 92 10 00       	mov    %eax,0x10925c
  102651:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
  102653:	5d                   	pop    %ebp
  102654:	c3                   	ret    
  102655:	8d 76 00             	lea    0x0(%esi),%esi
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
  102658:	8b 0d 5c 92 10 00    	mov    0x10925c,%ecx
  10265e:	f6 c1 40             	test   $0x40,%cl
  102661:	74 05                	je     102668 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
  102663:	0c 80                	or     $0x80,%al
    shift &= ~E0ESC;
  102665:	83 e1 bf             	and    $0xffffffbf,%ecx
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  102668:	0f b6 90 c0 72 10 00 	movzbl 0x1072c0(%eax),%edx
  10266f:	09 ca                	or     %ecx,%edx
  102671:	0f b6 88 c0 73 10 00 	movzbl 0x1073c0(%eax),%ecx
  102678:	31 ca                	xor    %ecx,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
  10267a:	89 d1                	mov    %edx,%ecx
  10267c:	83 e1 03             	and    $0x3,%ecx
  10267f:	8b 0c 8d c0 74 10 00 	mov    0x1074c0(,%ecx,4),%ecx
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  102686:	89 15 5c 92 10 00    	mov    %edx,0x10925c
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
  10268c:	83 e2 08             	and    $0x8,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  10268f:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
  if(shift & CAPSLOCK){
  102693:	74 be                	je     102653 <kbdgetc+0x53>
    if('a' <= c && c <= 'z')
  102695:	8d 50 9f             	lea    -0x61(%eax),%edx
  102698:	83 fa 19             	cmp    $0x19,%edx
  10269b:	77 1b                	ja     1026b8 <kbdgetc+0xb8>
      c += 'A' - 'a';
  10269d:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
  1026a0:	5d                   	pop    %ebp
  1026a1:	c3                   	ret    
  1026a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
  1026a8:	30 c0                	xor    %al,%al
  1026aa:	83 0d 5c 92 10 00 40 	orl    $0x40,0x10925c
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
  1026b1:	5d                   	pop    %ebp
  1026b2:	c3                   	ret    
  1026b3:	90                   	nop
  1026b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
  1026b8:	8d 50 bf             	lea    -0x41(%eax),%edx
  1026bb:	83 fa 19             	cmp    $0x19,%edx
  1026be:	77 93                	ja     102653 <kbdgetc+0x53>
      c += 'a' - 'A';
  1026c0:	83 c0 20             	add    $0x20,%eax
  }
  return c;
}
  1026c3:	5d                   	pop    %ebp
  1026c4:	c3                   	ret    
  1026c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1026c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001026d0 <kbdintr>:

void
kbdintr(void)
{
  1026d0:	55                   	push   %ebp
  1026d1:	89 e5                	mov    %esp,%ebp
  1026d3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
  1026d6:	c7 04 24 00 26 10 00 	movl   $0x102600,(%esp)
  1026dd:	e8 de e2 ff ff       	call   1009c0 <consoleintr>
}
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

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
  1026f0:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
  1026f5:	55                   	push   %ebp
  1026f6:	89 e5                	mov    %esp,%ebp
  if(lapic)
  1026f8:	85 c0                	test   %eax,%eax
  1026fa:	74 12                	je     10270e <lapiceoi+0x1e>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1026fc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  102703:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  102706:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10270b:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
  10270e:	5d                   	pop    %ebp
  10270f:	c3                   	ret    

00102710 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
  102710:	55                   	push   %ebp
  102711:	89 e5                	mov    %esp,%ebp
}
  102713:	5d                   	pop    %ebp
  102714:	c3                   	ret    
  102715:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102720 <lapicstartap>:

// Start additional processor running bootstrap code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
  102720:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
  // the AP startup code prior to the [universal startup algorithm]."
  outb(IO_RTC, 0xF);  // offset 0xF is shutdown code
  outb(IO_RTC+1, 0x0A);
  wrv = (ushort*)(0x40<<4 | 0x67);  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
  10273e:	89 c8                	mov    %ecx,%eax
  102740:	c1 e8 04             	shr    $0x4,%eax
  102743:	66 a3 69 04 00 00    	mov    %ax,0x469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102749:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10274e:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(IO_RTC, 0xF);  // offset 0xF is shutdown code
  outb(IO_RTC+1, 0x0A);
  wrv = (ushort*)(0x40<<4 | 0x67);  // Warm reset vector
  wrv[0] = 0;
  102751:	66 c7 05 67 04 00 00 	movw   $0x0,0x467
  102758:	00 00 

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  lapic[ID];  // wait for write to finish, by reading
  10275a:	c1 e9 0c             	shr    $0xc,%ecx
  10275d:	80 cd 06             	or     $0x6,%ch
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102760:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
  102766:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10276b:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  10276e:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
  102775:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
  102778:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10277d:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102780:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
  102787:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
  10278a:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10278f:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102792:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
  102798:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10279d:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1027a0:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
  1027a6:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1027ab:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1027ae:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
  1027b4:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1027b9:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1027bc:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
  1027c2:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
  1027c7:	5b                   	pop    %ebx
  1027c8:	5d                   	pop    %ebp

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  lapic[ID];  // wait for write to finish, by reading
  1027c9:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
  1027cc:	c3                   	ret    
  1027cd:	8d 76 00             	lea    0x0(%esi),%esi

001027d0 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
  1027d0:	55                   	push   %ebp
  1027d1:	89 e5                	mov    %esp,%ebp
  1027d3:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  1027d6:	9c                   	pushf  
  1027d7:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
  1027d8:	f6 c4 02             	test   $0x2,%ah
  1027db:	74 12                	je     1027ef <cpunum+0x1f>
    static int n;
    if(n++ == 0)
  1027dd:	a1 60 92 10 00       	mov    0x109260,%eax
  1027e2:	8d 50 01             	lea    0x1(%eax),%edx
  1027e5:	85 c0                	test   %eax,%eax
  1027e7:	89 15 60 92 10 00    	mov    %edx,0x109260
  1027ed:	74 19                	je     102808 <cpunum+0x38>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if(lapic)
  1027ef:	8b 15 b8 7b 11 00    	mov    0x117bb8,%edx
  1027f5:	31 c0                	xor    %eax,%eax
  1027f7:	85 d2                	test   %edx,%edx
  1027f9:	74 06                	je     102801 <cpunum+0x31>
    return lapic[ID]>>24;
  1027fb:	8b 42 20             	mov    0x20(%edx),%eax
  1027fe:	c1 e8 18             	shr    $0x18,%eax
  return 0;
}
  102801:	c9                   	leave  
  102802:	c3                   	ret    
  102803:	90                   	nop
  102804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
  102808:	8b 45 04             	mov    0x4(%ebp),%eax
  10280b:	c7 04 24 d0 74 10 00 	movl   $0x1074d0,(%esp)
  102812:	89 44 24 04          	mov    %eax,0x4(%esp)
  102816:	e8 45 df ff ff       	call   100760 <cprintf>
  10281b:	eb d2                	jmp    1027ef <cpunum+0x1f>
  10281d:	8d 76 00             	lea    0x0(%esi),%esi

00102820 <lapicinit>:
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(int c)
{
  102820:	55                   	push   %ebp
  102821:	89 e5                	mov    %esp,%ebp
  102823:	83 ec 18             	sub    $0x18,%esp
  cprintf("lapicinit: %d 0x%x\n", c, lapic);
  102826:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10282b:	c7 04 24 fc 74 10 00 	movl   $0x1074fc,(%esp)
  102832:	89 44 24 08          	mov    %eax,0x8(%esp)
  102836:	8b 45 08             	mov    0x8(%ebp),%eax
  102839:	89 44 24 04          	mov    %eax,0x4(%esp)
  10283d:	e8 1e df ff ff       	call   100760 <cprintf>
  if(!lapic) 
  102842:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102847:	85 c0                	test   %eax,%eax
  102849:	0f 84 0a 01 00 00    	je     102959 <lapicinit+0x139>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  10284f:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
  102856:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
  102859:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10285e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102861:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
  102868:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  10286b:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102870:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102873:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
  10287a:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
  10287d:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102882:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102885:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
  10288c:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
  10288f:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102894:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102897:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
  10289e:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
  1028a1:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1028a6:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1028a9:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
  1028b0:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
  1028b3:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1028b8:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
  1028bb:	8b 50 30             	mov    0x30(%eax),%edx
  1028be:	c1 ea 10             	shr    $0x10,%edx
  1028c1:	80 fa 03             	cmp    $0x3,%dl
  1028c4:	0f 87 96 00 00 00    	ja     102960 <lapicinit+0x140>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1028ca:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
  1028d1:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  1028d4:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1028d9:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1028dc:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1028e3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  1028e6:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1028eb:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  1028ee:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1028f5:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  1028f8:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  1028fd:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102900:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  102907:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  10290a:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  10290f:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102912:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
  102919:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  10291c:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102921:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102924:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
  10292b:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
  10292e:	8b 0d b8 7b 11 00    	mov    0x117bb8,%ecx
  102934:	8b 41 20             	mov    0x20(%ecx),%eax
  102937:	8d 91 00 03 00 00    	lea    0x300(%ecx),%edx
  10293d:	8d 76 00             	lea    0x0(%esi),%esi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
  102940:	8b 02                	mov    (%edx),%eax
  102942:	f6 c4 10             	test   $0x10,%ah
  102945:	75 f9                	jne    102940 <lapicinit+0x120>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102947:	c7 81 80 00 00 00 00 	movl   $0x0,0x80(%ecx)
  10294e:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
  102951:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
  102956:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
  102959:	c9                   	leave  
  10295a:	c3                   	ret    
  10295b:	90                   	nop
  10295c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
  102960:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
  102967:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
  10296a:	a1 b8 7b 11 00       	mov    0x117bb8,%eax
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
// Common CPU setup code.
// Bootstrap CPU comes here from mainc().
// Other CPUs jump here from bootother.S.
static void
mpmain(void)
{
  102980:	55                   	push   %ebp
  102981:	89 e5                	mov    %esp,%ebp
  102983:	53                   	push   %ebx
  102984:	83 ec 14             	sub    $0x14,%esp
  if(cpunum() != mpbcpu()) {
  102987:	e8 44 fe ff ff       	call   1027d0 <cpunum>
  10298c:	89 c3                	mov    %eax,%ebx
  10298e:	e8 ed 01 00 00       	call   102b80 <mpbcpu>
  102993:	39 c3                	cmp    %eax,%ebx
  102995:	74 16                	je     1029ad <mpmain+0x2d>
    ksegment();
  102997:	e8 e4 45 00 00       	call   106f80 <ksegment>
  10299c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    lapicinit(cpunum());
  1029a0:	e8 2b fe ff ff       	call   1027d0 <cpunum>
  1029a5:	89 04 24             	mov    %eax,(%esp)
  1029a8:	e8 73 fe ff ff       	call   102820 <lapicinit>
  }
  vmenable();        // turn on paging
  1029ad:	e8 ce 3e 00 00       	call   106880 <vmenable>
  cprintf("cpu%d: starting\n", cpu->id);
  1029b2:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1029b8:	0f b6 00             	movzbl (%eax),%eax
  1029bb:	c7 04 24 10 75 10 00 	movl   $0x107510,(%esp)
  1029c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029c6:	e8 95 dd ff ff       	call   100760 <cprintf>
  idtinit();       // load idt register
  1029cb:	e8 b0 2f 00 00       	call   105980 <idtinit>
  xchg(&cpu->booted, 1);
  1029d0:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  1029d7:	b8 01 00 00 00       	mov    $0x1,%eax
  1029dc:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
  1029e3:	e8 48 0b 00 00       	call   103530 <scheduler>
  1029e8:	90                   	nop
  1029e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001029f0 <mainc>:
  panic("jkstack");
}

void
mainc(void)
{
  1029f0:	55                   	push   %ebp
  1029f1:	89 e5                	mov    %esp,%ebp
  1029f3:	53                   	push   %ebx
  1029f4:	83 ec 14             	sub    $0x14,%esp
  cprintf("\ncpu%d: starting xv6\n\n", cpu->id);
  1029f7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1029fd:	0f b6 00             	movzbl (%eax),%eax
  102a00:	c7 04 24 21 75 10 00 	movl   $0x107521,(%esp)
  102a07:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a0b:	e8 50 dd ff ff       	call   100760 <cprintf>
  kvmalloc();      // initialize the kernel page table
  102a10:	e8 2b 41 00 00       	call   106b40 <kvmalloc>
  pinit();         // process table
  102a15:	e8 c6 19 00 00       	call   1043e0 <pinit>
  tvinit();        // trap vectors
  102a1a:	e8 01 32 00 00       	call   105c20 <tvinit>
  102a1f:	90                   	nop
  binit();         // buffer cache
  102a20:	e8 fb d9 ff ff       	call   100420 <binit>
  fileinit();      // file table
  102a25:	e8 b6 e8 ff ff       	call   1012e0 <fileinit>
  iinit();         // inode cache
  102a2a:	e8 c1 f6 ff ff       	call   1020f0 <iinit>
  102a2f:	90                   	nop
  ideinit();       // disk
  102a30:	e8 1b f9 ff ff       	call   102350 <ideinit>
  if(!ismp)
  102a35:	a1 c4 7b 11 00       	mov    0x117bc4,%eax
  102a3a:	85 c0                	test   %eax,%eax
  102a3c:	0f 84 ab 00 00 00    	je     102aed <mainc+0xfd>
    timerinit();   // uniprocessor timer
  userinit();      // first user process
  102a42:	e8 c9 17 00 00       	call   104210 <userinit>
  char *stack;

  // Write bootstrap code to unused memory at 0x7000.  The linker has
  // placed the start of bootother.S there.
  code = (uchar *) 0x7000;
  memmove(code, _binary_bootother_start, (uint)_binary_bootother_size);
  102a47:	c7 44 24 08 6a 00 00 	movl   $0x6a,0x8(%esp)
  102a4e:	00 
  102a4f:	c7 44 24 04 54 91 10 	movl   $0x109154,0x4(%esp)
  102a56:	00 
  102a57:	c7 04 24 00 70 00 00 	movl   $0x7000,(%esp)
  102a5e:	e8 4d 1c 00 00       	call   1046b0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
  102a63:	69 05 c0 81 11 00 bc 	imul   $0xbc,0x1181c0,%eax
  102a6a:	00 00 00 
  102a6d:	05 e0 7b 11 00       	add    $0x117be0,%eax
  102a72:	3d e0 7b 11 00       	cmp    $0x117be0,%eax
  102a77:	76 6a                	jbe    102ae3 <mainc+0xf3>
  102a79:	bb e0 7b 11 00       	mov    $0x117be0,%ebx
  102a7e:	66 90                	xchg   %ax,%ax
    if(c == cpus+cpunum())  // We've started already.
  102a80:	e8 4b fd ff ff       	call   1027d0 <cpunum>
  102a85:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  102a8b:	05 e0 7b 11 00       	add    $0x117be0,%eax
  102a90:	39 c3                	cmp    %eax,%ebx
  102a92:	74 36                	je     102aca <mainc+0xda>
      continue;

    // Fill in %esp, %eip and start code on cpu.
    stack = kalloc();
  102a94:	e8 57 fa ff ff       	call   1024f0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpmain;
  102a99:	c7 05 f8 6f 00 00 80 	movl   $0x102980,0x6ff8
  102aa0:	29 10 00 
    if(c == cpus+cpunum())  // We've started already.
      continue;

    // Fill in %esp, %eip and start code on cpu.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
  102aa3:	05 00 10 00 00       	add    $0x1000,%eax
  102aa8:	a3 fc 6f 00 00       	mov    %eax,0x6ffc
    *(void**)(code-8) = mpmain;
    lapicstartap(c->id, (uint)code);
  102aad:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
  102ab4:	00 
  102ab5:	0f b6 03             	movzbl (%ebx),%eax
  102ab8:	89 04 24             	mov    %eax,(%esp)
  102abb:	e8 60 fc ff ff       	call   102720 <lapicstartap>

    // Wait for cpu to finish mpmain()
    while(c->booted == 0)
  102ac0:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
  102ac6:	85 c0                	test   %eax,%eax
  102ac8:	74 f6                	je     102ac0 <mainc+0xd0>
  // Write bootstrap code to unused memory at 0x7000.  The linker has
  // placed the start of bootother.S there.
  code = (uchar *) 0x7000;
  memmove(code, _binary_bootother_start, (uint)_binary_bootother_size);

  for(c = cpus; c < cpus+ncpu; c++){
  102aca:	69 05 c0 81 11 00 bc 	imul   $0xbc,0x1181c0,%eax
  102ad1:	00 00 00 
  102ad4:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
  102ada:	05 e0 7b 11 00       	add    $0x117be0,%eax
  102adf:	39 c3                	cmp    %eax,%ebx
  102ae1:	72 9d                	jb     102a80 <mainc+0x90>
  userinit();      // first user process
  bootothers();    // start other processors

  // Finish setting up this processor in mpmain.
  mpmain();
}
  102ae3:	83 c4 14             	add    $0x14,%esp
  102ae6:	5b                   	pop    %ebx
  102ae7:	5d                   	pop    %ebp
    timerinit();   // uniprocessor timer
  userinit();      // first user process
  bootothers();    // start other processors

  // Finish setting up this processor in mpmain.
  mpmain();
  102ae8:	e9 93 fe ff ff       	jmp    102980 <mpmain>
  binit();         // buffer cache
  fileinit();      // file table
  iinit();         // inode cache
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  102aed:	e8 2e 2e 00 00       	call   105920 <timerinit>
  102af2:	e9 4b ff ff ff       	jmp    102a42 <mainc+0x52>
  102af7:	89 f6                	mov    %esi,%esi
  102af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102b00 <jkstack>:
  jkstack();       // call mainc() on a properly-allocated stack 
}

void
jkstack(void)
{
  102b00:	55                   	push   %ebp
  102b01:	89 e5                	mov    %esp,%ebp
  102b03:	83 ec 18             	sub    $0x18,%esp
  char *kstack = kalloc();
  102b06:	e8 e5 f9 ff ff       	call   1024f0 <kalloc>
  if(!kstack)
  102b0b:	85 c0                	test   %eax,%eax
  102b0d:	74 19                	je     102b28 <jkstack+0x28>
    panic("jkstack\n");
  char *top = kstack + PGSIZE;
  asm volatile("movl %0,%%esp" : : "r" (top));
  102b0f:	05 00 10 00 00       	add    $0x1000,%eax
  102b14:	89 c4                	mov    %eax,%esp
  asm volatile("call mainc");
  102b16:	e8 d5 fe ff ff       	call   1029f0 <mainc>
  panic("jkstack");
  102b1b:	c7 04 24 41 75 10 00 	movl   $0x107541,(%esp)
  102b22:	e8 29 e0 ff ff       	call   100b50 <panic>
  102b27:	90                   	nop
void
jkstack(void)
{
  char *kstack = kalloc();
  if(!kstack)
    panic("jkstack\n");
  102b28:	c7 04 24 38 75 10 00 	movl   $0x107538,(%esp)
  102b2f:	e8 1c e0 ff ff       	call   100b50 <panic>
  102b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00102b40 <main>:
void mainc(void);

// Bootstrap processor starts running C code here.
int
main(void)
{
  102b40:	55                   	push   %ebp
  102b41:	89 e5                	mov    %esp,%ebp
  102b43:	83 e4 f0             	and    $0xfffffff0,%esp
  102b46:	83 ec 10             	sub    $0x10,%esp
  mpinit();        // collect info about this machine
  102b49:	e8 d2 00 00 00       	call   102c20 <mpinit>
  lapicinit(mpbcpu());
  102b4e:	e8 2d 00 00 00       	call   102b80 <mpbcpu>
  102b53:	89 04 24             	mov    %eax,(%esp)
  102b56:	e8 c5 fc ff ff       	call   102820 <lapicinit>
  ksegment();      // set up segments
  102b5b:	e8 20 44 00 00       	call   106f80 <ksegment>
  picinit();       // interrupt controller
  102b60:	e8 eb 02 00 00       	call   102e50 <picinit>
  ioapicinit();    // another interrupt controller
  102b65:	e8 c6 f8 ff ff       	call   102430 <ioapicinit>
  consoleinit();   // I/O devices & their interrupts
  102b6a:	e8 21 d9 ff ff       	call   100490 <consoleinit>
  102b6f:	90                   	nop
  uartinit();      // serial port
  102b70:	e8 db 31 00 00       	call   105d50 <uartinit>
  kinit();         // initialize memory allocator
  102b75:	e8 26 fa ff ff       	call   1025a0 <kinit>
  jkstack();       // call mainc() on a properly-allocated stack 
  102b7a:	e8 81 ff ff ff       	call   102b00 <jkstack>
  102b7f:	90                   	nop

00102b80 <mpbcpu>:
int ncpu;
uchar ioapicid;

int
mpbcpu(void)
{
  102b80:	a1 64 92 10 00       	mov    0x109264,%eax
  102b85:	55                   	push   %ebp
  102b86:	89 e5                	mov    %esp,%ebp
  return bcpu-cpus;
}
  102b88:	5d                   	pop    %ebp
int ncpu;
uchar ioapicid;

int
mpbcpu(void)
{
  102b89:	2d e0 7b 11 00       	sub    $0x117be0,%eax
  102b8e:	c1 f8 02             	sar    $0x2,%eax
  102b91:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
  return bcpu-cpus;
}
  102b97:	c3                   	ret    
  102b98:	90                   	nop
  102b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102ba0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uchar *addr, int len)
{
  102ba0:	55                   	push   %ebp
  102ba1:	89 e5                	mov    %esp,%ebp
  102ba3:	56                   	push   %esi
  102ba4:	89 d6                	mov    %edx,%esi
  102ba6:	53                   	push   %ebx
  102ba7:	89 c3                	mov    %eax,%ebx
  102ba9:	83 ec 10             	sub    $0x10,%esp
  uchar *e, *p;

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  e = addr+len;
  102bac:	8d 34 33             	lea    (%ebx,%esi,1),%esi
static struct mp*
mpsearch1(uchar *addr, int len)
{
  uchar *e, *p;

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  102baf:	89 54 24 08          	mov    %edx,0x8(%esp)
  102bb3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bb7:	c7 04 24 49 75 10 00 	movl   $0x107549,(%esp)
  102bbe:	e8 9d db ff ff       	call   100760 <cprintf>
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
  102bc3:	39 f3                	cmp    %esi,%ebx
  102bc5:	73 3a                	jae    102c01 <mpsearch1+0x61>
  102bc7:	90                   	nop
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  102bc8:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  102bcf:	00 
  102bd0:	c7 44 24 04 5c 75 10 	movl   $0x10755c,0x4(%esp)
  102bd7:	00 
  102bd8:	89 1c 24             	mov    %ebx,(%esp)
  102bdb:	e8 70 1a 00 00       	call   104650 <memcmp>
  102be0:	85 c0                	test   %eax,%eax
  102be2:	75 16                	jne    102bfa <mpsearch1+0x5a>
  102be4:	31 d2                	xor    %edx,%edx
  102be6:	66 90                	xchg   %ax,%ax
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
  102be8:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
  102bec:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
  102bef:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
  102bf1:	83 f8 10             	cmp    $0x10,%eax
  102bf4:	75 f2                	jne    102be8 <mpsearch1+0x48>
  uchar *e, *p;

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  102bf6:	84 d2                	test   %dl,%dl
  102bf8:	74 10                	je     102c0a <mpsearch1+0x6a>
{
  uchar *e, *p;

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
  102bfa:	83 c3 10             	add    $0x10,%ebx
  102bfd:	39 de                	cmp    %ebx,%esi
  102bff:	77 c7                	ja     102bc8 <mpsearch1+0x28>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
  102c01:	83 c4 10             	add    $0x10,%esp
{
  uchar *e, *p;

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
  102c04:	31 c0                	xor    %eax,%eax
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
  102c06:	5b                   	pop    %ebx
  102c07:	5e                   	pop    %esi
  102c08:	5d                   	pop    %ebp
  102c09:	c3                   	ret    
  102c0a:	83 c4 10             	add    $0x10,%esp

  cprintf("mpsearch1 0x%x %d\n", addr, len);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  102c0d:	89 d8                	mov    %ebx,%eax
  return 0;
}
  102c0f:	5b                   	pop    %ebx
  102c10:	5e                   	pop    %esi
  102c11:	5d                   	pop    %ebp
  102c12:	c3                   	ret    
  102c13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102c20 <mpinit>:
  return conf;
}

void
mpinit(void)
{
  102c20:	55                   	push   %ebp
  102c21:	89 e5                	mov    %esp,%ebp
  102c23:	57                   	push   %edi
  102c24:	56                   	push   %esi
  102c25:	53                   	push   %ebx
  102c26:	83 ec 2c             	sub    $0x2c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar*)0x400;
  if((p = ((bda[0x0F]<<8)|bda[0x0E]) << 4)){
  102c29:	0f b6 05 0f 04 00 00 	movzbl 0x40f,%eax
  102c30:	0f b6 15 0e 04 00 00 	movzbl 0x40e,%edx
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
  102c37:	c7 05 64 92 10 00 e0 	movl   $0x117be0,0x109264
  102c3e:	7b 11 00 
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar*)0x400;
  if((p = ((bda[0x0F]<<8)|bda[0x0E]) << 4)){
  102c41:	c1 e0 08             	shl    $0x8,%eax
  102c44:	09 d0                	or     %edx,%eax
  102c46:	c1 e0 04             	shl    $0x4,%eax
  102c49:	85 c0                	test   %eax,%eax
  102c4b:	75 1b                	jne    102c68 <mpinit+0x48>
    if((mp = mpsearch1((uchar*)p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1((uchar*)p-1024, 1024)))
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
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  102c7c:	8b 73 04             	mov    0x4(%ebx),%esi
  102c7f:	85 f6                	test   %esi,%esi
  102c81:	74 1c                	je     102c9f <mpinit+0x7f>
    return 0;
  conf = (struct mpconf*)mp->physaddr;
  if(memcmp(conf, "PCMP", 4) != 0)
  102c83:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  102c8a:	00 
  102c8b:	c7 44 24 04 61 75 10 	movl   $0x107561,0x4(%esp)
  102c92:	00 
  102c93:	89 34 24             	mov    %esi,(%esp)
  102c96:	e8 b5 19 00 00       	call   104650 <memcmp>
  102c9b:	85 c0                	test   %eax,%eax
  102c9d:	74 09                	je     102ca8 <mpinit+0x88>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
  102c9f:	83 c4 2c             	add    $0x2c,%esp
  102ca2:	5b                   	pop    %ebx
  102ca3:	5e                   	pop    %esi
  102ca4:	5f                   	pop    %edi
  102ca5:	5d                   	pop    %ebp
  102ca6:	c3                   	ret    
  102ca7:	90                   	nop
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*)mp->physaddr;
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
  102ca8:	0f b6 46 06          	movzbl 0x6(%esi),%eax
  102cac:	3c 04                	cmp    $0x4,%al
  102cae:	74 04                	je     102cb4 <mpinit+0x94>
  102cb0:	3c 01                	cmp    $0x1,%al
  102cb2:	75 eb                	jne    102c9f <mpinit+0x7f>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
  102cb4:	0f b7 7e 04          	movzwl 0x4(%esi),%edi
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
  102cb8:	85 ff                	test   %edi,%edi
  102cba:	74 15                	je     102cd1 <mpinit+0xb1>
  102cbc:	31 d2                	xor    %edx,%edx
  102cbe:	31 c0                	xor    %eax,%eax
    sum += addr[i];
  102cc0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
  102cc4:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
  102cc7:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
  102cc9:	39 c7                	cmp    %eax,%edi
  102ccb:	7f f3                	jg     102cc0 <mpinit+0xa0>
  conf = (struct mpconf*)mp->physaddr;
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
  102ccd:	84 d2                	test   %dl,%dl
  102ccf:	75 ce                	jne    102c9f <mpinit+0x7f>
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  102cd1:	c7 05 c4 7b 11 00 01 	movl   $0x1,0x117bc4
  102cd8:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
  102cdb:	8b 46 24             	mov    0x24(%esi),%eax
  102cde:	a3 b8 7b 11 00       	mov    %eax,0x117bb8
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  102ce3:	0f b7 56 04          	movzwl 0x4(%esi),%edx
  102ce7:	8d 46 2c             	lea    0x2c(%esi),%eax
  102cea:	8d 14 16             	lea    (%esi,%edx,1),%edx
  102ced:	39 d0                	cmp    %edx,%eax
  102cef:	73 61                	jae    102d52 <mpinit+0x132>
  102cf1:	8b 0d 64 92 10 00    	mov    0x109264,%ecx
  102cf7:	89 de                	mov    %ebx,%esi
  102cf9:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    switch(*p){
  102cfc:	0f b6 08             	movzbl (%eax),%ecx
  102cff:	80 f9 04             	cmp    $0x4,%cl
  102d02:	76 2c                	jbe    102d30 <mpinit+0x110>
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
  102d04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
  102d07:	0f b6 c9             	movzbl %cl,%ecx
  102d0a:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  102d0e:	c7 04 24 88 75 10 00 	movl   $0x107588,(%esp)
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
  102d15:	a3 64 92 10 00       	mov    %eax,0x109264
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
  102d1a:	e8 41 da ff ff       	call   100760 <cprintf>
      panic("mpinit");
  102d1f:	c7 04 24 81 75 10 00 	movl   $0x107581,(%esp)
  102d26:	e8 25 de ff ff       	call   100b50 <panic>
  102d2b:	90                   	nop
  102d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
  102d30:	0f b6 c9             	movzbl %cl,%ecx
  102d33:	ff 24 8d a8 75 10 00 	jmp    *0x1075a8(,%ecx,4)
  102d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
  102d40:	83 c0 08             	add    $0x8,%eax
  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
  102d43:	39 c2                	cmp    %eax,%edx
  102d45:	77 b5                	ja     102cfc <mpinit+0xdc>
  102d47:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  102d4a:	89 f3                	mov    %esi,%ebx
  102d4c:	89 0d 64 92 10 00    	mov    %ecx,0x109264
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
      panic("mpinit");
    }
  }
  if(mp->imcrp){
  102d52:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
  102d56:	0f 84 43 ff ff ff    	je     102c9f <mpinit+0x7f>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  102d5c:	ba 22 00 00 00       	mov    $0x22,%edx
  102d61:	b8 70 00 00 00       	mov    $0x70,%eax
  102d66:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  102d67:	b2 23                	mov    $0x23,%dl
  102d69:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  102d6a:	83 c8 01             	or     $0x1,%eax
  102d6d:	ee                   	out    %al,(%dx)
  102d6e:	e9 2c ff ff ff       	jmp    102c9f <mpinit+0x7f>
  102d73:	90                   	nop
  102d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu != proc->apicid) {
  102d78:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
  102d7c:	8b 3d c0 81 11 00    	mov    0x1181c0,%edi
  102d82:	0f b6 cb             	movzbl %bl,%ecx
  102d85:	39 f9                	cmp    %edi,%ecx
  102d87:	75 68                	jne    102df1 <mpinit+0x1d1>
        cprintf("mpinit: ncpu=%d apicpid=%d", ncpu, proc->apicid);
        panic("mpinit");
      }
      if(proc->flags & MPBOOT)
  102d89:	f6 40 03 02          	testb  $0x2,0x3(%eax)
  102d8d:	74 0f                	je     102d9e <mpinit+0x17e>
        bcpu = &cpus[ncpu];
  102d8f:	69 f9 bc 00 00 00    	imul   $0xbc,%ecx,%edi
  102d95:	81 c7 e0 7b 11 00    	add    $0x117be0,%edi
  102d9b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      cpus[ncpu].id = ncpu;
  102d9e:	69 f9 bc 00 00 00    	imul   $0xbc,%ecx,%edi
      ncpu++;
  102da4:	83 c1 01             	add    $0x1,%ecx
  102da7:	89 0d c0 81 11 00    	mov    %ecx,0x1181c0
      p += sizeof(struct mpproc);
  102dad:	83 c0 14             	add    $0x14,%eax
        cprintf("mpinit: ncpu=%d apicpid=%d", ncpu, proc->apicid);
        panic("mpinit");
      }
      if(proc->flags & MPBOOT)
        bcpu = &cpus[ncpu];
      cpus[ncpu].id = ncpu;
  102db0:	88 9f e0 7b 11 00    	mov    %bl,0x117be0(%edi)
      ncpu++;
      p += sizeof(struct mpproc);
      continue;
  102db6:	eb 8b                	jmp    102d43 <mpinit+0x123>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
  102db8:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
  102dbc:	83 c0 08             	add    $0x8,%eax
      ncpu++;
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
  102dbf:	88 0d c0 7b 11 00    	mov    %cl,0x117bc0
      p += sizeof(struct mpioapic);
      continue;
  102dc5:	e9 79 ff ff ff       	jmp    102d43 <mpinit+0x123>
  102dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1((uchar*)p-1024, 1024)))
      return mp;
  }
  return mpsearch1((uchar*)0xF0000, 0x10000);
  102dd0:	ba 00 00 01 00       	mov    $0x10000,%edx
  102dd5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
  102dda:	e8 c1 fd ff ff       	call   102ba0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  102ddf:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1((uchar*)p-1024, 1024)))
      return mp;
  }
  return mpsearch1((uchar*)0xF0000, 0x10000);
  102de1:	89 c3                	mov    %eax,%ebx
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
  102de3:	0f 85 93 fe ff ff    	jne    102c7c <mpinit+0x5c>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
  102de9:	83 c4 2c             	add    $0x2c,%esp
  102dec:	5b                   	pop    %ebx
  102ded:	5e                   	pop    %esi
  102dee:	5f                   	pop    %edi
  102def:	5d                   	pop    %ebp
  102df0:	c3                   	ret    
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu != proc->apicid) {
  102df1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        cprintf("mpinit: ncpu=%d apicpid=%d", ncpu, proc->apicid);
  102df4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  102df8:	89 7c 24 04          	mov    %edi,0x4(%esp)
  102dfc:	c7 04 24 66 75 10 00 	movl   $0x107566,(%esp)
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu != proc->apicid) {
  102e03:	a3 64 92 10 00       	mov    %eax,0x109264
        cprintf("mpinit: ncpu=%d apicpid=%d", ncpu, proc->apicid);
  102e08:	e8 53 d9 ff ff       	call   100760 <cprintf>
        panic("mpinit");
  102e0d:	c7 04 24 81 75 10 00 	movl   $0x107581,(%esp)
  102e14:	e8 37 dd ff ff       	call   100b50 <panic>
  102e19:	90                   	nop
  102e1a:	90                   	nop
  102e1b:	90                   	nop
  102e1c:	90                   	nop
  102e1d:	90                   	nop
  102e1e:	90                   	nop
  102e1f:	90                   	nop

00102e20 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
  102e20:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
  102e21:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
  102e26:	89 e5                	mov    %esp,%ebp
  102e28:	ba 21 00 00 00       	mov    $0x21,%edx
  picsetmask(irqmask & ~(1<<irq));
  102e2d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  102e30:	d3 c0                	rol    %cl,%eax
  102e32:	66 23 05 20 8d 10 00 	and    0x108d20,%ax
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
  irqmask = mask;
  102e39:	66 a3 20 8d 10 00    	mov    %ax,0x108d20
  102e3f:	ee                   	out    %al,(%dx)
  102e40:	66 c1 e8 08          	shr    $0x8,%ax
  102e44:	b2 a1                	mov    $0xa1,%dl
  102e46:	ee                   	out    %al,(%dx)

void
picenable(int irq)
{
  picsetmask(irqmask & ~(1<<irq));
}
  102e47:	5d                   	pop    %ebp
  102e48:	c3                   	ret    
  102e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102e50 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
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
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
  102ec8:	0f b7 05 20 8d 10 00 	movzwl 0x108d20,%eax
  102ecf:	66 83 f8 ff          	cmp    $0xffffffff,%ax
  102ed3:	74 0a                	je     102edf <picinit+0x8f>
  102ed5:	b2 21                	mov    $0x21,%dl
  102ed7:	ee                   	out    %al,(%dx)
  102ed8:	66 c1 e8 08          	shr    $0x8,%ax
  102edc:	b2 a1                	mov    $0xa1,%dl
  102ede:	ee                   	out    %al,(%dx)
    picsetmask(irqmask);
}
  102edf:	8b 1c 24             	mov    (%esp),%ebx
  102ee2:	8b 74 24 04          	mov    0x4(%esp),%esi
  102ee6:	8b 7c 24 08          	mov    0x8(%esp),%edi
  102eea:	89 ec                	mov    %ebp,%esp
  102eec:	5d                   	pop    %ebp
  102eed:	c3                   	ret    
  102eee:	90                   	nop
  102eef:	90                   	nop

00102ef0 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
  102ef0:	55                   	push   %ebp
  102ef1:	89 e5                	mov    %esp,%ebp
  102ef3:	57                   	push   %edi
  102ef4:	56                   	push   %esi
  102ef5:	53                   	push   %ebx
  102ef6:	83 ec 1c             	sub    $0x1c,%esp
  102ef9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  102efc:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i;

  acquire(&p->lock);
  102eff:	89 1c 24             	mov    %ebx,(%esp)
  102f02:	e8 89 16 00 00       	call   104590 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
  102f07:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  102f0d:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f13:	75 58                	jne    102f6d <piperead+0x7d>
  102f15:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
  102f1b:	85 f6                	test   %esi,%esi
  102f1d:	74 4e                	je     102f6d <piperead+0x7d>
    if(proc->killed){
  102f1f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  102f25:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
  102f2b:	8b 48 4c             	mov    0x4c(%eax),%ecx
  102f2e:	85 c9                	test   %ecx,%ecx
  102f30:	74 21                	je     102f53 <piperead+0x63>
  102f32:	e9 99 00 00 00       	jmp    102fd0 <piperead+0xe0>
  102f37:	90                   	nop
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
  102f38:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
  102f3e:	85 c0                	test   %eax,%eax
  102f40:	74 2b                	je     102f6d <piperead+0x7d>
    if(proc->killed){
  102f42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  102f48:	8b 50 4c             	mov    0x4c(%eax),%edx
  102f4b:	85 d2                	test   %edx,%edx
  102f4d:	0f 85 7d 00 00 00    	jne    102fd0 <piperead+0xe0>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  102f53:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  102f57:	89 34 24             	mov    %esi,(%esp)
  102f5a:	e8 c1 04 00 00       	call   103420 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
  102f5f:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  102f65:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f6b:	74 cb                	je     102f38 <piperead+0x48>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
  102f6d:	85 ff                	test   %edi,%edi
  102f6f:	7e 76                	jle    102fe7 <piperead+0xf7>
    if(p->nread == p->nwrite)
  102f71:	31 f6                	xor    %esi,%esi
  102f73:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
  102f79:	75 0d                	jne    102f88 <piperead+0x98>
  102f7b:	eb 6a                	jmp    102fe7 <piperead+0xf7>
  102f7d:	8d 76 00             	lea    0x0(%esi),%esi
  102f80:	39 93 38 02 00 00    	cmp    %edx,0x238(%ebx)
  102f86:	74 22                	je     102faa <piperead+0xba>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  102f88:	89 d0                	mov    %edx,%eax
  102f8a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  102f8d:	83 c2 01             	add    $0x1,%edx
  102f90:	25 ff 01 00 00       	and    $0x1ff,%eax
  102f95:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
  102f9a:	88 04 31             	mov    %al,(%ecx,%esi,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
  102f9d:	83 c6 01             	add    $0x1,%esi
  102fa0:	39 f7                	cmp    %esi,%edi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  102fa2:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
  102fa8:	7f d6                	jg     102f80 <piperead+0x90>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  102faa:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  102fb0:	89 04 24             	mov    %eax,(%esp)
  102fb3:	e8 38 03 00 00       	call   1032f0 <wakeup>
  release(&p->lock);
  102fb8:	89 1c 24             	mov    %ebx,(%esp)
  102fbb:	e8 80 15 00 00       	call   104540 <release>
  return i;
}
  102fc0:	83 c4 1c             	add    $0x1c,%esp
  102fc3:	89 f0                	mov    %esi,%eax
  102fc5:	5b                   	pop    %ebx
  102fc6:	5e                   	pop    %esi
  102fc7:	5f                   	pop    %edi
  102fc8:	5d                   	pop    %ebp
  102fc9:	c3                   	ret    
  102fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
  102fd0:	be ff ff ff ff       	mov    $0xffffffff,%esi
  102fd5:	89 1c 24             	mov    %ebx,(%esp)
  102fd8:	e8 63 15 00 00       	call   104540 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
  102fdd:	83 c4 1c             	add    $0x1c,%esp
  102fe0:	89 f0                	mov    %esi,%eax
  102fe2:	5b                   	pop    %ebx
  102fe3:	5e                   	pop    %esi
  102fe4:	5f                   	pop    %edi
  102fe5:	5d                   	pop    %ebp
  102fe6:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
  102fe7:	31 f6                	xor    %esi,%esi
  102fe9:	eb bf                	jmp    102faa <piperead+0xba>
  102feb:	90                   	nop
  102fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00102ff0 <pipewrite>:
    release(&p->lock);
}

int
pipewrite(struct pipe *p, char *addr, int n)
{
  102ff0:	55                   	push   %ebp
  102ff1:	89 e5                	mov    %esp,%ebp
  102ff3:	57                   	push   %edi
  102ff4:	56                   	push   %esi
  102ff5:	53                   	push   %ebx
  102ff6:	83 ec 3c             	sub    $0x3c,%esp
  102ff9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
  102ffc:	89 1c 24             	mov    %ebx,(%esp)
  102fff:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
  103005:	e8 86 15 00 00       	call   104590 <acquire>
  for(i = 0; i < n; i++){
  10300a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10300d:	85 c9                	test   %ecx,%ecx
  10300f:	0f 8e 8d 00 00 00    	jle    1030a2 <pipewrite+0xb2>
  103015:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
  10301b:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
  103021:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  103028:	eb 37                	jmp    103061 <pipewrite+0x71>
  10302a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE) {  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
  103030:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
  103036:	85 c0                	test   %eax,%eax
  103038:	74 7e                	je     1030b8 <pipewrite+0xc8>
  10303a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103040:	8b 50 4c             	mov    0x4c(%eax),%edx
  103043:	85 d2                	test   %edx,%edx
  103045:	75 71                	jne    1030b8 <pipewrite+0xc8>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
  103047:	89 34 24             	mov    %esi,(%esp)
  10304a:	e8 a1 02 00 00       	call   1032f0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
  10304f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  103053:	89 3c 24             	mov    %edi,(%esp)
  103056:	e8 c5 03 00 00       	call   103420 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE) {  //DOC: pipewrite-full
  10305b:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
  103061:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
  103067:	81 c2 00 02 00 00    	add    $0x200,%edx
  10306d:	39 d0                	cmp    %edx,%eax
  10306f:	74 bf                	je     103030 <pipewrite+0x40>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
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
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
  103096:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  10309a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10309d:	39 4d 10             	cmp    %ecx,0x10(%ebp)
  1030a0:	7f bf                	jg     103061 <pipewrite+0x71>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  1030a2:	89 34 24             	mov    %esi,(%esp)
  1030a5:	e8 46 02 00 00       	call   1032f0 <wakeup>
  release(&p->lock);
  1030aa:	89 1c 24             	mov    %ebx,(%esp)
  1030ad:	e8 8e 14 00 00       	call   104540 <release>
  return n;
  1030b2:	eb 13                	jmp    1030c7 <pipewrite+0xd7>
  1030b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE) {  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
  1030b8:	89 1c 24             	mov    %ebx,(%esp)
  1030bb:	e8 80 14 00 00       	call   104540 <release>
  1030c0:	c7 45 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
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
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
  1030e0:	55                   	push   %ebp
  1030e1:	89 e5                	mov    %esp,%ebp
  1030e3:	83 ec 18             	sub    $0x18,%esp
  1030e6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  1030e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  1030ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  1030ef:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
  1030f2:	89 1c 24             	mov    %ebx,(%esp)
  1030f5:	e8 96 14 00 00       	call   104590 <acquire>
  if(writable){
  1030fa:	85 f6                	test   %esi,%esi
  1030fc:	74 42                	je     103140 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
  1030fe:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
  103104:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
  10310b:	00 00 00 
    wakeup(&p->nread);
  10310e:	89 04 24             	mov    %eax,(%esp)
  103111:	e8 da 01 00 00       	call   1032f0 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0) {
  103116:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
  10311c:	85 c0                	test   %eax,%eax
  10311e:	75 0a                	jne    10312a <pipeclose+0x4a>
  103120:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
  103126:	85 f6                	test   %esi,%esi
  103128:	74 36                	je     103160 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
  10312a:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
  10312d:	8b 75 fc             	mov    -0x4(%ebp),%esi
  103130:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  103133:	89 ec                	mov    %ebp,%esp
  103135:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0) {
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
  103136:	e9 05 14 00 00       	jmp    104540 <release>
  10313b:	90                   	nop
  10313c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  103140:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
  103146:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
  10314d:	00 00 00 
    wakeup(&p->nwrite);
  103150:	89 04 24             	mov    %eax,(%esp)
  103153:	e8 98 01 00 00       	call   1032f0 <wakeup>
  103158:	eb bc                	jmp    103116 <pipeclose+0x36>
  10315a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  if(p->readopen == 0 && p->writeopen == 0) {
    release(&p->lock);
  103160:	89 1c 24             	mov    %ebx,(%esp)
  103163:	e8 d8 13 00 00       	call   104540 <release>
    kfree((char*)p);
  } else
    release(&p->lock);
}
  103168:	8b 75 fc             	mov    -0x4(%ebp),%esi
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0) {
    release(&p->lock);
    kfree((char*)p);
  10316b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  } else
    release(&p->lock);
}
  10316e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  103171:	89 ec                	mov    %ebp,%esp
  103173:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0) {
    release(&p->lock);
    kfree((char*)p);
  103174:	e9 b7 f3 ff ff       	jmp    102530 <kfree>
  103179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103180 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
  103180:	55                   	push   %ebp
  103181:	89 e5                	mov    %esp,%ebp
  103183:	57                   	push   %edi
  103184:	56                   	push   %esi
  103185:	53                   	push   %ebx
  103186:	83 ec 1c             	sub    $0x1c,%esp
  103189:	8b 75 08             	mov    0x8(%ebp),%esi
  10318c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
  10318f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  103195:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
  10319b:	e8 e0 df ff ff       	call   101180 <filealloc>
  1031a0:	85 c0                	test   %eax,%eax
  1031a2:	89 06                	mov    %eax,(%esi)
  1031a4:	0f 84 9c 00 00 00    	je     103246 <pipealloc+0xc6>
  1031aa:	e8 d1 df ff ff       	call   101180 <filealloc>
  1031af:	85 c0                	test   %eax,%eax
  1031b1:	89 03                	mov    %eax,(%ebx)
  1031b3:	0f 84 7f 00 00 00    	je     103238 <pipealloc+0xb8>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
  1031b9:	e8 32 f3 ff ff       	call   1024f0 <kalloc>
  1031be:	85 c0                	test   %eax,%eax
  1031c0:	89 c7                	mov    %eax,%edi
  1031c2:	74 74                	je     103238 <pipealloc+0xb8>
    goto bad;
  p->readopen = 1;
  1031c4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
  1031cb:	00 00 00 
  p->writeopen = 1;
  1031ce:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
  1031d5:	00 00 00 
  p->nwrite = 0;
  1031d8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
  1031df:	00 00 00 
  p->nread = 0;
  1031e2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
  1031e9:	00 00 00 
  initlock(&p->lock, "pipe");
  1031ec:	89 04 24             	mov    %eax,(%esp)
  1031ef:	c7 44 24 04 bc 75 10 	movl   $0x1075bc,0x4(%esp)
  1031f6:	00 
  1031f7:	e8 04 12 00 00       	call   104400 <initlock>
  (*f0)->type = FD_PIPE;
  1031fc:	8b 06                	mov    (%esi),%eax
  1031fe:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
  103204:	8b 06                	mov    (%esi),%eax
  103206:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
  10320a:	8b 06                	mov    (%esi),%eax
  10320c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
  103210:	8b 06                	mov    (%esi),%eax
  103212:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
  103215:	8b 03                	mov    (%ebx),%eax
  103217:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
  10321d:	8b 03                	mov    (%ebx),%eax
  10321f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
  103223:	8b 03                	mov    (%ebx),%eax
  103225:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
  103229:	8b 03                	mov    (%ebx),%eax
  10322b:	89 78 0c             	mov    %edi,0xc(%eax)
  10322e:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
  103230:	83 c4 1c             	add    $0x1c,%esp
  103233:	5b                   	pop    %ebx
  103234:	5e                   	pop    %esi
  103235:	5f                   	pop    %edi
  103236:	5d                   	pop    %ebp
  103237:	c3                   	ret    
  return 0;

 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
  103238:	8b 06                	mov    (%esi),%eax
  10323a:	85 c0                	test   %eax,%eax
  10323c:	74 08                	je     103246 <pipealloc+0xc6>
    fileclose(*f0);
  10323e:	89 04 24             	mov    %eax,(%esp)
  103241:	e8 ba df ff ff       	call   101200 <fileclose>
  if(*f1)
  103246:	8b 13                	mov    (%ebx),%edx
  103248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10324d:	85 d2                	test   %edx,%edx
  10324f:	74 df                	je     103230 <pipealloc+0xb0>
    fileclose(*f1);
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
  10326a:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103271:	e8 1a 13 00 00       	call   104590 <acquire>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->pid == pid) {
  103276:	8b 15 6c 82 11 00    	mov    0x11826c,%edx
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).

int
kill(int pid) {
  10327c:	b8 9c 82 11 00       	mov    $0x11829c,%eax
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
  103288:	05 88 00 00 00       	add    $0x88,%eax
  10328d:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
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
  1032a8:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1032af:	e8 8c 12 00 00       	call   104540 <release>
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
  1032d0:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1032d7:	e8 64 12 00 00       	call   104540 <release>
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
  1032e7:	b8 14 82 11 00       	mov    $0x118214,%eax
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
  1032fa:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103301:	e8 8a 12 00 00       	call   104590 <acquire>
}

// Wake up all processes sleeping on chan.

void
wakeup(void *chan) {
  103306:	b8 14 82 11 00       	mov    $0x118214,%eax
  10330b:	eb 0f                	jmp    10331c <wakeup+0x2c>
  10330d:	8d 76 00             	lea    0x0(%esi),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103310:	05 88 00 00 00       	add    $0x88,%eax
  103315:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
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
  10332e:	05 88 00 00 00       	add    $0x88,%eax
  103333:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103338:	75 e2                	jne    10331c <wakeup+0x2c>
  10333a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

void
wakeup(void *chan) {
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
  103340:	c7 45 08 e0 81 11 00 	movl   $0x1181e0,0x8(%ebp)
}
  103347:	83 c4 14             	add    $0x14,%esp
  10334a:	5b                   	pop    %ebx
  10334b:	5d                   	pop    %ebp

void
wakeup(void *chan) {
    acquire(&ptable.lock);
    wakeup1(chan);
    release(&ptable.lock);
  10334c:	e9 ef 11 00 00       	jmp    104540 <release>
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
  103366:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  10336d:	e8 ce 11 00 00       	call   104540 <release>

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
  103387:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  10338e:	e8 ed 10 00 00       	call   104480 <holding>
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
  1033cd:	e8 5a 14 00 00       	call   10482c <swtch>
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
  1033e4:	c7 04 24 c1 75 10 00 	movl   $0x1075c1,(%esp)
  1033eb:	e8 60 d7 ff ff       	call   100b50 <panic>
    if (cpu->ncli != 1)
        panic("sched locks");
    if (proc->state == RUNNING)
        panic("sched running");
    if (readeflags() & FL_IF)
        panic("sched interruptible");
  1033f0:	c7 04 24 ed 75 10 00 	movl   $0x1075ed,(%esp)
  1033f7:	e8 54 d7 ff ff       	call   100b50 <panic>
    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
        panic("sched locks");
    if (proc->state == RUNNING)
        panic("sched running");
  1033fc:	c7 04 24 df 75 10 00 	movl   $0x1075df,(%esp)
  103403:	e8 48 d7 ff ff       	call   100b50 <panic>
    int intena;

    if (!holding(&ptable.lock))
        panic("sched ptable.lock");
    if (cpu->ncli != 1)
        panic("sched locks");
  103408:	c7 04 24 d3 75 10 00 	movl   $0x1075d3,(%esp)
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
  103444:	81 fb e0 81 11 00    	cmp    $0x1181e0,%ebx
  10344a:	74 5c                	je     1034a8 <sleep+0x88>
        acquire(&ptable.lock); //DOC: sleeplock1
  10344c:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103453:	e8 38 11 00 00       	call   104590 <acquire>
        release(lk);
  103458:	89 1c 24             	mov    %ebx,(%esp)
  10345b:	e8 e0 10 00 00       	call   104540 <release>
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
  103488:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  10348f:	e8 ac 10 00 00       	call   104540 <release>
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
  10349d:	e9 ee 10 00 00       	jmp    104590 <acquire>
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
  1034d1:	c7 04 24 07 76 10 00 	movl   $0x107607,(%esp)
  1034d8:	e8 73 d6 ff ff       	call   100b50 <panic>
// Reacquires lock when awakened.

void
sleep(void *chan, struct spinlock *lk) {
    if (proc == 0)
        panic("sleep");
  1034dd:	c7 04 24 01 76 10 00 	movl   $0x107601,(%esp)
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
  1034f6:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1034fd:	e8 8e 10 00 00       	call   104590 <acquire>
    proc->state = RUNNABLE;
  103502:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103508:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
    sched();
  10350f:	e8 6c fe ff ff       	call   103380 <sched>
    release(&ptable.lock);
  103514:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  10351b:	e8 20 10 00 00       	call   104540 <release>
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
  103539:	bb 14 82 11 00       	mov    $0x118214,%ebx
    for (;;) {
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
  10353e:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103545:	e8 46 10 00 00       	call   104590 <acquire>
  10354a:	eb 12                	jmp    10355e <scheduler+0x2e>
  10354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103550:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103556:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
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
  10356e:	e8 5d 39 00 00       	call   106ed0 <switchuvm>
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
  103580:	81 c3 88 00 00 00    	add    $0x88,%ebx
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
  103599:	e8 8e 12 00 00       	call   10482c <swtch>
            switchkvm();
  10359e:	e8 fd 32 00 00       	call   1068a0 <switchkvm>
        // Enable interrupts on this processor.
        sti();

        // Loop over process table looking for process to run.
        acquire(&ptable.lock);
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  1035a3:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
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
  1035b8:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1035bf:	e8 7c 0f 00 00       	call   104540 <release>

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
  1035d6:	bb 14 82 11 00       	mov    $0x118214,%ebx
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
  1035e4:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1035eb:	e8 a0 0f 00 00       	call   104590 <acquire>
  1035f0:	31 c0                	xor    %eax,%eax
  1035f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  1035f8:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
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
  103618:	bb 14 82 11 00       	mov    $0x118214,%ebx
  10361d:	89 04 24             	mov    %eax,(%esp)
  103620:	c7 44 24 04 e0 81 11 	movl   $0x1181e0,0x4(%esp)
  103627:	00 
  103628:	e8 f3 fd ff ff       	call   103420 <sleep>
  10362d:	31 c0                	xor    %eax,%eax

    acquire(&ptable.lock);
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  10362f:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  103635:	73 c9                	jae    103600 <thread_join+0x30>
            if (p->tid != thread_id) {
  103637:	8b 53 7c             	mov    0x7c(%ebx),%edx
  10363a:	39 f2                	cmp    %esi,%edx
  10363c:	74 0a                	je     103648 <thread_join+0x78>

    acquire(&ptable.lock);
    for (;;) {
        //cprintf("thread_join\n");
        exists = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  10363e:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103644:	eb b2                	jmp    1035f8 <thread_join+0x28>
  103646:	66 90                	xchg   %ax,%ax
		//cprintf("hmmm");
                continue;
            } //else
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
  103688:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  10368f:	e8 ac 0e 00 00       	call   104540 <release>
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
  1036d6:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1036dd:	e8 5e 0e 00 00       	call   104540 <release>
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
  1036f3:	57                   	push   %edi
  1036f4:	56                   	push   %esi
    struct proc *p, *np;
    int havekids, pid = -1;

    acquire(&ptable.lock);
  1036f5:	be 14 82 11 00       	mov    $0x118214,%esi

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  1036fa:	53                   	push   %ebx
  1036fb:	83 ec 2c             	sub    $0x2c,%esp
    struct proc *p, *np;
    int havekids, pid = -1;

    acquire(&ptable.lock);
  1036fe:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103705:	e8 86 0e 00 00       	call   104590 <acquire>
  10370a:	31 c0                	xor    %eax,%eax
  10370c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103710:	81 fe 14 a4 11 00    	cmp    $0x11a414,%esi
  103716:	72 38                	jb     103750 <wait+0x60>
                return pid;
            } 
        }

        // No point waiting if we don't have any children.
        if (!havekids || proc->killed) {
  103718:	85 c0                	test   %eax,%eax
  10371a:	0f 84 91 00 00 00    	je     1037b1 <wait+0xc1>
  103720:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103726:	8b 48 4c             	mov    0x4c(%eax),%ecx
  103729:	85 c9                	test   %ecx,%ecx
  10372b:	0f 85 80 00 00 00    	jne    1037b1 <wait+0xc1>
            release(&ptable.lock);
            return -1;
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock); //DOC: wait-sleep
  103731:	be 14 82 11 00       	mov    $0x118214,%esi
  103736:	89 04 24             	mov    %eax,(%esp)
  103739:	c7 44 24 04 e0 81 11 	movl   $0x1181e0,0x4(%esp)
  103740:	00 
  103741:	e8 da fc ff ff       	call   103420 <sleep>
  103746:	31 c0                	xor    %eax,%eax

    acquire(&ptable.lock);
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103748:	81 fe 14 a4 11 00    	cmp    $0x11a414,%esi
  10374e:	73 c8                	jae    103718 <wait+0x28>
            if (p->parent != proc)
  103750:	8b 5e 5c             	mov    0x5c(%esi),%ebx
  103753:	65 3b 1d 04 00 00 00 	cmp    %gs:0x4,%ebx
  10375a:	74 0c                	je     103768 <wait+0x78>

    acquire(&ptable.lock);
    for (;;) {
        // Scan through table looking for zombie children.
        havekids = 0;
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  10375c:	81 c6 88 00 00 00    	add    $0x88,%esi
  103762:	eb ac                	jmp    103710 <wait+0x20>
  103764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  103768:	b8 14 82 11 00       	mov    $0x118214,%eax
  10376d:	31 ff                	xor    %edi,%edi
  10376f:	eb 13                	jmp    103784 <wait+0x94>
  103771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		

	int counter = 0;
	int threads_clean = 0;

	for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
  103778:	05 88 00 00 00       	add    $0x88,%eax
  10377d:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103782:	74 21                	je     1037a5 <wait+0xb5>
		if((np->pid == proc->pid) && (np->state != ZOMBIE)) {
  103784:	8b 48 58             	mov    0x58(%eax),%ecx
  103787:	8b 53 58             	mov    0x58(%ebx),%edx
  10378a:	39 d1                	cmp    %edx,%ecx
  10378c:	75 ea                	jne    103778 <wait+0x88>
			counter++;
  10378e:	31 d2                	xor    %edx,%edx
  103790:	83 78 54 05          	cmpl   $0x5,0x54(%eax)
  103794:	0f 95 c2             	setne  %dl
		

	int counter = 0;
	int threads_clean = 0;

	for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
  103797:	05 88 00 00 00       	add    $0x88,%eax
		if((np->pid == proc->pid) && (np->state != ZOMBIE)) {
			counter++;
  10379c:	01 d7                	add    %edx,%edi
		

	int counter = 0;
	int threads_clean = 0;

	for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
  10379e:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  1037a3:	75 df                	jne    103784 <wait+0x94>
		if((np->pid == proc->pid) && (np->state != ZOMBIE)) {
			counter++;
		}

	}
	if(counter == 1) {
  1037a5:	83 ff 01             	cmp    $0x1,%edi
  1037a8:	74 20                	je     1037ca <wait+0xda>
                p->name[0] = 0;
                p->killed = 0;
                p->joinedthread = 0;
                freevm(p->pgdir);
                release(&ptable.lock);
                return pid;
  1037aa:	b8 01 00 00 00       	mov    $0x1,%eax
  1037af:	eb ab                	jmp    10375c <wait+0x6c>
            } 
        }

        // No point waiting if we don't have any children.
        if (!havekids || proc->killed) {
            release(&ptable.lock);
  1037b1:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1037b8:	e8 83 0d 00 00       	call   104540 <release>
  1037bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
        }

        // Wait for children to exit.  (See wakeup1 call in proc_exit.)
        sleep(proc, &ptable.lock); //DOC: wait-sleep
    }
}
  1037c2:	83 c4 2c             	add    $0x2c,%esp
  1037c5:	5b                   	pop    %ebx
  1037c6:	5e                   	pop    %esi
  1037c7:	5f                   	pop    %edi
  1037c8:	5d                   	pop    %ebp
  1037c9:	c3                   	ret    
	if(counter == 1) {
		threads_clean = 1; 
	}
	//cprintf("erwerwerwer");

            if ((p->state == ZOMBIE) && (threads_clean == 1)) {
  1037ca:	83 7e 54 05          	cmpl   $0x5,0x54(%esi)
  1037ce:	75 da                	jne    1037aa <wait+0xba>

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.

int
wait(void) {
  1037d0:	bb 14 82 11 00       	mov    $0x118214,%ebx
  1037d5:	eb 0f                	jmp    1037e6 <wait+0xf6>
  1037d7:	90                   	nop
	}
	//cprintf("erwerwerwer");

            if ((p->state == ZOMBIE) && (threads_clean == 1)) {
		//cprintf("here?\n");
                for (np = ptable.proc; np < &ptable.proc[NPROC]; np++) {
  1037d8:	81 c3 88 00 00 00    	add    $0x88,%ebx
  1037de:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  1037e4:	74 60                	je     103846 <wait+0x156>
                    if ((np->pid == p->pid) && (p != np)) {
  1037e6:	8b 53 58             	mov    0x58(%ebx),%edx
  1037e9:	8b 46 58             	mov    0x58(%esi),%eax
  1037ec:	39 c2                	cmp    %eax,%edx
  1037ee:	75 e8                	jne    1037d8 <wait+0xe8>
  1037f0:	39 de                	cmp    %ebx,%esi
  1037f2:	74 e4                	je     1037d8 <wait+0xe8>
			//cprintf("you suck\n");
                        pid = np->pid;
  1037f4:	8b 43 58             	mov    0x58(%ebx),%eax
                        kfree(np->kstack);
  1037f7:	8b 43 50             	mov    0x50(%ebx),%eax
  1037fa:	89 04 24             	mov    %eax,(%esp)
  1037fd:	e8 2e ed ff ff       	call   102530 <kfree>
			//cprintf("you suck22222\n");
                        np->kstack = 0;
                        np->state = UNUSED;
                        np->pid = 0;
  103802:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
                    if ((np->pid == p->pid) && (p != np)) {
			//cprintf("you suck\n");
                        pid = np->pid;
                        kfree(np->kstack);
			//cprintf("you suck22222\n");
                        np->kstack = 0;
  103809:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
                        np->state = UNUSED;
  103810:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
                        np->pid = 0;
                        np->tid = 0;
  103817:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
                        np->ret_val = 0;
  10381e:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  103825:	00 00 00 
                        np->parent = 0;
  103828:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
                        np->name[0] = 0;
  10382f:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
                        np->killed = 0;
  103833:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
                        np->joinedthread = 0;
  10383a:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
  103841:	00 00 00 
  103844:	eb 92                	jmp    1037d8 <wait+0xe8>
                    }
                }
                // Found one.
		//cprintf("GET ON THE FLOOR");
                pid = p->pid;
  103846:	8b 46 58             	mov    0x58(%esi),%eax
                kfree(p->kstack);
  103849:	8b 56 50             	mov    0x50(%esi),%edx
  10384c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10384f:	89 14 24             	mov    %edx,(%esp)
  103852:	e8 d9 ec ff ff       	call   102530 <kfree>
                p->ret_val = 0;
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                p->joinedthread = 0;
                freevm(p->pgdir);
  103857:	8b 56 04             	mov    0x4(%esi),%edx
		//cprintf("GET ON THE FLOOR");
                pid = p->pid;
                kfree(p->kstack);
                p->kstack = 0;
                p->state = UNUSED;
                p->pid = 0;
  10385a:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
                }
                // Found one.
		//cprintf("GET ON THE FLOOR");
                pid = p->pid;
                kfree(p->kstack);
                p->kstack = 0;
  103861:	c7 46 50 00 00 00 00 	movl   $0x0,0x50(%esi)
                p->state = UNUSED;
  103868:	c7 46 54 00 00 00 00 	movl   $0x0,0x54(%esi)
                p->ret_val = 0;
                p->parent = 0;
                p->name[0] = 0;
                p->killed = 0;
                p->joinedthread = 0;
                freevm(p->pgdir);
  10386f:	89 14 24             	mov    %edx,(%esp)
                pid = p->pid;
                kfree(p->kstack);
                p->kstack = 0;
                p->state = UNUSED;
                p->pid = 0;
                p->tid = 0;
  103872:	c7 46 7c 00 00 00 00 	movl   $0x0,0x7c(%esi)
                p->ret_val = 0;
  103879:	c7 86 84 00 00 00 00 	movl   $0x0,0x84(%esi)
  103880:	00 00 00 
                p->parent = 0;
  103883:	c7 46 5c 00 00 00 00 	movl   $0x0,0x5c(%esi)
                p->name[0] = 0;
  10388a:	c6 46 6c 00          	movb   $0x0,0x6c(%esi)
                p->killed = 0;
  10388e:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
                p->joinedthread = 0;
  103895:	c7 86 80 00 00 00 00 	movl   $0x0,0x80(%esi)
  10389c:	00 00 00 
                freevm(p->pgdir);
  10389f:	e8 5c 33 00 00       	call   106c00 <freevm>
                release(&ptable.lock);
  1038a4:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1038ab:	e8 90 0c 00 00       	call   104540 <release>
                return pid;
  1038b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1038b3:	e9 0a ff ff ff       	jmp    1037c2 <wait+0xd2>
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
  1038cf:	3b 05 68 92 10 00    	cmp    0x109268,%eax
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
  1038f3:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1038fa:	e8 91 0c 00 00       	call   104590 <acquire>

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);
  1038ff:	65 8b 1d 04 00 00 00 	mov    %gs:0x4,%ebx
  sched();
  panic("zombie exit");
}

void
exit_all_threads(void) {
  103906:	b9 14 a4 11 00       	mov    $0x11a414,%ecx
  10390b:	b8 14 82 11 00       	mov    $0x118214,%eax
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
  103918:	05 88 00 00 00       	add    $0x88,%eax
  10391d:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
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
  103936:	05 88 00 00 00       	add    $0x88,%eax
  10393b:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103940:	75 e2                	jne    103924 <exit_all_threads+0x64>
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->parent == proc) {
            p->parent = initproc;
  103942:	8b 35 68 92 10 00    	mov    0x109268,%esi
  103948:	ba 14 82 11 00       	mov    $0x118214,%edx
  10394d:	eb 0f                	jmp    10395e <exit_all_threads+0x9e>
  10394f:	90                   	nop

    // Parent might be sleeping in wait().
    wakeup1(proc->parent);

    // Pass abandoned children to init.
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103950:	81 c2 88 00 00 00    	add    $0x88,%edx
  103956:	81 fa 14 a4 11 00    	cmp    $0x11a414,%edx
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
  103997:	81 c2 88 00 00 00    	add    $0x88,%edx
  10399d:	81 fa 14 a4 11 00    	cmp    $0x11a414,%edx
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
  1039b1:	c7 04 24 40 76 10 00 	movl   $0x107640,(%esp)
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
  1039c9:	b8 14 82 11 00       	mov    $0x118214,%eax
  1039ce:	eb 09                	jmp    1039d9 <exit_all_threads+0x119>

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  1039d0:	05 88 00 00 00       	add    $0x88,%eax
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
  1039f2:	c7 04 24 18 76 10 00 	movl   $0x107618,(%esp)
  1039f9:	e8 52 d1 ff ff       	call   100b50 <panic>
  1039fe:	66 90                	xchg   %ax,%ax

00103a00 <exit>:
}


void
exit(void)
{
  103a00:	55                   	push   %ebp
    return pid;
}


void
exit(void)
  103a01:	b9 14 82 11 00       	mov    $0x118214,%ecx
{
  103a06:	89 e5                	mov    %esp,%ebp
  103a08:	57                   	push   %edi
  103a09:	56                   	push   %esi
  103a0a:	53                   	push   %ebx
  103a0b:	83 ec 1c             	sub    $0x1c,%esp
  struct proc *p;
  struct proc *np;
  int fd;

  if(proc->tid == -1) {
  103a0e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103a14:	8b 58 7c             	mov    0x7c(%eax),%ebx
  103a17:	89 c2                	mov    %eax,%edx
  103a19:	83 fb ff             	cmp    $0xffffffff,%ebx
  103a1c:	75 1a                	jne    103a38 <exit+0x38>
  103a1e:	e9 f1 01 00 00       	jmp    103c14 <exit+0x214>
  103a23:	90                   	nop
  103a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi


  } else {
	//cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103a28:	81 c1 88 00 00 00    	add    $0x88,%ecx
  103a2e:	81 f9 14 a4 11 00    	cmp    $0x11a414,%ecx
  103a34:	74 56                	je     103a8c <exit+0x8c>
  103a36:	89 c2                	mov    %eax,%edx
	//kills all the threads of the process not including the thread itself and the process
	if((p->pid == proc->pid) && (p->tid != -1) && (p != proc)){
  103a38:	8b 71 58             	mov    0x58(%ecx),%esi
  103a3b:	8b 58 58             	mov    0x58(%eax),%ebx
  103a3e:	39 de                	cmp    %ebx,%esi
  103a40:	75 e6                	jne    103a28 <exit+0x28>
  103a42:	8b 59 7c             	mov    0x7c(%ecx),%ebx
  103a45:	83 fb ff             	cmp    $0xffffffff,%ebx
  103a48:	74 de                	je     103a28 <exit+0x28>
  103a4a:	39 c8                	cmp    %ecx,%eax
  103a4c:	74 da                	je     103a28 <exit+0x28>
  103a4e:	31 d2                	xor    %edx,%edx
		for(fd = 0; fd < NOFILE; fd++){
			if(proc->ofile[fd]){
  103a50:	8b 5c 90 08          	mov    0x8(%eax,%edx,4),%ebx
  103a54:	85 db                	test   %ebx,%ebx
  103a56:	74 0e                	je     103a66 <exit+0x66>
				proc->ofile[fd] = 0;
  103a58:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  103a5f:	00 
  103a60:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
	//cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	//kills all the threads of the process not including the thread itself and the process
	if((p->pid == proc->pid) && (p->tid != -1) && (p != proc)){
		for(fd = 0; fd < NOFILE; fd++){
  103a66:	83 c2 01             	add    $0x1,%edx
  103a69:	83 fa 10             	cmp    $0x10,%edx
  103a6c:	75 e2                	jne    103a50 <exit+0x50>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;			
  103a6e:	c7 41 48 00 00 00 00 	movl   $0x0,0x48(%ecx)
			p->state = ZOMBIE;
  103a75:	89 c2                	mov    %eax,%edx
  103a77:	c7 41 54 05 00 00 00 	movl   $0x5,0x54(%ecx)


  } else {
	//cprintf("thread exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103a7e:	81 c1 88 00 00 00    	add    $0x88,%ecx
  103a84:	81 f9 14 a4 11 00    	cmp    $0x11a414,%ecx
  103a8a:	75 aa                	jne    103a36 <exit+0x36>
  103a8c:	bb 14 82 11 00       	mov    $0x118214,%ebx
  103a91:	eb 19                	jmp    103aac <exit+0xac>
  103a93:	90                   	nop
  103a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			p->state = ZOMBIE;
		}
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103a98:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103a9e:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  103aa4:	0f 84 07 01 00 00    	je     103bb1 <exit+0x1b1>
  103aaa:	89 c2                	mov    %eax,%edx
	if((p->pid == proc->pid) && (p->tid == -1)){
  103aac:	8b 73 58             	mov    0x58(%ebx),%esi
  103aaf:	8b 48 58             	mov    0x58(%eax),%ecx
  103ab2:	39 ce                	cmp    %ecx,%esi
  103ab4:	75 e2                	jne    103a98 <exit+0x98>
  103ab6:	8b 4b 7c             	mov    0x7c(%ebx),%ecx
  103ab9:	83 f9 ff             	cmp    $0xffffffff,%ecx
  103abc:	75 da                	jne    103a98 <exit+0x98>
  103abe:	31 c0                	xor    %eax,%eax
  103ac0:	eb 0d                	jmp    103acf <exit+0xcf>
  103ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		for(fd = 0; fd < NOFILE; fd++){
  103ac8:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
			if(proc->ofile[fd]){
  103acf:	8b 4c 82 08          	mov    0x8(%edx,%eax,4),%ecx
  103ad3:	85 c9                	test   %ecx,%ecx
  103ad5:	74 08                	je     103adf <exit+0xdf>
				proc->ofile[fd] = 0;
  103ad7:	c7 44 82 08 00 00 00 	movl   $0x0,0x8(%edx,%eax,4)
  103ade:	00 
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->pid == proc->pid) && (p->tid == -1)){
		for(fd = 0; fd < NOFILE; fd++){
  103adf:	83 c0 01             	add    $0x1,%eax
  103ae2:	83 f8 10             	cmp    $0x10,%eax
  103ae5:	75 e1                	jne    103ac8 <exit+0xc8>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
			}
			p->cwd = 0;
  103ae7:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
			iput(p->cwd);
  103aee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103af5:	e8 06 e0 ff ff       	call   101b00 <iput>
			
			acquire(&ptable.lock);
  103afa:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103b01:	e8 8a 0a 00 00       	call   104590 <acquire>
			
			// Parent might be sleeping in wait().
			wakeup1(p->parent);
  103b06:	8b 53 5c             	mov    0x5c(%ebx),%edx
  103b09:	b8 14 82 11 00       	mov    $0x118214,%eax
  103b0e:	eb 0c                	jmp    103b1c <exit+0x11c>

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103b10:	05 88 00 00 00       	add    $0x88,%eax
  103b15:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103b1a:	74 1e                	je     103b3a <exit+0x13a>
        if (p->state == SLEEPING && p->chan == chan)
  103b1c:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103b20:	75 ee                	jne    103b10 <exit+0x110>
  103b22:	3b 50 68             	cmp    0x68(%eax),%edx
  103b25:	75 e9                	jne    103b10 <exit+0x110>
            p->state = RUNNABLE;
  103b27:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103b2e:	05 88 00 00 00       	add    $0x88,%eax
  103b33:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103b38:	75 e2                	jne    103b1c <exit+0x11c>
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
			if(np->parent == p){
			np->parent = initproc;
  103b3a:	8b 0d 68 92 10 00    	mov    0x109268,%ecx
  103b40:	ba 14 82 11 00       	mov    $0x118214,%edx
  103b45:	eb 0f                	jmp    103b56 <exit+0x156>
  103b47:	90                   	nop
			
			// Parent might be sleeping in wait().
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
  103b48:	81 c2 88 00 00 00    	add    $0x88,%edx
  103b4e:	81 fa 14 a4 11 00    	cmp    $0x11a414,%edx
  103b54:	74 3c                	je     103b92 <exit+0x192>
			if(np->parent == p){
  103b56:	39 5a 5c             	cmp    %ebx,0x5c(%edx)
  103b59:	75 ed                	jne    103b48 <exit+0x148>
			np->parent = initproc;
			if(np->state == ZOMBIE)
  103b5b:	83 7a 54 05          	cmpl   $0x5,0x54(%edx)
			wakeup1(p->parent);
			
			// Pass abandoned children to init.
			for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
			if(np->parent == p){
			np->parent = initproc;
  103b5f:	89 4a 5c             	mov    %ecx,0x5c(%edx)
			if(np->state == ZOMBIE)
  103b62:	75 e4                	jne    103b48 <exit+0x148>
  103b64:	b8 14 82 11 00       	mov    $0x118214,%eax
  103b69:	eb 11                	jmp    103b7c <exit+0x17c>
  103b6b:	90                   	nop
  103b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103b70:	05 88 00 00 00       	add    $0x88,%eax
  103b75:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103b7a:	74 cc                	je     103b48 <exit+0x148>
        if (p->state == SLEEPING && p->chan == chan)
  103b7c:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103b80:	75 ee                	jne    103b70 <exit+0x170>
  103b82:	3b 48 68             	cmp    0x68(%eax),%ecx
  103b85:	75 e9                	jne    103b70 <exit+0x170>
            p->state = RUNNABLE;
  103b87:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
  103b8e:	66 90                	xchg   %ax,%ax
  103b90:	eb de                	jmp    103b70 <exit+0x170>
			np->parent = initproc;
			if(np->state == ZOMBIE)
				wakeup1(initproc);
			}
			}
			p->state = ZOMBIE;
  103b92:	c7 43 54 05 00 00 00 	movl   $0x5,0x54(%ebx)
			p->state = ZOMBIE;
		}
  	}

	//kill the parent process
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103b99:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103b9f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103ba5:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  103bab:	0f 85 f9 fe ff ff    	jne    103aaa <exit+0xaa>
  103bb1:	8b 3d 68 92 10 00    	mov    0x109268,%edi
			p->state = ZOMBIE;
		}
	}
  }
	
	proc->cwd = 0;
  103bb7:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
  if(proc == initproc)
  103bbe:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    panic("init exiting");
  103bc4:	31 db                	xor    %ebx,%ebx
		}
	}
  }
	
	proc->cwd = 0;
  if(proc == initproc)
  103bc6:	39 f8                	cmp    %edi,%eax
  103bc8:	0f 84 6d 01 00 00    	je     103d3b <exit+0x33b>
  103bce:	66 90                	xchg   %ax,%ax
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
  103bd0:	8b 54 98 08          	mov    0x8(%eax,%ebx,4),%edx
  103bd4:	85 d2                	test   %edx,%edx
  103bd6:	74 1c                	je     103bf4 <exit+0x1f4>
      fileclose(proc->ofile[fd]);
  103bd8:	89 14 24             	mov    %edx,(%esp)
  103bdb:	e8 20 d6 ff ff       	call   101200 <fileclose>
      proc->ofile[fd] = 0;
  103be0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103be6:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
  103bed:	00 
  103bee:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
	proc->cwd = 0;
  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
  103bf4:	83 c3 01             	add    $0x1,%ebx
  103bf7:	83 fb 10             	cmp    $0x10,%ebx
  103bfa:	75 d4                	jne    103bd0 <exit+0x1d0>
      proc->ofile[fd] = 0;
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
  103bfc:	c7 40 54 05 00 00 00 	movl   $0x5,0x54(%eax)
  sched();
  103c03:	e8 78 f7 ff ff       	call   103380 <sched>
  panic("zombie exit");
  103c08:	c7 04 24 40 76 10 00 	movl   $0x107640,(%esp)
  103c0f:	e8 3c cf ff ff       	call   100b50 <panic>
    return pid;
}


void
exit(void)
  103c14:	be 14 a4 11 00       	mov    $0x11a414,%esi
  103c19:	89 cb                	mov    %ecx,%ebx
  103c1b:	90                   	nop
  103c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->parent == proc) && (p->tid != -1)){
  103c20:	8b 4b 5c             	mov    0x5c(%ebx),%ecx
  103c23:	39 c1                	cmp    %eax,%ecx
  103c25:	0f 84 c7 00 00 00    	je     103cf2 <exit+0x2f2>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
		}
			p->cwd = 0;
			p->state = ZOMBIE;
  103c2b:	89 c1                	mov    %eax,%ecx
  int fd;

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
  103c2d:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103c33:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  103c39:	75 e5                	jne    103c20 <exit+0x220>
			p->cwd = 0;
			p->state = ZOMBIE;
	}
  	}
	/////////////
	proc->cwd = 0;
  103c3b:	c7 41 48 00 00 00 00 	movl   $0x0,0x48(%ecx)
	iput(proc->cwd);
  103c42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103c48:	8b 40 48             	mov    0x48(%eax),%eax
  103c4b:	89 04 24             	mov    %eax,(%esp)
  103c4e:	e8 ad de ff ff       	call   101b00 <iput>
	
	acquire(&ptable.lock);
  103c53:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103c5a:	e8 31 09 00 00       	call   104590 <acquire>
	
	// Parent might be sleeping in wait().
	wakeup1(proc->parent);
  103c5f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103c65:	ba 14 82 11 00       	mov    $0x118214,%edx
  103c6a:	8b 48 5c             	mov    0x5c(%eax),%ecx
  103c6d:	eb 0b                	jmp    103c7a <exit+0x27a>
  103c6f:	90                   	nop

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103c70:	81 c2 88 00 00 00    	add    $0x88,%edx
  103c76:	39 d6                	cmp    %edx,%esi
  103c78:	74 1c                	je     103c96 <exit+0x296>
        if (p->state == SLEEPING && p->chan == chan)
  103c7a:	83 7a 54 02          	cmpl   $0x2,0x54(%edx)
  103c7e:	75 f0                	jne    103c70 <exit+0x270>
  103c80:	3b 4a 68             	cmp    0x68(%edx),%ecx
  103c83:	75 eb                	jne    103c70 <exit+0x270>
            p->state = RUNNABLE;
  103c85:	c7 42 54 03 00 00 00 	movl   $0x3,0x54(%edx)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103c8c:	81 c2 88 00 00 00    	add    $0x88,%edx
  103c92:	39 d6                	cmp    %edx,%esi
  103c94:	75 e4                	jne    103c7a <exit+0x27a>
  103c96:	8b 3d 68 92 10 00    	mov    0x109268,%edi
  103c9c:	b9 14 82 11 00       	mov    $0x118214,%ecx
  103ca1:	eb 17                	jmp    103cba <exit+0x2ba>
  103ca3:	90                   	nop
  103ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	
	// Parent might be sleeping in wait().
	wakeup1(proc->parent);
	
	// Pass abandoned children to init.
	for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
  103ca8:	81 c1 88 00 00 00    	add    $0x88,%ecx
  103cae:	81 f9 14 a4 11 00    	cmp    $0x11a414,%ecx
  103cb4:	0f 84 fd fe ff ff    	je     103bb7 <exit+0x1b7>
	if(np->parent == proc){
  103cba:	3b 41 5c             	cmp    0x5c(%ecx),%eax
  103cbd:	75 e9                	jne    103ca8 <exit+0x2a8>
	np->parent = initproc;
	if(np->state == ZOMBIE)
  103cbf:	83 79 54 05          	cmpl   $0x5,0x54(%ecx)
	wakeup1(proc->parent);
	
	// Pass abandoned children to init.
	for(np = ptable.proc; np < &ptable.proc[NPROC]; np++){
	if(np->parent == proc){
	np->parent = initproc;
  103cc3:	89 79 5c             	mov    %edi,0x5c(%ecx)
	if(np->state == ZOMBIE)
  103cc6:	75 e0                	jne    103ca8 <exit+0x2a8>
  103cc8:	ba 14 82 11 00       	mov    $0x118214,%edx
  103ccd:	eb 0b                	jmp    103cda <exit+0x2da>
  103ccf:	90                   	nop

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103cd0:	81 c2 88 00 00 00    	add    $0x88,%edx
  103cd6:	39 d6                	cmp    %edx,%esi
  103cd8:	74 ce                	je     103ca8 <exit+0x2a8>
        if (p->state == SLEEPING && p->chan == chan)
  103cda:	83 7a 54 02          	cmpl   $0x2,0x54(%edx)
  103cde:	75 f0                	jne    103cd0 <exit+0x2d0>
  103ce0:	3b 7a 68             	cmp    0x68(%edx),%edi
  103ce3:	75 eb                	jne    103cd0 <exit+0x2d0>
            p->state = RUNNABLE;
  103ce5:	c7 42 54 03 00 00 00 	movl   $0x3,0x54(%edx)
  103cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103cf0:	eb de                	jmp    103cd0 <exit+0x2d0>

  if(proc->tid == -1) {
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->parent == proc) && (p->tid != -1)){
  103cf2:	8b 53 7c             	mov    0x7c(%ebx),%edx
  103cf5:	83 fa ff             	cmp    $0xffffffff,%edx
  103cf8:	0f 84 2f ff ff ff    	je     103c2d <exit+0x22d>
  103cfe:	31 d2                	xor    %edx,%edx
  103d00:	eb 08                	jmp    103d0a <exit+0x30a>
  103d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		//cprintf("no reason\n");
		for(fd = 0; fd < NOFILE; fd++){
  103d08:	89 c1                	mov    %eax,%ecx
			if(proc->ofile[fd]){
  103d0a:	8b 7c 91 08          	mov    0x8(%ecx,%edx,4),%edi
  103d0e:	85 ff                	test   %edi,%edi
  103d10:	74 0e                	je     103d20 <exit+0x320>
				proc->ofile[fd] = 0;
  103d12:	c7 44 91 08 00 00 00 	movl   $0x0,0x8(%ecx,%edx,4)
  103d19:	00 
  103d1a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
	//cprintf("parent process exits");

	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
	if((p->parent == proc) && (p->tid != -1)){
		//cprintf("no reason\n");
		for(fd = 0; fd < NOFILE; fd++){
  103d20:	83 c2 01             	add    $0x1,%edx
  103d23:	83 fa 10             	cmp    $0x10,%edx
  103d26:	75 e0                	jne    103d08 <exit+0x308>
			if(proc->ofile[fd]){
				proc->ofile[fd] = 0;
			}
		}
			p->cwd = 0;
  103d28:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
			p->state = ZOMBIE;
  103d2f:	c7 43 54 05 00 00 00 	movl   $0x5,0x54(%ebx)
  103d36:	e9 f0 fe ff ff       	jmp    103c2b <exit+0x22b>
	}
  }
	
	proc->cwd = 0;
  if(proc == initproc)
    panic("init exiting");
  103d3b:	c7 04 24 18 76 10 00 	movl   $0x107618,(%esp)
  103d42:	e8 09 ce ff ff       	call   100b50 <panic>
  103d47:	89 f6                	mov    %esi,%esi
  103d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103d50 <thread_exit>:
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
  103d50:	55                   	push   %ebp
  103d51:	89 e5                	mov    %esp,%ebp
  103d53:	56                   	push   %esi
  103d54:	53                   	push   %ebx
  103d55:	83 ec 10             	sub    $0x10,%esp
    struct proc *p;
    int counter=0;
    if (proc == initproc) {
  103d58:	65 8b 1d 04 00 00 00 	mov    %gs:0x4,%ebx
  103d5f:	3b 1d 68 92 10 00    	cmp    0x109268,%ebx
  103d65:	0f 84 fa 00 00 00    	je     103e65 <thread_exit+0x115>
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
  103d6b:	8b 43 7c             	mov    0x7c(%ebx),%eax
  103d6e:	83 f8 ff             	cmp    $0xffffffff,%eax
  103d71:	0f 84 9a 00 00 00    	je     103e11 <thread_exit+0xc1>
	   }
	if(counter == 1)
        exit();
    }

    acquire(&ptable.lock);
  103d77:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103d7e:	e8 0d 08 00 00       	call   104590 <acquire>

    iput(proc->cwd);
  103d83:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d89:	8b 40 48             	mov    0x48(%eax),%eax
  103d8c:	89 04 24             	mov    %eax,(%esp)
  103d8f:	e8 6c dd ff ff       	call   101b00 <iput>
    proc->state = ZOMBIE;
  103d94:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103d9a:	c7 40 54 05 00 00 00 	movl   $0x5,0x54(%eax)
    proc->cwd = 0;
  103da1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103da7:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
    proc->ret_val = ret_val;
  103dae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103db4:	8b 55 08             	mov    0x8(%ebp),%edx
  103db7:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)

    wakeup1(proc->joinedthread);
  103dbd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103dc3:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
  103dc9:	b8 14 82 11 00       	mov    $0x118214,%eax
  103dce:	eb 0c                	jmp    103ddc <thread_exit+0x8c>

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103dd0:	05 88 00 00 00       	add    $0x88,%eax
  103dd5:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103dda:	74 24                	je     103e00 <thread_exit+0xb0>
        if (p->state == SLEEPING && p->chan == chan)
  103ddc:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
  103de0:	75 ee                	jne    103dd0 <thread_exit+0x80>
  103de2:	3b 50 68             	cmp    0x68(%eax),%edx
  103de5:	75 e9                	jne    103dd0 <thread_exit+0x80>
            p->state = RUNNABLE;
  103de7:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)

static void
wakeup1(void *chan) {
    struct proc *p;

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103dee:	05 88 00 00 00       	add    $0x88,%eax
  103df3:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103df8:	75 e2                	jne    103ddc <thread_exit+0x8c>
  103dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

    wakeup1(proc->joinedthread);

    // Jump into the scheduler, never to return.

    sched();
  103e00:	e8 7b f5 ff ff       	call   103380 <sched>
    panic("thread zombie exit");
  103e05:	c7 04 24 39 76 10 00 	movl   $0x107639,(%esp)
  103e0c:	e8 3f cd ff ff       	call   100b50 <panic>
    sched();
    panic("zombie exit");
}

void
thread_exit(void* ret_val) {
  103e11:	31 f6                	xor    %esi,%esi
  103e13:	b8 14 82 11 00       	mov    $0x118214,%eax
  103e18:	eb 12                	jmp    103e2c <thread_exit+0xdc>
  103e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int counter=0;
    if (proc == initproc) {
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
	   for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103e20:	05 88 00 00 00       	add    $0x88,%eax
  103e25:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103e2a:	74 21                	je     103e4d <thread_exit+0xfd>
		if((p->pid == proc->pid) && (p->state != ZOMBIE)) {
  103e2c:	8b 48 58             	mov    0x58(%eax),%ecx
  103e2f:	8b 53 58             	mov    0x58(%ebx),%edx
  103e32:	39 d1                	cmp    %edx,%ecx
  103e34:	75 ea                	jne    103e20 <thread_exit+0xd0>
			counter++;	
  103e36:	31 d2                	xor    %edx,%edx
  103e38:	83 78 54 05          	cmpl   $0x5,0x54(%eax)
  103e3c:	0f 95 c2             	setne  %dl
    int counter=0;
    if (proc == initproc) {
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
	   for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103e3f:	05 88 00 00 00       	add    $0x88,%eax
		if((p->pid == proc->pid) && (p->state != ZOMBIE)) {
			counter++;	
  103e44:	01 d6                	add    %edx,%esi
    int counter=0;
    if (proc == initproc) {
        panic("init thread exiting");
    }
    if (proc->tid == -1) {
	   for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  103e46:	3d 14 a4 11 00       	cmp    $0x11a414,%eax
  103e4b:	75 df                	jne    103e2c <thread_exit+0xdc>
		if((p->pid == proc->pid) && (p->state != ZOMBIE)) {
			counter++;	
		}

	   }
	if(counter == 1)
  103e4d:	83 fe 01             	cmp    $0x1,%esi
  103e50:	0f 85 21 ff ff ff    	jne    103d77 <thread_exit+0x27>
        exit();
  103e56:	e8 a5 fb ff ff       	call   103a00 <exit>
  103e5b:	90                   	nop
  103e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103e60:	e9 12 ff ff ff       	jmp    103d77 <thread_exit+0x27>
void
thread_exit(void* ret_val) {
    struct proc *p;
    int counter=0;
    if (proc == initproc) {
        panic("init thread exiting");
  103e65:	c7 04 24 25 76 10 00 	movl   $0x107625,(%esp)
  103e6c:	e8 df cc ff ff       	call   100b50 <panic>
  103e71:	eb 0d                	jmp    103e80 <allocproc>
  103e73:	90                   	nop
  103e74:	90                   	nop
  103e75:	90                   	nop
  103e76:	90                   	nop
  103e77:	90                   	nop
  103e78:	90                   	nop
  103e79:	90                   	nop
  103e7a:	90                   	nop
  103e7b:	90                   	nop
  103e7c:	90                   	nop
  103e7d:	90                   	nop
  103e7e:	90                   	nop
  103e7f:	90                   	nop

00103e80 <allocproc>:
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and return it.
// Otherwise return 0.

static struct proc*
allocproc(void) {
  103e80:	55                   	push   %ebp
  103e81:	89 e5                	mov    %esp,%ebp
  103e83:	53                   	push   %ebx
  103e84:	83 ec 14             	sub    $0x14,%esp
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
  103e87:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103e8e:	e8 fd 06 00 00       	call   104590 <acquire>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
  103e93:	8b 15 68 82 11 00    	mov    0x118268,%edx
  103e99:	85 d2                	test   %edx,%edx
  103e9b:	0f 84 c5 00 00 00    	je     103f66 <allocproc+0xe6>
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and return it.
// Otherwise return 0.

static struct proc*
allocproc(void) {
  103ea1:	bb 9c 82 11 00       	mov    $0x11829c,%ebx
  103ea6:	eb 12                	jmp    103eba <allocproc+0x3a>
    struct proc *p;
    char *sp;

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  103ea8:	81 c3 88 00 00 00    	add    $0x88,%ebx
  103eae:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  103eb4:	0f 84 96 00 00 00    	je     103f50 <allocproc+0xd0>
        if (p->state == UNUSED)
  103eba:	8b 43 54             	mov    0x54(%ebx),%eax
  103ebd:	85 c0                	test   %eax,%eax
  103ebf:	75 e7                	jne    103ea8 <allocproc+0x28>
            goto found;
    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;
  103ec1:	c7 43 54 01 00 00 00 	movl   $0x1,0x54(%ebx)
    p->pid = nextpid++;
  103ec8:	a1 24 8d 10 00       	mov    0x108d24,%eax
  103ecd:	89 43 58             	mov    %eax,0x58(%ebx)
  103ed0:	83 c0 01             	add    $0x1,%eax
  103ed3:	a3 24 8d 10 00       	mov    %eax,0x108d24
    p->joinedthread = 0;
  103ed8:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
  103edf:	00 00 00 
    p->tid = -1;
  103ee2:	c7 43 7c ff ff ff ff 	movl   $0xffffffff,0x7c(%ebx)
    p->ret_val = 0;
  103ee9:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  103ef0:	00 00 00 
    release(&ptable.lock);
  103ef3:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103efa:	e8 41 06 00 00       	call   104540 <release>

    // Allocate kernel stack if possible.
    if ((p->kstack = kalloc()) == 0) {
  103eff:	e8 ec e5 ff ff       	call   1024f0 <kalloc>
  103f04:	85 c0                	test   %eax,%eax
  103f06:	89 43 50             	mov    %eax,0x50(%ebx)
  103f09:	74 65                	je     103f70 <allocproc+0xf0>
    }

    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame.
    sp -= sizeof *p->tf;
  103f0b:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
    p->tf = (struct trapframe*) sp;
  103f11:	89 53 60             	mov    %edx,0x60(%ebx)

    // Set up new context to start executing at forkret,
    // which returns to trapret (see below).
    sp -= 4;
    *(uint*) sp = (uint) trapret;
  103f14:	c7 80 b0 0f 00 00 70 	movl   $0x105970,0xfb0(%eax)
  103f1b:	59 10 00 

    sp -= sizeof *p->context;
    p->context = (struct context*) sp;
  103f1e:	05 9c 0f 00 00       	add    $0xf9c,%eax
  103f23:	89 43 64             	mov    %eax,0x64(%ebx)
    memset(p->context, 0, sizeof *p->context);
  103f26:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  103f2d:	00 
  103f2e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  103f35:	00 
  103f36:	89 04 24             	mov    %eax,(%esp)
  103f39:	e8 f2 06 00 00       	call   104630 <memset>
    p->context->eip = (uint) forkret;
  103f3e:	8b 43 64             	mov    0x64(%ebx),%eax
  103f41:	c7 40 10 60 33 10 00 	movl   $0x103360,0x10(%eax)
    return p;
}
  103f48:	89 d8                	mov    %ebx,%eax
  103f4a:	83 c4 14             	add    $0x14,%esp
  103f4d:	5b                   	pop    %ebx
  103f4e:	5d                   	pop    %ebp
  103f4f:	c3                   	ret    

    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            goto found;
    release(&ptable.lock);
  103f50:	31 db                	xor    %ebx,%ebx
  103f52:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  103f59:	e8 e2 05 00 00       	call   104540 <release>
    sp -= sizeof *p->context;
    p->context = (struct context*) sp;
    memset(p->context, 0, sizeof *p->context);
    p->context->eip = (uint) forkret;
    return p;
}
  103f5e:	89 d8                	mov    %ebx,%eax
  103f60:	83 c4 14             	add    $0x14,%esp
  103f63:	5b                   	pop    %ebx
  103f64:	5d                   	pop    %ebp
  103f65:	c3                   	ret    
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            goto found;
    release(&ptable.lock);
    return 0;
  103f66:	bb 14 82 11 00       	mov    $0x118214,%ebx
  103f6b:	e9 51 ff ff ff       	jmp    103ec1 <allocproc+0x41>
    p->ret_val = 0;
    release(&ptable.lock);

    // Allocate kernel stack if possible.
    if ((p->kstack = kalloc()) == 0) {
        p->state = UNUSED;
  103f70:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
  103f77:	31 db                	xor    %ebx,%ebx
        return 0;
  103f79:	eb cd                	jmp    103f48 <allocproc+0xc8>
  103f7b:	90                   	nop
  103f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103f80 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

int
fork(void) {
  103f80:	55                   	push   %ebp
  103f81:	89 e5                	mov    %esp,%ebp
  103f83:	57                   	push   %edi
  103f84:	56                   	push   %esi
    int i, pid;
    struct proc *np;

    // Allocate process.
    if ((np = allocproc()) == 0)
  103f85:	be ff ff ff ff       	mov    $0xffffffff,%esi
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.

int
fork(void) {
  103f8a:	53                   	push   %ebx
  103f8b:	83 ec 1c             	sub    $0x1c,%esp
    int i, pid;
    struct proc *np;

    // Allocate process.
    if ((np = allocproc()) == 0)
  103f8e:	e8 ed fe ff ff       	call   103e80 <allocproc>
  103f93:	85 c0                	test   %eax,%eax
  103f95:	89 c3                	mov    %eax,%ebx
  103f97:	0f 84 be 00 00 00    	je     10405b <fork+0xdb>
        return -1;

    // Copy process state from p.
    if (!(np->pgdir = copyuvm(proc->pgdir, proc->sz))) {
  103f9d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103fa3:	8b 10                	mov    (%eax),%edx
  103fa5:	89 54 24 04          	mov    %edx,0x4(%esp)
  103fa9:	8b 40 04             	mov    0x4(%eax),%eax
  103fac:	89 04 24             	mov    %eax,(%esp)
  103faf:	e8 cc 2c 00 00       	call   106c80 <copyuvm>
  103fb4:	85 c0                	test   %eax,%eax
  103fb6:	89 43 04             	mov    %eax,0x4(%ebx)
  103fb9:	0f 84 a6 00 00 00    	je     104065 <fork+0xe5>
        kfree(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }
    np->sz = proc->sz;
  103fbf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    np->parent = proc;
    *np->tf = *proc->tf;
  103fc5:	b9 13 00 00 00       	mov    $0x13,%ecx
        kfree(np->kstack);
        np->kstack = 0;
        np->state = UNUSED;
        return -1;
    }
    np->sz = proc->sz;
  103fca:	8b 00                	mov    (%eax),%eax
  103fcc:	89 03                	mov    %eax,(%ebx)
    np->parent = proc;
  103fce:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  103fd4:	89 43 5c             	mov    %eax,0x5c(%ebx)
    *np->tf = *proc->tf;
  103fd7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  103fde:	8b 43 60             	mov    0x60(%ebx),%eax
  103fe1:	8b 72 60             	mov    0x60(%edx),%esi
  103fe4:	89 c7                	mov    %eax,%edi
  103fe6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;
  103fe8:	31 f6                	xor    %esi,%esi
  103fea:	8b 43 60             	mov    0x60(%ebx),%eax
  103fed:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  103ff4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  103ffb:	90                   	nop
  103ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    for (i = 0; i < NOFILE; i++)
        if (proc->ofile[i])
  104000:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
  104004:	85 c0                	test   %eax,%eax
  104006:	74 13                	je     10401b <fork+0x9b>
            np->ofile[i] = filedup(proc->ofile[i]);
  104008:	89 04 24             	mov    %eax,(%esp)
  10400b:	e8 20 d1 ff ff       	call   101130 <filedup>
  104010:	89 44 b3 08          	mov    %eax,0x8(%ebx,%esi,4)
  104014:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
    *np->tf = *proc->tf;

    // Clear %eax so that fork returns 0 in the child.
    np->tf->eax = 0;

    for (i = 0; i < NOFILE; i++)
  10401b:	83 c6 01             	add    $0x1,%esi
  10401e:	83 fe 10             	cmp    $0x10,%esi
  104021:	75 dd                	jne    104000 <fork+0x80>
        if (proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);
  104023:	8b 42 48             	mov    0x48(%edx),%eax
  104026:	89 04 24             	mov    %eax,(%esp)
  104029:	e8 02 d3 ff ff       	call   101330 <idup>

    pid = np->pid;
  10402e:	8b 73 58             	mov    0x58(%ebx),%esi
    np->state = RUNNABLE;
  104031:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    np->tf->eax = 0;

    for (i = 0; i < NOFILE; i++)
        if (proc->ofile[i])
            np->ofile[i] = filedup(proc->ofile[i]);
    np->cwd = idup(proc->cwd);
  104038:	89 43 48             	mov    %eax,0x48(%ebx)

    pid = np->pid;
    np->state = RUNNABLE;
    safestrcpy(np->name, proc->name, sizeof (proc->name));
  10403b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104041:	83 c3 6c             	add    $0x6c,%ebx
  104044:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10404b:	00 
  10404c:	89 1c 24             	mov    %ebx,(%esp)
  10404f:	83 c0 6c             	add    $0x6c,%eax
  104052:	89 44 24 04          	mov    %eax,0x4(%esp)
  104056:	e8 75 07 00 00       	call   1047d0 <safestrcpy>
    return pid;
}
  10405b:	83 c4 1c             	add    $0x1c,%esp
  10405e:	89 f0                	mov    %esi,%eax
  104060:	5b                   	pop    %ebx
  104061:	5e                   	pop    %esi
  104062:	5f                   	pop    %edi
  104063:	5d                   	pop    %ebp
  104064:	c3                   	ret    
    if ((np = allocproc()) == 0)
        return -1;

    // Copy process state from p.
    if (!(np->pgdir = copyuvm(proc->pgdir, proc->sz))) {
        kfree(np->kstack);
  104065:	8b 43 50             	mov    0x50(%ebx),%eax
  104068:	89 04 24             	mov    %eax,(%esp)
  10406b:	e8 c0 e4 ff ff       	call   102530 <kfree>
        np->kstack = 0;
  104070:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
        np->state = UNUSED;
  104077:	c7 43 54 00 00 00 00 	movl   $0x0,0x54(%ebx)
        return -1;
  10407e:	eb db                	jmp    10405b <fork+0xdb>

00104080 <thread_create>:
    switchuvm(proc);
    return 0;
}

int
thread_create(void*(*start_func)(), void* stack, uint stack_size) {
  104080:	55                   	push   %ebp
  104081:	89 e5                	mov    %esp,%ebp
  104083:	57                   	push   %edi
  104084:	56                   	push   %esi
  104085:	53                   	push   %ebx
  104086:	83 ec 1c             	sub    $0x1c,%esp
    int i;

    //cprintf("Entering thread_create\n");

    // Allocate process.
    if ((np = allocproc()) == 0) {
  104089:	e8 f2 fd ff ff       	call   103e80 <allocproc>
  10408e:	89 c3                	mov    %eax,%ebx
  104090:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  104095:	85 db                	test   %ebx,%ebx
  104097:	0f 84 e2 00 00 00    	je     10417f <thread_create+0xff>
        return -1;
    }

    //cprintf("process allocated\n");

    if (proc->tid == -1) {
  10409d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040a3:	8b 50 7c             	mov    0x7c(%eax),%edx
  1040a6:	83 fa ff             	cmp    $0xffffffff,%edx
  1040a9:	74 03                	je     1040ae <thread_create+0x2e>
        np->parent = proc;
    } else {
        np->parent = proc->parent;
  1040ab:	8b 40 5c             	mov    0x5c(%eax),%eax
  1040ae:	89 43 5c             	mov    %eax,0x5c(%ebx)
    }


    np->sz = proc->sz;
  1040b1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040b7:	8b 00                	mov    (%eax),%eax
  1040b9:	89 03                	mov    %eax,(%ebx)
    np->pgdir = proc->pgdir;
  1040bb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040c1:	8b 40 04             	mov    0x4(%eax),%eax
  1040c4:	89 43 04             	mov    %eax,0x4(%ebx)
  1040c7:	31 c0                	xor    %eax,%eax
  1040c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
  1040d0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1040d7:	8b 54 82 08          	mov    0x8(%edx,%eax,4),%edx
  1040db:	89 54 83 08          	mov    %edx,0x8(%ebx,%eax,4)
    }


    np->sz = proc->sz;
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
  1040df:	83 c0 01             	add    $0x1,%eax
  1040e2:	83 f8 10             	cmp    $0x10,%eax
  1040e5:	75 e9                	jne    1040d0 <thread_create+0x50>
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
  1040e7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1040ed:	8b 40 48             	mov    0x48(%eax),%eax
  1040f0:	89 04 24             	mov    %eax,(%esp)
  1040f3:	e8 38 d2 ff ff       	call   101330 <idup>
    np->killed = proc->killed;
    np->tid = np->pid;
    np->ret_val = 0;
    *np->tf = *proc->tf;
  1040f8:	b9 13 00 00 00       	mov    $0x13,%ecx
    np->sz = proc->sz;
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
  1040fd:	89 43 48             	mov    %eax,0x48(%ebx)
    np->killed = proc->killed;
  104100:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104106:	8b 40 4c             	mov    0x4c(%eax),%eax
    np->tid = np->pid;
    np->ret_val = 0;
  104109:	c7 83 84 00 00 00 00 	movl   $0x0,0x84(%ebx)
  104110:	00 00 00 
    np->pgdir = proc->pgdir;
    for (i = 0; i < NOFILE; i++) {
        np->ofile[i] = proc->ofile[i];
    }
    np->cwd = idup(proc->cwd);
    np->killed = proc->killed;
  104113:	89 43 4c             	mov    %eax,0x4c(%ebx)
    np->tid = np->pid;
  104116:	8b 43 58             	mov    0x58(%ebx),%eax
  104119:	89 43 7c             	mov    %eax,0x7c(%ebx)
    np->ret_val = 0;
    *np->tf = *proc->tf;
  10411c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104123:	8b 43 60             	mov    0x60(%ebx),%eax
  104126:	8b 72 60             	mov    0x60(%edx),%esi
  104129:	89 c7                	mov    %eax,%edi
  10412b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    np->tf->eax = 0;
  10412d:	8b 43 60             	mov    0x60(%ebx),%eax
  104130:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    //cprintf("exec called\n");
    safestrcpy(np->name, proc->name, sizeof (proc->name));
  104137:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  10413d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  104144:	00 
  104145:	83 c0 6c             	add    $0x6c,%eax
  104148:	89 44 24 04          	mov    %eax,0x4(%esp)
  10414c:	8d 43 6c             	lea    0x6c(%ebx),%eax
  10414f:	89 04 24             	mov    %eax,(%esp)
  104152:	e8 79 06 00 00       	call   1047d0 <safestrcpy>
    //cprintf("name copied\n");
    np->state = RUNNABLE;
    np->pid = np->parent->pid;
  104157:	8b 43 5c             	mov    0x5c(%ebx),%eax
    *np->tf = *proc->tf;
    np->tf->eax = 0;
    //cprintf("exec called\n");
    safestrcpy(np->name, proc->name, sizeof (proc->name));
    //cprintf("name copied\n");
    np->state = RUNNABLE;
  10415a:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    np->pid = np->parent->pid;
  104161:	8b 40 58             	mov    0x58(%eax),%eax
  104164:	89 43 58             	mov    %eax,0x58(%ebx)


    //	stack	-= 4;
    //	*(uint*)(stack) = 0xffffffff;   // fake return pc

    np->tf->eip = (uint) start_func;
  104167:	8b 43 60             	mov    0x60(%ebx),%eax
  10416a:	8b 55 08             	mov    0x8(%ebp),%edx
  10416d:	89 50 38             	mov    %edx,0x38(%eax)
    np->tf->esp = (uint) (stack + stack_size);
  104170:	8b 43 60             	mov    0x60(%ebx),%eax
  104173:	8b 55 0c             	mov    0xc(%ebp),%edx
  104176:	03 55 10             	add    0x10(%ebp),%edx
  104179:	89 50 44             	mov    %edx,0x44(%eax)

    //cprintf("thread_create return value: %d\n", np->tid);
    return np->tid;
  10417c:	8b 43 7c             	mov    0x7c(%ebx),%eax
}
  10417f:	83 c4 1c             	add    $0x1c,%esp
  104182:	5b                   	pop    %ebx
  104183:	5e                   	pop    %esi
  104184:	5f                   	pop    %edi
  104185:	5d                   	pop    %ebp
  104186:	c3                   	ret    
  104187:	89 f6                	mov    %esi,%esi
  104189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104190 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.

int
growproc(int n) {
  104190:	55                   	push   %ebp
  104191:	89 e5                	mov    %esp,%ebp
  104193:	83 ec 18             	sub    $0x18,%esp
    uint sz = proc->sz;
  104196:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.

int
growproc(int n) {
  10419d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    uint sz = proc->sz;
  1041a0:	8b 02                	mov    (%edx),%eax
    if (n > 0) {
  1041a2:	83 f9 00             	cmp    $0x0,%ecx
  1041a5:	7f 19                	jg     1041c0 <growproc+0x30>
        if (!(sz = allocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    } else if (n < 0) {
  1041a7:	75 39                	jne    1041e2 <growproc+0x52>
        if (!(sz = deallocuvm(proc->pgdir, sz, sz + n)))
            return -1;
    }
    proc->sz = sz;
  1041a9:	89 02                	mov    %eax,(%edx)
    switchuvm(proc);
  1041ab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1041b1:	89 04 24             	mov    %eax,(%esp)
  1041b4:	e8 17 2d 00 00       	call   106ed0 <switchuvm>
  1041b9:	31 c0                	xor    %eax,%eax
    return 0;
}
  1041bb:	c9                   	leave  
  1041bc:	c3                   	ret    
  1041bd:	8d 76 00             	lea    0x0(%esi),%esi

int
growproc(int n) {
    uint sz = proc->sz;
    if (n > 0) {
        if (!(sz = allocuvm(proc->pgdir, sz, sz + n)))
  1041c0:	01 c1                	add    %eax,%ecx
  1041c2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1041c6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1041ca:	8b 42 04             	mov    0x4(%edx),%eax
  1041cd:	89 04 24             	mov    %eax,(%esp)
  1041d0:	e8 6b 2b 00 00       	call   106d40 <allocuvm>
  1041d5:	85 c0                	test   %eax,%eax
  1041d7:	74 27                	je     104200 <growproc+0x70>
            return -1;
    } else if (n < 0) {
        if (!(sz = deallocuvm(proc->pgdir, sz, sz + n)))
  1041d9:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1041e0:	eb c7                	jmp    1041a9 <growproc+0x19>
  1041e2:	01 c1                	add    %eax,%ecx
  1041e4:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1041e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1041ec:	8b 42 04             	mov    0x4(%edx),%eax
  1041ef:	89 04 24             	mov    %eax,(%esp)
  1041f2:	e8 69 29 00 00       	call   106b60 <deallocuvm>
  1041f7:	85 c0                	test   %eax,%eax
  1041f9:	75 de                	jne    1041d9 <growproc+0x49>
  1041fb:	90                   	nop
  1041fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            return -1;
    }
    proc->sz = sz;
    switchuvm(proc);
    return 0;
  104200:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104205:	c9                   	leave  
  104206:	c3                   	ret    
  104207:	89 f6                	mov    %esi,%esi
  104209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104210 <userinit>:
}

// Set up first user process.

void
userinit(void) {
  104210:	55                   	push   %ebp
  104211:	89 e5                	mov    %esp,%ebp
  104213:	53                   	push   %ebx
  104214:	83 ec 14             	sub    $0x14,%esp
    struct proc *p;
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
  104217:	e8 64 fc ff ff       	call   103e80 <allocproc>
  10421c:	89 c3                	mov    %eax,%ebx
    initproc = p;
  10421e:	a3 68 92 10 00       	mov    %eax,0x109268
    if (!(p->pgdir = setupkvm()))
  104223:	e8 58 28 00 00       	call   106a80 <setupkvm>
  104228:	85 c0                	test   %eax,%eax
  10422a:	89 43 04             	mov    %eax,0x4(%ebx)
  10422d:	0f 84 d1 00 00 00    	je     104304 <userinit+0xf4>
        panic("userinit: out of memory?");
    inituvm(p->pgdir, _binary_initcode_start, (int) _binary_initcode_size);
  104233:	89 04 24             	mov    %eax,(%esp)
  104236:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
  10423d:	00 
  10423e:	c7 44 24 04 28 91 10 	movl   $0x109128,0x4(%esp)
  104245:	00 
  104246:	e8 a5 27 00 00       	call   1069f0 <inituvm>
    p->sz = PGSIZE;
  10424b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
    memset(p->tf, 0, sizeof (*p->tf));
  104251:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
  104258:	00 
  104259:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  104260:	00 
  104261:	8b 43 60             	mov    0x60(%ebx),%eax
  104264:	89 04 24             	mov    %eax,(%esp)
  104267:	e8 c4 03 00 00       	call   104630 <memset>
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  10426c:	8b 43 60             	mov    0x60(%ebx),%eax
  10426f:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  104275:	8b 43 60             	mov    0x60(%ebx),%eax
  104278:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
    p->tf->es = p->tf->ds;
  10427e:	8b 43 60             	mov    0x60(%ebx),%eax
  104281:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
  104285:	66 89 50 28          	mov    %dx,0x28(%eax)
    p->tf->ss = p->tf->ds;
  104289:	8b 43 60             	mov    0x60(%ebx),%eax
  10428c:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
  104290:	66 89 50 48          	mov    %dx,0x48(%eax)
    p->tf->eflags = FL_IF;
  104294:	8b 43 60             	mov    0x60(%ebx),%eax
  104297:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
    p->tf->esp = PGSIZE;
  10429e:	8b 43 60             	mov    0x60(%ebx),%eax
  1042a1:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
    p->tf->eip = 0; // beginning of initcode.S
  1042a8:	8b 43 60             	mov    0x60(%ebx),%eax
  1042ab:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

    safestrcpy(p->name, "initcode", sizeof (p->name));
  1042b2:	8d 43 6c             	lea    0x6c(%ebx),%eax
  1042b5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  1042bc:	00 
  1042bd:	c7 44 24 04 65 76 10 	movl   $0x107665,0x4(%esp)
  1042c4:	00 
  1042c5:	89 04 24             	mov    %eax,(%esp)
  1042c8:	e8 03 05 00 00       	call   1047d0 <safestrcpy>
    p->cwd = namei("/");
  1042cd:	c7 04 24 6e 76 10 00 	movl   $0x10766e,(%esp)
  1042d4:	e8 f7 dd ff ff       	call   1020d0 <namei>

    p->state = RUNNABLE;
  1042d9:	c7 43 54 03 00 00 00 	movl   $0x3,0x54(%ebx)
    p->tf->eflags = FL_IF;
    p->tf->esp = PGSIZE;
    p->tf->eip = 0; // beginning of initcode.S

    safestrcpy(p->name, "initcode", sizeof (p->name));
    p->cwd = namei("/");
  1042e0:	89 43 48             	mov    %eax,0x48(%ebx)

    p->state = RUNNABLE;
  1042e3:	31 c0                	xor    %eax,%eax
  1042e5:	8d 76 00             	lea    0x0(%esi),%esi
    int i;
    for (i = 0; i < BSEMCOUNT; i++) {
        bstbl.bsem[i].used = 0;
  1042e8:	c7 80 ec 92 10 00 00 	movl   $0x0,0x1092ec(%eax)
  1042ef:	00 00 00 
  1042f2:	05 d4 01 00 00       	add    $0x1d4,%eax
    safestrcpy(p->name, "initcode", sizeof (p->name));
    p->cwd = namei("/");

    p->state = RUNNABLE;
    int i;
    for (i = 0; i < BSEMCOUNT; i++) {
  1042f7:	3d d0 b6 00 00       	cmp    $0xb6d0,%eax
  1042fc:	75 ea                	jne    1042e8 <userinit+0xd8>
        bstbl.bsem[i].used = 0;
    }
}
  1042fe:	83 c4 14             	add    $0x14,%esp
  104301:	5b                   	pop    %ebx
  104302:	5d                   	pop    %ebp
  104303:	c3                   	ret    
    extern char _binary_initcode_start[], _binary_initcode_size[];

    p = allocproc();
    initproc = p;
    if (!(p->pgdir = setupkvm()))
        panic("userinit: out of memory?");
  104304:	c7 04 24 4c 76 10 00 	movl   $0x10764c,(%esp)
  10430b:	e8 40 c8 ff ff       	call   100b50 <panic>

00104310 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.

void
procdump(void) {
  104310:	55                   	push   %ebp
  104311:	89 e5                	mov    %esp,%ebp
  104313:	57                   	push   %edi
  104314:	56                   	push   %esi
  104315:	53                   	push   %ebx
  104316:	bb 14 82 11 00       	mov    $0x118214,%ebx
  10431b:	83 ec 4c             	sub    $0x4c,%esp
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
  10431e:	8d 7d c0             	lea    -0x40(%ebp),%edi
  104321:	eb 4e                	jmp    104371 <procdump+0x61>
  104323:	90                   	nop
  104324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    uint pc[10];

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
        if (p->state == UNUSED)
            continue;
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
  104328:	8b 04 85 b0 76 10 00 	mov    0x1076b0(,%eax,4),%eax
  10432f:	85 c0                	test   %eax,%eax
  104331:	74 4a                	je     10437d <procdump+0x6d>
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
  104333:	8b 53 58             	mov    0x58(%ebx),%edx
  104336:	8d 4b 6c             	lea    0x6c(%ebx),%ecx
  104339:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10433d:	89 44 24 08          	mov    %eax,0x8(%esp)
  104341:	c7 04 24 74 76 10 00 	movl   $0x107674,(%esp)
  104348:	89 54 24 04          	mov    %edx,0x4(%esp)
  10434c:	e8 0f c4 ff ff       	call   100760 <cprintf>
        if (p->state == SLEEPING) {
  104351:	83 7b 54 02          	cmpl   $0x2,0x54(%ebx)
  104355:	74 31                	je     104388 <procdump+0x78>
            getcallerpcs((uint*) p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
  104357:	c7 04 24 36 75 10 00 	movl   $0x107536,(%esp)
  10435e:	e8 fd c3 ff ff       	call   100760 <cprintf>
    int i;
    struct proc *p;
    char *state;
    uint pc[10];

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
  104363:	81 c3 88 00 00 00    	add    $0x88,%ebx
  104369:	81 fb 14 a4 11 00    	cmp    $0x11a414,%ebx
  10436f:	74 57                	je     1043c8 <procdump+0xb8>
        if (p->state == UNUSED)
  104371:	8b 43 54             	mov    0x54(%ebx),%eax
  104374:	85 c0                	test   %eax,%eax
  104376:	74 eb                	je     104363 <procdump+0x53>
            continue;
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
  104378:	83 f8 05             	cmp    $0x5,%eax
  10437b:	76 ab                	jbe    104328 <procdump+0x18>
  10437d:	b8 70 76 10 00       	mov    $0x107670,%eax
  104382:	eb af                	jmp    104333 <procdump+0x23>
  104384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            state = states[p->state];
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
  104388:	8b 43 64             	mov    0x64(%ebx),%eax
  10438b:	31 f6                	xor    %esi,%esi
  10438d:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104391:	8b 40 0c             	mov    0xc(%eax),%eax
  104394:	83 c0 08             	add    $0x8,%eax
  104397:	89 04 24             	mov    %eax,(%esp)
  10439a:	e8 81 00 00 00       	call   104420 <getcallerpcs>
  10439f:	90                   	nop
            for (i = 0; i < 10 && pc[i] != 0; i++)
  1043a0:	8b 04 b7             	mov    (%edi,%esi,4),%eax
  1043a3:	85 c0                	test   %eax,%eax
  1043a5:	74 b0                	je     104357 <procdump+0x47>
  1043a7:	83 c6 01             	add    $0x1,%esi
                cprintf(" %p", pc[i]);
  1043aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1043ae:	c7 04 24 22 71 10 00 	movl   $0x107122,(%esp)
  1043b5:	e8 a6 c3 ff ff       	call   100760 <cprintf>
        else
            state = "???";
        cprintf("%d %s %s", p->pid, state, p->name);
        if (p->state == SLEEPING) {
            getcallerpcs((uint*) p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
  1043ba:	83 fe 0a             	cmp    $0xa,%esi
  1043bd:	75 e1                	jne    1043a0 <procdump+0x90>
  1043bf:	eb 96                	jmp    104357 <procdump+0x47>
  1043c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
    }
}
  1043c8:	83 c4 4c             	add    $0x4c,%esp
  1043cb:	5b                   	pop    %ebx
  1043cc:	5e                   	pop    %esi
  1043cd:	5f                   	pop    %edi
  1043ce:	5d                   	pop    %ebp
  1043cf:	90                   	nop
  1043d0:	c3                   	ret    
  1043d1:	eb 0d                	jmp    1043e0 <pinit>
  1043d3:	90                   	nop
  1043d4:	90                   	nop
  1043d5:	90                   	nop
  1043d6:	90                   	nop
  1043d7:	90                   	nop
  1043d8:	90                   	nop
  1043d9:	90                   	nop
  1043da:	90                   	nop
  1043db:	90                   	nop
  1043dc:	90                   	nop
  1043dd:	90                   	nop
  1043de:	90                   	nop
  1043df:	90                   	nop

001043e0 <pinit>:
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void) {
  1043e0:	55                   	push   %ebp
  1043e1:	89 e5                	mov    %esp,%ebp
  1043e3:	83 ec 18             	sub    $0x18,%esp
    initlock(&ptable.lock, "ptable");
  1043e6:	c7 44 24 04 7d 76 10 	movl   $0x10767d,0x4(%esp)
  1043ed:	00 
  1043ee:	c7 04 24 e0 81 11 00 	movl   $0x1181e0,(%esp)
  1043f5:	e8 06 00 00 00       	call   104400 <initlock>
}
  1043fa:	c9                   	leave  
  1043fb:	c3                   	ret    
  1043fc:	90                   	nop
  1043fd:	90                   	nop
  1043fe:	90                   	nop
  1043ff:	90                   	nop

00104400 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  104400:	55                   	push   %ebp
  104401:	89 e5                	mov    %esp,%ebp
  104403:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
  104406:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
  104409:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
  10440f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
  104412:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
  104419:	5d                   	pop    %ebp
  10441a:	c3                   	ret    
  10441b:	90                   	nop
  10441c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104420 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  104420:	55                   	push   %ebp
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  104421:	31 c0                	xor    %eax,%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  104423:	89 e5                	mov    %esp,%ebp
  104425:	53                   	push   %ebx
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  104426:	8b 55 08             	mov    0x8(%ebp),%edx
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
  104429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  10442c:	83 ea 08             	sub    $0x8,%edx
  10442f:	90                   	nop
  for(i = 0; i < 10; i++){
    if(ebp == 0 || ebp < (uint *) 0x100000 || ebp == (uint*)0xffffffff)
  104430:	8d 8a 00 00 f0 ff    	lea    -0x100000(%edx),%ecx
  104436:	81 f9 fe ff ef ff    	cmp    $0xffeffffe,%ecx
  10443c:	77 1a                	ja     104458 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
  10443e:	8b 4a 04             	mov    0x4(%edx),%ecx
  104441:	89 0c 83             	mov    %ecx,(%ebx,%eax,4)
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
  104444:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint *) 0x100000 || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  104447:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
  104449:	83 f8 0a             	cmp    $0xa,%eax
  10444c:	75 e2                	jne    104430 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
  10444e:	5b                   	pop    %ebx
  10444f:	5d                   	pop    %ebp
  104450:	c3                   	ret    
  104451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint *) 0x100000 || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
  104458:	83 f8 09             	cmp    $0x9,%eax
  10445b:	7f f1                	jg     10444e <getcallerpcs+0x2e>
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
    if(ebp == 0 || ebp < (uint *) 0x100000 || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  10445d:	8d 14 83             	lea    (%ebx,%eax,4),%edx
  }
  for(; i < 10; i++)
  104460:	83 c0 01             	add    $0x1,%eax
    pcs[i] = 0;
  104463:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    if(ebp == 0 || ebp < (uint *) 0x100000 || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
  104469:	83 c2 04             	add    $0x4,%edx
  10446c:	83 f8 0a             	cmp    $0xa,%eax
  10446f:	75 ef                	jne    104460 <getcallerpcs+0x40>
    pcs[i] = 0;
}
  104471:	5b                   	pop    %ebx
  104472:	5d                   	pop    %ebp
  104473:	c3                   	ret    
  104474:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10447a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00104480 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  104480:	55                   	push   %ebp
  return lock->locked && lock->cpu == cpu;
  104481:	31 c0                	xor    %eax,%eax
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  104483:	89 e5                	mov    %esp,%ebp
  104485:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
  104488:	8b 0a                	mov    (%edx),%ecx
  10448a:	85 c9                	test   %ecx,%ecx
  10448c:	74 10                	je     10449e <holding+0x1e>
  10448e:	8b 42 08             	mov    0x8(%edx),%eax
  104491:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  104498:	0f 94 c0             	sete   %al
  10449b:	0f b6 c0             	movzbl %al,%eax
}
  10449e:	5d                   	pop    %ebp
  10449f:	c3                   	ret    

001044a0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
  1044a0:	55                   	push   %ebp
  1044a1:	89 e5                	mov    %esp,%ebp
  1044a3:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  1044a4:	9c                   	pushf  
  1044a5:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
  1044a6:	fa                   	cli    
  int eflags;
  
  eflags = readeflags();
  cli();
  if(cpu->ncli++ == 0)
  1044a7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1044ae:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  1044b4:	8d 48 01             	lea    0x1(%eax),%ecx
  1044b7:	85 c0                	test   %eax,%eax
  1044b9:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
  1044bf:	75 12                	jne    1044d3 <pushcli+0x33>
    cpu->intena = eflags & FL_IF;
  1044c1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1044c7:	81 e3 00 02 00 00    	and    $0x200,%ebx
  1044cd:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
  1044d3:	5b                   	pop    %ebx
  1044d4:	5d                   	pop    %ebp
  1044d5:	c3                   	ret    
  1044d6:	8d 76 00             	lea    0x0(%esi),%esi
  1044d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001044e0 <popcli>:

void
popcli(void)
{
  1044e0:	55                   	push   %ebp
  1044e1:	89 e5                	mov    %esp,%ebp
  1044e3:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  1044e6:	9c                   	pushf  
  1044e7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
  1044e8:	f6 c4 02             	test   $0x2,%ah
  1044eb:	75 43                	jne    104530 <popcli+0x50>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
  1044ed:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1044f4:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  1044fa:	83 e8 01             	sub    $0x1,%eax
  1044fd:	85 c0                	test   %eax,%eax
  1044ff:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
  104505:	78 1d                	js     104524 <popcli+0x44>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
  104507:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  10450d:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
  104513:	85 d2                	test   %edx,%edx
  104515:	75 0b                	jne    104522 <popcli+0x42>
  104517:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
  10451d:	85 c0                	test   %eax,%eax
  10451f:	74 01                	je     104522 <popcli+0x42>
}

static inline void
sti(void)
{
  asm volatile("sti");
  104521:	fb                   	sti    
    sti();
}
  104522:	c9                   	leave  
  104523:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
  104524:	c7 04 24 df 76 10 00 	movl   $0x1076df,(%esp)
  10452b:	e8 20 c6 ff ff       	call   100b50 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  104530:	c7 04 24 c8 76 10 00 	movl   $0x1076c8,(%esp)
  104537:	e8 14 c6 ff ff       	call   100b50 <panic>
  10453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104540 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
  104540:	55                   	push   %ebp
  104541:	89 e5                	mov    %esp,%ebp
  104543:	83 ec 18             	sub    $0x18,%esp
  104546:	8b 55 08             	mov    0x8(%ebp),%edx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
  104549:	8b 0a                	mov    (%edx),%ecx
  10454b:	85 c9                	test   %ecx,%ecx
  10454d:	74 0c                	je     10455b <release+0x1b>
  10454f:	8b 42 08             	mov    0x8(%edx),%eax
  104552:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  104559:	74 0d                	je     104568 <release+0x28>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
  10455b:	c7 04 24 e6 76 10 00 	movl   $0x1076e6,(%esp)
  104562:	e8 e9 c5 ff ff       	call   100b50 <panic>
  104567:	90                   	nop

  lk->pcs[0] = 0;
  104568:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
xchg(volatile uint *addr, uint newval)
{
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  10456f:	31 c0                	xor    %eax,%eax
  lk->cpu = 0;
  104571:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
  104578:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);

  popcli();
}
  10457b:	c9                   	leave  
  // after a store. So lock->locked = 0 would work here.
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);

  popcli();
  10457c:	e9 5f ff ff ff       	jmp    1044e0 <popcli>
  104581:	eb 0d                	jmp    104590 <acquire>
  104583:	90                   	nop
  104584:	90                   	nop
  104585:	90                   	nop
  104586:	90                   	nop
  104587:	90                   	nop
  104588:	90                   	nop
  104589:	90                   	nop
  10458a:	90                   	nop
  10458b:	90                   	nop
  10458c:	90                   	nop
  10458d:	90                   	nop
  10458e:	90                   	nop
  10458f:	90                   	nop

00104590 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  104590:	55                   	push   %ebp
  104591:	89 e5                	mov    %esp,%ebp
  104593:	53                   	push   %ebx
  104594:	83 ec 14             	sub    $0x14,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
  104597:	9c                   	pushf  
  104598:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
  104599:	fa                   	cli    
{
  int eflags;
  
  eflags = readeflags();
  cli();
  if(cpu->ncli++ == 0)
  10459a:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1045a1:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
  1045a7:	8d 48 01             	lea    0x1(%eax),%ecx
  1045aa:	85 c0                	test   %eax,%eax
  1045ac:	89 8a ac 00 00 00    	mov    %ecx,0xac(%edx)
  1045b2:	75 12                	jne    1045c6 <acquire+0x36>
    cpu->intena = eflags & FL_IF;
  1045b4:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  1045ba:	81 e3 00 02 00 00    	and    $0x200,%ebx
  1045c0:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli();
  if(holding(lk))
  1045c6:	8b 55 08             	mov    0x8(%ebp),%edx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
  1045c9:	8b 1a                	mov    (%edx),%ebx
  1045cb:	85 db                	test   %ebx,%ebx
  1045cd:	74 0c                	je     1045db <acquire+0x4b>
  1045cf:	8b 42 08             	mov    0x8(%edx),%eax
  1045d2:	65 3b 05 00 00 00 00 	cmp    %gs:0x0,%eax
  1045d9:	74 45                	je     104620 <acquire+0x90>
xchg(volatile uint *addr, uint newval)
{
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  1045db:	b9 01 00 00 00       	mov    $0x1,%ecx
  1045e0:	eb 09                	jmp    1045eb <acquire+0x5b>
  1045e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("acquire");

  // The xchg is atomic.
  // It also serializes, so that reads after acquire are not
  // reordered before it. 
  while(xchg(&lk->locked, 1) != 0)
  1045e8:	8b 55 08             	mov    0x8(%ebp),%edx
  1045eb:	89 c8                	mov    %ecx,%eax
  1045ed:	f0 87 02             	lock xchg %eax,(%edx)
  1045f0:	85 c0                	test   %eax,%eax
  1045f2:	75 f4                	jne    1045e8 <acquire+0x58>
    ;

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  1045f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1045f7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  1045fe:	89 50 08             	mov    %edx,0x8(%eax)
  getcallerpcs(&lk, lk->pcs);
  104601:	8b 45 08             	mov    0x8(%ebp),%eax
  104604:	83 c0 0c             	add    $0xc,%eax
  104607:	89 44 24 04          	mov    %eax,0x4(%esp)
  10460b:	8d 45 08             	lea    0x8(%ebp),%eax
  10460e:	89 04 24             	mov    %eax,(%esp)
  104611:	e8 0a fe ff ff       	call   104420 <getcallerpcs>
}
  104616:	83 c4 14             	add    $0x14,%esp
  104619:	5b                   	pop    %ebx
  10461a:	5d                   	pop    %ebp
  10461b:	c3                   	ret    
  10461c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
acquire(struct spinlock *lk)
{
  pushcli();
  if(holding(lk))
    panic("acquire");
  104620:	c7 04 24 ee 76 10 00 	movl   $0x1076ee,(%esp)
  104627:	e8 24 c5 ff ff       	call   100b50 <panic>
  10462c:	90                   	nop
  10462d:	90                   	nop
  10462e:	90                   	nop
  10462f:	90                   	nop

00104630 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
  104630:	55                   	push   %ebp
  104631:	89 e5                	mov    %esp,%ebp
  104633:	8b 55 08             	mov    0x8(%ebp),%edx
  104636:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  104637:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10463a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10463d:	89 d7                	mov    %edx,%edi
  10463f:	fc                   	cld    
  104640:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  104642:	89 d0                	mov    %edx,%eax
  104644:	5f                   	pop    %edi
  104645:	5d                   	pop    %ebp
  104646:	c3                   	ret    
  104647:	89 f6                	mov    %esi,%esi
  104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104650 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
  104650:	55                   	push   %ebp
  104651:	89 e5                	mov    %esp,%ebp
  104653:	57                   	push   %edi
  104654:	56                   	push   %esi
  104655:	53                   	push   %ebx
  104656:	8b 55 10             	mov    0x10(%ebp),%edx
  104659:	8b 75 08             	mov    0x8(%ebp),%esi
  10465c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  const uchar *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
  10465f:	85 d2                	test   %edx,%edx
  104661:	74 2d                	je     104690 <memcmp+0x40>
    if(*s1 != *s2)
  104663:	0f b6 1e             	movzbl (%esi),%ebx
  104666:	0f b6 0f             	movzbl (%edi),%ecx
  104669:	38 cb                	cmp    %cl,%bl
  10466b:	75 2b                	jne    104698 <memcmp+0x48>
      return *s1 - *s2;
  10466d:	83 ea 01             	sub    $0x1,%edx
  104670:	31 c0                	xor    %eax,%eax
  104672:	eb 18                	jmp    10468c <memcmp+0x3c>
  104674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const uchar *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
  104678:	0f b6 5c 06 01       	movzbl 0x1(%esi,%eax,1),%ebx
  10467d:	83 ea 01             	sub    $0x1,%edx
  104680:	0f b6 4c 07 01       	movzbl 0x1(%edi,%eax,1),%ecx
  104685:	83 c0 01             	add    $0x1,%eax
  104688:	38 cb                	cmp    %cl,%bl
  10468a:	75 0c                	jne    104698 <memcmp+0x48>
{
  const uchar *s1, *s2;
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
  10468c:	85 d2                	test   %edx,%edx
  10468e:	75 e8                	jne    104678 <memcmp+0x28>
  104690:	31 c0                	xor    %eax,%eax
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
  104692:	5b                   	pop    %ebx
  104693:	5e                   	pop    %esi
  104694:	5f                   	pop    %edi
  104695:	5d                   	pop    %ebp
  104696:	c3                   	ret    
  104697:	90                   	nop
  
  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
  104698:	0f b6 c3             	movzbl %bl,%eax
  10469b:	0f b6 c9             	movzbl %cl,%ecx
  10469e:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
  1046a0:	5b                   	pop    %ebx
  1046a1:	5e                   	pop    %esi
  1046a2:	5f                   	pop    %edi
  1046a3:	5d                   	pop    %ebp
  1046a4:	c3                   	ret    
  1046a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001046b0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
  1046b0:	55                   	push   %ebp
  1046b1:	89 e5                	mov    %esp,%ebp
  1046b3:	57                   	push   %edi
  1046b4:	56                   	push   %esi
  1046b5:	53                   	push   %ebx
  1046b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1046b9:	8b 75 0c             	mov    0xc(%ebp),%esi
  1046bc:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
  1046bf:	39 c6                	cmp    %eax,%esi
  1046c1:	73 2d                	jae    1046f0 <memmove+0x40>
  1046c3:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
  1046c6:	39 f8                	cmp    %edi,%eax
  1046c8:	73 26                	jae    1046f0 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
  1046ca:	85 db                	test   %ebx,%ebx
  1046cc:	74 1d                	je     1046eb <memmove+0x3b>

  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
  1046ce:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  1046d1:	31 d2                	xor    %edx,%edx
  1046d3:	90                   	nop
  1046d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
      *--d = *--s;
  1046d8:	0f b6 4c 17 ff       	movzbl -0x1(%edi,%edx,1),%ecx
  1046dd:	88 4c 16 ff          	mov    %cl,-0x1(%esi,%edx,1)
  1046e1:	83 ea 01             	sub    $0x1,%edx
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
  1046e4:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
  1046e7:	85 c9                	test   %ecx,%ecx
  1046e9:	75 ed                	jne    1046d8 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
  1046eb:	5b                   	pop    %ebx
  1046ec:	5e                   	pop    %esi
  1046ed:	5f                   	pop    %edi
  1046ee:	5d                   	pop    %ebp
  1046ef:	c3                   	ret    
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
  1046f0:	31 d2                	xor    %edx,%edx
      *--d = *--s;
  } else
    while(n-- > 0)
  1046f2:	85 db                	test   %ebx,%ebx
  1046f4:	74 f5                	je     1046eb <memmove+0x3b>
  1046f6:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
  1046f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
  1046fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1046ff:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
  104702:	39 d3                	cmp    %edx,%ebx
  104704:	75 f2                	jne    1046f8 <memmove+0x48>
      *d++ = *s++;

  return dst;
}
  104706:	5b                   	pop    %ebx
  104707:	5e                   	pop    %esi
  104708:	5f                   	pop    %edi
  104709:	5d                   	pop    %ebp
  10470a:	c3                   	ret    
  10470b:	90                   	nop
  10470c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104710 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  104710:	55                   	push   %ebp
  104711:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
  104713:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
  104714:	e9 97 ff ff ff       	jmp    1046b0 <memmove>
  104719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104720 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
  104720:	55                   	push   %ebp
  104721:	89 e5                	mov    %esp,%ebp
  104723:	57                   	push   %edi
  104724:	56                   	push   %esi
  104725:	53                   	push   %ebx
  104726:	8b 7d 10             	mov    0x10(%ebp),%edi
  104729:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10472c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(n > 0 && *p && *p == *q)
  10472f:	85 ff                	test   %edi,%edi
  104731:	74 3d                	je     104770 <strncmp+0x50>
  104733:	0f b6 01             	movzbl (%ecx),%eax
  104736:	84 c0                	test   %al,%al
  104738:	75 18                	jne    104752 <strncmp+0x32>
  10473a:	eb 3c                	jmp    104778 <strncmp+0x58>
  10473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104740:	83 ef 01             	sub    $0x1,%edi
  104743:	74 2b                	je     104770 <strncmp+0x50>
    n--, p++, q++;
  104745:	83 c1 01             	add    $0x1,%ecx
  104748:	83 c3 01             	add    $0x1,%ebx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
  10474b:	0f b6 01             	movzbl (%ecx),%eax
  10474e:	84 c0                	test   %al,%al
  104750:	74 26                	je     104778 <strncmp+0x58>
  104752:	0f b6 33             	movzbl (%ebx),%esi
  104755:	89 f2                	mov    %esi,%edx
  104757:	38 d0                	cmp    %dl,%al
  104759:	74 e5                	je     104740 <strncmp+0x20>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
  10475b:	81 e6 ff 00 00 00    	and    $0xff,%esi
  104761:	0f b6 c0             	movzbl %al,%eax
  104764:	29 f0                	sub    %esi,%eax
}
  104766:	5b                   	pop    %ebx
  104767:	5e                   	pop    %esi
  104768:	5f                   	pop    %edi
  104769:	5d                   	pop    %ebp
  10476a:	c3                   	ret    
  10476b:	90                   	nop
  10476c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
  104770:	31 c0                	xor    %eax,%eax
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
  104772:	5b                   	pop    %ebx
  104773:	5e                   	pop    %esi
  104774:	5f                   	pop    %edi
  104775:	5d                   	pop    %ebp
  104776:	c3                   	ret    
  104777:	90                   	nop
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
  104778:	0f b6 33             	movzbl (%ebx),%esi
  10477b:	eb de                	jmp    10475b <strncmp+0x3b>
  10477d:	8d 76 00             	lea    0x0(%esi),%esi

00104780 <strncpy>:
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
{
  104780:	55                   	push   %ebp
  104781:	89 e5                	mov    %esp,%ebp
  104783:	8b 45 08             	mov    0x8(%ebp),%eax
  104786:	56                   	push   %esi
  104787:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10478a:	53                   	push   %ebx
  10478b:	8b 75 0c             	mov    0xc(%ebp),%esi
  10478e:	89 c3                	mov    %eax,%ebx
  104790:	eb 09                	jmp    10479b <strncpy+0x1b>
  104792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
  104798:	83 c6 01             	add    $0x1,%esi
  10479b:	83 e9 01             	sub    $0x1,%ecx
    return 0;
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
  10479e:	8d 51 01             	lea    0x1(%ecx),%edx
{
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
  1047a1:	85 d2                	test   %edx,%edx
  1047a3:	7e 0c                	jle    1047b1 <strncpy+0x31>
  1047a5:	0f b6 16             	movzbl (%esi),%edx
  1047a8:	88 13                	mov    %dl,(%ebx)
  1047aa:	83 c3 01             	add    $0x1,%ebx
  1047ad:	84 d2                	test   %dl,%dl
  1047af:	75 e7                	jne    104798 <strncpy+0x18>
    return 0;
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
  1047b1:	31 d2                	xor    %edx,%edx
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
  1047b3:	85 c9                	test   %ecx,%ecx
  1047b5:	7e 0c                	jle    1047c3 <strncpy+0x43>
  1047b7:	90                   	nop
    *s++ = 0;
  1047b8:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
  1047bc:	83 c2 01             	add    $0x1,%edx
  char *os;
  
  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
  1047bf:	39 ca                	cmp    %ecx,%edx
  1047c1:	75 f5                	jne    1047b8 <strncpy+0x38>
    *s++ = 0;
  return os;
}
  1047c3:	5b                   	pop    %ebx
  1047c4:	5e                   	pop    %esi
  1047c5:	5d                   	pop    %ebp
  1047c6:	c3                   	ret    
  1047c7:	89 f6                	mov    %esi,%esi
  1047c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001047d0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
  1047d0:	55                   	push   %ebp
  1047d1:	89 e5                	mov    %esp,%ebp
  1047d3:	8b 55 10             	mov    0x10(%ebp),%edx
  1047d6:	56                   	push   %esi
  1047d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1047da:	53                   	push   %ebx
  1047db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *os;
  
  os = s;
  if(n <= 0)
  1047de:	85 d2                	test   %edx,%edx
  1047e0:	7e 1f                	jle    104801 <safestrcpy+0x31>
  1047e2:	89 c1                	mov    %eax,%ecx
  1047e4:	eb 05                	jmp    1047eb <safestrcpy+0x1b>
  1047e6:	66 90                	xchg   %ax,%ax
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
  1047e8:	83 c6 01             	add    $0x1,%esi
  1047eb:	83 ea 01             	sub    $0x1,%edx
  1047ee:	85 d2                	test   %edx,%edx
  1047f0:	7e 0c                	jle    1047fe <safestrcpy+0x2e>
  1047f2:	0f b6 1e             	movzbl (%esi),%ebx
  1047f5:	88 19                	mov    %bl,(%ecx)
  1047f7:	83 c1 01             	add    $0x1,%ecx
  1047fa:	84 db                	test   %bl,%bl
  1047fc:	75 ea                	jne    1047e8 <safestrcpy+0x18>
    ;
  *s = 0;
  1047fe:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
  104801:	5b                   	pop    %ebx
  104802:	5e                   	pop    %esi
  104803:	5d                   	pop    %ebp
  104804:	c3                   	ret    
  104805:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104810 <strlen>:

int
strlen(const char *s)
{
  104810:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  104811:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
  104813:	89 e5                	mov    %esp,%ebp
  104815:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  104818:	80 3a 00             	cmpb   $0x0,(%edx)
  10481b:	74 0c                	je     104829 <strlen+0x19>
  10481d:	8d 76 00             	lea    0x0(%esi),%esi
  104820:	83 c0 01             	add    $0x1,%eax
  104823:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  104827:	75 f7                	jne    104820 <strlen+0x10>
    ;
  return n;
}
  104829:	5d                   	pop    %ebp
  10482a:	c3                   	ret    
  10482b:	90                   	nop

0010482c <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
  10482c:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
  104830:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
  104834:	55                   	push   %ebp
  pushl %ebx
  104835:	53                   	push   %ebx
  pushl %esi
  104836:	56                   	push   %esi
  pushl %edi
  104837:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
  104838:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
  10483a:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
  10483c:	5f                   	pop    %edi
  popl %esi
  10483d:	5e                   	pop    %esi
  popl %ebx
  10483e:	5b                   	pop    %ebx
  popl %ebp
  10483f:	5d                   	pop    %ebp
  ret
  104840:	c3                   	ret    
  104841:	90                   	nop
  104842:	90                   	nop
  104843:	90                   	nop
  104844:	90                   	nop
  104845:	90                   	nop
  104846:	90                   	nop
  104847:	90                   	nop
  104848:	90                   	nop
  104849:	90                   	nop
  10484a:	90                   	nop
  10484b:	90                   	nop
  10484c:	90                   	nop
  10484d:	90                   	nop
  10484e:	90                   	nop
  10484f:	90                   	nop

00104850 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  104850:	55                   	push   %ebp
  104851:	89 e5                	mov    %esp,%ebp
  if(addr >= p->sz || addr+4 > p->sz)
  104853:	8b 55 08             	mov    0x8(%ebp),%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  104856:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(addr >= p->sz || addr+4 > p->sz)
  104859:	8b 12                	mov    (%edx),%edx
  10485b:	39 c2                	cmp    %eax,%edx
  10485d:	77 09                	ja     104868 <fetchint+0x18>
    return -1;
  *ip = *(int*)(addr);
  return 0;
  10485f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104864:	5d                   	pop    %ebp
  104865:	c3                   	ret    
  104866:	66 90                	xchg   %ax,%ax

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  104868:	8d 48 04             	lea    0x4(%eax),%ecx
  10486b:	39 ca                	cmp    %ecx,%edx
  10486d:	72 f0                	jb     10485f <fetchint+0xf>
    return -1;
  *ip = *(int*)(addr);
  10486f:	8b 10                	mov    (%eax),%edx
  104871:	8b 45 10             	mov    0x10(%ebp),%eax
  104874:	89 10                	mov    %edx,(%eax)
  104876:	31 c0                	xor    %eax,%eax
  return 0;
}
  104878:	5d                   	pop    %ebp
  104879:	c3                   	ret    
  10487a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104880 <fetchstr>:
// Fetch the nul-terminated string at addr from process p.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(struct proc *p, uint addr, char **pp)
{
  104880:	55                   	push   %ebp
  104881:	89 e5                	mov    %esp,%ebp
  104883:	8b 45 08             	mov    0x8(%ebp),%eax
  104886:	8b 55 0c             	mov    0xc(%ebp),%edx
  104889:	53                   	push   %ebx
  char *s, *ep;

  if(addr >= p->sz)
  10488a:	39 10                	cmp    %edx,(%eax)
  10488c:	77 0a                	ja     104898 <fetchstr+0x18>
    return -1;
  *pp = (char *) addr;
  ep = (char *) p->sz;
  for(s = *pp; s < ep; s++)
  10488e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    if(*s == 0)
      return s - *pp;
  return -1;
}
  104893:	5b                   	pop    %ebx
  104894:	5d                   	pop    %ebp
  104895:	c3                   	ret    
  104896:	66 90                	xchg   %ax,%ax
{
  char *s, *ep;

  if(addr >= p->sz)
    return -1;
  *pp = (char *) addr;
  104898:	8b 4d 10             	mov    0x10(%ebp),%ecx
  10489b:	89 11                	mov    %edx,(%ecx)
  ep = (char *) p->sz;
  10489d:	8b 18                	mov    (%eax),%ebx
  for(s = *pp; s < ep; s++)
  10489f:	39 da                	cmp    %ebx,%edx
  1048a1:	73 eb                	jae    10488e <fetchstr+0xe>
    if(*s == 0)
  1048a3:	31 c0                	xor    %eax,%eax
  1048a5:	89 d1                	mov    %edx,%ecx
  1048a7:	80 3a 00             	cmpb   $0x0,(%edx)
  1048aa:	74 e7                	je     104893 <fetchstr+0x13>
  1048ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  if(addr >= p->sz)
    return -1;
  *pp = (char *) addr;
  ep = (char *) p->sz;
  for(s = *pp; s < ep; s++)
  1048b0:	83 c1 01             	add    $0x1,%ecx
  1048b3:	39 cb                	cmp    %ecx,%ebx
  1048b5:	76 d7                	jbe    10488e <fetchstr+0xe>
    if(*s == 0)
  1048b7:	80 39 00             	cmpb   $0x0,(%ecx)
  1048ba:	75 f4                	jne    1048b0 <fetchstr+0x30>
  1048bc:	89 c8                	mov    %ecx,%eax
  1048be:	29 d0                	sub    %edx,%eax
  1048c0:	eb d1                	jmp    104893 <fetchstr+0x13>
  1048c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1048c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001048d0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  1048d0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  1048d6:	55                   	push   %ebp
  1048d7:	89 e5                	mov    %esp,%ebp
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  1048d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1048dc:	8b 50 60             	mov    0x60(%eax),%edx

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  1048df:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  1048e1:	8b 52 44             	mov    0x44(%edx),%edx
  1048e4:	8d 54 8a 04          	lea    0x4(%edx,%ecx,4),%edx

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  1048e8:	39 c2                	cmp    %eax,%edx
  1048ea:	72 0c                	jb     1048f8 <argint+0x28>
    return -1;
  *ip = *(int*)(addr);
  1048ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  return x;
}
  1048f1:	5d                   	pop    %ebp
  1048f2:	c3                   	ret    
  1048f3:	90                   	nop
  1048f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  1048f8:	8d 4a 04             	lea    0x4(%edx),%ecx
  1048fb:	39 c8                	cmp    %ecx,%eax
  1048fd:	72 ed                	jb     1048ec <argint+0x1c>
    return -1;
  *ip = *(int*)(addr);
  1048ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  104902:	8b 12                	mov    (%edx),%edx
  104904:	89 10                	mov    %edx,(%eax)
  104906:	31 c0                	xor    %eax,%eax
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  return x;
}
  104908:	5d                   	pop    %ebp
  104909:	c3                   	ret    
  10490a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104910 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  104910:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
  104916:	55                   	push   %ebp
  104917:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  104919:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10491c:	8b 50 60             	mov    0x60(%eax),%edx

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  10491f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  104921:	8b 52 44             	mov    0x44(%edx),%edx
  104924:	8d 54 8a 04          	lea    0x4(%edx,%ecx,4),%edx

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  104928:	39 c2                	cmp    %eax,%edx
  10492a:	73 07                	jae    104933 <argptr+0x23>
  10492c:	8d 4a 04             	lea    0x4(%edx),%ecx
  10492f:	39 c8                	cmp    %ecx,%eax
  104931:	73 0d                	jae    104940 <argptr+0x30>
  if(argint(n, &i) < 0)
    return -1;
  if((uint)i >= proc->sz || (uint)i+size >= proc->sz)
    return -1;
  *pp = (char *) i;
  return 0;
  104933:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104938:	5d                   	pop    %ebp
  104939:	c3                   	ret    
  10493a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
    return -1;
  *ip = *(int*)(addr);
  104940:	8b 12                	mov    (%edx),%edx
{
  int i;
  
  if(argint(n, &i) < 0)
    return -1;
  if((uint)i >= proc->sz || (uint)i+size >= proc->sz)
  104942:	39 c2                	cmp    %eax,%edx
  104944:	73 ed                	jae    104933 <argptr+0x23>
  104946:	8b 4d 10             	mov    0x10(%ebp),%ecx
  104949:	01 d1                	add    %edx,%ecx
  10494b:	39 c1                	cmp    %eax,%ecx
  10494d:	73 e4                	jae    104933 <argptr+0x23>
    return -1;
  *pp = (char *) i;
  10494f:	8b 45 0c             	mov    0xc(%ebp),%eax
  104952:	89 10                	mov    %edx,(%eax)
  104954:	31 c0                	xor    %eax,%eax
  return 0;
}
  104956:	5d                   	pop    %ebp
  104957:	c3                   	ret    
  104958:	90                   	nop
  104959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104960 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  104960:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
  104967:	55                   	push   %ebp
  104968:	89 e5                	mov    %esp,%ebp
  10496a:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  int x = fetchint(proc, proc->tf->esp + 4 + 4*n, ip);
  10496b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  10496e:	8b 42 60             	mov    0x60(%edx),%eax
  104971:	8b 40 44             	mov    0x44(%eax),%eax
  104974:	8d 44 88 04          	lea    0x4(%eax,%ecx,4),%eax

// Fetch the int at addr from process p.
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
  104978:	8b 0a                	mov    (%edx),%ecx
  10497a:	39 c8                	cmp    %ecx,%eax
  10497c:	73 07                	jae    104985 <argstr+0x25>
  10497e:	8d 58 04             	lea    0x4(%eax),%ebx
  104981:	39 d9                	cmp    %ebx,%ecx
  104983:	73 0b                	jae    104990 <argstr+0x30>

  if(addr >= p->sz)
    return -1;
  *pp = (char *) addr;
  ep = (char *) p->sz;
  for(s = *pp; s < ep; s++)
  104985:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(proc, addr, pp);
}
  10498a:	5b                   	pop    %ebx
  10498b:	5d                   	pop    %ebp
  10498c:	c3                   	ret    
  10498d:	8d 76 00             	lea    0x0(%esi),%esi
int
fetchint(struct proc *p, uint addr, int *ip)
{
  if(addr >= p->sz || addr+4 > p->sz)
    return -1;
  *ip = *(int*)(addr);
  104990:	8b 18                	mov    (%eax),%ebx
int
fetchstr(struct proc *p, uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= p->sz)
  104992:	39 cb                	cmp    %ecx,%ebx
  104994:	73 ef                	jae    104985 <argstr+0x25>
    return -1;
  *pp = (char *) addr;
  104996:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  104999:	89 d8                	mov    %ebx,%eax
  10499b:	89 19                	mov    %ebx,(%ecx)
  ep = (char *) p->sz;
  10499d:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
  10499f:	39 d3                	cmp    %edx,%ebx
  1049a1:	73 e2                	jae    104985 <argstr+0x25>
    if(*s == 0)
  1049a3:	80 3b 00             	cmpb   $0x0,(%ebx)
  1049a6:	75 12                	jne    1049ba <argstr+0x5a>
  1049a8:	eb 1e                	jmp    1049c8 <argstr+0x68>
  1049aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1049b0:	80 38 00             	cmpb   $0x0,(%eax)
  1049b3:	90                   	nop
  1049b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1049b8:	74 0e                	je     1049c8 <argstr+0x68>

  if(addr >= p->sz)
    return -1;
  *pp = (char *) addr;
  ep = (char *) p->sz;
  for(s = *pp; s < ep; s++)
  1049ba:	83 c0 01             	add    $0x1,%eax
  1049bd:	39 c2                	cmp    %eax,%edx
  1049bf:	90                   	nop
  1049c0:	77 ee                	ja     1049b0 <argstr+0x50>
  1049c2:	eb c1                	jmp    104985 <argstr+0x25>
  1049c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*s == 0)
      return s - *pp;
  1049c8:	29 d8                	sub    %ebx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(proc, addr, pp);
}
  1049ca:	5b                   	pop    %ebx
  1049cb:	5d                   	pop    %ebp
  1049cc:	c3                   	ret    
  1049cd:	8d 76 00             	lea    0x0(%esi),%esi

001049d0 <syscall>:
[SYS_exit_all_threads] sys_exit_all_threads,
};

void
syscall(void)
{
  1049d0:	55                   	push   %ebp
  1049d1:	89 e5                	mov    %esp,%ebp
  1049d3:	53                   	push   %ebx
  1049d4:	83 ec 14             	sub    $0x14,%esp
  int num;
  
  num = proc->tf->eax;
  1049d7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1049de:	8b 5a 60             	mov    0x60(%edx),%ebx
  1049e1:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num >= 0 && num < NELEM(syscalls) && syscalls[num])
  1049e4:	83 f8 1f             	cmp    $0x1f,%eax
  1049e7:	77 17                	ja     104a00 <syscall+0x30>
  1049e9:	8b 0c 85 20 77 10 00 	mov    0x107720(,%eax,4),%ecx
  1049f0:	85 c9                	test   %ecx,%ecx
  1049f2:	74 0c                	je     104a00 <syscall+0x30>
    proc->tf->eax = syscalls[num]();
  1049f4:	ff d1                	call   *%ecx
  1049f6:	89 43 1c             	mov    %eax,0x1c(%ebx)
  else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
  1049f9:	83 c4 14             	add    $0x14,%esp
  1049fc:	5b                   	pop    %ebx
  1049fd:	5d                   	pop    %ebp
  1049fe:	c3                   	ret    
  1049ff:	90                   	nop
  
  num = proc->tf->eax;
  if(num >= 0 && num < NELEM(syscalls) && syscalls[num])
    proc->tf->eax = syscalls[num]();
  else {
    cprintf("%d %s: unknown sys call %d\n",
  104a00:	8b 4a 58             	mov    0x58(%edx),%ecx
  104a03:	83 c2 6c             	add    $0x6c,%edx
  104a06:	89 44 24 0c          	mov    %eax,0xc(%esp)
  104a0a:	89 54 24 08          	mov    %edx,0x8(%esp)
  104a0e:	c7 04 24 f6 76 10 00 	movl   $0x1076f6,(%esp)
  104a15:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  104a19:	e8 42 bd ff ff       	call   100760 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  104a1e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104a24:	8b 40 60             	mov    0x60(%eax),%eax
  104a27:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
  104a2e:	83 c4 14             	add    $0x14,%esp
  104a31:	5b                   	pop    %ebx
  104a32:	5d                   	pop    %ebp
  104a33:	c3                   	ret    
  104a34:	90                   	nop
  104a35:	90                   	nop
  104a36:	90                   	nop
  104a37:	90                   	nop
  104a38:	90                   	nop
  104a39:	90                   	nop
  104a3a:	90                   	nop
  104a3b:	90                   	nop
  104a3c:	90                   	nop
  104a3d:	90                   	nop
  104a3e:	90                   	nop
  104a3f:	90                   	nop

00104a40 <sys_pipe>:
  return exec(path, argv);
}

int
sys_pipe(void)
{
  104a40:	55                   	push   %ebp
  104a41:	89 e5                	mov    %esp,%ebp
  104a43:	53                   	push   %ebx
  104a44:	83 ec 24             	sub    $0x24,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
  104a47:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104a4a:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
  104a51:	00 
  104a52:	89 44 24 04          	mov    %eax,0x4(%esp)
  104a56:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104a5d:	e8 ae fe ff ff       	call   104910 <argptr>
  104a62:	85 c0                	test   %eax,%eax
  104a64:	79 12                	jns    104a78 <sys_pipe+0x38>
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  104a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
  104a6b:	83 c4 24             	add    $0x24,%esp
  104a6e:	5b                   	pop    %ebx
  104a6f:	5d                   	pop    %ebp
  104a70:	c3                   	ret    
  104a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
  104a78:	8d 45 ec             	lea    -0x14(%ebp),%eax
  104a7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104a7f:	8d 45 f0             	lea    -0x10(%ebp),%eax
  104a82:	89 04 24             	mov    %eax,(%esp)
  104a85:	e8 f6 e6 ff ff       	call   103180 <pipealloc>
  104a8a:	85 c0                	test   %eax,%eax
  104a8c:	78 d8                	js     104a66 <sys_pipe+0x26>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
  104a8e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  104a91:	31 c0                	xor    %eax,%eax
  104a93:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  104a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
  104aa0:	8b 5c 82 08          	mov    0x8(%edx,%eax,4),%ebx
  104aa4:	85 db                	test   %ebx,%ebx
  104aa6:	74 28                	je     104ad0 <sys_pipe+0x90>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
  104aa8:	83 c0 01             	add    $0x1,%eax
  104aab:	83 f8 10             	cmp    $0x10,%eax
  104aae:	75 f0                	jne    104aa0 <sys_pipe+0x60>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
  104ab0:	89 0c 24             	mov    %ecx,(%esp)
  104ab3:	e8 48 c7 ff ff       	call   101200 <fileclose>
    fileclose(wf);
  104ab8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104abb:	89 04 24             	mov    %eax,(%esp)
  104abe:	e8 3d c7 ff ff       	call   101200 <fileclose>
  104ac3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
  104ac8:	eb a1                	jmp    104a6b <sys_pipe+0x2b>
  104aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
  104ad0:	89 4c 82 08          	mov    %ecx,0x8(%edx,%eax,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
  104ad4:	8b 5d ec             	mov    -0x14(%ebp),%ebx
  104ad7:	31 d2                	xor    %edx,%edx
  104ad9:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
  104ae0:	83 7c 91 08 00       	cmpl   $0x0,0x8(%ecx,%edx,4)
  104ae5:	74 19                	je     104b00 <sys_pipe+0xc0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
  104ae7:	83 c2 01             	add    $0x1,%edx
  104aea:	83 fa 10             	cmp    $0x10,%edx
  104aed:	75 f1                	jne    104ae0 <sys_pipe+0xa0>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
  104aef:	c7 44 81 08 00 00 00 	movl   $0x0,0x8(%ecx,%eax,4)
  104af6:	00 
  104af7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  104afa:	eb b4                	jmp    104ab0 <sys_pipe+0x70>
  104afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
  104b00:	89 5c 91 08          	mov    %ebx,0x8(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  104b04:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  104b07:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
  104b09:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104b0c:	89 50 04             	mov    %edx,0x4(%eax)
  104b0f:	31 c0                	xor    %eax,%eax
  return 0;
  104b11:	e9 55 ff ff ff       	jmp    104a6b <sys_pipe+0x2b>
  104b16:	8d 76 00             	lea    0x0(%esi),%esi
  104b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104b20 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
  104b20:	55                   	push   %ebp
  104b21:	89 e5                	mov    %esp,%ebp
  104b23:	81 ec 88 00 00 00    	sub    $0x88,%esp
  char *path, *argv[20];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0) {
  104b29:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
  104b2c:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  104b2f:	89 75 f8             	mov    %esi,-0x8(%ebp)
  104b32:	89 7d fc             	mov    %edi,-0x4(%ebp)
  char *path, *argv[20];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0) {
  104b35:	89 44 24 04          	mov    %eax,0x4(%esp)
  104b39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104b40:	e8 1b fe ff ff       	call   104960 <argstr>
  104b45:	85 c0                	test   %eax,%eax
  104b47:	79 17                	jns    104b60 <sys_exec+0x40>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv))
  104b49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(proc, uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
  104b4e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104b51:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104b54:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104b57:	89 ec                	mov    %ebp,%esp
  104b59:	5d                   	pop    %ebp
  104b5a:	c3                   	ret    
  104b5b:	90                   	nop
  104b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *path, *argv[20];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0) {
  104b60:	8d 45 e0             	lea    -0x20(%ebp),%eax
  104b63:	89 44 24 04          	mov    %eax,0x4(%esp)
  104b67:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  104b6e:	e8 5d fd ff ff       	call   1048d0 <argint>
  104b73:	85 c0                	test   %eax,%eax
  104b75:	78 d2                	js     104b49 <sys_exec+0x29>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  104b77:	8d 7d 8c             	lea    -0x74(%ebp),%edi
  104b7a:	31 f6                	xor    %esi,%esi
  104b7c:	c7 44 24 08 50 00 00 	movl   $0x50,0x8(%esp)
  104b83:	00 
  104b84:	31 db                	xor    %ebx,%ebx
  104b86:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  104b8d:	00 
  104b8e:	89 3c 24             	mov    %edi,(%esp)
  104b91:	e8 9a fa ff ff       	call   104630 <memset>
  104b96:	eb 27                	jmp    104bbf <sys_exec+0x9f>
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(proc, uarg, &argv[i]) < 0)
  104b98:	89 44 24 04          	mov    %eax,0x4(%esp)
  104b9c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104ba2:	8d 14 b7             	lea    (%edi,%esi,4),%edx
  104ba5:	89 54 24 08          	mov    %edx,0x8(%esp)
  104ba9:	89 04 24             	mov    %eax,(%esp)
  104bac:	e8 cf fc ff ff       	call   104880 <fetchstr>
  104bb1:	85 c0                	test   %eax,%eax
  104bb3:	78 94                	js     104b49 <sys_exec+0x29>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0) {
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
  104bb5:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
  104bb8:	83 fb 14             	cmp    $0x14,%ebx

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0) {
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
  104bbb:	89 de                	mov    %ebx,%esi
    if(i >= NELEM(argv))
  104bbd:	74 8a                	je     104b49 <sys_exec+0x29>
      return -1;
    if(fetchint(proc, uargv+4*i, (int*)&uarg) < 0)
  104bbf:	8d 45 dc             	lea    -0x24(%ebp),%eax
  104bc2:	89 44 24 08          	mov    %eax,0x8(%esp)
  104bc6:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  104bcd:	03 45 e0             	add    -0x20(%ebp),%eax
  104bd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  104bd4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104bda:	89 04 24             	mov    %eax,(%esp)
  104bdd:	e8 6e fc ff ff       	call   104850 <fetchint>
  104be2:	85 c0                	test   %eax,%eax
  104be4:	0f 88 5f ff ff ff    	js     104b49 <sys_exec+0x29>
      return -1;
    if(uarg == 0){
  104bea:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104bed:	85 c0                	test   %eax,%eax
  104bef:	75 a7                	jne    104b98 <sys_exec+0x78>
      break;
    }
    if(fetchstr(proc, uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
  104bf1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(proc, uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
  104bf4:	c7 44 9d 8c 00 00 00 	movl   $0x0,-0x74(%ebp,%ebx,4)
  104bfb:	00 
      break;
    }
    if(fetchstr(proc, uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
  104bfc:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104c00:	89 04 24             	mov    %eax,(%esp)
  104c03:	e8 c8 bf ff ff       	call   100bd0 <exec>
  104c08:	e9 41 ff ff ff       	jmp    104b4e <sys_exec+0x2e>
  104c0d:	8d 76 00             	lea    0x0(%esi),%esi

00104c10 <sys_chdir>:
  return 0;
}

int
sys_chdir(void)
{
  104c10:	55                   	push   %ebp
  104c11:	89 e5                	mov    %esp,%ebp
  104c13:	53                   	push   %ebx
  104c14:	83 ec 24             	sub    $0x24,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
  104c17:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104c1a:	89 44 24 04          	mov    %eax,0x4(%esp)
  104c1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104c25:	e8 36 fd ff ff       	call   104960 <argstr>
  104c2a:	85 c0                	test   %eax,%eax
  104c2c:	79 12                	jns    104c40 <sys_chdir+0x30>
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  proc->cwd = ip;
  return 0;
  104c2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104c33:	83 c4 24             	add    $0x24,%esp
  104c36:	5b                   	pop    %ebx
  104c37:	5d                   	pop    %ebp
  104c38:	c3                   	ret    
  104c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_chdir(void)
{
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
  104c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104c43:	89 04 24             	mov    %eax,(%esp)
  104c46:	e8 85 d4 ff ff       	call   1020d0 <namei>
  104c4b:	85 c0                	test   %eax,%eax
  104c4d:	89 c3                	mov    %eax,%ebx
  104c4f:	74 dd                	je     104c2e <sys_chdir+0x1e>
    return -1;
  ilock(ip);
  104c51:	89 04 24             	mov    %eax,(%esp)
  104c54:	e8 d7 d1 ff ff       	call   101e30 <ilock>
  if(ip->type != T_DIR){
  104c59:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  104c5e:	75 26                	jne    104c86 <sys_chdir+0x76>
    iunlockput(ip);
    return -1;
  }
  iunlock(ip);
  104c60:	89 1c 24             	mov    %ebx,(%esp)
  104c63:	e8 88 cd ff ff       	call   1019f0 <iunlock>
  iput(proc->cwd);
  104c68:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104c6e:	8b 40 48             	mov    0x48(%eax),%eax
  104c71:	89 04 24             	mov    %eax,(%esp)
  104c74:	e8 87 ce ff ff       	call   101b00 <iput>
  proc->cwd = ip;
  104c79:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  104c7f:	89 58 48             	mov    %ebx,0x48(%eax)
  104c82:	31 c0                	xor    %eax,%eax
  return 0;
  104c84:	eb ad                	jmp    104c33 <sys_chdir+0x23>

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
    return -1;
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
  104c86:	89 1c 24             	mov    %ebx,(%esp)
  104c89:	e8 b2 d0 ff ff       	call   101d40 <iunlockput>
  104c8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
  104c93:	eb 9e                	jmp    104c33 <sys_chdir+0x23>
  104c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104ca0 <create>:
  return 0;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
  104ca0:	55                   	push   %ebp
  104ca1:	89 e5                	mov    %esp,%ebp
  104ca3:	83 ec 58             	sub    $0x58,%esp
  104ca6:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  104ca9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  104cac:	89 75 f8             	mov    %esi,-0x8(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  104caf:	8d 75 d6             	lea    -0x2a(%ebp),%esi
  return 0;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
  104cb2:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  104cb5:	31 db                	xor    %ebx,%ebx
  return 0;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
  104cb7:	89 7d fc             	mov    %edi,-0x4(%ebp)
  104cba:	89 d7                	mov    %edx,%edi
  104cbc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
  104cbf:	89 74 24 04          	mov    %esi,0x4(%esp)
  104cc3:	89 04 24             	mov    %eax,(%esp)
  104cc6:	e8 e5 d3 ff ff       	call   1020b0 <nameiparent>
  104ccb:	85 c0                	test   %eax,%eax
  104ccd:	74 47                	je     104d16 <create+0x76>
    return 0;
  ilock(dp);
  104ccf:	89 04 24             	mov    %eax,(%esp)
  104cd2:	89 45 bc             	mov    %eax,-0x44(%ebp)
  104cd5:	e8 56 d1 ff ff       	call   101e30 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
  104cda:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104cdd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  104ce0:	89 44 24 08          	mov    %eax,0x8(%esp)
  104ce4:	89 74 24 04          	mov    %esi,0x4(%esp)
  104ce8:	89 14 24             	mov    %edx,(%esp)
  104ceb:	e8 00 cc ff ff       	call   1018f0 <dirlookup>
  104cf0:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104cf3:	85 c0                	test   %eax,%eax
  104cf5:	89 c3                	mov    %eax,%ebx
  104cf7:	74 3f                	je     104d38 <create+0x98>
    iunlockput(dp);
  104cf9:	89 14 24             	mov    %edx,(%esp)
  104cfc:	e8 3f d0 ff ff       	call   101d40 <iunlockput>
    ilock(ip);
  104d01:	89 1c 24             	mov    %ebx,(%esp)
  104d04:	e8 27 d1 ff ff       	call   101e30 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
  104d09:	66 83 ff 02          	cmp    $0x2,%di
  104d0d:	75 19                	jne    104d28 <create+0x88>
  104d0f:	66 83 7b 10 02       	cmpw   $0x2,0x10(%ebx)
  104d14:	75 12                	jne    104d28 <create+0x88>
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);
  return ip;
}
  104d16:	89 d8                	mov    %ebx,%eax
  104d18:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104d1b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104d1e:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104d21:	89 ec                	mov    %ebp,%esp
  104d23:	5d                   	pop    %ebp
  104d24:	c3                   	ret    
  104d25:	8d 76 00             	lea    0x0(%esi),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
  104d28:	89 1c 24             	mov    %ebx,(%esp)
  104d2b:	31 db                	xor    %ebx,%ebx
  104d2d:	e8 0e d0 ff ff       	call   101d40 <iunlockput>
    return 0;
  104d32:	eb e2                	jmp    104d16 <create+0x76>
  104d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  if((ip = ialloc(dp->dev, type)) == 0)
  104d38:	0f bf c7             	movswl %di,%eax
  104d3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104d3f:	8b 02                	mov    (%edx),%eax
  104d41:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104d44:	89 04 24             	mov    %eax,(%esp)
  104d47:	e8 14 d0 ff ff       	call   101d60 <ialloc>
  104d4c:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104d4f:	85 c0                	test   %eax,%eax
  104d51:	89 c3                	mov    %eax,%ebx
  104d53:	0f 84 b7 00 00 00    	je     104e10 <create+0x170>
    panic("create: ialloc");

  ilock(ip);
  104d59:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104d5c:	89 04 24             	mov    %eax,(%esp)
  104d5f:	e8 cc d0 ff ff       	call   101e30 <ilock>
  ip->major = major;
  104d64:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
  104d68:	66 89 43 12          	mov    %ax,0x12(%ebx)
  ip->minor = minor;
  104d6c:	0f b7 4d c0          	movzwl -0x40(%ebp),%ecx
  ip->nlink = 1;
  104d70:	66 c7 43 16 01 00    	movw   $0x1,0x16(%ebx)
  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");

  ilock(ip);
  ip->major = major;
  ip->minor = minor;
  104d76:	66 89 4b 14          	mov    %cx,0x14(%ebx)
  ip->nlink = 1;
  iupdate(ip);
  104d7a:	89 1c 24             	mov    %ebx,(%esp)
  104d7d:	e8 6e c9 ff ff       	call   1016f0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
  104d82:	66 83 ff 01          	cmp    $0x1,%di
  104d86:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104d89:	74 2d                	je     104db8 <create+0x118>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
  104d8b:	8b 43 04             	mov    0x4(%ebx),%eax
  104d8e:	89 14 24             	mov    %edx,(%esp)
  104d91:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104d94:	89 74 24 04          	mov    %esi,0x4(%esp)
  104d98:	89 44 24 08          	mov    %eax,0x8(%esp)
  104d9c:	e8 af ce ff ff       	call   101c50 <dirlink>
  104da1:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104da4:	85 c0                	test   %eax,%eax
  104da6:	78 74                	js     104e1c <create+0x17c>
    panic("create: dirlink");

  iunlockput(dp);
  104da8:	89 14 24             	mov    %edx,(%esp)
  104dab:	e8 90 cf ff ff       	call   101d40 <iunlockput>
  return ip;
  104db0:	e9 61 ff ff ff       	jmp    104d16 <create+0x76>
  104db5:	8d 76 00             	lea    0x0(%esi),%esi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
  104db8:	66 83 42 16 01       	addw   $0x1,0x16(%edx)
    iupdate(dp);
  104dbd:	89 14 24             	mov    %edx,(%esp)
  104dc0:	89 55 bc             	mov    %edx,-0x44(%ebp)
  104dc3:	e8 28 c9 ff ff       	call   1016f0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
  104dc8:	8b 43 04             	mov    0x4(%ebx),%eax
  104dcb:	c7 44 24 04 b0 77 10 	movl   $0x1077b0,0x4(%esp)
  104dd2:	00 
  104dd3:	89 1c 24             	mov    %ebx,(%esp)
  104dd6:	89 44 24 08          	mov    %eax,0x8(%esp)
  104dda:	e8 71 ce ff ff       	call   101c50 <dirlink>
  104ddf:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104de2:	85 c0                	test   %eax,%eax
  104de4:	78 1e                	js     104e04 <create+0x164>
  104de6:	8b 42 04             	mov    0x4(%edx),%eax
  104de9:	c7 44 24 04 af 77 10 	movl   $0x1077af,0x4(%esp)
  104df0:	00 
  104df1:	89 1c 24             	mov    %ebx,(%esp)
  104df4:	89 44 24 08          	mov    %eax,0x8(%esp)
  104df8:	e8 53 ce ff ff       	call   101c50 <dirlink>
  104dfd:	8b 55 bc             	mov    -0x44(%ebp),%edx
  104e00:	85 c0                	test   %eax,%eax
  104e02:	79 87                	jns    104d8b <create+0xeb>
      panic("create dots");
  104e04:	c7 04 24 b2 77 10 00 	movl   $0x1077b2,(%esp)
  104e0b:	e8 40 bd ff ff       	call   100b50 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
  104e10:	c7 04 24 a0 77 10 00 	movl   $0x1077a0,(%esp)
  104e17:	e8 34 bd ff ff       	call   100b50 <panic>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
  104e1c:	c7 04 24 be 77 10 00 	movl   $0x1077be,(%esp)
  104e23:	e8 28 bd ff ff       	call   100b50 <panic>
  104e28:	90                   	nop
  104e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104e30 <sys_mknod>:
  return 0;
}

int
sys_mknod(void)
{
  104e30:	55                   	push   %ebp
  104e31:	89 e5                	mov    %esp,%ebp
  104e33:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  if((len=argstr(0, &path)) < 0 ||
  104e36:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104e39:	89 44 24 04          	mov    %eax,0x4(%esp)
  104e3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104e44:	e8 17 fb ff ff       	call   104960 <argstr>
  104e49:	85 c0                	test   %eax,%eax
  104e4b:	79 0b                	jns    104e58 <sys_mknod+0x28>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0)
    return -1;
  iunlockput(ip);
  return 0;
  104e4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104e52:	c9                   	leave  
  104e53:	c3                   	ret    
  104e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  int len;
  int major, minor;
  
  if((len=argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
  104e58:	8d 45 f0             	lea    -0x10(%ebp),%eax
  104e5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104e5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  104e66:	e8 65 fa ff ff       	call   1048d0 <argint>
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  if((len=argstr(0, &path)) < 0 ||
  104e6b:	85 c0                	test   %eax,%eax
  104e6d:	78 de                	js     104e4d <sys_mknod+0x1d>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
  104e6f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  104e72:	89 44 24 04          	mov    %eax,0x4(%esp)
  104e76:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  104e7d:	e8 4e fa ff ff       	call   1048d0 <argint>
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  if((len=argstr(0, &path)) < 0 ||
  104e82:	85 c0                	test   %eax,%eax
  104e84:	78 c7                	js     104e4d <sys_mknod+0x1d>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0)
  104e86:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
  104e8a:	ba 03 00 00 00       	mov    $0x3,%edx
  104e8f:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
  104e93:	89 04 24             	mov    %eax,(%esp)
  104e96:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104e99:	e8 02 fe ff ff       	call   104ca0 <create>
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  if((len=argstr(0, &path)) < 0 ||
  104e9e:	85 c0                	test   %eax,%eax
  104ea0:	74 ab                	je     104e4d <sys_mknod+0x1d>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0)
    return -1;
  iunlockput(ip);
  104ea2:	89 04 24             	mov    %eax,(%esp)
  104ea5:	e8 96 ce ff ff       	call   101d40 <iunlockput>
  104eaa:	31 c0                	xor    %eax,%eax
  return 0;
}
  104eac:	c9                   	leave  
  104ead:	c3                   	ret    
  104eae:	66 90                	xchg   %ax,%ax

00104eb0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
  104eb0:	55                   	push   %ebp
  104eb1:	89 e5                	mov    %esp,%ebp
  104eb3:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0)
  104eb6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  104eb9:	89 44 24 04          	mov    %eax,0x4(%esp)
  104ebd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104ec4:	e8 97 fa ff ff       	call   104960 <argstr>
  104ec9:	85 c0                	test   %eax,%eax
  104ecb:	79 0b                	jns    104ed8 <sys_mkdir+0x28>
    return -1;
  iunlockput(ip);
  return 0;
  104ecd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104ed2:	c9                   	leave  
  104ed3:	c3                   	ret    
  104ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
sys_mkdir(void)
{
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0)
  104ed8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104edf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104ee2:	31 c9                	xor    %ecx,%ecx
  104ee4:	ba 01 00 00 00       	mov    $0x1,%edx
  104ee9:	e8 b2 fd ff ff       	call   104ca0 <create>
  104eee:	85 c0                	test   %eax,%eax
  104ef0:	74 db                	je     104ecd <sys_mkdir+0x1d>
    return -1;
  iunlockput(ip);
  104ef2:	89 04 24             	mov    %eax,(%esp)
  104ef5:	e8 46 ce ff ff       	call   101d40 <iunlockput>
  104efa:	31 c0                	xor    %eax,%eax
  return 0;
}
  104efc:	c9                   	leave  
  104efd:	c3                   	ret    
  104efe:	66 90                	xchg   %ax,%ax

00104f00 <sys_link>:
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
  104f00:	55                   	push   %ebp
  104f01:	89 e5                	mov    %esp,%ebp
  104f03:	83 ec 48             	sub    $0x48,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
  104f06:	8d 45 e0             	lea    -0x20(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
  104f09:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  104f0c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  104f0f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
  104f12:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f16:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104f1d:	e8 3e fa ff ff       	call   104960 <argstr>
  104f22:	85 c0                	test   %eax,%eax
  104f24:	79 12                	jns    104f38 <sys_link+0x38>
bad:
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  return -1;
  104f26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  104f2b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  104f2e:	8b 75 f8             	mov    -0x8(%ebp),%esi
  104f31:	8b 7d fc             	mov    -0x4(%ebp),%edi
  104f34:	89 ec                	mov    %ebp,%esp
  104f36:	5d                   	pop    %ebp
  104f37:	c3                   	ret    
sys_link(void)
{
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
  104f38:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  104f3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  104f3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  104f46:	e8 15 fa ff ff       	call   104960 <argstr>
  104f4b:	85 c0                	test   %eax,%eax
  104f4d:	78 d7                	js     104f26 <sys_link+0x26>
    return -1;
  if((ip = namei(old)) == 0)
  104f4f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104f52:	89 04 24             	mov    %eax,(%esp)
  104f55:	e8 76 d1 ff ff       	call   1020d0 <namei>
  104f5a:	85 c0                	test   %eax,%eax
  104f5c:	89 c3                	mov    %eax,%ebx
  104f5e:	74 c6                	je     104f26 <sys_link+0x26>
    return -1;
  ilock(ip);
  104f60:	89 04 24             	mov    %eax,(%esp)
  104f63:	e8 c8 ce ff ff       	call   101e30 <ilock>
  if(ip->type == T_DIR){
  104f68:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  104f6d:	0f 84 86 00 00 00    	je     104ff9 <sys_link+0xf9>
    iunlockput(ip);
    return -1;
  }
  ip->nlink++;
  104f73:	66 83 43 16 01       	addw   $0x1,0x16(%ebx)
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
  104f78:	8d 7d d2             	lea    -0x2e(%ebp),%edi
  if(ip->type == T_DIR){
    iunlockput(ip);
    return -1;
  }
  ip->nlink++;
  iupdate(ip);
  104f7b:	89 1c 24             	mov    %ebx,(%esp)
  104f7e:	e8 6d c7 ff ff       	call   1016f0 <iupdate>
  iunlock(ip);
  104f83:	89 1c 24             	mov    %ebx,(%esp)
  104f86:	e8 65 ca ff ff       	call   1019f0 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
  104f8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  104f8e:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104f92:	89 04 24             	mov    %eax,(%esp)
  104f95:	e8 16 d1 ff ff       	call   1020b0 <nameiparent>
  104f9a:	85 c0                	test   %eax,%eax
  104f9c:	89 c6                	mov    %eax,%esi
  104f9e:	74 44                	je     104fe4 <sys_link+0xe4>
    goto bad;
  ilock(dp);
  104fa0:	89 04 24             	mov    %eax,(%esp)
  104fa3:	e8 88 ce ff ff       	call   101e30 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
  104fa8:	8b 06                	mov    (%esi),%eax
  104faa:	3b 03                	cmp    (%ebx),%eax
  104fac:	75 2e                	jne    104fdc <sys_link+0xdc>
  104fae:	8b 43 04             	mov    0x4(%ebx),%eax
  104fb1:	89 7c 24 04          	mov    %edi,0x4(%esp)
  104fb5:	89 34 24             	mov    %esi,(%esp)
  104fb8:	89 44 24 08          	mov    %eax,0x8(%esp)
  104fbc:	e8 8f cc ff ff       	call   101c50 <dirlink>
  104fc1:	85 c0                	test   %eax,%eax
  104fc3:	78 17                	js     104fdc <sys_link+0xdc>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
  104fc5:	89 34 24             	mov    %esi,(%esp)
  104fc8:	e8 73 cd ff ff       	call   101d40 <iunlockput>
  iput(ip);
  104fcd:	89 1c 24             	mov    %ebx,(%esp)
  104fd0:	e8 2b cb ff ff       	call   101b00 <iput>
  104fd5:	31 c0                	xor    %eax,%eax
  return 0;
  104fd7:	e9 4f ff ff ff       	jmp    104f2b <sys_link+0x2b>

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
  104fdc:	89 34 24             	mov    %esi,(%esp)
  104fdf:	e8 5c cd ff ff       	call   101d40 <iunlockput>
  iunlockput(dp);
  iput(ip);
  return 0;

bad:
  ilock(ip);
  104fe4:	89 1c 24             	mov    %ebx,(%esp)
  104fe7:	e8 44 ce ff ff       	call   101e30 <ilock>
  ip->nlink--;
  104fec:	66 83 6b 16 01       	subw   $0x1,0x16(%ebx)
  iupdate(ip);
  104ff1:	89 1c 24             	mov    %ebx,(%esp)
  104ff4:	e8 f7 c6 ff ff       	call   1016f0 <iupdate>
  iunlockput(ip);
  104ff9:	89 1c 24             	mov    %ebx,(%esp)
  104ffc:	e8 3f cd ff ff       	call   101d40 <iunlockput>
  105001:	83 c8 ff             	or     $0xffffffff,%eax
  return -1;
  105004:	e9 22 ff ff ff       	jmp    104f2b <sys_link+0x2b>
  105009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105010 <sys_open>:
  return ip;
}

int
sys_open(void)
{
  105010:	55                   	push   %ebp
  105011:	89 e5                	mov    %esp,%ebp
  105013:	83 ec 38             	sub    $0x38,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
  105016:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
  105019:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  10501c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
  10501f:	89 44 24 04          	mov    %eax,0x4(%esp)
  105023:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10502a:	e8 31 f9 ff ff       	call   104960 <argstr>
  10502f:	85 c0                	test   %eax,%eax
  105031:	79 15                	jns    105048 <sys_open+0x38>

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    return -1;
  105033:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
  105038:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  10503b:	8b 75 fc             	mov    -0x4(%ebp),%esi
  10503e:	89 ec                	mov    %ebp,%esp
  105040:	5d                   	pop    %ebp
  105041:	c3                   	ret    
  105042:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
  105048:	8d 45 f0             	lea    -0x10(%ebp),%eax
  10504b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10504f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105056:	e8 75 f8 ff ff       	call   1048d0 <argint>
  10505b:	85 c0                	test   %eax,%eax
  10505d:	78 d4                	js     105033 <sys_open+0x23>
    return -1;
  if(omode & O_CREATE){
  10505f:	f6 45 f1 02          	testb  $0x2,-0xf(%ebp)
  105063:	74 63                	je     1050c8 <sys_open+0xb8>
    if((ip = create(path, T_FILE, 0, 0)) == 0)
  105065:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105068:	31 c9                	xor    %ecx,%ecx
  10506a:	ba 02 00 00 00       	mov    $0x2,%edx
  10506f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105076:	e8 25 fc ff ff       	call   104ca0 <create>
  10507b:	85 c0                	test   %eax,%eax
  10507d:	89 c3                	mov    %eax,%ebx
  10507f:	74 b2                	je     105033 <sys_open+0x23>
      iunlockput(ip);
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
  105081:	e8 fa c0 ff ff       	call   101180 <filealloc>
  105086:	85 c0                	test   %eax,%eax
  105088:	89 c6                	mov    %eax,%esi
  10508a:	74 24                	je     1050b0 <sys_open+0xa0>
  10508c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  105093:	31 c0                	xor    %eax,%eax
  105095:	8d 76 00             	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
  105098:	8b 4c 82 08          	mov    0x8(%edx,%eax,4),%ecx
  10509c:	85 c9                	test   %ecx,%ecx
  10509e:	74 58                	je     1050f8 <sys_open+0xe8>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
  1050a0:	83 c0 01             	add    $0x1,%eax
  1050a3:	83 f8 10             	cmp    $0x10,%eax
  1050a6:	75 f0                	jne    105098 <sys_open+0x88>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
  1050a8:	89 34 24             	mov    %esi,(%esp)
  1050ab:	e8 50 c1 ff ff       	call   101200 <fileclose>
    iunlockput(ip);
  1050b0:	89 1c 24             	mov    %ebx,(%esp)
  1050b3:	e8 88 cc ff ff       	call   101d40 <iunlockput>
  1050b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
  1050bd:	e9 76 ff ff ff       	jmp    105038 <sys_open+0x28>
  1050c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(omode & O_CREATE){
    if((ip = create(path, T_FILE, 0, 0)) == 0)
      return -1;
  } else {
    if((ip = namei(path)) == 0)
  1050c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1050cb:	89 04 24             	mov    %eax,(%esp)
  1050ce:	e8 fd cf ff ff       	call   1020d0 <namei>
  1050d3:	85 c0                	test   %eax,%eax
  1050d5:	89 c3                	mov    %eax,%ebx
  1050d7:	0f 84 56 ff ff ff    	je     105033 <sys_open+0x23>
      return -1;
    ilock(ip);
  1050dd:	89 04 24             	mov    %eax,(%esp)
  1050e0:	e8 4b cd ff ff       	call   101e30 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
  1050e5:	66 83 7b 10 01       	cmpw   $0x1,0x10(%ebx)
  1050ea:	75 95                	jne    105081 <sys_open+0x71>
  1050ec:	8b 75 f0             	mov    -0x10(%ebp),%esi
  1050ef:	85 f6                	test   %esi,%esi
  1050f1:	74 8e                	je     105081 <sys_open+0x71>
  1050f3:	eb bb                	jmp    1050b0 <sys_open+0xa0>
  1050f5:	8d 76 00             	lea    0x0(%esi),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
  1050f8:	89 74 82 08          	mov    %esi,0x8(%edx,%eax,4)
    if(f)
      fileclose(f);
    iunlockput(ip);
    return -1;
  }
  iunlock(ip);
  1050fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1050ff:	89 1c 24             	mov    %ebx,(%esp)
  105102:	e8 e9 c8 ff ff       	call   1019f0 <iunlock>

  f->type = FD_INODE;
  105107:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  10510d:	89 5e 10             	mov    %ebx,0x10(%esi)
  f->off = 0;
  105110:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
  105117:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10511a:	83 f2 01             	xor    $0x1,%edx
  10511d:	83 e2 01             	and    $0x1,%edx
  105120:	88 56 08             	mov    %dl,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  105123:	f6 45 f0 03          	testb  $0x3,-0x10(%ebp)
  105127:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
  10512b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10512e:	e9 05 ff ff ff       	jmp    105038 <sys_open+0x28>
  105133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105140 <sys_unlink>:
  return 1;
}

int
sys_unlink(void)
{
  105140:	55                   	push   %ebp
  105141:	89 e5                	mov    %esp,%ebp
  105143:	83 ec 78             	sub    $0x78,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
  105146:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  return 1;
}

int
sys_unlink(void)
{
  105149:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  10514c:	89 75 f8             	mov    %esi,-0x8(%ebp)
  10514f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
  105152:	89 44 24 04          	mov    %eax,0x4(%esp)
  105156:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10515d:	e8 fe f7 ff ff       	call   104960 <argstr>
  105162:	85 c0                	test   %eax,%eax
  105164:	79 12                	jns    105178 <sys_unlink+0x38>
  iunlockput(dp);

  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  return 0;
  105166:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  10516b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  10516e:	8b 75 f8             	mov    -0x8(%ebp),%esi
  105171:	8b 7d fc             	mov    -0x4(%ebp),%edi
  105174:	89 ec                	mov    %ebp,%esp
  105176:	5d                   	pop    %ebp
  105177:	c3                   	ret    
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
  if((dp = nameiparent(path, name)) == 0)
  105178:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10517b:	8d 5d d2             	lea    -0x2e(%ebp),%ebx
  10517e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  105182:	89 04 24             	mov    %eax,(%esp)
  105185:	e8 26 cf ff ff       	call   1020b0 <nameiparent>
  10518a:	85 c0                	test   %eax,%eax
  10518c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  10518f:	74 d5                	je     105166 <sys_unlink+0x26>
    return -1;
  ilock(dp);
  105191:	89 04 24             	mov    %eax,(%esp)
  105194:	e8 97 cc ff ff       	call   101e30 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0){
  105199:	c7 44 24 04 b0 77 10 	movl   $0x1077b0,0x4(%esp)
  1051a0:	00 
  1051a1:	89 1c 24             	mov    %ebx,(%esp)
  1051a4:	e8 17 c7 ff ff       	call   1018c0 <namecmp>
  1051a9:	85 c0                	test   %eax,%eax
  1051ab:	0f 84 a4 00 00 00    	je     105255 <sys_unlink+0x115>
  1051b1:	c7 44 24 04 af 77 10 	movl   $0x1077af,0x4(%esp)
  1051b8:	00 
  1051b9:	89 1c 24             	mov    %ebx,(%esp)
  1051bc:	e8 ff c6 ff ff       	call   1018c0 <namecmp>
  1051c1:	85 c0                	test   %eax,%eax
  1051c3:	0f 84 8c 00 00 00    	je     105255 <sys_unlink+0x115>
    iunlockput(dp);
    return -1;
  }

  if((ip = dirlookup(dp, name, &off)) == 0){
  1051c9:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1051cc:	89 44 24 08          	mov    %eax,0x8(%esp)
  1051d0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1051d3:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1051d7:	89 04 24             	mov    %eax,(%esp)
  1051da:	e8 11 c7 ff ff       	call   1018f0 <dirlookup>
  1051df:	85 c0                	test   %eax,%eax
  1051e1:	89 c6                	mov    %eax,%esi
  1051e3:	74 70                	je     105255 <sys_unlink+0x115>
    iunlockput(dp);
    return -1;
  }
  ilock(ip);
  1051e5:	89 04 24             	mov    %eax,(%esp)
  1051e8:	e8 43 cc ff ff       	call   101e30 <ilock>

  if(ip->nlink < 1)
  1051ed:	66 83 7e 16 00       	cmpw   $0x0,0x16(%esi)
  1051f2:	0f 8e 0e 01 00 00    	jle    105306 <sys_unlink+0x1c6>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
  1051f8:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  1051fd:	75 71                	jne    105270 <sys_unlink+0x130>
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
  1051ff:	83 7e 18 20          	cmpl   $0x20,0x18(%esi)
  105203:	76 6b                	jbe    105270 <sys_unlink+0x130>
  105205:	8d 7d b2             	lea    -0x4e(%ebp),%edi
  105208:	bb 20 00 00 00       	mov    $0x20,%ebx
  10520d:	8d 76 00             	lea    0x0(%esi),%esi
  105210:	eb 0e                	jmp    105220 <sys_unlink+0xe0>
  105212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105218:	83 c3 10             	add    $0x10,%ebx
  10521b:	3b 5e 18             	cmp    0x18(%esi),%ebx
  10521e:	73 50                	jae    105270 <sys_unlink+0x130>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  105220:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  105227:	00 
  105228:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  10522c:	89 7c 24 04          	mov    %edi,0x4(%esp)
  105230:	89 34 24             	mov    %esi,(%esp)
  105233:	e8 b8 c3 ff ff       	call   1015f0 <readi>
  105238:	83 f8 10             	cmp    $0x10,%eax
  10523b:	0f 85 ad 00 00 00    	jne    1052ee <sys_unlink+0x1ae>
      panic("isdirempty: readi");
    if(de.inum != 0)
  105241:	66 83 7d b2 00       	cmpw   $0x0,-0x4e(%ebp)
  105246:	74 d0                	je     105218 <sys_unlink+0xd8>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
  105248:	89 34 24             	mov    %esi,(%esp)
  10524b:	90                   	nop
  10524c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105250:	e8 eb ca ff ff       	call   101d40 <iunlockput>
    iunlockput(dp);
  105255:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  105258:	89 04 24             	mov    %eax,(%esp)
  10525b:	e8 e0 ca ff ff       	call   101d40 <iunlockput>
  105260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    return -1;
  105265:	e9 01 ff ff ff       	jmp    10516b <sys_unlink+0x2b>
  10526a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  memset(&de, 0, sizeof(de));
  105270:	8d 5d c2             	lea    -0x3e(%ebp),%ebx
  105273:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
  10527a:	00 
  10527b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  105282:	00 
  105283:	89 1c 24             	mov    %ebx,(%esp)
  105286:	e8 a5 f3 ff ff       	call   104630 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
  10528b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10528e:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  105295:	00 
  105296:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  10529a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10529e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1052a1:	89 04 24             	mov    %eax,(%esp)
  1052a4:	e8 d7 c4 ff ff       	call   101780 <writei>
  1052a9:	83 f8 10             	cmp    $0x10,%eax
  1052ac:	75 4c                	jne    1052fa <sys_unlink+0x1ba>
    panic("unlink: writei");
  if(ip->type == T_DIR){
  1052ae:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  1052b3:	74 27                	je     1052dc <sys_unlink+0x19c>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
  1052b5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1052b8:	89 04 24             	mov    %eax,(%esp)
  1052bb:	e8 80 ca ff ff       	call   101d40 <iunlockput>

  ip->nlink--;
  1052c0:	66 83 6e 16 01       	subw   $0x1,0x16(%esi)
  iupdate(ip);
  1052c5:	89 34 24             	mov    %esi,(%esp)
  1052c8:	e8 23 c4 ff ff       	call   1016f0 <iupdate>
  iunlockput(ip);
  1052cd:	89 34 24             	mov    %esi,(%esp)
  1052d0:	e8 6b ca ff ff       	call   101d40 <iunlockput>
  1052d5:	31 c0                	xor    %eax,%eax
  return 0;
  1052d7:	e9 8f fe ff ff       	jmp    10516b <sys_unlink+0x2b>

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
  1052dc:	8b 45 a4             	mov    -0x5c(%ebp),%eax
  1052df:	66 83 68 16 01       	subw   $0x1,0x16(%eax)
    iupdate(dp);
  1052e4:	89 04 24             	mov    %eax,(%esp)
  1052e7:	e8 04 c4 ff ff       	call   1016f0 <iupdate>
  1052ec:	eb c7                	jmp    1052b5 <sys_unlink+0x175>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
  1052ee:	c7 04 24 e0 77 10 00 	movl   $0x1077e0,(%esp)
  1052f5:	e8 56 b8 ff ff       	call   100b50 <panic>
    return -1;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  1052fa:	c7 04 24 f2 77 10 00 	movl   $0x1077f2,(%esp)
  105301:	e8 4a b8 ff ff       	call   100b50 <panic>
    return -1;
  }
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  105306:	c7 04 24 ce 77 10 00 	movl   $0x1077ce,(%esp)
  10530d:	e8 3e b8 ff ff       	call   100b50 <panic>
  105312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105320 <T.67>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
  105320:	55                   	push   %ebp
  105321:	89 e5                	mov    %esp,%ebp
  105323:	83 ec 28             	sub    $0x28,%esp
  105326:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  105329:	89 c3                	mov    %eax,%ebx
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
  10532b:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
  10532e:	89 75 fc             	mov    %esi,-0x4(%ebp)
  105331:	89 d6                	mov    %edx,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
  105333:	89 44 24 04          	mov    %eax,0x4(%esp)
  105337:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10533e:	e8 8d f5 ff ff       	call   1048d0 <argint>
  105343:	85 c0                	test   %eax,%eax
  105345:	79 11                	jns    105358 <T.67+0x38>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  105347:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return 0;
}
  10534c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  10534f:	8b 75 fc             	mov    -0x4(%ebp),%esi
  105352:	89 ec                	mov    %ebp,%esp
  105354:	5d                   	pop    %ebp
  105355:	c3                   	ret    
  105356:	66 90                	xchg   %ax,%ax
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
  105358:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10535b:	83 f8 0f             	cmp    $0xf,%eax
  10535e:	77 e7                	ja     105347 <T.67+0x27>
  105360:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  105367:	8b 54 82 08          	mov    0x8(%edx,%eax,4),%edx
  10536b:	85 d2                	test   %edx,%edx
  10536d:	74 d8                	je     105347 <T.67+0x27>
    return -1;
  if(pfd)
  10536f:	85 db                	test   %ebx,%ebx
  105371:	74 02                	je     105375 <T.67+0x55>
    *pfd = fd;
  105373:	89 03                	mov    %eax,(%ebx)
  if(pf)
  105375:	31 c0                	xor    %eax,%eax
  105377:	85 f6                	test   %esi,%esi
  105379:	74 d1                	je     10534c <T.67+0x2c>
    *pf = f;
  10537b:	89 16                	mov    %edx,(%esi)
  10537d:	eb cd                	jmp    10534c <T.67+0x2c>
  10537f:	90                   	nop

00105380 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
  105380:	55                   	push   %ebp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
  105381:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
  105383:	89 e5                	mov    %esp,%ebp
  105385:	53                   	push   %ebx
  105386:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
  105389:	8d 55 f4             	lea    -0xc(%ebp),%edx
  10538c:	e8 8f ff ff ff       	call   105320 <T.67>
  105391:	85 c0                	test   %eax,%eax
  105393:	79 13                	jns    1053a8 <sys_dup+0x28>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
  105395:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
  10539a:	89 d8                	mov    %ebx,%eax
  10539c:	83 c4 24             	add    $0x24,%esp
  10539f:	5b                   	pop    %ebx
  1053a0:	5d                   	pop    %ebp
  1053a1:	c3                   	ret    
  1053a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
  1053a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1053ab:	31 db                	xor    %ebx,%ebx
  1053ad:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  1053b3:	eb 0b                	jmp    1053c0 <sys_dup+0x40>
  1053b5:	8d 76 00             	lea    0x0(%esi),%esi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
  1053b8:	83 c3 01             	add    $0x1,%ebx
  1053bb:	83 fb 10             	cmp    $0x10,%ebx
  1053be:	74 d5                	je     105395 <sys_dup+0x15>
    if(proc->ofile[fd] == 0){
  1053c0:	8b 4c 98 08          	mov    0x8(%eax,%ebx,4),%ecx
  1053c4:	85 c9                	test   %ecx,%ecx
  1053c6:	75 f0                	jne    1053b8 <sys_dup+0x38>
      proc->ofile[fd] = f;
  1053c8:	89 54 98 08          	mov    %edx,0x8(%eax,%ebx,4)
  
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  1053cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1053cf:	89 04 24             	mov    %eax,(%esp)
  1053d2:	e8 59 bd ff ff       	call   101130 <filedup>
  return fd;
  1053d7:	eb c1                	jmp    10539a <sys_dup+0x1a>
  1053d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001053e0 <sys_read>:
}

int
sys_read(void)
{
  1053e0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  1053e1:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
  1053e3:	89 e5                	mov    %esp,%ebp
  1053e5:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  1053e8:	8d 55 f4             	lea    -0xc(%ebp),%edx
  1053eb:	e8 30 ff ff ff       	call   105320 <T.67>
  1053f0:	85 c0                	test   %eax,%eax
  1053f2:	79 0c                	jns    105400 <sys_read+0x20>
    return -1;
  return fileread(f, p, n);
  1053f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1053f9:	c9                   	leave  
  1053fa:	c3                   	ret    
  1053fb:	90                   	nop
  1053fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  105400:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105403:	89 44 24 04          	mov    %eax,0x4(%esp)
  105407:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10540e:	e8 bd f4 ff ff       	call   1048d0 <argint>
  105413:	85 c0                	test   %eax,%eax
  105415:	78 dd                	js     1053f4 <sys_read+0x14>
  105417:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10541a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105421:	89 44 24 08          	mov    %eax,0x8(%esp)
  105425:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105428:	89 44 24 04          	mov    %eax,0x4(%esp)
  10542c:	e8 df f4 ff ff       	call   104910 <argptr>
  105431:	85 c0                	test   %eax,%eax
  105433:	78 bf                	js     1053f4 <sys_read+0x14>
    return -1;
  return fileread(f, p, n);
  105435:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105438:	89 44 24 08          	mov    %eax,0x8(%esp)
  10543c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10543f:	89 44 24 04          	mov    %eax,0x4(%esp)
  105443:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105446:	89 04 24             	mov    %eax,(%esp)
  105449:	e8 e2 bb ff ff       	call   101030 <fileread>
}
  10544e:	c9                   	leave  
  10544f:	c3                   	ret    

00105450 <sys_write>:

int
sys_write(void)
{
  105450:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  105451:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
  105453:	89 e5                	mov    %esp,%ebp
  105455:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  105458:	8d 55 f4             	lea    -0xc(%ebp),%edx
  10545b:	e8 c0 fe ff ff       	call   105320 <T.67>
  105460:	85 c0                	test   %eax,%eax
  105462:	79 0c                	jns    105470 <sys_write+0x20>
    return -1;
  return filewrite(f, p, n);
  105464:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  105469:	c9                   	leave  
  10546a:	c3                   	ret    
  10546b:	90                   	nop
  10546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
  105470:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105473:	89 44 24 04          	mov    %eax,0x4(%esp)
  105477:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10547e:	e8 4d f4 ff ff       	call   1048d0 <argint>
  105483:	85 c0                	test   %eax,%eax
  105485:	78 dd                	js     105464 <sys_write+0x14>
  105487:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10548a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105491:	89 44 24 08          	mov    %eax,0x8(%esp)
  105495:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105498:	89 44 24 04          	mov    %eax,0x4(%esp)
  10549c:	e8 6f f4 ff ff       	call   104910 <argptr>
  1054a1:	85 c0                	test   %eax,%eax
  1054a3:	78 bf                	js     105464 <sys_write+0x14>
    return -1;
  return filewrite(f, p, n);
  1054a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1054a8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1054ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1054af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1054b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1054b6:	89 04 24             	mov    %eax,(%esp)
  1054b9:	e8 c2 ba ff ff       	call   100f80 <filewrite>
}
  1054be:	c9                   	leave  
  1054bf:	c3                   	ret    

001054c0 <sys_fstat>:
  return 0;
}

int
sys_fstat(void)
{
  1054c0:	55                   	push   %ebp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
  1054c1:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
  1054c3:	89 e5                	mov    %esp,%ebp
  1054c5:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
  1054c8:	8d 55 f4             	lea    -0xc(%ebp),%edx
  1054cb:	e8 50 fe ff ff       	call   105320 <T.67>
  1054d0:	85 c0                	test   %eax,%eax
  1054d2:	79 0c                	jns    1054e0 <sys_fstat+0x20>
    return -1;
  return filestat(f, st);
  1054d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1054d9:	c9                   	leave  
  1054da:	c3                   	ret    
  1054db:	90                   	nop
  1054dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
sys_fstat(void)
{
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
  1054e0:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1054e3:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
  1054ea:	00 
  1054eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1054ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1054f6:	e8 15 f4 ff ff       	call   104910 <argptr>
  1054fb:	85 c0                	test   %eax,%eax
  1054fd:	78 d5                	js     1054d4 <sys_fstat+0x14>
    return -1;
  return filestat(f, st);
  1054ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105502:	89 44 24 04          	mov    %eax,0x4(%esp)
  105506:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105509:	89 04 24             	mov    %eax,(%esp)
  10550c:	e8 cf bb ff ff       	call   1010e0 <filestat>
}
  105511:	c9                   	leave  
  105512:	c3                   	ret    
  105513:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105520 <sys_close>:
  return filewrite(f, p, n);
}

int
sys_close(void)
{
  105520:	55                   	push   %ebp
  105521:	89 e5                	mov    %esp,%ebp
  105523:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;
  
  if(argfd(0, &fd, &f) < 0)
  105526:	8d 55 f0             	lea    -0x10(%ebp),%edx
  105529:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10552c:	e8 ef fd ff ff       	call   105320 <T.67>
  105531:	89 c2                	mov    %eax,%edx
  105533:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105538:	85 d2                	test   %edx,%edx
  10553a:	78 1e                	js     10555a <sys_close+0x3a>
    return -1;
  proc->ofile[fd] = 0;
  10553c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105542:	8b 55 f4             	mov    -0xc(%ebp),%edx
  105545:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
  10554c:	00 
  fileclose(f);
  10554d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105550:	89 04 24             	mov    %eax,(%esp)
  105553:	e8 a8 bc ff ff       	call   101200 <fileclose>
  105558:	31 c0                	xor    %eax,%eax
  return 0;
}
  10555a:	c9                   	leave  
  10555b:	c3                   	ret    
  10555c:	90                   	nop
  10555d:	90                   	nop
  10555e:	90                   	nop
  10555f:	90                   	nop

00105560 <sys_getpid>:
}

int
sys_getpid(void)
{
  return proc->pid;
  105560:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
  105566:	55                   	push   %ebp
  105567:	89 e5                	mov    %esp,%ebp
  return proc->pid;
}
  105569:	5d                   	pop    %ebp
}

int
sys_getpid(void)
{
  return proc->pid;
  10556a:	8b 40 58             	mov    0x58(%eax),%eax
}
  10556d:	c3                   	ret    
  10556e:	66 90                	xchg   %ax,%ax

00105570 <sys_thread_getid>:

int
sys_thread_getid(void)
{
    return proc->tid;
  105570:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return proc->pid;
}

int
sys_thread_getid(void)
{
  105576:	55                   	push   %ebp
  105577:	89 e5                	mov    %esp,%ebp
    return proc->tid;
}
  105579:	5d                   	pop    %ebp
}

int
sys_thread_getid(void)
{
    return proc->tid;
  10557a:	8b 40 7c             	mov    0x7c(%eax),%eax
}
  10557d:	c3                   	ret    
  10557e:	66 90                	xchg   %ax,%ax

00105580 <sys_thread_getProcId>:

int
sys_thread_getProcId(void)
{
    return proc->pid;
  105580:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
    return proc->tid;
}

int
sys_thread_getProcId(void)
{
  105586:	55                   	push   %ebp
  105587:	89 e5                	mov    %esp,%ebp
    return proc->pid;
}
  105589:	5d                   	pop    %ebp
}

int
sys_thread_getProcId(void)
{
    return proc->pid;
  10558a:	8b 40 58             	mov    0x58(%eax),%eax
}
  10558d:	c3                   	ret    
  10558e:	66 90                	xchg   %ax,%ax

00105590 <sys_exit_all_threads>:
    return binary_sem_clear(sem_id);
}

int
sys_exit_all_threads(void)
{
  105590:	55                   	push   %ebp
  105591:	89 e5                	mov    %esp,%ebp
  105593:	83 ec 08             	sub    $0x8,%esp
  exit_all_threads();
  105596:	e8 25 e3 ff ff       	call   1038c0 <exit_all_threads>
  return 0;  // not reached
}
  10559b:	31 c0                	xor    %eax,%eax
  10559d:	c9                   	leave  
  10559e:	c3                   	ret    
  10559f:	90                   	nop

001055a0 <sys_binary_sem_clear>:
        return -1;
    return binary_sem_up(sem_id);
}

int sys_binary_sem_clear(void)
{
  1055a0:	55                   	push   %ebp
  1055a1:	89 e5                	mov    %esp,%ebp
  1055a3:	83 ec 28             	sub    $0x28,%esp
    int sem_id;
    if(argint(0, &sem_id) < 0)
  1055a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1055a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1055ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1055b4:	e8 17 f3 ff ff       	call   1048d0 <argint>
  1055b9:	89 c2                	mov    %eax,%edx
  1055bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1055c0:	85 d2                	test   %edx,%edx
  1055c2:	78 0b                	js     1055cf <sys_binary_sem_clear+0x2f>
        return -1;
    return binary_sem_clear(sem_id);
  1055c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1055c7:	89 04 24             	mov    %eax,(%esp)
  1055ca:	e8 31 aa ff ff       	call   100000 <binary_sem_clear>
}
  1055cf:	c9                   	leave  
  1055d0:	c3                   	ret    
  1055d1:	eb 0d                	jmp    1055e0 <sys_binary_sem_up>
  1055d3:	90                   	nop
  1055d4:	90                   	nop
  1055d5:	90                   	nop
  1055d6:	90                   	nop
  1055d7:	90                   	nop
  1055d8:	90                   	nop
  1055d9:	90                   	nop
  1055da:	90                   	nop
  1055db:	90                   	nop
  1055dc:	90                   	nop
  1055dd:	90                   	nop
  1055de:	90                   	nop
  1055df:	90                   	nop

001055e0 <sys_binary_sem_up>:
        return -1;
    return binary_sem_down(sem_id);
}

int sys_binary_sem_up(void)
{
  1055e0:	55                   	push   %ebp
  1055e1:	89 e5                	mov    %esp,%ebp
  1055e3:	83 ec 28             	sub    $0x28,%esp
    int sem_id;
    if(argint(0, &sem_id) < 0)
  1055e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1055e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1055ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1055f4:	e8 d7 f2 ff ff       	call   1048d0 <argint>
  1055f9:	89 c2                	mov    %eax,%edx
  1055fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105600:	85 d2                	test   %edx,%edx
  105602:	78 0b                	js     10560f <sys_binary_sem_up+0x2f>
        return -1;
    return binary_sem_up(sem_id);
  105604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105607:	89 04 24             	mov    %eax,(%esp)
  10560a:	e8 01 ab ff ff       	call   100110 <binary_sem_up>
}
  10560f:	c9                   	leave  
  105610:	c3                   	ret    
  105611:	eb 0d                	jmp    105620 <sys_binary_sem_down>
  105613:	90                   	nop
  105614:	90                   	nop
  105615:	90                   	nop
  105616:	90                   	nop
  105617:	90                   	nop
  105618:	90                   	nop
  105619:	90                   	nop
  10561a:	90                   	nop
  10561b:	90                   	nop
  10561c:	90                   	nop
  10561d:	90                   	nop
  10561e:	90                   	nop
  10561f:	90                   	nop

00105620 <sys_binary_sem_down>:
{
return binary_sem_create();
}

int sys_binary_sem_down(void)
{
  105620:	55                   	push   %ebp
  105621:	89 e5                	mov    %esp,%ebp
  105623:	83 ec 28             	sub    $0x28,%esp
    int sem_id;
    if(argint(0, &sem_id) < 0)
  105626:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105629:	89 44 24 04          	mov    %eax,0x4(%esp)
  10562d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105634:	e8 97 f2 ff ff       	call   1048d0 <argint>
  105639:	89 c2                	mov    %eax,%edx
  10563b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  105640:	85 d2                	test   %edx,%edx
  105642:	78 0b                	js     10564f <sys_binary_sem_down+0x2f>
        return -1;
    return binary_sem_down(sem_id);
  105644:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105647:	89 04 24             	mov    %eax,(%esp)
  10564a:	e8 81 ab ff ff       	call   1001d0 <binary_sem_down>
}
  10564f:	c9                   	leave  
  105650:	c3                   	ret    
  105651:	eb 0d                	jmp    105660 <sys_binary_sem_create>
  105653:	90                   	nop
  105654:	90                   	nop
  105655:	90                   	nop
  105656:	90                   	nop
  105657:	90                   	nop
  105658:	90                   	nop
  105659:	90                   	nop
  10565a:	90                   	nop
  10565b:	90                   	nop
  10565c:	90                   	nop
  10565d:	90                   	nop
  10565e:	90                   	nop
  10565f:	90                   	nop

00105660 <sys_binary_sem_create>:
  release(&tickslock);
  return xticks;
}

int sys_binary_sem_create(void)
{
  105660:	55                   	push   %ebp
  105661:	89 e5                	mov    %esp,%ebp
  105663:	83 ec 08             	sub    $0x8,%esp
return binary_sem_create();
}
  105666:	c9                   	leave  
  return xticks;
}

int sys_binary_sem_create(void)
{
return binary_sem_create();
  105667:	e9 f4 a9 ff ff       	jmp    100060 <binary_sem_create>
  10566c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105670 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since boot.
int
sys_uptime(void)
{
  105670:	55                   	push   %ebp
  105671:	89 e5                	mov    %esp,%ebp
  105673:	53                   	push   %ebx
  105674:	83 ec 14             	sub    $0x14,%esp
  uint xticks;
  
  acquire(&tickslock);
  105677:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  10567e:	e8 0d ef ff ff       	call   104590 <acquire>
  xticks = ticks;
  105683:	8b 1d 60 ac 11 00    	mov    0x11ac60,%ebx
  release(&tickslock);
  105689:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  105690:	e8 ab ee ff ff       	call   104540 <release>
  return xticks;
}
  105695:	83 c4 14             	add    $0x14,%esp
  105698:	89 d8                	mov    %ebx,%eax
  10569a:	5b                   	pop    %ebx
  10569b:	5d                   	pop    %ebp
  10569c:	c3                   	ret    
  10569d:	8d 76 00             	lea    0x0(%esi),%esi

001056a0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
  1056a0:	55                   	push   %ebp
  1056a1:	89 e5                	mov    %esp,%ebp
  1056a3:	53                   	push   %ebx
  1056a4:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
  1056a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1056aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  1056ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1056b5:	e8 16 f2 ff ff       	call   1048d0 <argint>
  1056ba:	89 c2                	mov    %eax,%edx
  1056bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1056c1:	85 d2                	test   %edx,%edx
  1056c3:	78 59                	js     10571e <sys_sleep+0x7e>
    return -1;
  acquire(&tickslock);
  1056c5:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  1056cc:	e8 bf ee ff ff       	call   104590 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
  1056d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  1056d4:	8b 1d 60 ac 11 00    	mov    0x11ac60,%ebx
  while(ticks - ticks0 < n){
  1056da:	85 d2                	test   %edx,%edx
  1056dc:	75 22                	jne    105700 <sys_sleep+0x60>
  1056de:	eb 48                	jmp    105728 <sys_sleep+0x88>
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  1056e0:	c7 44 24 04 20 a4 11 	movl   $0x11a420,0x4(%esp)
  1056e7:	00 
  1056e8:	c7 04 24 60 ac 11 00 	movl   $0x11ac60,(%esp)
  1056ef:	e8 2c dd ff ff       	call   103420 <sleep>
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
  1056f4:	a1 60 ac 11 00       	mov    0x11ac60,%eax
  1056f9:	29 d8                	sub    %ebx,%eax
  1056fb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1056fe:	73 28                	jae    105728 <sys_sleep+0x88>
    if(proc->killed){
  105700:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105706:	8b 40 4c             	mov    0x4c(%eax),%eax
  105709:	85 c0                	test   %eax,%eax
  10570b:	74 d3                	je     1056e0 <sys_sleep+0x40>
      release(&tickslock);
  10570d:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  105714:	e8 27 ee ff ff       	call   104540 <release>
  105719:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
  10571e:	83 c4 24             	add    $0x24,%esp
  105721:	5b                   	pop    %ebx
  105722:	5d                   	pop    %ebp
  105723:	c3                   	ret    
  105724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  105728:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  10572f:	e8 0c ee ff ff       	call   104540 <release>
  return 0;
}
  105734:	83 c4 24             	add    $0x24,%esp
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  105737:	31 c0                	xor    %eax,%eax
  return 0;
}
  105739:	5b                   	pop    %ebx
  10573a:	5d                   	pop    %ebp
  10573b:	c3                   	ret    
  10573c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105740 <sys_sbrk>:
thread_exit((void*)ret_val);
}

int
sys_sbrk(void)
{
  105740:	55                   	push   %ebp
  105741:	89 e5                	mov    %esp,%ebp
  105743:	53                   	push   %ebx
  105744:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
  105747:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10574a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10574e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105755:	e8 76 f1 ff ff       	call   1048d0 <argint>
  10575a:	85 c0                	test   %eax,%eax
  10575c:	79 12                	jns    105770 <sys_sbrk+0x30>
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
  10575e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  105763:	83 c4 24             	add    $0x24,%esp
  105766:	5b                   	pop    %ebx
  105767:	5d                   	pop    %ebp
  105768:	c3                   	ret    
  105769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  105770:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105776:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
  105778:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10577b:	89 04 24             	mov    %eax,(%esp)
  10577e:	e8 0d ea ff ff       	call   104190 <growproc>
  105783:	89 c2                	mov    %eax,%edx
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  105785:	89 d8                	mov    %ebx,%eax
  if(growproc(n) < 0)
  105787:	85 d2                	test   %edx,%edx
  105789:	79 d8                	jns    105763 <sys_sbrk+0x23>
  10578b:	eb d1                	jmp    10575e <sys_sbrk+0x1e>
  10578d:	8d 76 00             	lea    0x0(%esi),%esi

00105790 <sys_thread_exit>:
    return thread_join(tid,(void*)ret_val);
}

void
sys_thread_exit(void)
{
  105790:	55                   	push   %ebp
  105791:	89 e5                	mov    %esp,%ebp
  105793:	83 ec 28             	sub    $0x28,%esp
int ret_val;
argint(0,&ret_val);
  105796:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105799:	89 44 24 04          	mov    %eax,0x4(%esp)
  10579d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1057a4:	e8 27 f1 ff ff       	call   1048d0 <argint>
thread_exit((void*)ret_val);
  1057a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1057ac:	89 04 24             	mov    %eax,(%esp)
  1057af:	e8 9c e5 ff ff       	call   103d50 <thread_exit>
}
  1057b4:	c9                   	leave  
  1057b5:	c3                   	ret    
  1057b6:	8d 76 00             	lea    0x0(%esi),%esi
  1057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001057c0 <sys_thread_join>:
    return thread_create(start_func, stack, stack_size);
}

int
sys_thread_join(void)
{
  1057c0:	55                   	push   %ebp
  1057c1:	89 e5                	mov    %esp,%ebp
  1057c3:	83 ec 28             	sub    $0x28,%esp
    char* ret_val;
    int tid;
    if(argint(0, &tid) < 0)
  1057c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1057c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1057cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1057d4:	e8 f7 f0 ff ff       	call   1048d0 <argint>
  1057d9:	85 c0                	test   %eax,%eax
  1057db:	79 0b                	jns    1057e8 <sys_thread_join+0x28>
        return -1;
    if(argptr(1,&ret_val, 4) < 0)
        return -1;
    return thread_join(tid,(void*)ret_val);
  1057dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  1057e2:	c9                   	leave  
  1057e3:	c3                   	ret    
  1057e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
    char* ret_val;
    int tid;
    if(argint(0, &tid) < 0)
        return -1;
    if(argptr(1,&ret_val, 4) < 0)
  1057e8:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1057eb:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  1057f2:	00 
  1057f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1057f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1057fe:	e8 0d f1 ff ff       	call   104910 <argptr>
  105803:	85 c0                	test   %eax,%eax
  105805:	78 d6                	js     1057dd <sys_thread_join+0x1d>
        return -1;
    return thread_join(tid,(void*)ret_val);
  105807:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10580a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10580e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105811:	89 04 24             	mov    %eax,(%esp)
  105814:	e8 b7 dd ff ff       	call   1035d0 <thread_join>
}
  105819:	c9                   	leave  
  10581a:	c3                   	ret    
  10581b:	90                   	nop
  10581c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105820 <sys_thread_create>:
    return proc->pid;
}

int
sys_thread_create(void)
{   
  105820:	55                   	push   %ebp
  105821:	89 e5                	mov    %esp,%ebp
  105823:	83 ec 28             	sub    $0x28,%esp
    void* (*start_func)();
    void* stack;
    int stack_size;
    if(argptr(0, (void*)&start_func, 4) < 0)
  105826:	8d 45 f4             	lea    -0xc(%ebp),%eax
  105829:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  105830:	00 
  105831:	89 44 24 04          	mov    %eax,0x4(%esp)
  105835:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10583c:	e8 cf f0 ff ff       	call   104910 <argptr>
  105841:	85 c0                	test   %eax,%eax
  105843:	79 0b                	jns    105850 <sys_thread_create+0x30>
        return -1;
    if(argptr(1, (void*)&stack, 4) < 0)
        return -1;
    if(argint(2, &stack_size) < 0)
        return -1;
    return thread_create(start_func, stack, stack_size);
  105845:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  10584a:	c9                   	leave  
  10584b:	c3                   	ret    
  10584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    void* (*start_func)();
    void* stack;
    int stack_size;
    if(argptr(0, (void*)&start_func, 4) < 0)
        return -1;
    if(argptr(1, (void*)&stack, 4) < 0)
  105850:	8d 45 f0             	lea    -0x10(%ebp),%eax
  105853:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  10585a:	00 
  10585b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10585f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  105866:	e8 a5 f0 ff ff       	call   104910 <argptr>
  10586b:	85 c0                	test   %eax,%eax
  10586d:	78 d6                	js     105845 <sys_thread_create+0x25>
        return -1;
    if(argint(2, &stack_size) < 0)
  10586f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  105872:	89 44 24 04          	mov    %eax,0x4(%esp)
  105876:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  10587d:	e8 4e f0 ff ff       	call   1048d0 <argint>
  105882:	85 c0                	test   %eax,%eax
  105884:	78 bf                	js     105845 <sys_thread_create+0x25>
        return -1;
    return thread_create(start_func, stack, stack_size);
  105886:	8b 45 ec             	mov    -0x14(%ebp),%eax
  105889:	89 44 24 08          	mov    %eax,0x8(%esp)
  10588d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  105890:	89 44 24 04          	mov    %eax,0x4(%esp)
  105894:	8b 45 f4             	mov    -0xc(%ebp),%eax
  105897:	89 04 24             	mov    %eax,(%esp)
  10589a:	e8 e1 e7 ff ff       	call   104080 <thread_create>
}
  10589f:	c9                   	leave  
  1058a0:	c3                   	ret    
  1058a1:	eb 0d                	jmp    1058b0 <sys_kill>
  1058a3:	90                   	nop
  1058a4:	90                   	nop
  1058a5:	90                   	nop
  1058a6:	90                   	nop
  1058a7:	90                   	nop
  1058a8:	90                   	nop
  1058a9:	90                   	nop
  1058aa:	90                   	nop
  1058ab:	90                   	nop
  1058ac:	90                   	nop
  1058ad:	90                   	nop
  1058ae:	90                   	nop
  1058af:	90                   	nop

001058b0 <sys_kill>:
  return wait();
}

int
sys_kill(void)
{
  1058b0:	55                   	push   %ebp
  1058b1:	89 e5                	mov    %esp,%ebp
  1058b3:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
  1058b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1058b9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1058bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1058c4:	e8 07 f0 ff ff       	call   1048d0 <argint>
  1058c9:	89 c2                	mov    %eax,%edx
  1058cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1058d0:	85 d2                	test   %edx,%edx
  1058d2:	78 0b                	js     1058df <sys_kill+0x2f>
    return -1;
  return kill(pid);
  1058d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1058d7:	89 04 24             	mov    %eax,(%esp)
  1058da:	e8 81 d9 ff ff       	call   103260 <kill>
}
  1058df:	c9                   	leave  
  1058e0:	c3                   	ret    
  1058e1:	eb 0d                	jmp    1058f0 <sys_wait>
  1058e3:	90                   	nop
  1058e4:	90                   	nop
  1058e5:	90                   	nop
  1058e6:	90                   	nop
  1058e7:	90                   	nop
  1058e8:	90                   	nop
  1058e9:	90                   	nop
  1058ea:	90                   	nop
  1058eb:	90                   	nop
  1058ec:	90                   	nop
  1058ed:	90                   	nop
  1058ee:	90                   	nop
  1058ef:	90                   	nop

001058f0 <sys_wait>:
  return 0;  // not reached
}

int
sys_wait(void)
{
  1058f0:	55                   	push   %ebp
  1058f1:	89 e5                	mov    %esp,%ebp
  1058f3:	83 ec 08             	sub    $0x8,%esp
  return wait();
}
  1058f6:	c9                   	leave  
}

int
sys_wait(void)
{
  return wait();
  1058f7:	e9 f4 dd ff ff       	jmp    1036f0 <wait>
  1058fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105900 <sys_exit>:
  return fork();
}

int
sys_exit(void)
{
  105900:	55                   	push   %ebp
  105901:	89 e5                	mov    %esp,%ebp
  105903:	83 ec 08             	sub    $0x8,%esp
  exit();
  105906:	e8 f5 e0 ff ff       	call   103a00 <exit>
  return 0;  // not reached
}
  10590b:	31 c0                	xor    %eax,%eax
  10590d:	c9                   	leave  
  10590e:	c3                   	ret    
  10590f:	90                   	nop

00105910 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  105910:	55                   	push   %ebp
  105911:	89 e5                	mov    %esp,%ebp
  105913:	83 ec 08             	sub    $0x8,%esp
  return fork();
}
  105916:	c9                   	leave  
#include "proc.h"

int
sys_fork(void)
{
  return fork();
  105917:	e9 64 e6 ff ff       	jmp    103f80 <fork>
  10591c:	90                   	nop
  10591d:	90                   	nop
  10591e:	90                   	nop
  10591f:	90                   	nop

00105920 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
  105920:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  105921:	ba 43 00 00 00       	mov    $0x43,%edx
  105926:	89 e5                	mov    %esp,%ebp
  105928:	83 ec 18             	sub    $0x18,%esp
  10592b:	b8 34 00 00 00       	mov    $0x34,%eax
  105930:	ee                   	out    %al,(%dx)
  105931:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
  105936:	b2 40                	mov    $0x40,%dl
  105938:	ee                   	out    %al,(%dx)
  105939:	b8 2e 00 00 00       	mov    $0x2e,%eax
  10593e:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
  10593f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105946:	e8 d5 d4 ff ff       	call   102e20 <picenable>
}
  10594b:	c9                   	leave  
  10594c:	c3                   	ret    
  10594d:	90                   	nop
  10594e:	90                   	nop
  10594f:	90                   	nop

00105950 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
  105950:	1e                   	push   %ds
  pushl %es
  105951:	06                   	push   %es
  pushl %fs
  105952:	0f a0                	push   %fs
  pushl %gs
  105954:	0f a8                	push   %gs
  pushal
  105956:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
  105957:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
  10595b:	8e d8                	mov    %eax,%ds
  movw %ax, %es
  10595d:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
  10595f:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
  105963:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
  105965:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
  105967:	54                   	push   %esp
  call trap
  105968:	e8 43 00 00 00       	call   1059b0 <trap>
  addl $4, %esp
  10596d:	83 c4 04             	add    $0x4,%esp

00105970 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
  105970:	61                   	popa   
  popl %gs
  105971:	0f a9                	pop    %gs
  popl %fs
  105973:	0f a1                	pop    %fs
  popl %es
  105975:	07                   	pop    %es
  popl %ds
  105976:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
  105977:	83 c4 08             	add    $0x8,%esp
  iret
  10597a:	cf                   	iret   
  10597b:	90                   	nop
  10597c:	90                   	nop
  10597d:	90                   	nop
  10597e:	90                   	nop
  10597f:	90                   	nop

00105980 <idtinit>:
  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  105980:	55                   	push   %ebp
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
  pd[1] = (uint)p;
  105981:	b8 60 a4 11 00       	mov    $0x11a460,%eax
  105986:	89 e5                	mov    %esp,%ebp
  105988:	83 ec 10             	sub    $0x10,%esp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
  10598b:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
  105991:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
  105995:	c1 e8 10             	shr    $0x10,%eax
  105998:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
  10599c:	8d 45 fa             	lea    -0x6(%ebp),%eax
  10599f:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
  1059a2:	c9                   	leave  
  1059a3:	c3                   	ret    
  1059a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1059aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001059b0 <trap>:

void
trap(struct trapframe *tf)
{
  1059b0:	55                   	push   %ebp
  1059b1:	89 e5                	mov    %esp,%ebp
  1059b3:	56                   	push   %esi
  1059b4:	53                   	push   %ebx
  1059b5:	83 ec 20             	sub    $0x20,%esp
  1059b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
  1059bb:	8b 43 30             	mov    0x30(%ebx),%eax
  1059be:	83 f8 40             	cmp    $0x40,%eax
  1059c1:	0f 84 d1 00 00 00    	je     105a98 <trap+0xe8>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  1059c7:	8d 50 e0             	lea    -0x20(%eax),%edx
  1059ca:	83 fa 1f             	cmp    $0x1f,%edx
  1059cd:	0f 86 bd 00 00 00    	jbe    105a90 <trap+0xe0>
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
    break;
   
  default:
    if(proc == 0 || (tf->cs&3) == 0){
  1059d3:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  1059da:	85 d2                	test   %edx,%edx
  1059dc:	0f 84 fe 01 00 00    	je     105be0 <trap+0x230>
  1059e2:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
  1059e6:	0f 84 f4 01 00 00    	je     105be0 <trap+0x230>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
  1059ec:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
  1059ef:	8b 4a 58             	mov    0x58(%edx),%ecx
  1059f2:	83 c2 6c             	add    $0x6c,%edx
  1059f5:	89 74 24 1c          	mov    %esi,0x1c(%esp)
  1059f9:	8b 73 38             	mov    0x38(%ebx),%esi
  1059fc:	89 74 24 18          	mov    %esi,0x18(%esp)
  105a00:	65 8b 35 00 00 00 00 	mov    %gs:0x0,%esi
  105a07:	0f b6 36             	movzbl (%esi),%esi
  105a0a:	89 74 24 14          	mov    %esi,0x14(%esp)
  105a0e:	8b 73 34             	mov    0x34(%ebx),%esi
  105a11:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105a15:	89 54 24 08          	mov    %edx,0x8(%esp)
  105a19:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105a1d:	89 74 24 10          	mov    %esi,0x10(%esp)
  105a21:	c7 04 24 5c 78 10 00 	movl   $0x10785c,(%esp)
  105a28:	e8 33 ad ff ff       	call   100760 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
            rcr2());
    proc->killed = 1;
  105a2d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105a33:	c7 40 4c 01 00 00 00 	movl   $0x1,0x4c(%eax)
  105a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
  105a40:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105a46:	85 c0                	test   %eax,%eax
  105a48:	74 70                	je     105aba <trap+0x10a>
  105a4a:	8b 50 4c             	mov    0x4c(%eax),%edx
  105a4d:	85 d2                	test   %edx,%edx
  105a4f:	74 10                	je     105a61 <trap+0xb1>
  105a51:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
  105a55:	83 e2 03             	and    $0x3,%edx
  105a58:	83 fa 03             	cmp    $0x3,%edx
  105a5b:	0f 84 67 01 00 00    	je     105bc8 <trap+0x218>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
  105a61:	83 78 54 04          	cmpl   $0x4,0x54(%eax)
  105a65:	0f 84 35 01 00 00    	je     105ba0 <trap+0x1f0>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
  105a6b:	8b 40 4c             	mov    0x4c(%eax),%eax
  105a6e:	85 c0                	test   %eax,%eax
  105a70:	74 48                	je     105aba <trap+0x10a>
  105a72:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
  105a76:	83 e0 03             	and    $0x3,%eax
  105a79:	83 f8 03             	cmp    $0x3,%eax
  105a7c:	75 3c                	jne    105aba <trap+0x10a>
    exit();
}
  105a7e:	83 c4 20             	add    $0x20,%esp
  105a81:	5b                   	pop    %ebx
  105a82:	5e                   	pop    %esi
  105a83:	5d                   	pop    %ebp
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
  105a84:	e9 77 df ff ff       	jmp    103a00 <exit>
  105a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  105a90:	ff 24 95 ac 78 10 00 	jmp    *0x1078ac(,%edx,4)
  105a97:	90                   	nop

void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
  105a98:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105a9e:	8b 70 4c             	mov    0x4c(%eax),%esi
  105aa1:	85 f6                	test   %esi,%esi
  105aa3:	75 23                	jne    105ac8 <trap+0x118>
      exit();
    proc->tf = tf;
  105aa5:	89 58 60             	mov    %ebx,0x60(%eax)
    syscall();
  105aa8:	e8 23 ef ff ff       	call   1049d0 <syscall>
    if(proc->killed)
  105aad:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105ab3:	8b 48 4c             	mov    0x4c(%eax),%ecx
  105ab6:	85 c9                	test   %ecx,%ecx
  105ab8:	75 c4                	jne    105a7e <trap+0xce>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
  105aba:	83 c4 20             	add    $0x20,%esp
  105abd:	5b                   	pop    %ebx
  105abe:	5e                   	pop    %esi
  105abf:	5d                   	pop    %ebp
  105ac0:	c3                   	ret    
  105ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
  105ac8:	e8 33 df ff ff       	call   103a00 <exit>
  105acd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105ad3:	eb d0                	jmp    105aa5 <trap+0xf5>
  105ad5:	8d 76 00             	lea    0x0(%esi),%esi
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
  105ad8:	8b 43 38             	mov    0x38(%ebx),%eax
  105adb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105adf:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
  105ae3:	89 44 24 08          	mov    %eax,0x8(%esp)
  105ae7:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  105aed:	0f b6 00             	movzbl (%eax),%eax
  105af0:	c7 04 24 04 78 10 00 	movl   $0x107804,(%esp)
  105af7:	89 44 24 04          	mov    %eax,0x4(%esp)
  105afb:	e8 60 ac ff ff       	call   100760 <cprintf>
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
  105b00:	e8 eb cb ff ff       	call   1026f0 <lapiceoi>
    break;
  105b05:	e9 36 ff ff ff       	jmp    105a40 <trap+0x90>
  105b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
  105b10:	e8 cb 01 00 00       	call   105ce0 <uartintr>
  105b15:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
  105b18:	e8 d3 cb ff ff       	call   1026f0 <lapiceoi>
  105b1d:	8d 76 00             	lea    0x0(%esi),%esi
    break;
  105b20:	e9 1b ff ff ff       	jmp    105a40 <trap+0x90>
  105b25:	8d 76 00             	lea    0x0(%esi),%esi
  105b28:	90                   	nop
  105b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
  105b30:	e8 5b c7 ff ff       	call   102290 <ideintr>
  105b35:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
  105b38:	e8 b3 cb ff ff       	call   1026f0 <lapiceoi>
  105b3d:	8d 76 00             	lea    0x0(%esi),%esi
    break;
  105b40:	e9 fb fe ff ff       	jmp    105a40 <trap+0x90>
  105b45:	8d 76 00             	lea    0x0(%esi),%esi
  105b48:	90                   	nop
  105b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
  105b50:	e8 7b cb ff ff       	call   1026d0 <kbdintr>
  105b55:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
  105b58:	e8 93 cb ff ff       	call   1026f0 <lapiceoi>
  105b5d:	8d 76 00             	lea    0x0(%esi),%esi
    break;
  105b60:	e9 db fe ff ff       	jmp    105a40 <trap+0x90>
  105b65:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpu->id == 0){
  105b68:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  105b6e:	80 38 00             	cmpb   $0x0,(%eax)
  105b71:	75 c2                	jne    105b35 <trap+0x185>
      acquire(&tickslock);
  105b73:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  105b7a:	e8 11 ea ff ff       	call   104590 <acquire>
      ticks++;
  105b7f:	83 05 60 ac 11 00 01 	addl   $0x1,0x11ac60
      wakeup(&ticks);
  105b86:	c7 04 24 60 ac 11 00 	movl   $0x11ac60,(%esp)
  105b8d:	e8 5e d7 ff ff       	call   1032f0 <wakeup>
      release(&tickslock);
  105b92:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
  105b99:	e8 a2 e9 ff ff       	call   104540 <release>
  105b9e:	eb 95                	jmp    105b35 <trap+0x185>
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
  105ba0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
  105ba4:	0f 85 c1 fe ff ff    	jne    105a6b <trap+0xbb>
  105baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    yield();
  105bb0:	e8 3b d9 ff ff       	call   1034f0 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
  105bb5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105bbb:	85 c0                	test   %eax,%eax
  105bbd:	0f 85 a8 fe ff ff    	jne    105a6b <trap+0xbb>
  105bc3:	e9 f2 fe ff ff       	jmp    105aba <trap+0x10a>

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
  105bc8:	e8 33 de ff ff       	call   103a00 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
  105bcd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  105bd3:	85 c0                	test   %eax,%eax
  105bd5:	0f 85 86 fe ff ff    	jne    105a61 <trap+0xb1>
  105bdb:	e9 da fe ff ff       	jmp    105aba <trap+0x10a>
  105be0:	0f 20 d2             	mov    %cr2,%edx
    break;
   
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
  105be3:	89 54 24 10          	mov    %edx,0x10(%esp)
  105be7:	8b 53 38             	mov    0x38(%ebx),%edx
  105bea:	89 54 24 0c          	mov    %edx,0xc(%esp)
  105bee:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
  105bf5:	0f b6 12             	movzbl (%edx),%edx
  105bf8:	89 44 24 04          	mov    %eax,0x4(%esp)
  105bfc:	c7 04 24 28 78 10 00 	movl   $0x107828,(%esp)
  105c03:	89 54 24 08          	mov    %edx,0x8(%esp)
  105c07:	e8 54 ab ff ff       	call   100760 <cprintf>
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
  105c0c:	c7 04 24 9f 78 10 00 	movl   $0x10789f,(%esp)
  105c13:	e8 38 af ff ff       	call   100b50 <panic>
  105c18:	90                   	nop
  105c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105c20 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
  105c20:	55                   	push   %ebp
  105c21:	31 c0                	xor    %eax,%eax
  105c23:	89 e5                	mov    %esp,%ebp
  105c25:	ba 60 a4 11 00       	mov    $0x11a460,%edx
  105c2a:	83 ec 18             	sub    $0x18,%esp
  105c2d:	8d 76 00             	lea    0x0(%esi),%esi
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  105c30:	8b 0c 85 28 8d 10 00 	mov    0x108d28(,%eax,4),%ecx
  105c37:	66 89 0c c5 60 a4 11 	mov    %cx,0x11a460(,%eax,8)
  105c3e:	00 
  105c3f:	c1 e9 10             	shr    $0x10,%ecx
  105c42:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  105c49:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  105c4e:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  105c53:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
  105c58:	83 c0 01             	add    $0x1,%eax
  105c5b:	3d 00 01 00 00       	cmp    $0x100,%eax
  105c60:	75 ce                	jne    105c30 <tvinit+0x10>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
  105c62:	a1 28 8e 10 00       	mov    0x108e28,%eax
  
  initlock(&tickslock, "time");
  105c67:	c7 44 24 04 a4 78 10 	movl   $0x1078a4,0x4(%esp)
  105c6e:	00 
  105c6f:	c7 04 24 20 a4 11 00 	movl   $0x11a420,(%esp)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
  105c76:	66 c7 05 62 a6 11 00 	movw   $0x8,0x11a662
  105c7d:	08 00 
  105c7f:	66 a3 60 a6 11 00    	mov    %ax,0x11a660
  105c85:	c1 e8 10             	shr    $0x10,%eax
  105c88:	c6 05 64 a6 11 00 00 	movb   $0x0,0x11a664
  105c8f:	c6 05 65 a6 11 00 ef 	movb   $0xef,0x11a665
  105c96:	66 a3 66 a6 11 00    	mov    %ax,0x11a666
  
  initlock(&tickslock, "time");
  105c9c:	e8 5f e7 ff ff       	call   104400 <initlock>
}
  105ca1:	c9                   	leave  
  105ca2:	c3                   	ret    
  105ca3:	90                   	nop
  105ca4:	90                   	nop
  105ca5:	90                   	nop
  105ca6:	90                   	nop
  105ca7:	90                   	nop
  105ca8:	90                   	nop
  105ca9:	90                   	nop
  105caa:	90                   	nop
  105cab:	90                   	nop
  105cac:	90                   	nop
  105cad:	90                   	nop
  105cae:	90                   	nop
  105caf:	90                   	nop

00105cb0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
  105cb0:	a1 6c 92 10 00       	mov    0x10926c,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
  105cb5:	55                   	push   %ebp
  105cb6:	89 e5                	mov    %esp,%ebp
  if(!uart)
  105cb8:	85 c0                	test   %eax,%eax
  105cba:	75 0c                	jne    105cc8 <uartgetc+0x18>
    return -1;
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
  105cbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  105cc1:	5d                   	pop    %ebp
  105cc2:	c3                   	ret    
  105cc3:	90                   	nop
  105cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  105cc8:	ba fd 03 00 00       	mov    $0x3fd,%edx
  105ccd:	ec                   	in     (%dx),%al
static int
uartgetc(void)
{
  if(!uart)
    return -1;
  if(!(inb(COM1+5) & 0x01))
  105cce:	a8 01                	test   $0x1,%al
  105cd0:	74 ea                	je     105cbc <uartgetc+0xc>
  105cd2:	b2 f8                	mov    $0xf8,%dl
  105cd4:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
  105cd5:	0f b6 c0             	movzbl %al,%eax
}
  105cd8:	5d                   	pop    %ebp
  105cd9:	c3                   	ret    
  105cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105ce0 <uartintr>:

void
uartintr(void)
{
  105ce0:	55                   	push   %ebp
  105ce1:	89 e5                	mov    %esp,%ebp
  105ce3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
  105ce6:	c7 04 24 b0 5c 10 00 	movl   $0x105cb0,(%esp)
  105ced:	e8 ce ac ff ff       	call   1009c0 <consoleintr>
}
  105cf2:	c9                   	leave  
  105cf3:	c3                   	ret    
  105cf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105cfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105d00 <uartputc>:
    uartputc(*p);
}

void
uartputc(int c)
{
  105d00:	55                   	push   %ebp
  105d01:	89 e5                	mov    %esp,%ebp
  105d03:	56                   	push   %esi
  105d04:	be fd 03 00 00       	mov    $0x3fd,%esi
  105d09:	53                   	push   %ebx
  int i;

  if(!uart)
  105d0a:	31 db                	xor    %ebx,%ebx
    uartputc(*p);
}

void
uartputc(int c)
{
  105d0c:	83 ec 10             	sub    $0x10,%esp
  int i;

  if(!uart)
  105d0f:	8b 15 6c 92 10 00    	mov    0x10926c,%edx
  105d15:	85 d2                	test   %edx,%edx
  105d17:	75 1e                	jne    105d37 <uartputc+0x37>
  105d19:	eb 2c                	jmp    105d47 <uartputc+0x47>
  105d1b:	90                   	nop
  105d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
  105d20:	83 c3 01             	add    $0x1,%ebx
    microdelay(10);
  105d23:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  105d2a:	e8 e1 c9 ff ff       	call   102710 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
  105d2f:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
  105d35:	74 07                	je     105d3e <uartputc+0x3e>
  105d37:	89 f2                	mov    %esi,%edx
  105d39:	ec                   	in     (%dx),%al
  105d3a:	a8 20                	test   $0x20,%al
  105d3c:	74 e2                	je     105d20 <uartputc+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
  105d3e:	ba f8 03 00 00       	mov    $0x3f8,%edx
  105d43:	8b 45 08             	mov    0x8(%ebp),%eax
  105d46:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
  105d47:	83 c4 10             	add    $0x10,%esp
  105d4a:	5b                   	pop    %ebx
  105d4b:	5e                   	pop    %esi
  105d4c:	5d                   	pop    %ebp
  105d4d:	c3                   	ret    
  105d4e:	66 90                	xchg   %ax,%ax

00105d50 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
  105d50:	55                   	push   %ebp
  105d51:	31 c9                	xor    %ecx,%ecx
  105d53:	89 e5                	mov    %esp,%ebp
  105d55:	89 c8                	mov    %ecx,%eax
  105d57:	57                   	push   %edi
  105d58:	bf fa 03 00 00       	mov    $0x3fa,%edi
  105d5d:	56                   	push   %esi
  105d5e:	89 fa                	mov    %edi,%edx
  105d60:	53                   	push   %ebx
  105d61:	83 ec 1c             	sub    $0x1c,%esp
  105d64:	ee                   	out    %al,(%dx)
  105d65:	bb fb 03 00 00       	mov    $0x3fb,%ebx
  105d6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  105d6f:	89 da                	mov    %ebx,%edx
  105d71:	ee                   	out    %al,(%dx)
  105d72:	b8 0c 00 00 00       	mov    $0xc,%eax
  105d77:	b2 f8                	mov    $0xf8,%dl
  105d79:	ee                   	out    %al,(%dx)
  105d7a:	be f9 03 00 00       	mov    $0x3f9,%esi
  105d7f:	89 c8                	mov    %ecx,%eax
  105d81:	89 f2                	mov    %esi,%edx
  105d83:	ee                   	out    %al,(%dx)
  105d84:	b8 03 00 00 00       	mov    $0x3,%eax
  105d89:	89 da                	mov    %ebx,%edx
  105d8b:	ee                   	out    %al,(%dx)
  105d8c:	b2 fc                	mov    $0xfc,%dl
  105d8e:	89 c8                	mov    %ecx,%eax
  105d90:	ee                   	out    %al,(%dx)
  105d91:	b8 01 00 00 00       	mov    $0x1,%eax
  105d96:	89 f2                	mov    %esi,%edx
  105d98:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
  105d99:	b2 fd                	mov    $0xfd,%dl
  105d9b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
  105d9c:	3c ff                	cmp    $0xff,%al
  105d9e:	74 55                	je     105df5 <uartinit+0xa5>
    return;
  uart = 1;
  105da0:	c7 05 6c 92 10 00 01 	movl   $0x1,0x10926c
  105da7:	00 00 00 
  105daa:	89 fa                	mov    %edi,%edx
  105dac:	ec                   	in     (%dx),%al
  105dad:	b2 f8                	mov    $0xf8,%dl
  105daf:	ec                   	in     (%dx),%al
  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  105db0:	bb 2c 79 10 00       	mov    $0x10792c,%ebx

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
  105db5:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  105dbc:	e8 5f d0 ff ff       	call   102e20 <picenable>
  ioapicenable(IRQ_COM1, 0);
  105dc1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  105dc8:	00 
  105dc9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  105dd0:	e8 0b c6 ff ff       	call   1023e0 <ioapicenable>
  105dd5:	b8 78 00 00 00       	mov    $0x78,%eax
  105dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
  105de0:	0f be c0             	movsbl %al,%eax
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
  105de3:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
  105de6:	89 04 24             	mov    %eax,(%esp)
  105de9:	e8 12 ff ff ff       	call   105d00 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
  105dee:	0f b6 03             	movzbl (%ebx),%eax
  105df1:	84 c0                	test   %al,%al
  105df3:	75 eb                	jne    105de0 <uartinit+0x90>
    uartputc(*p);
}
  105df5:	83 c4 1c             	add    $0x1c,%esp
  105df8:	5b                   	pop    %ebx
  105df9:	5e                   	pop    %esi
  105dfa:	5f                   	pop    %edi
  105dfb:	5d                   	pop    %ebp
  105dfc:	c3                   	ret    
  105dfd:	90                   	nop
  105dfe:	90                   	nop
  105dff:	90                   	nop

00105e00 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
  105e00:	6a 00                	push   $0x0
  pushl $0
  105e02:	6a 00                	push   $0x0
  jmp alltraps
  105e04:	e9 47 fb ff ff       	jmp    105950 <alltraps>

00105e09 <vector1>:
.globl vector1
vector1:
  pushl $0
  105e09:	6a 00                	push   $0x0
  pushl $1
  105e0b:	6a 01                	push   $0x1
  jmp alltraps
  105e0d:	e9 3e fb ff ff       	jmp    105950 <alltraps>

00105e12 <vector2>:
.globl vector2
vector2:
  pushl $0
  105e12:	6a 00                	push   $0x0
  pushl $2
  105e14:	6a 02                	push   $0x2
  jmp alltraps
  105e16:	e9 35 fb ff ff       	jmp    105950 <alltraps>

00105e1b <vector3>:
.globl vector3
vector3:
  pushl $0
  105e1b:	6a 00                	push   $0x0
  pushl $3
  105e1d:	6a 03                	push   $0x3
  jmp alltraps
  105e1f:	e9 2c fb ff ff       	jmp    105950 <alltraps>

00105e24 <vector4>:
.globl vector4
vector4:
  pushl $0
  105e24:	6a 00                	push   $0x0
  pushl $4
  105e26:	6a 04                	push   $0x4
  jmp alltraps
  105e28:	e9 23 fb ff ff       	jmp    105950 <alltraps>

00105e2d <vector5>:
.globl vector5
vector5:
  pushl $0
  105e2d:	6a 00                	push   $0x0
  pushl $5
  105e2f:	6a 05                	push   $0x5
  jmp alltraps
  105e31:	e9 1a fb ff ff       	jmp    105950 <alltraps>

00105e36 <vector6>:
.globl vector6
vector6:
  pushl $0
  105e36:	6a 00                	push   $0x0
  pushl $6
  105e38:	6a 06                	push   $0x6
  jmp alltraps
  105e3a:	e9 11 fb ff ff       	jmp    105950 <alltraps>

00105e3f <vector7>:
.globl vector7
vector7:
  pushl $0
  105e3f:	6a 00                	push   $0x0
  pushl $7
  105e41:	6a 07                	push   $0x7
  jmp alltraps
  105e43:	e9 08 fb ff ff       	jmp    105950 <alltraps>

00105e48 <vector8>:
.globl vector8
vector8:
  pushl $8
  105e48:	6a 08                	push   $0x8
  jmp alltraps
  105e4a:	e9 01 fb ff ff       	jmp    105950 <alltraps>

00105e4f <vector9>:
.globl vector9
vector9:
  pushl $0
  105e4f:	6a 00                	push   $0x0
  pushl $9
  105e51:	6a 09                	push   $0x9
  jmp alltraps
  105e53:	e9 f8 fa ff ff       	jmp    105950 <alltraps>

00105e58 <vector10>:
.globl vector10
vector10:
  pushl $10
  105e58:	6a 0a                	push   $0xa
  jmp alltraps
  105e5a:	e9 f1 fa ff ff       	jmp    105950 <alltraps>

00105e5f <vector11>:
.globl vector11
vector11:
  pushl $11
  105e5f:	6a 0b                	push   $0xb
  jmp alltraps
  105e61:	e9 ea fa ff ff       	jmp    105950 <alltraps>

00105e66 <vector12>:
.globl vector12
vector12:
  pushl $12
  105e66:	6a 0c                	push   $0xc
  jmp alltraps
  105e68:	e9 e3 fa ff ff       	jmp    105950 <alltraps>

00105e6d <vector13>:
.globl vector13
vector13:
  pushl $13
  105e6d:	6a 0d                	push   $0xd
  jmp alltraps
  105e6f:	e9 dc fa ff ff       	jmp    105950 <alltraps>

00105e74 <vector14>:
.globl vector14
vector14:
  pushl $14
  105e74:	6a 0e                	push   $0xe
  jmp alltraps
  105e76:	e9 d5 fa ff ff       	jmp    105950 <alltraps>

00105e7b <vector15>:
.globl vector15
vector15:
  pushl $0
  105e7b:	6a 00                	push   $0x0
  pushl $15
  105e7d:	6a 0f                	push   $0xf
  jmp alltraps
  105e7f:	e9 cc fa ff ff       	jmp    105950 <alltraps>

00105e84 <vector16>:
.globl vector16
vector16:
  pushl $0
  105e84:	6a 00                	push   $0x0
  pushl $16
  105e86:	6a 10                	push   $0x10
  jmp alltraps
  105e88:	e9 c3 fa ff ff       	jmp    105950 <alltraps>

00105e8d <vector17>:
.globl vector17
vector17:
  pushl $17
  105e8d:	6a 11                	push   $0x11
  jmp alltraps
  105e8f:	e9 bc fa ff ff       	jmp    105950 <alltraps>

00105e94 <vector18>:
.globl vector18
vector18:
  pushl $0
  105e94:	6a 00                	push   $0x0
  pushl $18
  105e96:	6a 12                	push   $0x12
  jmp alltraps
  105e98:	e9 b3 fa ff ff       	jmp    105950 <alltraps>

00105e9d <vector19>:
.globl vector19
vector19:
  pushl $0
  105e9d:	6a 00                	push   $0x0
  pushl $19
  105e9f:	6a 13                	push   $0x13
  jmp alltraps
  105ea1:	e9 aa fa ff ff       	jmp    105950 <alltraps>

00105ea6 <vector20>:
.globl vector20
vector20:
  pushl $0
  105ea6:	6a 00                	push   $0x0
  pushl $20
  105ea8:	6a 14                	push   $0x14
  jmp alltraps
  105eaa:	e9 a1 fa ff ff       	jmp    105950 <alltraps>

00105eaf <vector21>:
.globl vector21
vector21:
  pushl $0
  105eaf:	6a 00                	push   $0x0
  pushl $21
  105eb1:	6a 15                	push   $0x15
  jmp alltraps
  105eb3:	e9 98 fa ff ff       	jmp    105950 <alltraps>

00105eb8 <vector22>:
.globl vector22
vector22:
  pushl $0
  105eb8:	6a 00                	push   $0x0
  pushl $22
  105eba:	6a 16                	push   $0x16
  jmp alltraps
  105ebc:	e9 8f fa ff ff       	jmp    105950 <alltraps>

00105ec1 <vector23>:
.globl vector23
vector23:
  pushl $0
  105ec1:	6a 00                	push   $0x0
  pushl $23
  105ec3:	6a 17                	push   $0x17
  jmp alltraps
  105ec5:	e9 86 fa ff ff       	jmp    105950 <alltraps>

00105eca <vector24>:
.globl vector24
vector24:
  pushl $0
  105eca:	6a 00                	push   $0x0
  pushl $24
  105ecc:	6a 18                	push   $0x18
  jmp alltraps
  105ece:	e9 7d fa ff ff       	jmp    105950 <alltraps>

00105ed3 <vector25>:
.globl vector25
vector25:
  pushl $0
  105ed3:	6a 00                	push   $0x0
  pushl $25
  105ed5:	6a 19                	push   $0x19
  jmp alltraps
  105ed7:	e9 74 fa ff ff       	jmp    105950 <alltraps>

00105edc <vector26>:
.globl vector26
vector26:
  pushl $0
  105edc:	6a 00                	push   $0x0
  pushl $26
  105ede:	6a 1a                	push   $0x1a
  jmp alltraps
  105ee0:	e9 6b fa ff ff       	jmp    105950 <alltraps>

00105ee5 <vector27>:
.globl vector27
vector27:
  pushl $0
  105ee5:	6a 00                	push   $0x0
  pushl $27
  105ee7:	6a 1b                	push   $0x1b
  jmp alltraps
  105ee9:	e9 62 fa ff ff       	jmp    105950 <alltraps>

00105eee <vector28>:
.globl vector28
vector28:
  pushl $0
  105eee:	6a 00                	push   $0x0
  pushl $28
  105ef0:	6a 1c                	push   $0x1c
  jmp alltraps
  105ef2:	e9 59 fa ff ff       	jmp    105950 <alltraps>

00105ef7 <vector29>:
.globl vector29
vector29:
  pushl $0
  105ef7:	6a 00                	push   $0x0
  pushl $29
  105ef9:	6a 1d                	push   $0x1d
  jmp alltraps
  105efb:	e9 50 fa ff ff       	jmp    105950 <alltraps>

00105f00 <vector30>:
.globl vector30
vector30:
  pushl $0
  105f00:	6a 00                	push   $0x0
  pushl $30
  105f02:	6a 1e                	push   $0x1e
  jmp alltraps
  105f04:	e9 47 fa ff ff       	jmp    105950 <alltraps>

00105f09 <vector31>:
.globl vector31
vector31:
  pushl $0
  105f09:	6a 00                	push   $0x0
  pushl $31
  105f0b:	6a 1f                	push   $0x1f
  jmp alltraps
  105f0d:	e9 3e fa ff ff       	jmp    105950 <alltraps>

00105f12 <vector32>:
.globl vector32
vector32:
  pushl $0
  105f12:	6a 00                	push   $0x0
  pushl $32
  105f14:	6a 20                	push   $0x20
  jmp alltraps
  105f16:	e9 35 fa ff ff       	jmp    105950 <alltraps>

00105f1b <vector33>:
.globl vector33
vector33:
  pushl $0
  105f1b:	6a 00                	push   $0x0
  pushl $33
  105f1d:	6a 21                	push   $0x21
  jmp alltraps
  105f1f:	e9 2c fa ff ff       	jmp    105950 <alltraps>

00105f24 <vector34>:
.globl vector34
vector34:
  pushl $0
  105f24:	6a 00                	push   $0x0
  pushl $34
  105f26:	6a 22                	push   $0x22
  jmp alltraps
  105f28:	e9 23 fa ff ff       	jmp    105950 <alltraps>

00105f2d <vector35>:
.globl vector35
vector35:
  pushl $0
  105f2d:	6a 00                	push   $0x0
  pushl $35
  105f2f:	6a 23                	push   $0x23
  jmp alltraps
  105f31:	e9 1a fa ff ff       	jmp    105950 <alltraps>

00105f36 <vector36>:
.globl vector36
vector36:
  pushl $0
  105f36:	6a 00                	push   $0x0
  pushl $36
  105f38:	6a 24                	push   $0x24
  jmp alltraps
  105f3a:	e9 11 fa ff ff       	jmp    105950 <alltraps>

00105f3f <vector37>:
.globl vector37
vector37:
  pushl $0
  105f3f:	6a 00                	push   $0x0
  pushl $37
  105f41:	6a 25                	push   $0x25
  jmp alltraps
  105f43:	e9 08 fa ff ff       	jmp    105950 <alltraps>

00105f48 <vector38>:
.globl vector38
vector38:
  pushl $0
  105f48:	6a 00                	push   $0x0
  pushl $38
  105f4a:	6a 26                	push   $0x26
  jmp alltraps
  105f4c:	e9 ff f9 ff ff       	jmp    105950 <alltraps>

00105f51 <vector39>:
.globl vector39
vector39:
  pushl $0
  105f51:	6a 00                	push   $0x0
  pushl $39
  105f53:	6a 27                	push   $0x27
  jmp alltraps
  105f55:	e9 f6 f9 ff ff       	jmp    105950 <alltraps>

00105f5a <vector40>:
.globl vector40
vector40:
  pushl $0
  105f5a:	6a 00                	push   $0x0
  pushl $40
  105f5c:	6a 28                	push   $0x28
  jmp alltraps
  105f5e:	e9 ed f9 ff ff       	jmp    105950 <alltraps>

00105f63 <vector41>:
.globl vector41
vector41:
  pushl $0
  105f63:	6a 00                	push   $0x0
  pushl $41
  105f65:	6a 29                	push   $0x29
  jmp alltraps
  105f67:	e9 e4 f9 ff ff       	jmp    105950 <alltraps>

00105f6c <vector42>:
.globl vector42
vector42:
  pushl $0
  105f6c:	6a 00                	push   $0x0
  pushl $42
  105f6e:	6a 2a                	push   $0x2a
  jmp alltraps
  105f70:	e9 db f9 ff ff       	jmp    105950 <alltraps>

00105f75 <vector43>:
.globl vector43
vector43:
  pushl $0
  105f75:	6a 00                	push   $0x0
  pushl $43
  105f77:	6a 2b                	push   $0x2b
  jmp alltraps
  105f79:	e9 d2 f9 ff ff       	jmp    105950 <alltraps>

00105f7e <vector44>:
.globl vector44
vector44:
  pushl $0
  105f7e:	6a 00                	push   $0x0
  pushl $44
  105f80:	6a 2c                	push   $0x2c
  jmp alltraps
  105f82:	e9 c9 f9 ff ff       	jmp    105950 <alltraps>

00105f87 <vector45>:
.globl vector45
vector45:
  pushl $0
  105f87:	6a 00                	push   $0x0
  pushl $45
  105f89:	6a 2d                	push   $0x2d
  jmp alltraps
  105f8b:	e9 c0 f9 ff ff       	jmp    105950 <alltraps>

00105f90 <vector46>:
.globl vector46
vector46:
  pushl $0
  105f90:	6a 00                	push   $0x0
  pushl $46
  105f92:	6a 2e                	push   $0x2e
  jmp alltraps
  105f94:	e9 b7 f9 ff ff       	jmp    105950 <alltraps>

00105f99 <vector47>:
.globl vector47
vector47:
  pushl $0
  105f99:	6a 00                	push   $0x0
  pushl $47
  105f9b:	6a 2f                	push   $0x2f
  jmp alltraps
  105f9d:	e9 ae f9 ff ff       	jmp    105950 <alltraps>

00105fa2 <vector48>:
.globl vector48
vector48:
  pushl $0
  105fa2:	6a 00                	push   $0x0
  pushl $48
  105fa4:	6a 30                	push   $0x30
  jmp alltraps
  105fa6:	e9 a5 f9 ff ff       	jmp    105950 <alltraps>

00105fab <vector49>:
.globl vector49
vector49:
  pushl $0
  105fab:	6a 00                	push   $0x0
  pushl $49
  105fad:	6a 31                	push   $0x31
  jmp alltraps
  105faf:	e9 9c f9 ff ff       	jmp    105950 <alltraps>

00105fb4 <vector50>:
.globl vector50
vector50:
  pushl $0
  105fb4:	6a 00                	push   $0x0
  pushl $50
  105fb6:	6a 32                	push   $0x32
  jmp alltraps
  105fb8:	e9 93 f9 ff ff       	jmp    105950 <alltraps>

00105fbd <vector51>:
.globl vector51
vector51:
  pushl $0
  105fbd:	6a 00                	push   $0x0
  pushl $51
  105fbf:	6a 33                	push   $0x33
  jmp alltraps
  105fc1:	e9 8a f9 ff ff       	jmp    105950 <alltraps>

00105fc6 <vector52>:
.globl vector52
vector52:
  pushl $0
  105fc6:	6a 00                	push   $0x0
  pushl $52
  105fc8:	6a 34                	push   $0x34
  jmp alltraps
  105fca:	e9 81 f9 ff ff       	jmp    105950 <alltraps>

00105fcf <vector53>:
.globl vector53
vector53:
  pushl $0
  105fcf:	6a 00                	push   $0x0
  pushl $53
  105fd1:	6a 35                	push   $0x35
  jmp alltraps
  105fd3:	e9 78 f9 ff ff       	jmp    105950 <alltraps>

00105fd8 <vector54>:
.globl vector54
vector54:
  pushl $0
  105fd8:	6a 00                	push   $0x0
  pushl $54
  105fda:	6a 36                	push   $0x36
  jmp alltraps
  105fdc:	e9 6f f9 ff ff       	jmp    105950 <alltraps>

00105fe1 <vector55>:
.globl vector55
vector55:
  pushl $0
  105fe1:	6a 00                	push   $0x0
  pushl $55
  105fe3:	6a 37                	push   $0x37
  jmp alltraps
  105fe5:	e9 66 f9 ff ff       	jmp    105950 <alltraps>

00105fea <vector56>:
.globl vector56
vector56:
  pushl $0
  105fea:	6a 00                	push   $0x0
  pushl $56
  105fec:	6a 38                	push   $0x38
  jmp alltraps
  105fee:	e9 5d f9 ff ff       	jmp    105950 <alltraps>

00105ff3 <vector57>:
.globl vector57
vector57:
  pushl $0
  105ff3:	6a 00                	push   $0x0
  pushl $57
  105ff5:	6a 39                	push   $0x39
  jmp alltraps
  105ff7:	e9 54 f9 ff ff       	jmp    105950 <alltraps>

00105ffc <vector58>:
.globl vector58
vector58:
  pushl $0
  105ffc:	6a 00                	push   $0x0
  pushl $58
  105ffe:	6a 3a                	push   $0x3a
  jmp alltraps
  106000:	e9 4b f9 ff ff       	jmp    105950 <alltraps>

00106005 <vector59>:
.globl vector59
vector59:
  pushl $0
  106005:	6a 00                	push   $0x0
  pushl $59
  106007:	6a 3b                	push   $0x3b
  jmp alltraps
  106009:	e9 42 f9 ff ff       	jmp    105950 <alltraps>

0010600e <vector60>:
.globl vector60
vector60:
  pushl $0
  10600e:	6a 00                	push   $0x0
  pushl $60
  106010:	6a 3c                	push   $0x3c
  jmp alltraps
  106012:	e9 39 f9 ff ff       	jmp    105950 <alltraps>

00106017 <vector61>:
.globl vector61
vector61:
  pushl $0
  106017:	6a 00                	push   $0x0
  pushl $61
  106019:	6a 3d                	push   $0x3d
  jmp alltraps
  10601b:	e9 30 f9 ff ff       	jmp    105950 <alltraps>

00106020 <vector62>:
.globl vector62
vector62:
  pushl $0
  106020:	6a 00                	push   $0x0
  pushl $62
  106022:	6a 3e                	push   $0x3e
  jmp alltraps
  106024:	e9 27 f9 ff ff       	jmp    105950 <alltraps>

00106029 <vector63>:
.globl vector63
vector63:
  pushl $0
  106029:	6a 00                	push   $0x0
  pushl $63
  10602b:	6a 3f                	push   $0x3f
  jmp alltraps
  10602d:	e9 1e f9 ff ff       	jmp    105950 <alltraps>

00106032 <vector64>:
.globl vector64
vector64:
  pushl $0
  106032:	6a 00                	push   $0x0
  pushl $64
  106034:	6a 40                	push   $0x40
  jmp alltraps
  106036:	e9 15 f9 ff ff       	jmp    105950 <alltraps>

0010603b <vector65>:
.globl vector65
vector65:
  pushl $0
  10603b:	6a 00                	push   $0x0
  pushl $65
  10603d:	6a 41                	push   $0x41
  jmp alltraps
  10603f:	e9 0c f9 ff ff       	jmp    105950 <alltraps>

00106044 <vector66>:
.globl vector66
vector66:
  pushl $0
  106044:	6a 00                	push   $0x0
  pushl $66
  106046:	6a 42                	push   $0x42
  jmp alltraps
  106048:	e9 03 f9 ff ff       	jmp    105950 <alltraps>

0010604d <vector67>:
.globl vector67
vector67:
  pushl $0
  10604d:	6a 00                	push   $0x0
  pushl $67
  10604f:	6a 43                	push   $0x43
  jmp alltraps
  106051:	e9 fa f8 ff ff       	jmp    105950 <alltraps>

00106056 <vector68>:
.globl vector68
vector68:
  pushl $0
  106056:	6a 00                	push   $0x0
  pushl $68
  106058:	6a 44                	push   $0x44
  jmp alltraps
  10605a:	e9 f1 f8 ff ff       	jmp    105950 <alltraps>

0010605f <vector69>:
.globl vector69
vector69:
  pushl $0
  10605f:	6a 00                	push   $0x0
  pushl $69
  106061:	6a 45                	push   $0x45
  jmp alltraps
  106063:	e9 e8 f8 ff ff       	jmp    105950 <alltraps>

00106068 <vector70>:
.globl vector70
vector70:
  pushl $0
  106068:	6a 00                	push   $0x0
  pushl $70
  10606a:	6a 46                	push   $0x46
  jmp alltraps
  10606c:	e9 df f8 ff ff       	jmp    105950 <alltraps>

00106071 <vector71>:
.globl vector71
vector71:
  pushl $0
  106071:	6a 00                	push   $0x0
  pushl $71
  106073:	6a 47                	push   $0x47
  jmp alltraps
  106075:	e9 d6 f8 ff ff       	jmp    105950 <alltraps>

0010607a <vector72>:
.globl vector72
vector72:
  pushl $0
  10607a:	6a 00                	push   $0x0
  pushl $72
  10607c:	6a 48                	push   $0x48
  jmp alltraps
  10607e:	e9 cd f8 ff ff       	jmp    105950 <alltraps>

00106083 <vector73>:
.globl vector73
vector73:
  pushl $0
  106083:	6a 00                	push   $0x0
  pushl $73
  106085:	6a 49                	push   $0x49
  jmp alltraps
  106087:	e9 c4 f8 ff ff       	jmp    105950 <alltraps>

0010608c <vector74>:
.globl vector74
vector74:
  pushl $0
  10608c:	6a 00                	push   $0x0
  pushl $74
  10608e:	6a 4a                	push   $0x4a
  jmp alltraps
  106090:	e9 bb f8 ff ff       	jmp    105950 <alltraps>

00106095 <vector75>:
.globl vector75
vector75:
  pushl $0
  106095:	6a 00                	push   $0x0
  pushl $75
  106097:	6a 4b                	push   $0x4b
  jmp alltraps
  106099:	e9 b2 f8 ff ff       	jmp    105950 <alltraps>

0010609e <vector76>:
.globl vector76
vector76:
  pushl $0
  10609e:	6a 00                	push   $0x0
  pushl $76
  1060a0:	6a 4c                	push   $0x4c
  jmp alltraps
  1060a2:	e9 a9 f8 ff ff       	jmp    105950 <alltraps>

001060a7 <vector77>:
.globl vector77
vector77:
  pushl $0
  1060a7:	6a 00                	push   $0x0
  pushl $77
  1060a9:	6a 4d                	push   $0x4d
  jmp alltraps
  1060ab:	e9 a0 f8 ff ff       	jmp    105950 <alltraps>

001060b0 <vector78>:
.globl vector78
vector78:
  pushl $0
  1060b0:	6a 00                	push   $0x0
  pushl $78
  1060b2:	6a 4e                	push   $0x4e
  jmp alltraps
  1060b4:	e9 97 f8 ff ff       	jmp    105950 <alltraps>

001060b9 <vector79>:
.globl vector79
vector79:
  pushl $0
  1060b9:	6a 00                	push   $0x0
  pushl $79
  1060bb:	6a 4f                	push   $0x4f
  jmp alltraps
  1060bd:	e9 8e f8 ff ff       	jmp    105950 <alltraps>

001060c2 <vector80>:
.globl vector80
vector80:
  pushl $0
  1060c2:	6a 00                	push   $0x0
  pushl $80
  1060c4:	6a 50                	push   $0x50
  jmp alltraps
  1060c6:	e9 85 f8 ff ff       	jmp    105950 <alltraps>

001060cb <vector81>:
.globl vector81
vector81:
  pushl $0
  1060cb:	6a 00                	push   $0x0
  pushl $81
  1060cd:	6a 51                	push   $0x51
  jmp alltraps
  1060cf:	e9 7c f8 ff ff       	jmp    105950 <alltraps>

001060d4 <vector82>:
.globl vector82
vector82:
  pushl $0
  1060d4:	6a 00                	push   $0x0
  pushl $82
  1060d6:	6a 52                	push   $0x52
  jmp alltraps
  1060d8:	e9 73 f8 ff ff       	jmp    105950 <alltraps>

001060dd <vector83>:
.globl vector83
vector83:
  pushl $0
  1060dd:	6a 00                	push   $0x0
  pushl $83
  1060df:	6a 53                	push   $0x53
  jmp alltraps
  1060e1:	e9 6a f8 ff ff       	jmp    105950 <alltraps>

001060e6 <vector84>:
.globl vector84
vector84:
  pushl $0
  1060e6:	6a 00                	push   $0x0
  pushl $84
  1060e8:	6a 54                	push   $0x54
  jmp alltraps
  1060ea:	e9 61 f8 ff ff       	jmp    105950 <alltraps>

001060ef <vector85>:
.globl vector85
vector85:
  pushl $0
  1060ef:	6a 00                	push   $0x0
  pushl $85
  1060f1:	6a 55                	push   $0x55
  jmp alltraps
  1060f3:	e9 58 f8 ff ff       	jmp    105950 <alltraps>

001060f8 <vector86>:
.globl vector86
vector86:
  pushl $0
  1060f8:	6a 00                	push   $0x0
  pushl $86
  1060fa:	6a 56                	push   $0x56
  jmp alltraps
  1060fc:	e9 4f f8 ff ff       	jmp    105950 <alltraps>

00106101 <vector87>:
.globl vector87
vector87:
  pushl $0
  106101:	6a 00                	push   $0x0
  pushl $87
  106103:	6a 57                	push   $0x57
  jmp alltraps
  106105:	e9 46 f8 ff ff       	jmp    105950 <alltraps>

0010610a <vector88>:
.globl vector88
vector88:
  pushl $0
  10610a:	6a 00                	push   $0x0
  pushl $88
  10610c:	6a 58                	push   $0x58
  jmp alltraps
  10610e:	e9 3d f8 ff ff       	jmp    105950 <alltraps>

00106113 <vector89>:
.globl vector89
vector89:
  pushl $0
  106113:	6a 00                	push   $0x0
  pushl $89
  106115:	6a 59                	push   $0x59
  jmp alltraps
  106117:	e9 34 f8 ff ff       	jmp    105950 <alltraps>

0010611c <vector90>:
.globl vector90
vector90:
  pushl $0
  10611c:	6a 00                	push   $0x0
  pushl $90
  10611e:	6a 5a                	push   $0x5a
  jmp alltraps
  106120:	e9 2b f8 ff ff       	jmp    105950 <alltraps>

00106125 <vector91>:
.globl vector91
vector91:
  pushl $0
  106125:	6a 00                	push   $0x0
  pushl $91
  106127:	6a 5b                	push   $0x5b
  jmp alltraps
  106129:	e9 22 f8 ff ff       	jmp    105950 <alltraps>

0010612e <vector92>:
.globl vector92
vector92:
  pushl $0
  10612e:	6a 00                	push   $0x0
  pushl $92
  106130:	6a 5c                	push   $0x5c
  jmp alltraps
  106132:	e9 19 f8 ff ff       	jmp    105950 <alltraps>

00106137 <vector93>:
.globl vector93
vector93:
  pushl $0
  106137:	6a 00                	push   $0x0
  pushl $93
  106139:	6a 5d                	push   $0x5d
  jmp alltraps
  10613b:	e9 10 f8 ff ff       	jmp    105950 <alltraps>

00106140 <vector94>:
.globl vector94
vector94:
  pushl $0
  106140:	6a 00                	push   $0x0
  pushl $94
  106142:	6a 5e                	push   $0x5e
  jmp alltraps
  106144:	e9 07 f8 ff ff       	jmp    105950 <alltraps>

00106149 <vector95>:
.globl vector95
vector95:
  pushl $0
  106149:	6a 00                	push   $0x0
  pushl $95
  10614b:	6a 5f                	push   $0x5f
  jmp alltraps
  10614d:	e9 fe f7 ff ff       	jmp    105950 <alltraps>

00106152 <vector96>:
.globl vector96
vector96:
  pushl $0
  106152:	6a 00                	push   $0x0
  pushl $96
  106154:	6a 60                	push   $0x60
  jmp alltraps
  106156:	e9 f5 f7 ff ff       	jmp    105950 <alltraps>

0010615b <vector97>:
.globl vector97
vector97:
  pushl $0
  10615b:	6a 00                	push   $0x0
  pushl $97
  10615d:	6a 61                	push   $0x61
  jmp alltraps
  10615f:	e9 ec f7 ff ff       	jmp    105950 <alltraps>

00106164 <vector98>:
.globl vector98
vector98:
  pushl $0
  106164:	6a 00                	push   $0x0
  pushl $98
  106166:	6a 62                	push   $0x62
  jmp alltraps
  106168:	e9 e3 f7 ff ff       	jmp    105950 <alltraps>

0010616d <vector99>:
.globl vector99
vector99:
  pushl $0
  10616d:	6a 00                	push   $0x0
  pushl $99
  10616f:	6a 63                	push   $0x63
  jmp alltraps
  106171:	e9 da f7 ff ff       	jmp    105950 <alltraps>

00106176 <vector100>:
.globl vector100
vector100:
  pushl $0
  106176:	6a 00                	push   $0x0
  pushl $100
  106178:	6a 64                	push   $0x64
  jmp alltraps
  10617a:	e9 d1 f7 ff ff       	jmp    105950 <alltraps>

0010617f <vector101>:
.globl vector101
vector101:
  pushl $0
  10617f:	6a 00                	push   $0x0
  pushl $101
  106181:	6a 65                	push   $0x65
  jmp alltraps
  106183:	e9 c8 f7 ff ff       	jmp    105950 <alltraps>

00106188 <vector102>:
.globl vector102
vector102:
  pushl $0
  106188:	6a 00                	push   $0x0
  pushl $102
  10618a:	6a 66                	push   $0x66
  jmp alltraps
  10618c:	e9 bf f7 ff ff       	jmp    105950 <alltraps>

00106191 <vector103>:
.globl vector103
vector103:
  pushl $0
  106191:	6a 00                	push   $0x0
  pushl $103
  106193:	6a 67                	push   $0x67
  jmp alltraps
  106195:	e9 b6 f7 ff ff       	jmp    105950 <alltraps>

0010619a <vector104>:
.globl vector104
vector104:
  pushl $0
  10619a:	6a 00                	push   $0x0
  pushl $104
  10619c:	6a 68                	push   $0x68
  jmp alltraps
  10619e:	e9 ad f7 ff ff       	jmp    105950 <alltraps>

001061a3 <vector105>:
.globl vector105
vector105:
  pushl $0
  1061a3:	6a 00                	push   $0x0
  pushl $105
  1061a5:	6a 69                	push   $0x69
  jmp alltraps
  1061a7:	e9 a4 f7 ff ff       	jmp    105950 <alltraps>

001061ac <vector106>:
.globl vector106
vector106:
  pushl $0
  1061ac:	6a 00                	push   $0x0
  pushl $106
  1061ae:	6a 6a                	push   $0x6a
  jmp alltraps
  1061b0:	e9 9b f7 ff ff       	jmp    105950 <alltraps>

001061b5 <vector107>:
.globl vector107
vector107:
  pushl $0
  1061b5:	6a 00                	push   $0x0
  pushl $107
  1061b7:	6a 6b                	push   $0x6b
  jmp alltraps
  1061b9:	e9 92 f7 ff ff       	jmp    105950 <alltraps>

001061be <vector108>:
.globl vector108
vector108:
  pushl $0
  1061be:	6a 00                	push   $0x0
  pushl $108
  1061c0:	6a 6c                	push   $0x6c
  jmp alltraps
  1061c2:	e9 89 f7 ff ff       	jmp    105950 <alltraps>

001061c7 <vector109>:
.globl vector109
vector109:
  pushl $0
  1061c7:	6a 00                	push   $0x0
  pushl $109
  1061c9:	6a 6d                	push   $0x6d
  jmp alltraps
  1061cb:	e9 80 f7 ff ff       	jmp    105950 <alltraps>

001061d0 <vector110>:
.globl vector110
vector110:
  pushl $0
  1061d0:	6a 00                	push   $0x0
  pushl $110
  1061d2:	6a 6e                	push   $0x6e
  jmp alltraps
  1061d4:	e9 77 f7 ff ff       	jmp    105950 <alltraps>

001061d9 <vector111>:
.globl vector111
vector111:
  pushl $0
  1061d9:	6a 00                	push   $0x0
  pushl $111
  1061db:	6a 6f                	push   $0x6f
  jmp alltraps
  1061dd:	e9 6e f7 ff ff       	jmp    105950 <alltraps>

001061e2 <vector112>:
.globl vector112
vector112:
  pushl $0
  1061e2:	6a 00                	push   $0x0
  pushl $112
  1061e4:	6a 70                	push   $0x70
  jmp alltraps
  1061e6:	e9 65 f7 ff ff       	jmp    105950 <alltraps>

001061eb <vector113>:
.globl vector113
vector113:
  pushl $0
  1061eb:	6a 00                	push   $0x0
  pushl $113
  1061ed:	6a 71                	push   $0x71
  jmp alltraps
  1061ef:	e9 5c f7 ff ff       	jmp    105950 <alltraps>

001061f4 <vector114>:
.globl vector114
vector114:
  pushl $0
  1061f4:	6a 00                	push   $0x0
  pushl $114
  1061f6:	6a 72                	push   $0x72
  jmp alltraps
  1061f8:	e9 53 f7 ff ff       	jmp    105950 <alltraps>

001061fd <vector115>:
.globl vector115
vector115:
  pushl $0
  1061fd:	6a 00                	push   $0x0
  pushl $115
  1061ff:	6a 73                	push   $0x73
  jmp alltraps
  106201:	e9 4a f7 ff ff       	jmp    105950 <alltraps>

00106206 <vector116>:
.globl vector116
vector116:
  pushl $0
  106206:	6a 00                	push   $0x0
  pushl $116
  106208:	6a 74                	push   $0x74
  jmp alltraps
  10620a:	e9 41 f7 ff ff       	jmp    105950 <alltraps>

0010620f <vector117>:
.globl vector117
vector117:
  pushl $0
  10620f:	6a 00                	push   $0x0
  pushl $117
  106211:	6a 75                	push   $0x75
  jmp alltraps
  106213:	e9 38 f7 ff ff       	jmp    105950 <alltraps>

00106218 <vector118>:
.globl vector118
vector118:
  pushl $0
  106218:	6a 00                	push   $0x0
  pushl $118
  10621a:	6a 76                	push   $0x76
  jmp alltraps
  10621c:	e9 2f f7 ff ff       	jmp    105950 <alltraps>

00106221 <vector119>:
.globl vector119
vector119:
  pushl $0
  106221:	6a 00                	push   $0x0
  pushl $119
  106223:	6a 77                	push   $0x77
  jmp alltraps
  106225:	e9 26 f7 ff ff       	jmp    105950 <alltraps>

0010622a <vector120>:
.globl vector120
vector120:
  pushl $0
  10622a:	6a 00                	push   $0x0
  pushl $120
  10622c:	6a 78                	push   $0x78
  jmp alltraps
  10622e:	e9 1d f7 ff ff       	jmp    105950 <alltraps>

00106233 <vector121>:
.globl vector121
vector121:
  pushl $0
  106233:	6a 00                	push   $0x0
  pushl $121
  106235:	6a 79                	push   $0x79
  jmp alltraps
  106237:	e9 14 f7 ff ff       	jmp    105950 <alltraps>

0010623c <vector122>:
.globl vector122
vector122:
  pushl $0
  10623c:	6a 00                	push   $0x0
  pushl $122
  10623e:	6a 7a                	push   $0x7a
  jmp alltraps
  106240:	e9 0b f7 ff ff       	jmp    105950 <alltraps>

00106245 <vector123>:
.globl vector123
vector123:
  pushl $0
  106245:	6a 00                	push   $0x0
  pushl $123
  106247:	6a 7b                	push   $0x7b
  jmp alltraps
  106249:	e9 02 f7 ff ff       	jmp    105950 <alltraps>

0010624e <vector124>:
.globl vector124
vector124:
  pushl $0
  10624e:	6a 00                	push   $0x0
  pushl $124
  106250:	6a 7c                	push   $0x7c
  jmp alltraps
  106252:	e9 f9 f6 ff ff       	jmp    105950 <alltraps>

00106257 <vector125>:
.globl vector125
vector125:
  pushl $0
  106257:	6a 00                	push   $0x0
  pushl $125
  106259:	6a 7d                	push   $0x7d
  jmp alltraps
  10625b:	e9 f0 f6 ff ff       	jmp    105950 <alltraps>

00106260 <vector126>:
.globl vector126
vector126:
  pushl $0
  106260:	6a 00                	push   $0x0
  pushl $126
  106262:	6a 7e                	push   $0x7e
  jmp alltraps
  106264:	e9 e7 f6 ff ff       	jmp    105950 <alltraps>

00106269 <vector127>:
.globl vector127
vector127:
  pushl $0
  106269:	6a 00                	push   $0x0
  pushl $127
  10626b:	6a 7f                	push   $0x7f
  jmp alltraps
  10626d:	e9 de f6 ff ff       	jmp    105950 <alltraps>

00106272 <vector128>:
.globl vector128
vector128:
  pushl $0
  106272:	6a 00                	push   $0x0
  pushl $128
  106274:	68 80 00 00 00       	push   $0x80
  jmp alltraps
  106279:	e9 d2 f6 ff ff       	jmp    105950 <alltraps>

0010627e <vector129>:
.globl vector129
vector129:
  pushl $0
  10627e:	6a 00                	push   $0x0
  pushl $129
  106280:	68 81 00 00 00       	push   $0x81
  jmp alltraps
  106285:	e9 c6 f6 ff ff       	jmp    105950 <alltraps>

0010628a <vector130>:
.globl vector130
vector130:
  pushl $0
  10628a:	6a 00                	push   $0x0
  pushl $130
  10628c:	68 82 00 00 00       	push   $0x82
  jmp alltraps
  106291:	e9 ba f6 ff ff       	jmp    105950 <alltraps>

00106296 <vector131>:
.globl vector131
vector131:
  pushl $0
  106296:	6a 00                	push   $0x0
  pushl $131
  106298:	68 83 00 00 00       	push   $0x83
  jmp alltraps
  10629d:	e9 ae f6 ff ff       	jmp    105950 <alltraps>

001062a2 <vector132>:
.globl vector132
vector132:
  pushl $0
  1062a2:	6a 00                	push   $0x0
  pushl $132
  1062a4:	68 84 00 00 00       	push   $0x84
  jmp alltraps
  1062a9:	e9 a2 f6 ff ff       	jmp    105950 <alltraps>

001062ae <vector133>:
.globl vector133
vector133:
  pushl $0
  1062ae:	6a 00                	push   $0x0
  pushl $133
  1062b0:	68 85 00 00 00       	push   $0x85
  jmp alltraps
  1062b5:	e9 96 f6 ff ff       	jmp    105950 <alltraps>

001062ba <vector134>:
.globl vector134
vector134:
  pushl $0
  1062ba:	6a 00                	push   $0x0
  pushl $134
  1062bc:	68 86 00 00 00       	push   $0x86
  jmp alltraps
  1062c1:	e9 8a f6 ff ff       	jmp    105950 <alltraps>

001062c6 <vector135>:
.globl vector135
vector135:
  pushl $0
  1062c6:	6a 00                	push   $0x0
  pushl $135
  1062c8:	68 87 00 00 00       	push   $0x87
  jmp alltraps
  1062cd:	e9 7e f6 ff ff       	jmp    105950 <alltraps>

001062d2 <vector136>:
.globl vector136
vector136:
  pushl $0
  1062d2:	6a 00                	push   $0x0
  pushl $136
  1062d4:	68 88 00 00 00       	push   $0x88
  jmp alltraps
  1062d9:	e9 72 f6 ff ff       	jmp    105950 <alltraps>

001062de <vector137>:
.globl vector137
vector137:
  pushl $0
  1062de:	6a 00                	push   $0x0
  pushl $137
  1062e0:	68 89 00 00 00       	push   $0x89
  jmp alltraps
  1062e5:	e9 66 f6 ff ff       	jmp    105950 <alltraps>

001062ea <vector138>:
.globl vector138
vector138:
  pushl $0
  1062ea:	6a 00                	push   $0x0
  pushl $138
  1062ec:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
  1062f1:	e9 5a f6 ff ff       	jmp    105950 <alltraps>

001062f6 <vector139>:
.globl vector139
vector139:
  pushl $0
  1062f6:	6a 00                	push   $0x0
  pushl $139
  1062f8:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
  1062fd:	e9 4e f6 ff ff       	jmp    105950 <alltraps>

00106302 <vector140>:
.globl vector140
vector140:
  pushl $0
  106302:	6a 00                	push   $0x0
  pushl $140
  106304:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
  106309:	e9 42 f6 ff ff       	jmp    105950 <alltraps>

0010630e <vector141>:
.globl vector141
vector141:
  pushl $0
  10630e:	6a 00                	push   $0x0
  pushl $141
  106310:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
  106315:	e9 36 f6 ff ff       	jmp    105950 <alltraps>

0010631a <vector142>:
.globl vector142
vector142:
  pushl $0
  10631a:	6a 00                	push   $0x0
  pushl $142
  10631c:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
  106321:	e9 2a f6 ff ff       	jmp    105950 <alltraps>

00106326 <vector143>:
.globl vector143
vector143:
  pushl $0
  106326:	6a 00                	push   $0x0
  pushl $143
  106328:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
  10632d:	e9 1e f6 ff ff       	jmp    105950 <alltraps>

00106332 <vector144>:
.globl vector144
vector144:
  pushl $0
  106332:	6a 00                	push   $0x0
  pushl $144
  106334:	68 90 00 00 00       	push   $0x90
  jmp alltraps
  106339:	e9 12 f6 ff ff       	jmp    105950 <alltraps>

0010633e <vector145>:
.globl vector145
vector145:
  pushl $0
  10633e:	6a 00                	push   $0x0
  pushl $145
  106340:	68 91 00 00 00       	push   $0x91
  jmp alltraps
  106345:	e9 06 f6 ff ff       	jmp    105950 <alltraps>

0010634a <vector146>:
.globl vector146
vector146:
  pushl $0
  10634a:	6a 00                	push   $0x0
  pushl $146
  10634c:	68 92 00 00 00       	push   $0x92
  jmp alltraps
  106351:	e9 fa f5 ff ff       	jmp    105950 <alltraps>

00106356 <vector147>:
.globl vector147
vector147:
  pushl $0
  106356:	6a 00                	push   $0x0
  pushl $147
  106358:	68 93 00 00 00       	push   $0x93
  jmp alltraps
  10635d:	e9 ee f5 ff ff       	jmp    105950 <alltraps>

00106362 <vector148>:
.globl vector148
vector148:
  pushl $0
  106362:	6a 00                	push   $0x0
  pushl $148
  106364:	68 94 00 00 00       	push   $0x94
  jmp alltraps
  106369:	e9 e2 f5 ff ff       	jmp    105950 <alltraps>

0010636e <vector149>:
.globl vector149
vector149:
  pushl $0
  10636e:	6a 00                	push   $0x0
  pushl $149
  106370:	68 95 00 00 00       	push   $0x95
  jmp alltraps
  106375:	e9 d6 f5 ff ff       	jmp    105950 <alltraps>

0010637a <vector150>:
.globl vector150
vector150:
  pushl $0
  10637a:	6a 00                	push   $0x0
  pushl $150
  10637c:	68 96 00 00 00       	push   $0x96
  jmp alltraps
  106381:	e9 ca f5 ff ff       	jmp    105950 <alltraps>

00106386 <vector151>:
.globl vector151
vector151:
  pushl $0
  106386:	6a 00                	push   $0x0
  pushl $151
  106388:	68 97 00 00 00       	push   $0x97
  jmp alltraps
  10638d:	e9 be f5 ff ff       	jmp    105950 <alltraps>

00106392 <vector152>:
.globl vector152
vector152:
  pushl $0
  106392:	6a 00                	push   $0x0
  pushl $152
  106394:	68 98 00 00 00       	push   $0x98
  jmp alltraps
  106399:	e9 b2 f5 ff ff       	jmp    105950 <alltraps>

0010639e <vector153>:
.globl vector153
vector153:
  pushl $0
  10639e:	6a 00                	push   $0x0
  pushl $153
  1063a0:	68 99 00 00 00       	push   $0x99
  jmp alltraps
  1063a5:	e9 a6 f5 ff ff       	jmp    105950 <alltraps>

001063aa <vector154>:
.globl vector154
vector154:
  pushl $0
  1063aa:	6a 00                	push   $0x0
  pushl $154
  1063ac:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
  1063b1:	e9 9a f5 ff ff       	jmp    105950 <alltraps>

001063b6 <vector155>:
.globl vector155
vector155:
  pushl $0
  1063b6:	6a 00                	push   $0x0
  pushl $155
  1063b8:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
  1063bd:	e9 8e f5 ff ff       	jmp    105950 <alltraps>

001063c2 <vector156>:
.globl vector156
vector156:
  pushl $0
  1063c2:	6a 00                	push   $0x0
  pushl $156
  1063c4:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
  1063c9:	e9 82 f5 ff ff       	jmp    105950 <alltraps>

001063ce <vector157>:
.globl vector157
vector157:
  pushl $0
  1063ce:	6a 00                	push   $0x0
  pushl $157
  1063d0:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
  1063d5:	e9 76 f5 ff ff       	jmp    105950 <alltraps>

001063da <vector158>:
.globl vector158
vector158:
  pushl $0
  1063da:	6a 00                	push   $0x0
  pushl $158
  1063dc:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
  1063e1:	e9 6a f5 ff ff       	jmp    105950 <alltraps>

001063e6 <vector159>:
.globl vector159
vector159:
  pushl $0
  1063e6:	6a 00                	push   $0x0
  pushl $159
  1063e8:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
  1063ed:	e9 5e f5 ff ff       	jmp    105950 <alltraps>

001063f2 <vector160>:
.globl vector160
vector160:
  pushl $0
  1063f2:	6a 00                	push   $0x0
  pushl $160
  1063f4:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
  1063f9:	e9 52 f5 ff ff       	jmp    105950 <alltraps>

001063fe <vector161>:
.globl vector161
vector161:
  pushl $0
  1063fe:	6a 00                	push   $0x0
  pushl $161
  106400:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
  106405:	e9 46 f5 ff ff       	jmp    105950 <alltraps>

0010640a <vector162>:
.globl vector162
vector162:
  pushl $0
  10640a:	6a 00                	push   $0x0
  pushl $162
  10640c:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
  106411:	e9 3a f5 ff ff       	jmp    105950 <alltraps>

00106416 <vector163>:
.globl vector163
vector163:
  pushl $0
  106416:	6a 00                	push   $0x0
  pushl $163
  106418:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
  10641d:	e9 2e f5 ff ff       	jmp    105950 <alltraps>

00106422 <vector164>:
.globl vector164
vector164:
  pushl $0
  106422:	6a 00                	push   $0x0
  pushl $164
  106424:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
  106429:	e9 22 f5 ff ff       	jmp    105950 <alltraps>

0010642e <vector165>:
.globl vector165
vector165:
  pushl $0
  10642e:	6a 00                	push   $0x0
  pushl $165
  106430:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
  106435:	e9 16 f5 ff ff       	jmp    105950 <alltraps>

0010643a <vector166>:
.globl vector166
vector166:
  pushl $0
  10643a:	6a 00                	push   $0x0
  pushl $166
  10643c:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
  106441:	e9 0a f5 ff ff       	jmp    105950 <alltraps>

00106446 <vector167>:
.globl vector167
vector167:
  pushl $0
  106446:	6a 00                	push   $0x0
  pushl $167
  106448:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
  10644d:	e9 fe f4 ff ff       	jmp    105950 <alltraps>

00106452 <vector168>:
.globl vector168
vector168:
  pushl $0
  106452:	6a 00                	push   $0x0
  pushl $168
  106454:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
  106459:	e9 f2 f4 ff ff       	jmp    105950 <alltraps>

0010645e <vector169>:
.globl vector169
vector169:
  pushl $0
  10645e:	6a 00                	push   $0x0
  pushl $169
  106460:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
  106465:	e9 e6 f4 ff ff       	jmp    105950 <alltraps>

0010646a <vector170>:
.globl vector170
vector170:
  pushl $0
  10646a:	6a 00                	push   $0x0
  pushl $170
  10646c:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
  106471:	e9 da f4 ff ff       	jmp    105950 <alltraps>

00106476 <vector171>:
.globl vector171
vector171:
  pushl $0
  106476:	6a 00                	push   $0x0
  pushl $171
  106478:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
  10647d:	e9 ce f4 ff ff       	jmp    105950 <alltraps>

00106482 <vector172>:
.globl vector172
vector172:
  pushl $0
  106482:	6a 00                	push   $0x0
  pushl $172
  106484:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
  106489:	e9 c2 f4 ff ff       	jmp    105950 <alltraps>

0010648e <vector173>:
.globl vector173
vector173:
  pushl $0
  10648e:	6a 00                	push   $0x0
  pushl $173
  106490:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
  106495:	e9 b6 f4 ff ff       	jmp    105950 <alltraps>

0010649a <vector174>:
.globl vector174
vector174:
  pushl $0
  10649a:	6a 00                	push   $0x0
  pushl $174
  10649c:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
  1064a1:	e9 aa f4 ff ff       	jmp    105950 <alltraps>

001064a6 <vector175>:
.globl vector175
vector175:
  pushl $0
  1064a6:	6a 00                	push   $0x0
  pushl $175
  1064a8:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
  1064ad:	e9 9e f4 ff ff       	jmp    105950 <alltraps>

001064b2 <vector176>:
.globl vector176
vector176:
  pushl $0
  1064b2:	6a 00                	push   $0x0
  pushl $176
  1064b4:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
  1064b9:	e9 92 f4 ff ff       	jmp    105950 <alltraps>

001064be <vector177>:
.globl vector177
vector177:
  pushl $0
  1064be:	6a 00                	push   $0x0
  pushl $177
  1064c0:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
  1064c5:	e9 86 f4 ff ff       	jmp    105950 <alltraps>

001064ca <vector178>:
.globl vector178
vector178:
  pushl $0
  1064ca:	6a 00                	push   $0x0
  pushl $178
  1064cc:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
  1064d1:	e9 7a f4 ff ff       	jmp    105950 <alltraps>

001064d6 <vector179>:
.globl vector179
vector179:
  pushl $0
  1064d6:	6a 00                	push   $0x0
  pushl $179
  1064d8:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
  1064dd:	e9 6e f4 ff ff       	jmp    105950 <alltraps>

001064e2 <vector180>:
.globl vector180
vector180:
  pushl $0
  1064e2:	6a 00                	push   $0x0
  pushl $180
  1064e4:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
  1064e9:	e9 62 f4 ff ff       	jmp    105950 <alltraps>

001064ee <vector181>:
.globl vector181
vector181:
  pushl $0
  1064ee:	6a 00                	push   $0x0
  pushl $181
  1064f0:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
  1064f5:	e9 56 f4 ff ff       	jmp    105950 <alltraps>

001064fa <vector182>:
.globl vector182
vector182:
  pushl $0
  1064fa:	6a 00                	push   $0x0
  pushl $182
  1064fc:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
  106501:	e9 4a f4 ff ff       	jmp    105950 <alltraps>

00106506 <vector183>:
.globl vector183
vector183:
  pushl $0
  106506:	6a 00                	push   $0x0
  pushl $183
  106508:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
  10650d:	e9 3e f4 ff ff       	jmp    105950 <alltraps>

00106512 <vector184>:
.globl vector184
vector184:
  pushl $0
  106512:	6a 00                	push   $0x0
  pushl $184
  106514:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
  106519:	e9 32 f4 ff ff       	jmp    105950 <alltraps>

0010651e <vector185>:
.globl vector185
vector185:
  pushl $0
  10651e:	6a 00                	push   $0x0
  pushl $185
  106520:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
  106525:	e9 26 f4 ff ff       	jmp    105950 <alltraps>

0010652a <vector186>:
.globl vector186
vector186:
  pushl $0
  10652a:	6a 00                	push   $0x0
  pushl $186
  10652c:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
  106531:	e9 1a f4 ff ff       	jmp    105950 <alltraps>

00106536 <vector187>:
.globl vector187
vector187:
  pushl $0
  106536:	6a 00                	push   $0x0
  pushl $187
  106538:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
  10653d:	e9 0e f4 ff ff       	jmp    105950 <alltraps>

00106542 <vector188>:
.globl vector188
vector188:
  pushl $0
  106542:	6a 00                	push   $0x0
  pushl $188
  106544:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
  106549:	e9 02 f4 ff ff       	jmp    105950 <alltraps>

0010654e <vector189>:
.globl vector189
vector189:
  pushl $0
  10654e:	6a 00                	push   $0x0
  pushl $189
  106550:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
  106555:	e9 f6 f3 ff ff       	jmp    105950 <alltraps>

0010655a <vector190>:
.globl vector190
vector190:
  pushl $0
  10655a:	6a 00                	push   $0x0
  pushl $190
  10655c:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
  106561:	e9 ea f3 ff ff       	jmp    105950 <alltraps>

00106566 <vector191>:
.globl vector191
vector191:
  pushl $0
  106566:	6a 00                	push   $0x0
  pushl $191
  106568:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
  10656d:	e9 de f3 ff ff       	jmp    105950 <alltraps>

00106572 <vector192>:
.globl vector192
vector192:
  pushl $0
  106572:	6a 00                	push   $0x0
  pushl $192
  106574:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
  106579:	e9 d2 f3 ff ff       	jmp    105950 <alltraps>

0010657e <vector193>:
.globl vector193
vector193:
  pushl $0
  10657e:	6a 00                	push   $0x0
  pushl $193
  106580:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
  106585:	e9 c6 f3 ff ff       	jmp    105950 <alltraps>

0010658a <vector194>:
.globl vector194
vector194:
  pushl $0
  10658a:	6a 00                	push   $0x0
  pushl $194
  10658c:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
  106591:	e9 ba f3 ff ff       	jmp    105950 <alltraps>

00106596 <vector195>:
.globl vector195
vector195:
  pushl $0
  106596:	6a 00                	push   $0x0
  pushl $195
  106598:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
  10659d:	e9 ae f3 ff ff       	jmp    105950 <alltraps>

001065a2 <vector196>:
.globl vector196
vector196:
  pushl $0
  1065a2:	6a 00                	push   $0x0
  pushl $196
  1065a4:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
  1065a9:	e9 a2 f3 ff ff       	jmp    105950 <alltraps>

001065ae <vector197>:
.globl vector197
vector197:
  pushl $0
  1065ae:	6a 00                	push   $0x0
  pushl $197
  1065b0:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
  1065b5:	e9 96 f3 ff ff       	jmp    105950 <alltraps>

001065ba <vector198>:
.globl vector198
vector198:
  pushl $0
  1065ba:	6a 00                	push   $0x0
  pushl $198
  1065bc:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
  1065c1:	e9 8a f3 ff ff       	jmp    105950 <alltraps>

001065c6 <vector199>:
.globl vector199
vector199:
  pushl $0
  1065c6:	6a 00                	push   $0x0
  pushl $199
  1065c8:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
  1065cd:	e9 7e f3 ff ff       	jmp    105950 <alltraps>

001065d2 <vector200>:
.globl vector200
vector200:
  pushl $0
  1065d2:	6a 00                	push   $0x0
  pushl $200
  1065d4:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
  1065d9:	e9 72 f3 ff ff       	jmp    105950 <alltraps>

001065de <vector201>:
.globl vector201
vector201:
  pushl $0
  1065de:	6a 00                	push   $0x0
  pushl $201
  1065e0:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
  1065e5:	e9 66 f3 ff ff       	jmp    105950 <alltraps>

001065ea <vector202>:
.globl vector202
vector202:
  pushl $0
  1065ea:	6a 00                	push   $0x0
  pushl $202
  1065ec:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
  1065f1:	e9 5a f3 ff ff       	jmp    105950 <alltraps>

001065f6 <vector203>:
.globl vector203
vector203:
  pushl $0
  1065f6:	6a 00                	push   $0x0
  pushl $203
  1065f8:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
  1065fd:	e9 4e f3 ff ff       	jmp    105950 <alltraps>

00106602 <vector204>:
.globl vector204
vector204:
  pushl $0
  106602:	6a 00                	push   $0x0
  pushl $204
  106604:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
  106609:	e9 42 f3 ff ff       	jmp    105950 <alltraps>

0010660e <vector205>:
.globl vector205
vector205:
  pushl $0
  10660e:	6a 00                	push   $0x0
  pushl $205
  106610:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
  106615:	e9 36 f3 ff ff       	jmp    105950 <alltraps>

0010661a <vector206>:
.globl vector206
vector206:
  pushl $0
  10661a:	6a 00                	push   $0x0
  pushl $206
  10661c:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
  106621:	e9 2a f3 ff ff       	jmp    105950 <alltraps>

00106626 <vector207>:
.globl vector207
vector207:
  pushl $0
  106626:	6a 00                	push   $0x0
  pushl $207
  106628:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
  10662d:	e9 1e f3 ff ff       	jmp    105950 <alltraps>

00106632 <vector208>:
.globl vector208
vector208:
  pushl $0
  106632:	6a 00                	push   $0x0
  pushl $208
  106634:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
  106639:	e9 12 f3 ff ff       	jmp    105950 <alltraps>

0010663e <vector209>:
.globl vector209
vector209:
  pushl $0
  10663e:	6a 00                	push   $0x0
  pushl $209
  106640:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
  106645:	e9 06 f3 ff ff       	jmp    105950 <alltraps>

0010664a <vector210>:
.globl vector210
vector210:
  pushl $0
  10664a:	6a 00                	push   $0x0
  pushl $210
  10664c:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
  106651:	e9 fa f2 ff ff       	jmp    105950 <alltraps>

00106656 <vector211>:
.globl vector211
vector211:
  pushl $0
  106656:	6a 00                	push   $0x0
  pushl $211
  106658:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
  10665d:	e9 ee f2 ff ff       	jmp    105950 <alltraps>

00106662 <vector212>:
.globl vector212
vector212:
  pushl $0
  106662:	6a 00                	push   $0x0
  pushl $212
  106664:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
  106669:	e9 e2 f2 ff ff       	jmp    105950 <alltraps>

0010666e <vector213>:
.globl vector213
vector213:
  pushl $0
  10666e:	6a 00                	push   $0x0
  pushl $213
  106670:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
  106675:	e9 d6 f2 ff ff       	jmp    105950 <alltraps>

0010667a <vector214>:
.globl vector214
vector214:
  pushl $0
  10667a:	6a 00                	push   $0x0
  pushl $214
  10667c:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
  106681:	e9 ca f2 ff ff       	jmp    105950 <alltraps>

00106686 <vector215>:
.globl vector215
vector215:
  pushl $0
  106686:	6a 00                	push   $0x0
  pushl $215
  106688:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
  10668d:	e9 be f2 ff ff       	jmp    105950 <alltraps>

00106692 <vector216>:
.globl vector216
vector216:
  pushl $0
  106692:	6a 00                	push   $0x0
  pushl $216
  106694:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
  106699:	e9 b2 f2 ff ff       	jmp    105950 <alltraps>

0010669e <vector217>:
.globl vector217
vector217:
  pushl $0
  10669e:	6a 00                	push   $0x0
  pushl $217
  1066a0:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
  1066a5:	e9 a6 f2 ff ff       	jmp    105950 <alltraps>

001066aa <vector218>:
.globl vector218
vector218:
  pushl $0
  1066aa:	6a 00                	push   $0x0
  pushl $218
  1066ac:	68 da 00 00 00       	push   $0xda
  jmp alltraps
  1066b1:	e9 9a f2 ff ff       	jmp    105950 <alltraps>

001066b6 <vector219>:
.globl vector219
vector219:
  pushl $0
  1066b6:	6a 00                	push   $0x0
  pushl $219
  1066b8:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
  1066bd:	e9 8e f2 ff ff       	jmp    105950 <alltraps>

001066c2 <vector220>:
.globl vector220
vector220:
  pushl $0
  1066c2:	6a 00                	push   $0x0
  pushl $220
  1066c4:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
  1066c9:	e9 82 f2 ff ff       	jmp    105950 <alltraps>

001066ce <vector221>:
.globl vector221
vector221:
  pushl $0
  1066ce:	6a 00                	push   $0x0
  pushl $221
  1066d0:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
  1066d5:	e9 76 f2 ff ff       	jmp    105950 <alltraps>

001066da <vector222>:
.globl vector222
vector222:
  pushl $0
  1066da:	6a 00                	push   $0x0
  pushl $222
  1066dc:	68 de 00 00 00       	push   $0xde
  jmp alltraps
  1066e1:	e9 6a f2 ff ff       	jmp    105950 <alltraps>

001066e6 <vector223>:
.globl vector223
vector223:
  pushl $0
  1066e6:	6a 00                	push   $0x0
  pushl $223
  1066e8:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
  1066ed:	e9 5e f2 ff ff       	jmp    105950 <alltraps>

001066f2 <vector224>:
.globl vector224
vector224:
  pushl $0
  1066f2:	6a 00                	push   $0x0
  pushl $224
  1066f4:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
  1066f9:	e9 52 f2 ff ff       	jmp    105950 <alltraps>

001066fe <vector225>:
.globl vector225
vector225:
  pushl $0
  1066fe:	6a 00                	push   $0x0
  pushl $225
  106700:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
  106705:	e9 46 f2 ff ff       	jmp    105950 <alltraps>

0010670a <vector226>:
.globl vector226
vector226:
  pushl $0
  10670a:	6a 00                	push   $0x0
  pushl $226
  10670c:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
  106711:	e9 3a f2 ff ff       	jmp    105950 <alltraps>

00106716 <vector227>:
.globl vector227
vector227:
  pushl $0
  106716:	6a 00                	push   $0x0
  pushl $227
  106718:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
  10671d:	e9 2e f2 ff ff       	jmp    105950 <alltraps>

00106722 <vector228>:
.globl vector228
vector228:
  pushl $0
  106722:	6a 00                	push   $0x0
  pushl $228
  106724:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
  106729:	e9 22 f2 ff ff       	jmp    105950 <alltraps>

0010672e <vector229>:
.globl vector229
vector229:
  pushl $0
  10672e:	6a 00                	push   $0x0
  pushl $229
  106730:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
  106735:	e9 16 f2 ff ff       	jmp    105950 <alltraps>

0010673a <vector230>:
.globl vector230
vector230:
  pushl $0
  10673a:	6a 00                	push   $0x0
  pushl $230
  10673c:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
  106741:	e9 0a f2 ff ff       	jmp    105950 <alltraps>

00106746 <vector231>:
.globl vector231
vector231:
  pushl $0
  106746:	6a 00                	push   $0x0
  pushl $231
  106748:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
  10674d:	e9 fe f1 ff ff       	jmp    105950 <alltraps>

00106752 <vector232>:
.globl vector232
vector232:
  pushl $0
  106752:	6a 00                	push   $0x0
  pushl $232
  106754:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
  106759:	e9 f2 f1 ff ff       	jmp    105950 <alltraps>

0010675e <vector233>:
.globl vector233
vector233:
  pushl $0
  10675e:	6a 00                	push   $0x0
  pushl $233
  106760:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
  106765:	e9 e6 f1 ff ff       	jmp    105950 <alltraps>

0010676a <vector234>:
.globl vector234
vector234:
  pushl $0
  10676a:	6a 00                	push   $0x0
  pushl $234
  10676c:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
  106771:	e9 da f1 ff ff       	jmp    105950 <alltraps>

00106776 <vector235>:
.globl vector235
vector235:
  pushl $0
  106776:	6a 00                	push   $0x0
  pushl $235
  106778:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
  10677d:	e9 ce f1 ff ff       	jmp    105950 <alltraps>

00106782 <vector236>:
.globl vector236
vector236:
  pushl $0
  106782:	6a 00                	push   $0x0
  pushl $236
  106784:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
  106789:	e9 c2 f1 ff ff       	jmp    105950 <alltraps>

0010678e <vector237>:
.globl vector237
vector237:
  pushl $0
  10678e:	6a 00                	push   $0x0
  pushl $237
  106790:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
  106795:	e9 b6 f1 ff ff       	jmp    105950 <alltraps>

0010679a <vector238>:
.globl vector238
vector238:
  pushl $0
  10679a:	6a 00                	push   $0x0
  pushl $238
  10679c:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
  1067a1:	e9 aa f1 ff ff       	jmp    105950 <alltraps>

001067a6 <vector239>:
.globl vector239
vector239:
  pushl $0
  1067a6:	6a 00                	push   $0x0
  pushl $239
  1067a8:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
  1067ad:	e9 9e f1 ff ff       	jmp    105950 <alltraps>

001067b2 <vector240>:
.globl vector240
vector240:
  pushl $0
  1067b2:	6a 00                	push   $0x0
  pushl $240
  1067b4:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
  1067b9:	e9 92 f1 ff ff       	jmp    105950 <alltraps>

001067be <vector241>:
.globl vector241
vector241:
  pushl $0
  1067be:	6a 00                	push   $0x0
  pushl $241
  1067c0:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
  1067c5:	e9 86 f1 ff ff       	jmp    105950 <alltraps>

001067ca <vector242>:
.globl vector242
vector242:
  pushl $0
  1067ca:	6a 00                	push   $0x0
  pushl $242
  1067cc:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
  1067d1:	e9 7a f1 ff ff       	jmp    105950 <alltraps>

001067d6 <vector243>:
.globl vector243
vector243:
  pushl $0
  1067d6:	6a 00                	push   $0x0
  pushl $243
  1067d8:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
  1067dd:	e9 6e f1 ff ff       	jmp    105950 <alltraps>

001067e2 <vector244>:
.globl vector244
vector244:
  pushl $0
  1067e2:	6a 00                	push   $0x0
  pushl $244
  1067e4:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
  1067e9:	e9 62 f1 ff ff       	jmp    105950 <alltraps>

001067ee <vector245>:
.globl vector245
vector245:
  pushl $0
  1067ee:	6a 00                	push   $0x0
  pushl $245
  1067f0:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
  1067f5:	e9 56 f1 ff ff       	jmp    105950 <alltraps>

001067fa <vector246>:
.globl vector246
vector246:
  pushl $0
  1067fa:	6a 00                	push   $0x0
  pushl $246
  1067fc:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
  106801:	e9 4a f1 ff ff       	jmp    105950 <alltraps>

00106806 <vector247>:
.globl vector247
vector247:
  pushl $0
  106806:	6a 00                	push   $0x0
  pushl $247
  106808:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
  10680d:	e9 3e f1 ff ff       	jmp    105950 <alltraps>

00106812 <vector248>:
.globl vector248
vector248:
  pushl $0
  106812:	6a 00                	push   $0x0
  pushl $248
  106814:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
  106819:	e9 32 f1 ff ff       	jmp    105950 <alltraps>

0010681e <vector249>:
.globl vector249
vector249:
  pushl $0
  10681e:	6a 00                	push   $0x0
  pushl $249
  106820:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
  106825:	e9 26 f1 ff ff       	jmp    105950 <alltraps>

0010682a <vector250>:
.globl vector250
vector250:
  pushl $0
  10682a:	6a 00                	push   $0x0
  pushl $250
  10682c:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
  106831:	e9 1a f1 ff ff       	jmp    105950 <alltraps>

00106836 <vector251>:
.globl vector251
vector251:
  pushl $0
  106836:	6a 00                	push   $0x0
  pushl $251
  106838:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
  10683d:	e9 0e f1 ff ff       	jmp    105950 <alltraps>

00106842 <vector252>:
.globl vector252
vector252:
  pushl $0
  106842:	6a 00                	push   $0x0
  pushl $252
  106844:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
  106849:	e9 02 f1 ff ff       	jmp    105950 <alltraps>

0010684e <vector253>:
.globl vector253
vector253:
  pushl $0
  10684e:	6a 00                	push   $0x0
  pushl $253
  106850:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
  106855:	e9 f6 f0 ff ff       	jmp    105950 <alltraps>

0010685a <vector254>:
.globl vector254
vector254:
  pushl $0
  10685a:	6a 00                	push   $0x0
  pushl $254
  10685c:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
  106861:	e9 ea f0 ff ff       	jmp    105950 <alltraps>

00106866 <vector255>:
.globl vector255
vector255:
  pushl $0
  106866:	6a 00                	push   $0x0
  pushl $255
  106868:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
  10686d:	e9 de f0 ff ff       	jmp    105950 <alltraps>
  106872:	90                   	nop
  106873:	90                   	nop
  106874:	90                   	nop
  106875:	90                   	nop
  106876:	90                   	nop
  106877:	90                   	nop
  106878:	90                   	nop
  106879:	90                   	nop
  10687a:	90                   	nop
  10687b:	90                   	nop
  10687c:	90                   	nop
  10687d:	90                   	nop
  10687e:	90                   	nop
  10687f:	90                   	nop

00106880 <vmenable>:
}

// Turn on paging.
void
vmenable(void)
{
  106880:	55                   	push   %ebp
}

static inline void
lcr3(uint val) 
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
  106881:	a1 70 92 10 00       	mov    0x109270,%eax
  106886:	89 e5                	mov    %esp,%ebp
  106888:	0f 22 d8             	mov    %eax,%cr3

static inline uint
rcr0(void)
{
  uint val;
  asm volatile("movl %%cr0,%0" : "=r" (val));
  10688b:	0f 20 c0             	mov    %cr0,%eax
}

static inline void
lcr0(uint val)
{
  asm volatile("movl %0,%%cr0" : : "r" (val));
  10688e:	0d 00 00 00 80       	or     $0x80000000,%eax
  106893:	0f 22 c0             	mov    %eax,%cr0

  switchkvm(); // load kpgdir into cr3
  cr0 = rcr0();
  cr0 |= CR0_PG;
  lcr0(cr0);
}
  106896:	5d                   	pop    %ebp
  106897:	c3                   	ret    
  106898:	90                   	nop
  106899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001068a0 <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm()
{
  1068a0:	55                   	push   %ebp
}

static inline void
lcr3(uint val) 
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
  1068a1:	a1 70 92 10 00       	mov    0x109270,%eax
  1068a6:	89 e5                	mov    %esp,%ebp
  1068a8:	0f 22 d8             	mov    %eax,%cr3
  lcr3(PADDR(kpgdir));   // switch to the kernel page table
}
  1068ab:	5d                   	pop    %ebp
  1068ac:	c3                   	ret    
  1068ad:	8d 76 00             	lea    0x0(%esi),%esi

001068b0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to linear address va.  If create!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int create)
{
  1068b0:	55                   	push   %ebp
  1068b1:	89 e5                	mov    %esp,%ebp
  1068b3:	83 ec 28             	sub    $0x28,%esp
  1068b6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  uint r;
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  1068b9:	89 d3                	mov    %edx,%ebx
  1068bb:	c1 eb 16             	shr    $0x16,%ebx
  1068be:	8d 1c 98             	lea    (%eax,%ebx,4),%ebx
// Return the address of the PTE in page table pgdir
// that corresponds to linear address va.  If create!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int create)
{
  1068c1:	89 75 fc             	mov    %esi,-0x4(%ebp)
  uint r;
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
  1068c4:	8b 33                	mov    (%ebx),%esi
  1068c6:	f7 c6 01 00 00 00    	test   $0x1,%esi
  1068cc:	74 22                	je     1068f0 <walkpgdir+0x40>
    pgtab = (pte_t*) PTE_ADDR(*pde);
  1068ce:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = PADDR(r) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
  1068d4:	c1 ea 0a             	shr    $0xa,%edx
  1068d7:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
  1068dd:	8d 04 16             	lea    (%esi,%edx,1),%eax
}
  1068e0:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  1068e3:	8b 75 fc             	mov    -0x4(%ebp),%esi
  1068e6:	89 ec                	mov    %ebp,%esp
  1068e8:	5d                   	pop    %ebp
  1068e9:	c3                   	ret    
  1068ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*) PTE_ADDR(*pde);
  } else if(!create || !(r = (uint) kalloc()))
  1068f0:	85 c9                	test   %ecx,%ecx
  1068f2:	75 04                	jne    1068f8 <walkpgdir+0x48>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = PADDR(r) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
  1068f4:	31 c0                	xor    %eax,%eax
  1068f6:	eb e8                	jmp    1068e0 <walkpgdir+0x30>
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*) PTE_ADDR(*pde);
  } else if(!create || !(r = (uint) kalloc()))
  1068f8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1068fb:	90                   	nop
  1068fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106900:	e8 eb bb ff ff       	call   1024f0 <kalloc>
  106905:	85 c0                	test   %eax,%eax
  106907:	74 eb                	je     1068f4 <walkpgdir+0x44>
    return 0;
  else {
    pgtab = (pte_t*) r;
  106909:	89 c6                	mov    %eax,%esi
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
  10690b:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106912:	00 
  106913:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10691a:	00 
  10691b:	89 04 24             	mov    %eax,(%esp)
  10691e:	e8 0d dd ff ff       	call   104630 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = PADDR(r) | PTE_P | PTE_W | PTE_U;
  106923:	89 f0                	mov    %esi,%eax
  106925:	83 c8 07             	or     $0x7,%eax
  106928:	89 03                	mov    %eax,(%ebx)
  10692a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10692d:	eb a5                	jmp    1068d4 <walkpgdir+0x24>
  10692f:	90                   	nop

00106930 <mappages>:
// Create PTEs for linear addresses starting at la that refer to
// physical addresses starting at pa. la and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *la, uint size, uint pa, int perm)
{
  106930:	55                   	push   %ebp
  106931:	89 e5                	mov    %esp,%ebp
  106933:	57                   	push   %edi
  106934:	56                   	push   %esi
  106935:	53                   	push   %ebx
  char *a = PGROUNDDOWN(la);
  106936:	89 d3                	mov    %edx,%ebx
  char *last = PGROUNDDOWN(la + size - 1);
  106938:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
// Create PTEs for linear addresses starting at la that refer to
// physical addresses starting at pa. la and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *la, uint size, uint pa, int perm)
{
  10693c:	83 ec 2c             	sub    $0x2c,%esp
  10693f:	8b 75 08             	mov    0x8(%ebp),%esi
  106942:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a = PGROUNDDOWN(la);
  106945:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  char *last = PGROUNDDOWN(la + size - 1);
  10694b:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    pte_t *pte = walkpgdir(pgdir, a, 1);
    if(pte == 0)
      return 0;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
  106951:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
  106955:	eb 1d                	jmp    106974 <mappages+0x44>
  106957:	90                   	nop

  while(1){
    pte_t *pte = walkpgdir(pgdir, a, 1);
    if(pte == 0)
      return 0;
    if(*pte & PTE_P)
  106958:	f6 00 01             	testb  $0x1,(%eax)
  10695b:	75 48                	jne    1069a5 <mappages+0x75>
      panic("remap");
    *pte = pa | perm | PTE_P;
  10695d:	8b 55 0c             	mov    0xc(%ebp),%edx
  106960:	09 f2                	or     %esi,%edx
    if(a == last)
  106962:	39 fb                	cmp    %edi,%ebx
    pte_t *pte = walkpgdir(pgdir, a, 1);
    if(pte == 0)
      return 0;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
  106964:	89 10                	mov    %edx,(%eax)
    if(a == last)
  106966:	74 30                	je     106998 <mappages+0x68>
      break;
    a += PGSIZE;
  106968:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
  10696e:	81 c6 00 10 00 00    	add    $0x1000,%esi
{
  char *a = PGROUNDDOWN(la);
  char *last = PGROUNDDOWN(la + size - 1);

  while(1){
    pte_t *pte = walkpgdir(pgdir, a, 1);
  106974:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106977:	b9 01 00 00 00       	mov    $0x1,%ecx
  10697c:	89 da                	mov    %ebx,%edx
  10697e:	e8 2d ff ff ff       	call   1068b0 <walkpgdir>
    if(pte == 0)
  106983:	85 c0                	test   %eax,%eax
  106985:	75 d1                	jne    106958 <mappages+0x28>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 1;
}
  106987:	83 c4 2c             	add    $0x2c,%esp
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  10698a:	31 c0                	xor    %eax,%eax
  return 1;
}
  10698c:	5b                   	pop    %ebx
  10698d:	5e                   	pop    %esi
  10698e:	5f                   	pop    %edi
  10698f:	5d                   	pop    %ebp
  106990:	c3                   	ret    
  106991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106998:	83 c4 2c             	add    $0x2c,%esp
    if(pte == 0)
      return 0;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
  10699b:	b8 01 00 00 00       	mov    $0x1,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 1;
}
  1069a0:	5b                   	pop    %ebx
  1069a1:	5e                   	pop    %esi
  1069a2:	5f                   	pop    %edi
  1069a3:	5d                   	pop    %ebp
  1069a4:	c3                   	ret    
  while(1){
    pte_t *pte = walkpgdir(pgdir, a, 1);
    if(pte == 0)
      return 0;
    if(*pte & PTE_P)
      panic("remap");
  1069a5:	c7 04 24 34 79 10 00 	movl   $0x107934,(%esp)
  1069ac:	e8 9f a1 ff ff       	call   100b50 <panic>
  1069b1:	eb 0d                	jmp    1069c0 <uva2ka>
  1069b3:	90                   	nop
  1069b4:	90                   	nop
  1069b5:	90                   	nop
  1069b6:	90                   	nop
  1069b7:	90                   	nop
  1069b8:	90                   	nop
  1069b9:	90                   	nop
  1069ba:	90                   	nop
  1069bb:	90                   	nop
  1069bc:	90                   	nop
  1069bd:	90                   	nop
  1069be:	90                   	nop
  1069bf:	90                   	nop

001069c0 <uva2ka>:
// maps to.  The result is also a kernel logical address,
// since the kernel maps the physical memory allocated to user
// processes directly.
char*
uva2ka(pde_t *pgdir, char *uva)
{    
  1069c0:	55                   	push   %ebp
  pte_t *pte = walkpgdir(pgdir, uva, 0);
  1069c1:	31 c9                	xor    %ecx,%ecx
// maps to.  The result is also a kernel logical address,
// since the kernel maps the physical memory allocated to user
// processes directly.
char*
uva2ka(pde_t *pgdir, char *uva)
{    
  1069c3:	89 e5                	mov    %esp,%ebp
  1069c5:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte = walkpgdir(pgdir, uva, 0);
  1069c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1069cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1069ce:	e8 dd fe ff ff       	call   1068b0 <walkpgdir>
  1069d3:	89 c2                	mov    %eax,%edx
  if(pte == 0) return 0;
  1069d5:	31 c0                	xor    %eax,%eax
  1069d7:	85 d2                	test   %edx,%edx
  1069d9:	74 07                	je     1069e2 <uva2ka+0x22>
  uint pa = PTE_ADDR(*pte);
  return (char *)pa;
  1069db:	8b 02                	mov    (%edx),%eax
  1069dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
  1069e2:	c9                   	leave  
  1069e3:	c3                   	ret    
  1069e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1069ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

001069f0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  1069f0:	55                   	push   %ebp
  1069f1:	89 e5                	mov    %esp,%ebp
  1069f3:	83 ec 38             	sub    $0x38,%esp
  1069f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1069f9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  1069fc:	89 75 f8             	mov    %esi,-0x8(%ebp)
  1069ff:	8b 75 10             	mov    0x10(%ebp),%esi
  106a02:	89 7d fc             	mov    %edi,-0x4(%ebp)
  106a05:	8b 7d 0c             	mov    0xc(%ebp),%edi
  106a08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem = kalloc();
  106a0b:	e8 e0 ba ff ff       	call   1024f0 <kalloc>
  if (sz >= PGSIZE)
  106a10:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem = kalloc();
  106a16:	89 c3                	mov    %eax,%ebx
  if (sz >= PGSIZE)
  106a18:	77 4c                	ja     106a66 <inituvm+0x76>
    panic("inituvm: more than a page");
  memset(mem, 0, PGSIZE);
  106a1a:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106a21:	00 
  106a22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106a29:	00 
  106a2a:	89 04 24             	mov    %eax,(%esp)
  106a2d:	e8 fe db ff ff       	call   104630 <memset>
  mappages(pgdir, 0, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  106a32:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106a37:	31 d2                	xor    %edx,%edx
  106a39:	89 1c 24             	mov    %ebx,(%esp)
  106a3c:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106a43:	00 
  106a44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106a47:	e8 e4 fe ff ff       	call   106930 <mappages>
  memmove(mem, init, sz);
  106a4c:	89 75 10             	mov    %esi,0x10(%ebp)
}
  106a4f:	8b 75 f8             	mov    -0x8(%ebp),%esi
  char *mem = kalloc();
  if (sz >= PGSIZE)
    panic("inituvm: more than a page");
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
  106a52:	89 7d 0c             	mov    %edi,0xc(%ebp)
}
  106a55:	8b 7d fc             	mov    -0x4(%ebp),%edi
  char *mem = kalloc();
  if (sz >= PGSIZE)
    panic("inituvm: more than a page");
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
  106a58:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
  106a5b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  106a5e:	89 ec                	mov    %ebp,%esp
  106a60:	5d                   	pop    %ebp
  char *mem = kalloc();
  if (sz >= PGSIZE)
    panic("inituvm: more than a page");
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
  106a61:	e9 4a dc ff ff       	jmp    1046b0 <memmove>
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem = kalloc();
  if (sz >= PGSIZE)
    panic("inituvm: more than a page");
  106a66:	c7 04 24 3a 79 10 00 	movl   $0x10793a,(%esp)
  106a6d:	e8 de a0 ff ff       	call   100b50 <panic>
  106a72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106a79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106a80 <setupkvm>:
}

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
  106a80:	55                   	push   %ebp
  106a81:	89 e5                	mov    %esp,%ebp
  106a83:	53                   	push   %ebx
  106a84:	83 ec 14             	sub    $0x14,%esp
  pde_t *pgdir;

  // Allocate page directory
  if(!(pgdir = (pde_t *) kalloc()))
  106a87:	e8 64 ba ff ff       	call   1024f0 <kalloc>
  106a8c:	85 c0                	test   %eax,%eax
  106a8e:	89 c3                	mov    %eax,%ebx
  106a90:	75 0e                	jne    106aa0 <setupkvm+0x20>
     !mappages(pgdir, (void *)0x100000, PHYSTOP-0x100000, 0x100000, PTE_W) ||
     // Map devices such as ioapic, lapic, ...
     !mappages(pgdir, (void *)0xFE000000, 0x2000000, 0xFE000000, PTE_W))
    return 0;
  return pgdir;
}
  106a92:	89 d8                	mov    %ebx,%eax
  106a94:	83 c4 14             	add    $0x14,%esp
  106a97:	5b                   	pop    %ebx
  106a98:	5d                   	pop    %ebp
  106a99:	c3                   	ret    
  106a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pde_t *pgdir;

  // Allocate page directory
  if(!(pgdir = (pde_t *) kalloc()))
    return 0;
  memset(pgdir, 0, PGSIZE);
  106aa0:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106aa7:	00 
  106aa8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106aaf:	00 
  106ab0:	89 04 24             	mov    %eax,(%esp)
  106ab3:	e8 78 db ff ff       	call   104630 <memset>
  if(// Map IO space from 640K to 1Mbyte
     !mappages(pgdir, (void *)USERTOP, 0x60000, USERTOP, PTE_W) ||
  106ab8:	b9 00 00 06 00       	mov    $0x60000,%ecx
  106abd:	ba 00 00 0a 00       	mov    $0xa0000,%edx
  106ac2:	89 d8                	mov    %ebx,%eax
  106ac4:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106acb:	00 
  106acc:	c7 04 24 00 00 0a 00 	movl   $0xa0000,(%esp)
  106ad3:	e8 58 fe ff ff       	call   106930 <mappages>

  // Allocate page directory
  if(!(pgdir = (pde_t *) kalloc()))
    return 0;
  memset(pgdir, 0, PGSIZE);
  if(// Map IO space from 640K to 1Mbyte
  106ad8:	85 c0                	test   %eax,%eax
  106ada:	75 0a                	jne    106ae6 <setupkvm+0x66>
  106adc:	31 db                	xor    %ebx,%ebx
     !mappages(pgdir, (void *)0x100000, PHYSTOP-0x100000, 0x100000, PTE_W) ||
     // Map devices such as ioapic, lapic, ...
     !mappages(pgdir, (void *)0xFE000000, 0x2000000, 0xFE000000, PTE_W))
    return 0;
  return pgdir;
}
  106ade:	83 c4 14             	add    $0x14,%esp
  106ae1:	89 d8                	mov    %ebx,%eax
  106ae3:	5b                   	pop    %ebx
  106ae4:	5d                   	pop    %ebp
  106ae5:	c3                   	ret    
    return 0;
  memset(pgdir, 0, PGSIZE);
  if(// Map IO space from 640K to 1Mbyte
     !mappages(pgdir, (void *)USERTOP, 0x60000, USERTOP, PTE_W) ||
     // Map kernel and free memory pool
     !mappages(pgdir, (void *)0x100000, PHYSTOP-0x100000, 0x100000, PTE_W) ||
  106ae6:	b9 00 00 f0 00       	mov    $0xf00000,%ecx
  106aeb:	ba 00 00 10 00       	mov    $0x100000,%edx
  106af0:	89 d8                	mov    %ebx,%eax
  106af2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106af9:	00 
  106afa:	c7 04 24 00 00 10 00 	movl   $0x100000,(%esp)
  106b01:	e8 2a fe ff ff       	call   106930 <mappages>

  // Allocate page directory
  if(!(pgdir = (pde_t *) kalloc()))
    return 0;
  memset(pgdir, 0, PGSIZE);
  if(// Map IO space from 640K to 1Mbyte
  106b06:	85 c0                	test   %eax,%eax
  106b08:	74 d2                	je     106adc <setupkvm+0x5c>
     !mappages(pgdir, (void *)USERTOP, 0x60000, USERTOP, PTE_W) ||
     // Map kernel and free memory pool
     !mappages(pgdir, (void *)0x100000, PHYSTOP-0x100000, 0x100000, PTE_W) ||
     // Map devices such as ioapic, lapic, ...
     !mappages(pgdir, (void *)0xFE000000, 0x2000000, 0xFE000000, PTE_W))
  106b0a:	b9 00 00 00 02       	mov    $0x2000000,%ecx
  106b0f:	ba 00 00 00 fe       	mov    $0xfe000000,%edx
  106b14:	89 d8                	mov    %ebx,%eax
  106b16:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  106b1d:	00 
  106b1e:	c7 04 24 00 00 00 fe 	movl   $0xfe000000,(%esp)
  106b25:	e8 06 fe ff ff       	call   106930 <mappages>

  // Allocate page directory
  if(!(pgdir = (pde_t *) kalloc()))
    return 0;
  memset(pgdir, 0, PGSIZE);
  if(// Map IO space from 640K to 1Mbyte
  106b2a:	85 c0                	test   %eax,%eax
  106b2c:	0f 85 60 ff ff ff    	jne    106a92 <setupkvm+0x12>
  106b32:	eb a8                	jmp    106adc <setupkvm+0x5c>
  106b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00106b40 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
  106b40:	55                   	push   %ebp
  106b41:	89 e5                	mov    %esp,%ebp
  106b43:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
  106b46:	e8 35 ff ff ff       	call   106a80 <setupkvm>
  106b4b:	a3 70 92 10 00       	mov    %eax,0x109270
}
  106b50:	c9                   	leave  
  106b51:	c3                   	ret    
  106b52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106b60 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  106b60:	55                   	push   %ebp
  106b61:	89 e5                	mov    %esp,%ebp
  106b63:	57                   	push   %edi
  106b64:	56                   	push   %esi
  106b65:	53                   	push   %ebx
  106b66:	83 ec 2c             	sub    $0x2c,%esp
  char *a = (char *)PGROUNDUP(newsz);
  106b69:	8b 5d 10             	mov    0x10(%ebp),%ebx
  char *last = PGROUNDDOWN(oldsz - 1);
  106b6c:	8b 75 0c             	mov    0xc(%ebp),%esi
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  106b6f:	8b 7d 08             	mov    0x8(%ebp),%edi
  char *a = (char *)PGROUNDUP(newsz);
  106b72:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
  char *last = PGROUNDDOWN(oldsz - 1);
  106b78:	83 ee 01             	sub    $0x1,%esi
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  char *a = (char *)PGROUNDUP(newsz);
  106b7b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  char *last = PGROUNDDOWN(oldsz - 1);
  106b81:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a <= last; a += PGSIZE){
  106b87:	39 f3                	cmp    %esi,%ebx
  106b89:	77 41                	ja     106bcc <deallocuvm+0x6c>
  106b8b:	90                   	nop
  106b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pte_t *pte = walkpgdir(pgdir, a, 0);
  106b90:	31 c9                	xor    %ecx,%ecx
  106b92:	89 da                	mov    %ebx,%edx
  106b94:	89 f8                	mov    %edi,%eax
  106b96:	e8 15 fd ff ff       	call   1068b0 <walkpgdir>
    if(pte && (*pte & PTE_P) != 0){
  106b9b:	85 c0                	test   %eax,%eax
  106b9d:	74 23                	je     106bc2 <deallocuvm+0x62>
  106b9f:	8b 10                	mov    (%eax),%edx
  106ba1:	f6 c2 01             	test   $0x1,%dl
  106ba4:	74 1c                	je     106bc2 <deallocuvm+0x62>
      uint pa = PTE_ADDR(*pte);
      if(pa == 0)
  106ba6:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  106bac:	74 3d                	je     106beb <deallocuvm+0x8b>
        panic("kfree");
      kfree((void *) pa);
  106bae:	89 14 24             	mov    %edx,(%esp)
  106bb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106bb4:	e8 77 b9 ff ff       	call   102530 <kfree>
      *pte = 0;
  106bb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  106bbc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  char *a = (char *)PGROUNDUP(newsz);
  char *last = PGROUNDDOWN(oldsz - 1);
  for(; a <= last; a += PGSIZE){
  106bc2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106bc8:	39 de                	cmp    %ebx,%esi
  106bca:	73 c4                	jae    106b90 <deallocuvm+0x30>
  106bcc:	8b 45 10             	mov    0x10(%ebp),%eax
  106bcf:	3b 45 0c             	cmp    0xc(%ebp),%eax
  106bd2:	77 0c                	ja     106be0 <deallocuvm+0x80>
      kfree((void *) pa);
      *pte = 0;
    }
  }
  return newsz < oldsz ? newsz : oldsz;
}
  106bd4:	83 c4 2c             	add    $0x2c,%esp
  106bd7:	5b                   	pop    %ebx
  106bd8:	5e                   	pop    %esi
  106bd9:	5f                   	pop    %edi
  106bda:	5d                   	pop    %ebp
  106bdb:	c3                   	ret    
  106bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  char *a = (char *)PGROUNDUP(newsz);
  char *last = PGROUNDDOWN(oldsz - 1);
  for(; a <= last; a += PGSIZE){
  106be0:	8b 45 0c             	mov    0xc(%ebp),%eax
      kfree((void *) pa);
      *pte = 0;
    }
  }
  return newsz < oldsz ? newsz : oldsz;
}
  106be3:	83 c4 2c             	add    $0x2c,%esp
  106be6:	5b                   	pop    %ebx
  106be7:	5e                   	pop    %esi
  106be8:	5f                   	pop    %edi
  106be9:	5d                   	pop    %ebp
  106bea:	c3                   	ret    
  for(; a <= last; a += PGSIZE){
    pte_t *pte = walkpgdir(pgdir, a, 0);
    if(pte && (*pte & PTE_P) != 0){
      uint pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
  106beb:	c7 04 24 ae 72 10 00 	movl   $0x1072ae,(%esp)
  106bf2:	e8 59 9f ff ff       	call   100b50 <panic>
  106bf7:	89 f6                	mov    %esi,%esi
  106bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106c00 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
  106c00:	55                   	push   %ebp
  106c01:	89 e5                	mov    %esp,%ebp
  106c03:	56                   	push   %esi
  106c04:	53                   	push   %ebx
  106c05:	83 ec 10             	sub    $0x10,%esp
  106c08:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint i;

  if(!pgdir)
  106c0b:	85 db                	test   %ebx,%ebx
  106c0d:	74 59                	je     106c68 <freevm+0x68>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, USERTOP, 0);
  106c0f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  106c16:	00 
  106c17:	31 f6                	xor    %esi,%esi
  106c19:	c7 44 24 04 00 00 0a 	movl   $0xa0000,0x4(%esp)
  106c20:	00 
  106c21:	89 1c 24             	mov    %ebx,(%esp)
  106c24:	e8 37 ff ff ff       	call   106b60 <deallocuvm>
  106c29:	eb 10                	jmp    106c3b <freevm+0x3b>
  106c2b:	90                   	nop
  106c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < NPDENTRIES; i++){
  106c30:	83 c6 01             	add    $0x1,%esi
  106c33:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  106c39:	74 1f                	je     106c5a <freevm+0x5a>
    if(pgdir[i] & PTE_P)
  106c3b:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
  106c3e:	a8 01                	test   $0x1,%al
  106c40:	74 ee                	je     106c30 <freevm+0x30>
      kfree((void *) PTE_ADDR(pgdir[i]));
  106c42:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  uint i;

  if(!pgdir)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, USERTOP, 0);
  for(i = 0; i < NPDENTRIES; i++){
  106c47:	83 c6 01             	add    $0x1,%esi
    if(pgdir[i] & PTE_P)
      kfree((void *) PTE_ADDR(pgdir[i]));
  106c4a:	89 04 24             	mov    %eax,(%esp)
  106c4d:	e8 de b8 ff ff       	call   102530 <kfree>
  uint i;

  if(!pgdir)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, USERTOP, 0);
  for(i = 0; i < NPDENTRIES; i++){
  106c52:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  106c58:	75 e1                	jne    106c3b <freevm+0x3b>
    if(pgdir[i] & PTE_P)
      kfree((void *) PTE_ADDR(pgdir[i]));
  }
  kfree((void *) pgdir);
  106c5a:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
  106c5d:	83 c4 10             	add    $0x10,%esp
  106c60:	5b                   	pop    %ebx
  106c61:	5e                   	pop    %esi
  106c62:	5d                   	pop    %ebp
  deallocuvm(pgdir, USERTOP, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if(pgdir[i] & PTE_P)
      kfree((void *) PTE_ADDR(pgdir[i]));
  }
  kfree((void *) pgdir);
  106c63:	e9 c8 b8 ff ff       	jmp    102530 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(!pgdir)
    panic("freevm: no pgdir");
  106c68:	c7 04 24 54 79 10 00 	movl   $0x107954,(%esp)
  106c6f:	e8 dc 9e ff ff       	call   100b50 <panic>
  106c74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106c7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00106c80 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  106c80:	55                   	push   %ebp
  106c81:	89 e5                	mov    %esp,%ebp
  106c83:	57                   	push   %edi
  106c84:	56                   	push   %esi
  106c85:	53                   	push   %ebx
  106c86:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d = setupkvm();
  106c89:	e8 f2 fd ff ff       	call   106a80 <setupkvm>
  pte_t *pte;
  uint pa, i;
  char *mem;

  if(!d) return 0;
  106c8e:	85 c0                	test   %eax,%eax
// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d = setupkvm();
  106c90:	89 c6                	mov    %eax,%esi
  pte_t *pte;
  uint pa, i;
  char *mem;

  if(!d) return 0;
  106c92:	0f 84 84 00 00 00    	je     106d1c <copyuvm+0x9c>
  for(i = 0; i < sz; i += PGSIZE){
  106c98:	8b 45 0c             	mov    0xc(%ebp),%eax
  106c9b:	85 c0                	test   %eax,%eax
  106c9d:	74 7d                	je     106d1c <copyuvm+0x9c>
  106c9f:	31 db                	xor    %ebx,%ebx
  106ca1:	eb 47                	jmp    106cea <copyuvm+0x6a>
  106ca3:	90                   	nop
  106ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present\n");
    pa = PTE_ADDR(*pte);
    if(!(mem = kalloc()))
      goto bad;
    memmove(mem, (char *)pa, PGSIZE);
  106ca8:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  106cae:	89 54 24 04          	mov    %edx,0x4(%esp)
  106cb2:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106cb9:	00 
  106cba:	89 04 24             	mov    %eax,(%esp)
  106cbd:	e8 ee d9 ff ff       	call   1046b0 <memmove>
    if(!mappages(d, (void *)i, PGSIZE, PADDR(mem), PTE_W|PTE_U))
  106cc2:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106cc7:	89 da                	mov    %ebx,%edx
  106cc9:	89 f0                	mov    %esi,%eax
  106ccb:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106cd2:	00 
  106cd3:	89 3c 24             	mov    %edi,(%esp)
  106cd6:	e8 55 fc ff ff       	call   106930 <mappages>
  106cdb:	85 c0                	test   %eax,%eax
  106cdd:	74 33                	je     106d12 <copyuvm+0x92>
  pte_t *pte;
  uint pa, i;
  char *mem;

  if(!d) return 0;
  for(i = 0; i < sz; i += PGSIZE){
  106cdf:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106ce5:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
  106ce8:	76 32                	jbe    106d1c <copyuvm+0x9c>
    if(!(pte = walkpgdir(pgdir, (void *)i, 0)))
  106cea:	8b 45 08             	mov    0x8(%ebp),%eax
  106ced:	31 c9                	xor    %ecx,%ecx
  106cef:	89 da                	mov    %ebx,%edx
  106cf1:	e8 ba fb ff ff       	call   1068b0 <walkpgdir>
  106cf6:	85 c0                	test   %eax,%eax
  106cf8:	74 2c                	je     106d26 <copyuvm+0xa6>
      panic("copyuvm: pte should exist\n");
    if(!(*pte & PTE_P))
  106cfa:	8b 10                	mov    (%eax),%edx
  106cfc:	f6 c2 01             	test   $0x1,%dl
  106cff:	74 31                	je     106d32 <copyuvm+0xb2>
      panic("copyuvm: page not present\n");
    pa = PTE_ADDR(*pte);
    if(!(mem = kalloc()))
  106d01:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  106d04:	e8 e7 b7 ff ff       	call   1024f0 <kalloc>
  106d09:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106d0c:	85 c0                	test   %eax,%eax
  106d0e:	89 c7                	mov    %eax,%edi
  106d10:	75 96                	jne    106ca8 <copyuvm+0x28>
      goto bad;
  }
  return d;

bad:
  freevm(d);
  106d12:	89 34 24             	mov    %esi,(%esp)
  106d15:	31 f6                	xor    %esi,%esi
  106d17:	e8 e4 fe ff ff       	call   106c00 <freevm>
  return 0;
}
  106d1c:	83 c4 2c             	add    $0x2c,%esp
  106d1f:	89 f0                	mov    %esi,%eax
  106d21:	5b                   	pop    %ebx
  106d22:	5e                   	pop    %esi
  106d23:	5f                   	pop    %edi
  106d24:	5d                   	pop    %ebp
  106d25:	c3                   	ret    
  char *mem;

  if(!d) return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if(!(pte = walkpgdir(pgdir, (void *)i, 0)))
      panic("copyuvm: pte should exist\n");
  106d26:	c7 04 24 65 79 10 00 	movl   $0x107965,(%esp)
  106d2d:	e8 1e 9e ff ff       	call   100b50 <panic>
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present\n");
  106d32:	c7 04 24 80 79 10 00 	movl   $0x107980,(%esp)
  106d39:	e8 12 9e ff ff       	call   100b50 <panic>
  106d3e:	66 90                	xchg   %ax,%ax

00106d40 <allocuvm>:
// newsz. Allocates physical memory and page table entries. oldsz and
// newsz need not be page-aligned, nor does newsz have to be larger
// than oldsz.  Returns the new process size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  106d40:	55                   	push   %ebp
  if(newsz > USERTOP)
  106d41:	31 c0                	xor    %eax,%eax
// newsz. Allocates physical memory and page table entries. oldsz and
// newsz need not be page-aligned, nor does newsz have to be larger
// than oldsz.  Returns the new process size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  106d43:	89 e5                	mov    %esp,%ebp
  106d45:	57                   	push   %edi
  106d46:	56                   	push   %esi
  106d47:	53                   	push   %ebx
  106d48:	83 ec 2c             	sub    $0x2c,%esp
  106d4b:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(newsz > USERTOP)
  106d4e:	81 7d 10 00 00 0a 00 	cmpl   $0xa0000,0x10(%ebp)
  106d55:	0f 87 93 00 00 00    	ja     106dee <allocuvm+0xae>
    return 0;
  char *a = (char *)PGROUNDUP(oldsz);
  106d5b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *last = PGROUNDDOWN(newsz - 1);
  106d5e:	8b 75 10             	mov    0x10(%ebp),%esi
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  if(newsz > USERTOP)
    return 0;
  char *a = (char *)PGROUNDUP(oldsz);
  106d61:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
  char *last = PGROUNDDOWN(newsz - 1);
  106d67:	83 ee 01             	sub    $0x1,%esi
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  if(newsz > USERTOP)
    return 0;
  char *a = (char *)PGROUNDUP(oldsz);
  106d6a:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  char *last = PGROUNDDOWN(newsz - 1);
  106d70:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for (; a <= last; a += PGSIZE){
  106d76:	39 f3                	cmp    %esi,%ebx
  106d78:	76 47                	jbe    106dc1 <allocuvm+0x81>
  106d7a:	eb 7c                	jmp    106df8 <allocuvm+0xb8>
  106d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
  106d80:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
  106d87:	00 
  106d88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  106d8f:	00 
  106d90:	89 04 24             	mov    %eax,(%esp)
  106d93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  106d96:	e8 95 d8 ff ff       	call   104630 <memset>
    mappages(pgdir, a, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  106d9b:	b9 00 10 00 00       	mov    $0x1000,%ecx
  106da0:	89 f8                	mov    %edi,%eax
  106da2:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
  106da9:	00 
  106daa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106dad:	89 14 24             	mov    %edx,(%esp)
  106db0:	89 da                	mov    %ebx,%edx
{
  if(newsz > USERTOP)
    return 0;
  char *a = (char *)PGROUNDUP(oldsz);
  char *last = PGROUNDDOWN(newsz - 1);
  for (; a <= last; a += PGSIZE){
  106db2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, a, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  106db8:	e8 73 fb ff ff       	call   106930 <mappages>
{
  if(newsz > USERTOP)
    return 0;
  char *a = (char *)PGROUNDUP(oldsz);
  char *last = PGROUNDDOWN(newsz - 1);
  for (; a <= last; a += PGSIZE){
  106dbd:	39 de                	cmp    %ebx,%esi
  106dbf:	72 37                	jb     106df8 <allocuvm+0xb8>
    char *mem = kalloc();
  106dc1:	e8 2a b7 ff ff       	call   1024f0 <kalloc>
    if(mem == 0){
  106dc6:	85 c0                	test   %eax,%eax
  106dc8:	75 b6                	jne    106d80 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
  106dca:	c7 04 24 9b 79 10 00 	movl   $0x10799b,(%esp)
  106dd1:	e8 8a 99 ff ff       	call   100760 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
  106dd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  106dd9:	89 44 24 08          	mov    %eax,0x8(%esp)
  106ddd:	8b 45 10             	mov    0x10(%ebp),%eax
  106de0:	89 3c 24             	mov    %edi,(%esp)
  106de3:	89 44 24 04          	mov    %eax,0x4(%esp)
  106de7:	e8 74 fd ff ff       	call   106b60 <deallocuvm>
  106dec:	31 c0                	xor    %eax,%eax
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, a, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  }
  return newsz > oldsz ? newsz : oldsz;
}
  106dee:	83 c4 2c             	add    $0x2c,%esp
  106df1:	5b                   	pop    %ebx
  106df2:	5e                   	pop    %esi
  106df3:	5f                   	pop    %edi
  106df4:	5d                   	pop    %ebp
  106df5:	c3                   	ret    
  106df6:	66 90                	xchg   %ax,%ax
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, a, PGSIZE, PADDR(mem), PTE_W|PTE_U);
  }
  return newsz > oldsz ? newsz : oldsz;
  106df8:	8b 45 10             	mov    0x10(%ebp),%eax
  106dfb:	3b 45 0c             	cmp    0xc(%ebp),%eax
  106dfe:	73 ee                	jae    106dee <allocuvm+0xae>
  106e00:	8b 45 0c             	mov    0xc(%ebp),%eax
}
  106e03:	83 c4 2c             	add    $0x2c,%esp
  106e06:	5b                   	pop    %ebx
  106e07:	5e                   	pop    %esi
  106e08:	5f                   	pop    %edi
  106e09:	5d                   	pop    %ebp
  106e0a:	c3                   	ret    
  106e0b:	90                   	nop
  106e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106e10 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
  106e10:	55                   	push   %ebp
  106e11:	89 e5                	mov    %esp,%ebp
  106e13:	57                   	push   %edi
  106e14:	56                   	push   %esi
  106e15:	53                   	push   %ebx
  106e16:	83 ec 3c             	sub    $0x3c,%esp
  106e19:	8b 7d 0c             	mov    0xc(%ebp),%edi
  uint i, pa, n;
  pte_t *pte;

  if((uint)addr % PGSIZE != 0)
  106e1c:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
  106e22:	0f 85 99 00 00 00    	jne    106ec1 <loaduvm+0xb1>
    panic("loaduvm: addr must be page aligned\n");
  106e28:	8b 75 18             	mov    0x18(%ebp),%esi
  106e2b:	31 db                	xor    %ebx,%ebx
  for(i = 0; i < sz; i += PGSIZE){
  106e2d:	85 f6                	test   %esi,%esi
  106e2f:	74 77                	je     106ea8 <loaduvm+0x98>
  106e31:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  106e34:	eb 13                	jmp    106e49 <loaduvm+0x39>
  106e36:	66 90                	xchg   %ax,%ax
  106e38:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  106e3e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
  106e44:	39 5d 18             	cmp    %ebx,0x18(%ebp)
  106e47:	76 5f                	jbe    106ea8 <loaduvm+0x98>
    if(!(pte = walkpgdir(pgdir, addr+i, 0)))
  106e49:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  106e4c:	31 c9                	xor    %ecx,%ecx
  106e4e:	8b 45 08             	mov    0x8(%ebp),%eax
  106e51:	01 da                	add    %ebx,%edx
  106e53:	e8 58 fa ff ff       	call   1068b0 <walkpgdir>
  106e58:	85 c0                	test   %eax,%eax
  106e5a:	74 59                	je     106eb5 <loaduvm+0xa5>
      panic("loaduvm: address should exist\n");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE) n = sz - i;
  106e5c:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
  if((uint)addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned\n");
  for(i = 0; i < sz; i += PGSIZE){
    if(!(pte = walkpgdir(pgdir, addr+i, 0)))
      panic("loaduvm: address should exist\n");
    pa = PTE_ADDR(*pte);
  106e62:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE) n = sz - i;
  106e64:	ba 00 10 00 00       	mov    $0x1000,%edx
  106e69:	77 02                	ja     106e6d <loaduvm+0x5d>
  106e6b:	89 f2                	mov    %esi,%edx
    else n = PGSIZE;
    if(readi(ip, (char *)pa, offset+i, n) != n)
  106e6d:	89 54 24 0c          	mov    %edx,0xc(%esp)
  106e71:	8b 7d 14             	mov    0x14(%ebp),%edi
  106e74:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  106e79:	89 44 24 04          	mov    %eax,0x4(%esp)
  106e7d:	8d 0c 3b             	lea    (%ebx,%edi,1),%ecx
  106e80:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  106e84:	8b 45 10             	mov    0x10(%ebp),%eax
  106e87:	89 04 24             	mov    %eax,(%esp)
  106e8a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  106e8d:	e8 5e a7 ff ff       	call   1015f0 <readi>
  106e92:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  106e95:	39 d0                	cmp    %edx,%eax
  106e97:	74 9f                	je     106e38 <loaduvm+0x28>
      return 0;
  }
  return 1;
}
  106e99:	83 c4 3c             	add    $0x3c,%esp
    if(!(pte = walkpgdir(pgdir, addr+i, 0)))
      panic("loaduvm: address should exist\n");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE) n = sz - i;
    else n = PGSIZE;
    if(readi(ip, (char *)pa, offset+i, n) != n)
  106e9c:	31 c0                	xor    %eax,%eax
      return 0;
  }
  return 1;
}
  106e9e:	5b                   	pop    %ebx
  106e9f:	5e                   	pop    %esi
  106ea0:	5f                   	pop    %edi
  106ea1:	5d                   	pop    %ebp
  106ea2:	c3                   	ret    
  106ea3:	90                   	nop
  106ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106ea8:	83 c4 3c             	add    $0x3c,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint)addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned\n");
  for(i = 0; i < sz; i += PGSIZE){
  106eab:	b8 01 00 00 00       	mov    $0x1,%eax
    else n = PGSIZE;
    if(readi(ip, (char *)pa, offset+i, n) != n)
      return 0;
  }
  return 1;
}
  106eb0:	5b                   	pop    %ebx
  106eb1:	5e                   	pop    %esi
  106eb2:	5f                   	pop    %edi
  106eb3:	5d                   	pop    %ebp
  106eb4:	c3                   	ret    

  if((uint)addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned\n");
  for(i = 0; i < sz; i += PGSIZE){
    if(!(pte = walkpgdir(pgdir, addr+i, 0)))
      panic("loaduvm: address should exist\n");
  106eb5:	c7 04 24 ec 79 10 00 	movl   $0x1079ec,(%esp)
  106ebc:	e8 8f 9c ff ff       	call   100b50 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint)addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned\n");
  106ec1:	c7 04 24 c8 79 10 00 	movl   $0x1079c8,(%esp)
  106ec8:	e8 83 9c ff ff       	call   100b50 <panic>
  106ecd:	8d 76 00             	lea    0x0(%esi),%esi

00106ed0 <switchuvm>:
}

// Switch h/w page table and TSS registers to point to process p.
void
switchuvm(struct proc *p)
{
  106ed0:	55                   	push   %ebp
  106ed1:	89 e5                	mov    %esp,%ebp
  106ed3:	53                   	push   %ebx
  106ed4:	83 ec 14             	sub    $0x14,%esp
  106ed7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
  106eda:	e8 c1 d5 ff ff       	call   1044a0 <pushcli>

  // Setup TSS
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  106edf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106ee5:	8d 50 08             	lea    0x8(%eax),%edx
  106ee8:	89 d1                	mov    %edx,%ecx
  106eea:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
  106ef1:	c1 e9 10             	shr    $0x10,%ecx
  106ef4:	c1 ea 18             	shr    $0x18,%edx
  106ef7:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  106efd:	c6 80 a5 00 00 00 99 	movb   $0x99,0xa5(%eax)
  106f04:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  106f0a:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
  106f11:	67 00 
  106f13:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  106f1a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106f20:	80 a0 a5 00 00 00 ef 	andb   $0xef,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
  106f27:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106f2d:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  106f33:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  106f39:	8b 50 50             	mov    0x50(%eax),%edx
  106f3c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
  106f42:	81 c2 00 10 00 00    	add    $0x1000,%edx
  106f48:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
  106f4b:	b8 30 00 00 00       	mov    $0x30,%eax
  106f50:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);

  if(p->pgdir == 0)
  106f53:	8b 43 04             	mov    0x4(%ebx),%eax
  106f56:	85 c0                	test   %eax,%eax
  106f58:	74 0d                	je     106f67 <switchuvm+0x97>
}

static inline void
lcr3(uint val) 
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
  106f5a:	0f 22 d8             	mov    %eax,%cr3
    panic("switchuvm: no pgdir\n");

  lcr3(PADDR(p->pgdir));  // switch to new address space
  popcli();
}
  106f5d:	83 c4 14             	add    $0x14,%esp
  106f60:	5b                   	pop    %ebx
  106f61:	5d                   	pop    %ebp

  if(p->pgdir == 0)
    panic("switchuvm: no pgdir\n");

  lcr3(PADDR(p->pgdir));  // switch to new address space
  popcli();
  106f62:	e9 79 d5 ff ff       	jmp    1044e0 <popcli>
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  ltr(SEG_TSS << 3);

  if(p->pgdir == 0)
    panic("switchuvm: no pgdir\n");
  106f67:	c7 04 24 b3 79 10 00 	movl   $0x1079b3,(%esp)
  106f6e:	e8 dd 9b ff ff       	call   100b50 <panic>
  106f73:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00106f80 <ksegment>:

// Set up CPU's kernel segment descriptors.
// Run once at boot time on each CPU.
void
ksegment(void)
{
  106f80:	55                   	push   %ebp
  106f81:	89 e5                	mov    %esp,%ebp
  106f83:	83 ec 18             	sub    $0x18,%esp

  // Map virtual addresses to linear addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  106f86:	e8 45 b8 ff ff       	call   1027d0 <cpunum>
  106f8b:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
  106f91:	05 e0 7b 11 00       	add    $0x117be0,%eax
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
  106f96:	8d 90 b4 00 00 00    	lea    0xb4(%eax),%edx
  106f9c:	66 89 90 8a 00 00 00 	mov    %dx,0x8a(%eax)
  106fa3:	89 d1                	mov    %edx,%ecx
  106fa5:	c1 ea 18             	shr    $0x18,%edx
  106fa8:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)
  106fae:	c1 e9 10             	shr    $0x10,%ecx

  lgdt(c->gdt, sizeof(c->gdt));
  106fb1:	8d 50 70             	lea    0x70(%eax),%edx
  // Map virtual addresses to linear addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  106fb4:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
  106fba:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
  106fc0:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
  106fc4:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
  106fc8:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  106fcc:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  106fd0:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
  106fd7:	ff ff 
  106fd9:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
  106fe0:	00 00 
  106fe2:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
  106fe9:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
  106ff0:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  106ff7:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  106ffe:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
  107005:	ff ff 
  107007:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
  10700e:	00 00 
  107010:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
  107017:	c6 80 95 00 00 00 fa 	movb   $0xfa,0x95(%eax)
  10701e:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  107025:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
  10702c:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
  107033:	ff ff 
  107035:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
  10703c:	00 00 
  10703e:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
  107045:	c6 80 9d 00 00 00 f2 	movb   $0xf2,0x9d(%eax)
  10704c:	c6 80 9e 00 00 00 cf 	movb   $0xcf,0x9e(%eax)
  107053:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
  10705a:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
  107061:	00 00 
  107063:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
  107069:	c6 80 8d 00 00 00 92 	movb   $0x92,0x8d(%eax)
  107070:	c6 80 8e 00 00 00 c0 	movb   $0xc0,0x8e(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
  107077:	66 c7 45 f2 37 00    	movw   $0x37,-0xe(%ebp)
  pd[1] = (uint)p;
  10707d:	66 89 55 f4          	mov    %dx,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
  107081:	c1 ea 10             	shr    $0x10,%edx
  107084:	66 89 55 f6          	mov    %dx,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
  107088:	8d 55 f2             	lea    -0xe(%ebp),%edx
  10708b:	0f 01 12             	lgdtl  (%edx)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
  10708e:	ba 18 00 00 00       	mov    $0x18,%edx
  107093:	8e ea                	mov    %edx,%gs

  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);
  
  // Initialize cpu-local storage.
  cpu = c;
  107095:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
  10709b:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
  1070a2:	00 00 00 00 
}
  1070a6:	c9                   	leave  
  1070a7:	c3                   	ret    
