	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"select.c"
	.text
	.align	2
	.global	initSelect
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSelect, %function
initSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L3
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	select
	.size	initSelect, .-initSelect
	.align	2
	.global	updateStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L17
	ldrh	r2, [r4]
	tst	r2, #16
	beq	.L6
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L15
.L6:
	tst	r2, #32
	beq	.L5
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	ands	r3, r3, #32
	bne	.L5
	ldr	r4, .L17+8
	ldr	r2, [r4]
	cmp	r2, #1
	beq	.L16
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r5, .L17+8
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L6
	ldr	r2, .L17+12
	ldr	r1, .L17+16
	ldr	r0, .L17+20
	ldr	r6, .L17+24
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	add	r3, r3, #1
	ldrh	r2, [r4]
	str	r3, [r5]
	b	.L6
.L16:
	ldr	r2, .L17+12
	ldr	r1, .L17+16
	ldr	r0, .L17+20
	ldr	r5, .L17+24
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	b	.L5
.L18:
	.align	2
.L17:
	.word	oldButtons
	.word	buttons
	.word	select
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.size	updateStart, .-updateStart
	.align	2
	.global	drawStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStart, %function
drawStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	ldr	r2, [r3]
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #3
	lsl	r2, r2, #1
	add	r2, r2, #63
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	mov	lr, #656
	ldr	ip, .L21+4
	ldr	r0, .L21+8
	strh	r2, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	ldr	r4, .L21+12
	mov	r1, ip
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	select
	.word	shadowOAM
	.word	16528
	.word	DMANow
	.size	drawStart, .-drawStart
	.align	2
	.global	updatePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldrh	r2, [r4]
	tst	r2, #128
	beq	.L24
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	ands	r3, r3, #128
	beq	.L33
.L24:
	tst	r2, #64
	beq	.L23
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L23
	ldr	r4, .L34+8
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L23
	ldr	r2, .L34+12
	ldr	r1, .L34+16
	ldr	r0, .L34+20
	ldr	r5, .L34+24
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
.L23:
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	ldr	r5, .L34+8
	ldr	r1, [r5]
	cmp	r1, #1
	bgt	.L24
	ldr	r2, .L34+12
	ldr	r1, .L34+16
	ldr	r0, .L34+20
	ldr	r6, .L34+24
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	add	r3, r3, #1
	ldrh	r2, [r4]
	str	r3, [r5]
	b	.L24
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	select
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.size	updatePause, .-updatePause
	.align	2
	.global	drawPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPause, %function
drawPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #660
	ldr	r3, .L38
	ldr	r3, [r3]
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl #1
	ldr	ip, .L38+4
	ldr	r0, .L38+8
	add	r2, r2, #48
	orr	r2, r2, #16384
	strh	r2, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	ldr	r4, .L38+12
	mov	r1, ip
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	select
	.word	shadowOAM
	.word	-32723
	.word	DMANow
	.size	drawPause, .-drawPause
	.comm	select,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
