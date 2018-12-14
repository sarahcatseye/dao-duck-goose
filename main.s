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
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions1.part.1, %function
instructions1.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L12
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	ldr	r0, .L12+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	playSoundB
	.word	11025
	.word	17243
	.word	clang
	.size	instructions1.part.1, .-instructions1.part.1
	.set	instructions3.part.2,instructions1.part.1
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
	ldr	r4, .L16
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1360
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
	mov	r3, #2336
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
	mov	r0, #4
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
	.global	goToInstructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions1, %function
goToInstructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L20
	mov	r2, #83886080
	ldr	r1, .L20+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L20+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3184
	ldr	r2, .L20+20
	ldr	r1, .L20+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L20+28
	ldr	r1, .L20+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L20+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	instructionsbg0Pal
	.word	instructionsbg0Tiles
	.word	100726784
	.word	instructionsbg0Map
	.word	100679680
	.word	instructionsbg2Tiles
	.word	100724736
	.word	instructionsbg2Map
	.word	state
	.size	goToInstructions1, .-goToInstructions1
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
	ldr	r4, .L31
	ldr	r3, .L31+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	ldr	r2, .L31+8
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L31+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L22
	ldr	r3, .L31+20
	ldrh	r3, [r3]
	ands	r5, r3, #1
	beq	.L29
.L22:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldr	r3, .L31+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L31+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L31+32
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r3, .L31+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L30
	mov	r2, #67108864
	ldr	r3, .L31+40
	ldr	r1, .L31+44
	strh	r5, [r3]	@ movhi
	strh	r5, [r1]	@ movhi
	strh	r5, [r2, #20]	@ movhi
	ldrh	r1, [r3]
	ldr	r4, .L31+48
	strh	r1, [r2, #22]	@ movhi
	mov	r3, r5
	ldr	r2, .L31+52
	ldr	r1, .L31+56
	ldr	r0, .L31+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToInstructions1
.L30:
	ldr	r0, [r4]
	ldr	r3, .L31+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+68
	mov	lr, pc
	bx	r3
	ldr	r4, .L31+72
	mov	r3, #1
	ldr	r2, .L31+52
	ldr	r1, .L31+76
	ldr	r0, .L31+80
	mov	lr, pc
	bx	r4
	ldr	r3, .L31+84
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L32:
	.align	2
.L31:
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
	.word	vOff
	.word	hOff
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
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2848
	ldr	r4, .L35
	ldr	r2, .L35+4
	ldr	r1, .L35+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L35+12
	ldr	r1, .L35+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L35+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	.align	2
.L35:
	.word	DMANow
	.word	100679680
	.word	instructionsbg3Tiles
	.word	100724736
	.word	instructionsbg3Map
	.word	state
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	instructions1
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions1, %function
instructions1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L49+4
	ldr	r2, .L49+8
	ldrh	r3, [lr]
	ldrh	r0, [r2]
	sub	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #18
	sub	r0, r0, #1
	strh	r0, [r2]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #2
	strh	r3, [ip, #22]	@ movhi
	ldr	r4, .L49+12
	ldrh	r2, [r4]
	tst	r2, #16
	beq	.L38
	ldr	r3, .L49+16
	ldrh	r3, [r3]
	ands	r3, r3, #16
	beq	.L47
.L38:
	tst	r2, #8
	beq	.L37
	ldr	r3, .L49+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
.L37:
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	pop	{r4, r5, r6, lr}
	b	instructions1.part.1
.L47:
	ldr	r2, .L49+20
	ldr	r1, .L49+24
	ldr	r0, .L49+28
	ldr	r5, .L49+32
	mov	lr, pc
	bx	r5
	bl	goToInstructions2
	ldrh	r2, [r4]
	b	.L38
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.size	instructions1, .-instructions1
	.align	2
	.global	goToInstructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions3, %function
goToInstructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2688
	ldr	r4, .L53
	ldr	r2, .L53+4
	ldr	r1, .L53+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L53+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	100679680
	.word	instructionsbg4Tiles
	.word	100724736
	.word	instructionsbg4Map
	.word	state
	.size	goToInstructions3, .-goToInstructions3
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L72+4
	ldr	r2, .L72+8
	ldrh	r3, [lr]
	ldrh	r0, [r2]
	sub	r3, r3, #1
	lsl	r1, r3, #16
	lsr	r1, r1, #18
	sub	r0, r0, #1
	strh	r0, [r2]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #2
	strh	r3, [ip, #22]	@ movhi
	ldr	r4, .L72+12
	ldrh	r2, [r4]
	tst	r2, #32
	beq	.L56
	ldr	r3, .L72+16
	ldrh	r3, [r3]
	ands	r3, r3, #32
	beq	.L69
.L56:
	tst	r2, #16
	beq	.L57
	ldr	r3, .L72+16
	ldrh	r3, [r3]
	ands	r3, r3, #16
	beq	.L70
.L57:
	tst	r2, #8
	beq	.L55
	ldr	r3, .L72+16
	ldrh	r3, [r3]
	ands	r3, r3, #8
	beq	.L71
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	ldr	r4, .L72+20
	ldr	r2, .L72+24
	ldr	r1, .L72+28
	ldr	r0, .L72+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L69:
	ldr	r2, .L72+24
	ldr	r1, .L72+28
	ldr	r0, .L72+32
	ldr	r5, .L72+20
	mov	lr, pc
	bx	r5
	bl	goToInstructions1
	ldrh	r2, [r4]
	b	.L56
.L70:
	ldr	r2, .L72+24
	ldr	r1, .L72+28
	ldr	r0, .L72+32
	ldr	r5, .L72+20
	mov	lr, pc
	bx	r5
	bl	goToInstructions3
	ldrh	r2, [r4]
	b	.L57
.L73:
	.align	2
.L72:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	playSoundB
	.word	11025
	.word	17243
	.word	clang
	.size	instructions2, .-instructions2
	.align	2
	.global	instructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions3, %function
instructions3:
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
	strh	r0, [r2]	@ movhi
	strh	r3, [lr]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldrh	r3, [r2]
	lsr	r3, r3, #2
	strh	r3, [ip, #22]	@ movhi
	ldr	r4, .L86+12
	ldrh	r2, [r4]
	tst	r2, #32
	beq	.L75
	ldr	r3, .L86+16
	ldrh	r3, [r3]
	ands	r3, r3, #32
	beq	.L84
.L75:
	tst	r2, #8
	beq	.L74
	ldr	r3, .L86+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
.L74:
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	pop	{r4, r5, r6, lr}
	b	instructions3.part.2
.L84:
	ldr	r2, .L86+20
	ldr	r1, .L86+24
	ldr	r0, .L86+28
	ldr	r5, .L86+32
	mov	lr, pc
	bx	r5
	bl	goToInstructions2
	ldrh	r2, [r4]
	b	.L75
.L87:
	.align	2
.L86:
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.size	instructions3, .-instructions3
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
	ldr	r4, .L93
	mov	r2, #83886080
	ldr	r1, .L93+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L93+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L93+12
	ldr	r1, .L93+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L93+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L92
	mov	r3, #2080
	ldr	r2, .L93+24
	ldr	r1, .L93+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L93+32
	ldr	r1, .L93+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L90:
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L93+40
	ldr	r1, .L93+44
	strh	r3, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldrh	r1, [r1]
	ldr	r3, .L93+48
	strh	r1, [r2, #22]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L93+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L92:
	mov	r3, #1328
	ldr	r2, .L93+24
	ldr	r1, .L93+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L93+32
	ldr	r1, .L93+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L90
.L94:
	.align	2
.L93:
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
	ldr	r3, .L108
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L108+4
	ldr	r2, .L108+8
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
	ldr	r3, .L108+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+20
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L95
	ldr	r3, .L108+24
	ldrh	r3, [r3]
	ands	r4, r3, #1
	bne	.L95
	ldr	r3, .L108+28
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L104
	cmp	r5, #1
	beq	.L105
	cmp	r5, #2
	beq	.L106
.L95:
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	ldr	r3, .L108+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L106:
	ldr	r5, .L108+36
	mov	r3, r4
	ldr	r2, .L108+40
	ldr	r1, .L108+44
	ldr	r0, .L108+48
	ldr	r6, .L108+52
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L107
	mov	r3, #1328
	ldr	r2, .L108+56
	ldr	r1, .L108+60
	mov	r0, #3
	ldr	r6, .L108+64
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	ldr	r2, .L108+68
	ldr	r1, .L108+72
	mov	r0, #3
	mov	lr, pc
	bx	r6
	str	r4, [r5]
	b	.L95
.L105:
	ldr	r3, .L108+32
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L108+40
	ldr	r1, .L108+44
	ldr	r0, .L108+48
	ldr	r4, .L108+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r4, .L108+76
	ldr	r2, .L108+40
	ldr	r1, .L108+80
	ldr	r0, .L108+84
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L107:
	mov	r3, #2080
	ldr	r2, .L108+56
	ldr	r1, .L108+88
	mov	r0, #3
	ldr	r4, .L108+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L108+68
	ldr	r1, .L108+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1
	str	r3, [r5]
	b	.L95
.L109:
	.align	2
.L108:
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
	ldr	r4, .L116
	mov	r2, #83886080
	ldr	r1, .L116+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L116+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L116+12
	ldr	r1, .L116+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	ldr	r2, .L116+20
	ldr	r1, .L116+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L116+28
	ldr	r1, .L116+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mvn	r2, #99
	ldr	r1, .L116+36
	ldr	r3, .L116+40
	ldr	r1, [r1]
	smull	r6, r7, r1, r3
	asr	r3, r1, #31
	rsb	r3, r3, r7, asr #5
	mla	r5, r3, r2, r1
	mov	r0, #52
	mov	ip, #79
	ldr	r1, .L116+44
	smull	r6, r7, r5, r1
	asr	r1, r5, #31
	rsb	r1, r1, r7, asr #2
	rsb	lr, r1, r1, lsl #29
	rsb	lr, r1, lr, lsl #2
	add	r2, r5, lr, lsl #1
	str	r2, [sp, #12]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	ldr	r2, .L116+48
	ldr	r5, .L116+52
	add	lr, sp, #8
.L114:
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
	bne	.L114
.L113:
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L116+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #6
	ldr	ip, .L116+56
	ldr	r1, .L116+60
	strh	r3, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L116+64
	ldrh	r1, [r1]
	strh	r1, [r2, #22]	@ movhi
	str	r0, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L117:
	.align	2
.L116:
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
	ldr	r3, .L127
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+8
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r2, .L127+12
	ldrh	r3, [r2]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2]	@ movhi
	ldr	r2, .L127+16
	strh	r3, [r1, #20]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L119
	ldr	r3, .L127+20
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L125
.L119:
	ldr	r3, .L127+24
	ldr	r4, [r3]
	cmp	r4, #1
	beq	.L126
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	ldr	r3, .L127+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L127+32
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L127+36
	ldr	r1, .L127+40
	ldr	r0, .L127+44
	ldr	r4, .L127+48
	mov	lr, pc
	bx	r4
	ldr	r4, .L127+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L127+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToLose
.L125:
	ldr	r3, .L127+28
	mov	lr, pc
	bx	r3
	ldr	r5, .L127+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L127+56
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L127+36
	ldr	r1, .L127+60
	ldr	r0, .L127+64
	ldr	r4, .L127+68
	mov	lr, pc
	bx	r4
	bl	goToPause
	b	.L119
.L128:
	.align	2
.L127:
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
	ldr	r3, .L136
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	ldr	lr, .L136+4
	ldr	r2, .L136+8
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
	ldr	r3, .L136+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L129
	ldr	r3, .L136+16
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L135
.L129:
	pop	{r4, r5, r6, lr}
	bx	lr
.L135:
	ldr	r3, .L136+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L136+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L136+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L136+36
	ldr	r1, .L136+40
	ldr	r0, .L136+44
	ldr	r4, .L136+48
	mov	lr, pc
	bx	r4
	ldr	r4, .L136+52
	mov	r3, #1
	ldr	r2, .L136+36
	ldr	r1, .L136+56
	ldr	r0, .L136+60
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L137:
	.align	2
.L136:
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
	ldr	r3, .L152
	mov	lr, pc
	bx	r3
	ldr	r6, .L152+4
	ldr	r7, .L152+8
	ldr	r5, .L152+12
	ldr	fp, .L152+16
	ldr	r10, .L152+20
	ldr	r9, .L152+24
	ldr	r8, .L152+28
	ldr	r4, .L152+32
.L139:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L140:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L140
.L142:
	.word	.L141
	.word	.L143
	.word	.L144
	.word	.L145
	.word	.L146
	.word	.L147
	.word	.L148
.L148:
	ldr	r3, .L152+36
	mov	lr, pc
	bx	r3
	b	.L139
.L147:
	ldr	r3, .L152+40
	mov	lr, pc
	bx	r3
	b	.L139
.L146:
	ldr	r3, .L152+44
	mov	lr, pc
	bx	r3
	b	.L139
.L145:
	mov	lr, pc
	bx	r8
	b	.L139
.L144:
	mov	lr, pc
	bx	r9
	b	.L139
.L143:
	mov	lr, pc
	bx	r10
	b	.L139
.L141:
	mov	lr, pc
	bx	fp
	b	.L139
.L153:
	.align	2
.L152:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions1
	.word	instructions2
	.word	instructions3
	.word	67109120
	.word	lose
	.word	pause
	.word	game
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
