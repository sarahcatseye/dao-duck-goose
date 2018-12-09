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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r4, .L4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+8
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+28
	ldr	r3, .L4+32
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startbgPal
	.word	5712
	.word	100679680
	.word	startbgTiles
	.word	100724736
	.word	startbgMap
	.word	seed
	.word	initSelect
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #4864
	mov	r3, #512
	strh	r2, [r5]	@ movhi
	ldr	r1, .L8+24
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #7936
	mov	r4, #0
	ldr	r0, .L8+28
	ldr	r1, .L8+32
	ldr	r2, .L8+36
	strh	r3, [r5, #10]	@ movhi
	strh	r0, [r5, #8]	@ movhi
	ldr	r3, .L8+40
	strh	r4, [r1]	@ movhi
	strh	r4, [r2]	@ movhi
	ldr	r5, .L8+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+52
	mov	lr, pc
	bx	r3
	ldr	r6, .L8+56
	mov	r2, r5
	mov	r3, #1
	ldr	r1, .L8+60
	ldr	r0, .L8+64
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r2, r5
	ldr	r4, .L8+68
	ldr	r1, .L8+72
	ldr	r0, .L8+76
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	7684
	.word	hOff
	.word	vOff
	.word	setupSounds
	.word	11025
	.word	setupInterrupts
	.word	stopSound
	.word	playSoundA
	.word	2404800
	.word	VacationWasteland
	.word	playSoundB
	.word	17243
	.word	clang
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2336
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+28
	ldr	r1, .L12+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #2
	ldr	r1, .L12+36
	ldr	ip, .L12+40
	strh	r3, [r1]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L12+44
	ldrh	r1, [r1]
	pop	{r4, lr}
	strh	r1, [r2, #22]	@ movhi
	str	r0, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	gamebg0Pal
	.word	gamebg0Tiles
	.word	100726784
	.word	gamebg0Map
	.word	100679680
	.word	gamebg1Tiles
	.word	100724736
	.word	gamebg1Map
	.word	vOff
	.word	hOff
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L16+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2496
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #1
	ldr	r1, .L16+36
	ldr	ip, .L16+40
	strh	r3, [r1]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L16+44
	ldrh	r1, [r1]
	pop	{r4, lr}
	strh	r1, [r2, #22]	@ movhi
	str	r0, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	instructionsbg0Pal
	.word	instructionsbg0Tiles
	.word	100726784
	.word	instructionsbg0Map
	.word	100679680
	.word	instructionsbg1Tiles
	.word	100724736
	.word	instructionsbg1Map
	.word	vOff
	.word	hOff
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L27
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	ldr	r2, .L27+8
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L27+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L18
	ldr	r3, .L27+20
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L25
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L27+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L27+32
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r3, .L27+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L26
	mov	r3, r5
	ldr	r4, .L27+40
	ldr	r2, .L27+44
	ldr	r1, .L27+48
	ldr	r0, .L27+52
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L26:
	ldr	r0, [r4]
	ldr	r3, .L27+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+60
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+64
	mov	r3, #1
	ldr	r2, .L27+44
	ldr	r1, .L27+68
	ldr	r0, .L27+72
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+76
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L28:
	.align	2
.L27:
	.word	seed
	.word	waitForVBlank
	.word	updateStart
	.word	drawStart
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	select
	.word	playSoundB
	.word	11025
	.word	17243
	.word	clang
	.word	srand
	.word	stopSound
	.word	playSoundA
	.word	2129472
	.word	MegaHyperUltrastorm
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L36+4
	ldr	r2, .L36+8
	ldrh	r3, [lr]
	ldrh	r0, [r2]
	sub	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #18
	sub	r0, r0, #1
	strh	r3, [lr]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #2
	strh	r3, [ip, #22]	@ movhi
	ldr	r3, .L36+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L36+16
	ldrh	r3, [r3]
	ands	r3, r3, #8
	beq	.L35
.L29:
	pop	{r4, lr}
	bx	lr
.L35:
	ldr	r4, .L36+20
	ldr	r2, .L36+24
	ldr	r1, .L36+28
	ldr	r0, .L36+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	playSoundB
	.word	11025
	.word	17243
	.word	clang
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L43
	mov	r2, #83886080
	ldr	r1, .L43+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L43+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L42
	mov	r3, #2080
	ldr	r2, .L43+24
	ldr	r1, .L43+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+32
	ldr	r1, .L43+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L40:
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L43+40
	ldr	r1, .L43+44
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldrh	r1, [r1]
	ldr	r3, .L43+48
	strh	r1, [r2, #22]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L43+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	mov	r3, #1328
	ldr	r2, .L43+24
	ldr	r1, .L43+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+32
	ldr	r1, .L43+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L40
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	pausebg0Pal
	.word	pausebg0Tiles
	.word	100726784
	.word	pausebg0Map
	.word	demonMode
	.word	100679680
	.word	pausebg2Tiles
	.word	100724736
	.word	pausebg2Map
	.word	hOff
	.word	vOff
	.word	initSelect
	.word	state
	.word	pausebg1Tiles
	.word	pausebg1Map
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L58+4
	ldr	r2, .L58+8
	ldrh	r3, [lr]
	ldrh	r0, [r2]
	sub	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #17
	sub	r0, r0, #1
	strh	r3, [lr]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #1
	strh	r3, [ip, #22]	@ movhi
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L45
	ldr	r3, .L58+24
	ldrh	r3, [r3]
	ands	r4, r3, #1
	bne	.L45
	ldr	r3, .L58+28
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L54
	cmp	r5, #1
	beq	.L55
	cmp	r5, #2
	beq	.L56
.L45:
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	ldr	r3, .L58+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L56:
	ldr	r5, .L58+36
	mov	r3, r4
	ldr	r2, .L58+40
	ldr	r1, .L58+44
	ldr	r0, .L58+48
	ldr	r6, .L58+52
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L57
	mov	r3, #1328
	ldr	r2, .L58+56
	ldr	r1, .L58+60
	mov	r0, #3
	ldr	r6, .L58+64
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L58+68
	ldr	r1, .L58+72
	mov	r0, #3
	mov	lr, pc
	bx	r6
	str	r4, [r5]
	b	.L45
.L55:
	ldr	r3, .L58+32
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L58+40
	ldr	r1, .L58+44
	ldr	r0, .L58+48
	ldr	r4, .L58+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r4, .L58+76
	ldr	r2, .L58+40
	ldr	r1, .L58+80
	ldr	r0, .L58+84
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L57:
	mov	r3, #2080
	ldr	r2, .L58+56
	ldr	r1, .L58+88
	mov	r0, #3
	ldr	r4, .L58+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L58+68
	ldr	r1, .L58+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1
	str	r3, [r5]
	b	.L45
.L59:
	.align	2
.L58:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	updatePause
	.word	drawPause
	.word	oldButtons
	.word	buttons
	.word	select
	.word	hideSprites
	.word	demonMode
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.word	100679680
	.word	pausebg1Tiles
	.word	DMANow
	.word	100724736
	.word	pausebg1Map
	.word	playSoundA
	.word	2404800
	.word	VacationWasteland
	.word	pausebg2Tiles
	.word	pausebg2Map
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r3, #256
	sub	sp, sp, #20
	ldr	r4, .L66
	mov	r2, #83886080
	ldr	r1, .L66+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L66+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+12
	ldr	r1, .L66+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	ldr	r2, .L66+20
	ldr	r1, .L66+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+28
	ldr	r1, .L66+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mvn	r2, #99
	ldr	r1, .L66+36
	ldr	r3, .L66+40
	ldr	r1, [r1]
	smull	r6, r7, r1, r3
	asr	r3, r1, #31
	rsb	r3, r3, r7, asr #5
	mla	r5, r3, r2, r1
	mov	r0, #52
	mov	ip, #79
	ldr	r1, .L66+44
	smull	r6, r7, r5, r1
	asr	r1, r5, #31
	rsb	r1, r1, r7, asr #2
	rsb	lr, r1, r1, lsl #29
	rsb	lr, r1, lr, lsl #2
	add	r2, r5, lr, lsl #1
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	ldr	r2, .L66+48
	ldr	r5, .L66+52
	add	lr, sp, #8
.L64:
	orr	r1, r0, r5
	add	r0, r0, #50
	cmp	r3, #1
	lsl	r0, r0, #16
	addle	r3, r3, #192
	addgt	r3, r3, #222
	lsr	r0, r0, #16
	lsl	r3, r3, #2
	cmp	r0, #202
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	add	r2, r2, #8
	ldrne	r3, [lr], #4
	bne	.L64
.L63:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L66+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #4
	ldr	ip, .L66+56
	ldr	r1, .L66+60
	strh	r3, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L66+64
	ldrh	r1, [r1]
	strh	r1, [r2, #22]	@ movhi
	str	r0, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	DMANow
	.word	losebg0Pal
	.word	losebg0Tiles
	.word	100726784
	.word	losebg0Map
	.word	100679680
	.word	losebg1Tiles
	.word	100724736
	.word	losebg1Map
	.word	enemiesDefeated
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	-32768
	.word	hOff
	.word	vOff
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r2, .L77+12
	ldrh	r3, [r2]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	ldr	r2, .L77+16
	strh	r3, [r1, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L77+20
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L75
.L69:
	ldr	r3, .L77+24
	ldr	r4, [r3]
	cmp	r4, #1
	beq	.L76
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+32
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L77+36
	ldr	r1, .L77+40
	ldr	r0, .L77+44
	ldr	r4, .L77+48
	mov	lr, pc
	bx	r4
	ldr	r4, .L77+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L77+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToLose
.L75:
	ldr	r3, .L77+28
	mov	lr, pc
	bx	r3
	ldr	r5, .L77+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L77+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L77+36
	ldr	r1, .L77+60
	ldr	r0, .L77+64
	ldr	r4, .L77+68
	mov	lr, pc
	bx	r4
	bl	goToPause
	b	.L69
.L78:
	.align	2
.L77:
	.word	waitForVBlank
	.word	updateGame
	.word	drawGame
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	playerDefeated
	.word	hideSprites
	.word	stopSound
	.word	11025
	.word	2648160
	.word	SpringBreak
	.word	playSoundA
	.word	DMANow
	.word	shadowOAM
	.word	17243
	.word	clang
	.word	playSoundB
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L86+4
	ldr	r2, .L86+8
	ldrh	r3, [lr]
	ldrh	r0, [r2]
	sub	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #18
	sub	r0, r0, #1
	strh	r3, [lr]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #2
	strh	r3, [ip, #22]	@ movhi
	ldr	r3, .L86+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
	ldr	r3, .L86+16
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L85
.L79:
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	ldr	r3, .L86+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L86+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L86+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L86+36
	ldr	r1, .L86+40
	ldr	r0, .L86+44
	ldr	r4, .L86+48
	mov	lr, pc
	bx	r4
	ldr	r4, .L86+52
	mov	r3, #1
	ldr	r2, .L86+36
	ldr	r1, .L86+56
	ldr	r0, .L86+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L87:
	.align	2
.L86:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	stopSound
	.word	DMANow
	.word	shadowOAM
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.word	playSoundA
	.word	2404800
	.word	VacationWasteland
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r6, .L100+4
	ldr	r7, .L100+8
	ldr	r5, .L100+12
	ldr	fp, .L100+16
	ldr	r10, .L100+20
	ldr	r9, .L100+24
	ldr	r8, .L100+28
	ldr	r4, .L100+32
.L89:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L90:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L90
.L92:
	.word	.L91
	.word	.L93
	.word	.L94
	.word	.L95
	.word	.L96
.L96:
	ldr	r3, .L100+36
	mov	lr, pc
	bx	r3
	b	.L89
.L95:
	mov	lr, pc
	bx	r8
	b	.L89
.L94:
	mov	lr, pc
	bx	r9
	b	.L89
.L93:
	mov	lr, pc
	bx	r10
	b	.L89
.L91:
	mov	lr, pc
	bx	fp
	b	.L89
.L101:
	.align	2
.L100:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
