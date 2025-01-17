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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerDying.part.2, %function
playerDying.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L4
	ldr	r3, [r2, #36]
	add	r3, r3, #1
	cmp	r3, #6
	str	r3, [r2, #36]
	movgt	r2, #1
	ldrgt	r3, .L4+4
	strgt	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	playerDefeated
	.size	playerDying.part.2, .-playerDying.part.2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnergyWave.part.9, %function
updateEnergyWave.part.9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	ldr	r0, [r3, #36]
	ldr	r2, [r3]
	cmp	r0, r2
	str	lr, [sp, #-4]!
	bge	.L7
	ldr	r1, [r3, #24]
	sub	r2, r2, r1
	str	r2, [r3]
.L8:
	ldr	ip, [r3, #40]
	ldr	r1, [r3, #4]
	cmp	ip, r1
	bge	.L9
	ldr	lr, [r3, #28]
	sub	r1, r1, lr
	str	r1, [r3, #4]
.L10:
	cmp	r0, r2
	bne	.L6
	ldr	r2, [r3, #4]
	cmp	ip, r2
	moveq	r2, #0
	streq	r2, [r3, #20]
.L6:
	ldr	lr, [sp], #4
	bx	lr
.L9:
	ldrgt	lr, [r3, #28]
	addgt	r1, lr, r1
	strgt	r1, [r3, #4]
	b	.L10
.L7:
	ldrgt	r1, [r3, #24]
	addgt	r2, r2, r1
	strgt	r2, [r3]
	b	.L8
.L14:
	.align	2
.L13:
	.word	playerEnergyWave
	.size	updateEnergyWave.part.9, .-updateEnergyWave.part.9
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnergyWave.part.10, %function
drawEnergyWave.part.10:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L18
	ldr	r0, [r3, #32]
	ldr	r1, [r3]
	ldrsh	r3, [r3, #4]
	cmp	r0, #0
	mvneq	r3, r3, lsl #17
	mvneq	r3, r3, lsr #17
	ldr	r2, .L18+4
	orrne	r3, r3, #36864
	strh	r3, [r2, #50]	@ movhi
	ldr	r3, .L18+8
	ldr	r3, [r3]
	lsl	r3, r3, #14
	orr	r3, r3, #516
	strh	r1, [r2, #48]	@ movhi
	strh	r3, [r2, #52]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
	.word	playerEnergyWave
	.word	shadowOAM
	.word	demonMode
	.size	drawEnergyWave.part.10, .-drawEnergyWave.part.10
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyEnergyWaves.part.12, %function
updateEnemyEnergyWaves.part.12:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #36]
	mov	r4, r0
	ldr	r0, [r0]
	cmp	r3, r0
	sub	sp, sp, #16
	bge	.L21
	ldr	r3, [r4, #24]
	sub	r0, r0, r3
	str	r0, [r4]
.L22:
	ldr	r3, [r4, #40]
	ldr	r1, [r4, #4]
	cmp	r3, r1
	bge	.L23
	ldr	r3, [r4, #28]
	sub	r1, r1, r3
	str	r1, [r4, #4]
.L24:
	ldr	r5, .L39
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	add	r3, r3, #32
	str	r3, [sp, #12]
	ldm	r5, {ip, lr}
	add	r2, r2, #32
	ldr	r3, [r4, #16]
	str	r2, [sp, #8]
	sub	lr, lr, #16
	sub	ip, ip, #16
	ldr	r2, [r4, #12]
	ldr	r6, .L39+4
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L20
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L27
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L38
	cmp	r3, #1
	bne	.L27
	ldr	r3, .L39+8
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L27
.L29:
	mov	r3, #0
	str	r3, [r4, #20]
.L20:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	ldrgt	r3, [r4, #28]
	addgt	r1, r1, r3
	strgt	r1, [r4, #4]
	b	.L24
.L21:
	ldrgt	r3, [r4, #24]
	addgt	r0, r0, r3
	strgt	r0, [r4]
	b	.L22
.L38:
	ldr	r3, .L39+8
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L29
.L27:
	add	ip, r5, #8
	ldm	ip, {ip, lr}
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L20
	mov	r6, #0
	ldr	r2, .L39+12
	str	r6, [r4, #20]
	mov	r3, r6
	ldr	r1, .L39+16
	ldr	r0, .L39+20
	ldr	r4, .L39+24
	mov	lr, pc
	bx	r4
	mov	r1, #7
	mov	r2, #4
	mov	r3, #1
	str	r6, [r5, #32]
	str	r1, [r5, #16]
	str	r2, [r5, #36]
	str	r3, [r5, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	player
	.word	collision
	.word	target
	.word	11025
	.word	1543
	.word	quack
	.word	playSoundB
	.size	updateEnemyEnergyWaves.part.12, .-updateEnemyEnergyWaves.part.12
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r1, #32
	mov	r4, #110
	mov	lr, #104
	mov	ip, #25
	mov	r0, #100
	ldr	r3, .L43
	stm	r3, {r4, lr}
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemyEnergyWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyEnergyWaves, %function
initEnemyEnergyWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #32
	mov	r1, #1
	ldr	ip, .L49
	ldr	r3, .L49+4
	push	{r4, lr}
	ldm	ip, {r4, lr}
	add	ip, r3, #176
.L46:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r4, [r3, #36]
	str	lr, [r3, #40]
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L46
	pop	{r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	player
	.word	enemyWaves
	.size	initEnemyEnergyWaves, .-initEnemyEnergyWaves
	.align	2
	.global	playerWait
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerWait, %function
playerWait:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L65
	ldr	r2, [r4, #32]
	ldr	r3, .L65+4
	add	r2, r2, #1
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3
	str	r2, [r4, #32]
	bne	.L52
	ldr	r2, [r4, #36]
	cmp	r2, #3
	addne	r2, r2, #1
	streq	r3, [r4, #36]
	strne	r2, [r4, #36]
.L52:
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L54
	ldr	r2, .L65+12
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L63
.L54:
	tst	r3, #2
	beq	.L51
	ldr	r3, .L65+12
	ldrh	r3, [r3]
	ands	r5, r3, #2
	beq	.L64
.L51:
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	mov	ip, #6
	mov	r0, #1
	mov	r1, #5
	str	r2, [r4, #32]
	str	ip, [r4, #40]
	str	r0, [r4, #36]
	str	r1, [r4, #16]
	b	.L54
.L64:
	mov	r3, r5
	ldr	r2, .L65+16
	ldr	r6, .L65+20
	ldr	r1, .L65+24
	ldr	r0, .L65+28
	mov	lr, pc
	bx	r6
	mov	r3, #1
	mov	r2, #4
	str	r5, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #36]
	str	r2, [r4, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	player
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	playSoundB
	.word	5920
	.word	swish
	.size	playerWait, .-playerWait
	.align	2
	.global	playerCloseAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCloseAttack, %function
playerCloseAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L78
	ldr	r2, [r3, #32]
	ldr	r1, [r3, #36]
	add	r2, r2, #1
	cmp	r1, #1
	push	{r4, r5, lr}
	str	r2, [r3, #32]
	beq	.L76
	cmp	r1, #2
	beq	.L77
	cmp	r1, #3
	bne	.L67
	ldr	ip, [r3, #24]
.L74:
	cmp	r2, ip
	moveq	r2, #0
	streq	r2, [r3, #36]
	streq	r2, [r3, #40]
	streq	r2, [r3, #16]
	streq	r2, [r3, #32]
.L67:
	pop	{r4, r5, lr}
	bx	lr
.L77:
	ldr	ip, [r3, #24]
.L70:
	ldr	r0, .L78+4
	lsl	r1, ip, #2
	smull	r4, r5, r1, r0
	asr	r1, r1, #31
	rsb	r1, r1, r5, asr #1
	cmp	r2, r1
	bne	.L67
	mov	r0, #3
	mov	r1, #0
	str	r0, [r3, #36]
	str	r1, [r3, #20]
	b	.L74
.L76:
	ldr	ip, [r3, #24]
	ldr	lr, .L78+4
	lsl	r0, ip, #1
	smull	r4, r5, r0, lr
	asr	r0, r0, #31
	rsb	r0, r0, r5, asr #1
	cmp	r2, r0
	moveq	r0, #2
	streq	r1, [r3, #20]
	streq	r0, [r3, #36]
	beq	.L70
	pop	{r4, r5, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	player
	.word	1717986919
	.size	playerCloseAttack, .-playerCloseAttack
	.align	2
	.global	playerDying
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerDying, %function
playerDying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L83
	ldr	r3, [r1, #32]
	ldr	r2, .L83+4
	add	r3, r3, #1
	push	{r4, r5}
	smull	r4, r5, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r5, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r1, #32]
	popeq	{r4, r5}
	beq	playerDying.part.2
.L80:
	pop	{r4, r5}
	bx	lr
.L84:
	.align	2
.L83:
	.word	player
	.word	1717986919
	.size	playerDying, .-playerDying
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L102
	ldr	r2, [r3, #16]
	cmp	r2, #5
	ldr	ip, [r3, #36]
	beq	.L86
	ldr	r2, .L102+4
	ldr	r2, [r2]
	cmp	r2, #1
	ldr	r2, [r3, #4]
	mvngt	r2, r2, lsl #18
	mvngt	r2, r2, lsr #18
	ldr	r0, [r3]
	ldr	r1, .L102+8
	orr	r0, r0, #16384
	suble	r2, r2, #32
	strh	r0, [r1]	@ movhi
	ldr	r0, .L102+12
	orrle	r2, r2, #53248
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #40]
	ldr	r3, [r0]
	add	r2, r2, ip, lsl #4
	lsl	r3, r3, #14
	orr	r3, r3, r2, lsl #3
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L86:
	cmp	ip, #1
	beq	.L100
	cmp	ip, #3
	beq	.L101
	bgt	.L97
	ldr	r1, .L102+8
.L92:
	ldr	r2, .L102+12
	ldr	r3, [r3, #40]
	ldr	r2, [r2]
	add	ip, r3, ip, lsl #5
	lsl	r2, r2, #14
	orr	r2, r2, ip, lsl #2
	strh	r2, [r1, #4]	@ movhi
	bx	lr
.L101:
	ldr	r1, .L102+4
	ldr	r2, [r3]
	ldr	r0, [r1]
	ldr	r1, .L102+8
	sub	r2, r2, #32
	cmp	r0, #1
	strh	r2, [r1]	@ movhi
	ldr	r2, [r3, #4]
	ble	.L99
.L95:
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	strh	r2, [r1, #2]	@ movhi
	b	.L92
.L97:
	ldr	r1, .L102+4
	ldr	r2, [r3]
	ldr	r0, [r1]
	ldr	r1, .L102+8
	orr	r2, r2, #16384
	cmp	r0, #1
	strh	r2, [r1]	@ movhi
	ldr	r2, [r3, #4]
	bgt	.L95
.L99:
	sub	r2, r2, #32
.L98:
	orr	r2, r2, #53248
	strh	r2, [r1, #2]	@ movhi
	b	.L92
.L100:
	ldr	r2, [r3]
	sub	r2, r2, #32
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L102+4
	ldr	r0, [r1]
	ldr	r1, .L102+8
	cmp	r0, #1
	strh	r2, [r1]	@ movhi
	ldrsh	r2, [r3, #4]
	bgt	.L95
	b	.L98
.L103:
	.align	2
.L102:
	.word	player
	.word	target
	.word	shadowOAM
	.word	demonMode
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	mov	fp, #32
	ldr	r4, .L111
	ldr	r6, .L111+4
	ldr	r8, .L111+8
	ldr	r7, .L111+12
	sub	sp, sp, #12
.L108:
	mov	r10, #1
	mov	r5, #0
	and	r1, r9, r10
	asr	r3, r9, r10
	lsl	r2, r1, r10
	add	r0, r3, r3, lsl r10
	add	r2, r2, r1
	rsb	r3, r3, r0, lsl #3
	rsb	r2, r2, r2, lsl #4
	lsl	r3, r3, #3
	add	r2, r2, #80
	add	r3, r3, #10
	str	r2, [r4]
	str	r2, [r4, #8]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	str	fp, [r4, #16]
	str	fp, [r4, #20]
	str	r9, [r4, #28]
	str	r5, [r4, #52]
	str	r5, [r4, #48]
	str	r5, [r4, #56]
	str	r5, [r4, #76]
	str	r10, [r4, #32]
	str	r10, [r4, #36]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r0, r8
	stm	sp, {r2-r3}
	ldr	r3, [sp, #4]
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #2
	str	r3, [r4, #60]
	str	r10, [r4, #84]
	str	r5, [r4, #40]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r0, r7
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r10
	sub	r3, r0, r3
	cmp	r3, r5
	str	r5, [r4, #80]
	str	r3, [r4, #24]
	bne	.L105
	mov	r2, #175
	mov	r3, #100
	str	r2, [r4, #64]
	str	r3, [r4, #68]
.L106:
	add	r9, r9, #1
	cmp	r9, #4
	add	r4, r4, #88
	bne	.L108
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L105:
	cmp	r3, #1
	moveq	r2, #300
	moveq	r3, #50
	movne	r1, #250
	movne	r2, #75
	movne	r3, #100
	streq	r2, [r4, #64]
	streq	r3, [r4, #68]
	strne	r1, [r4, #64]
	strne	r2, [r4, #68]
	strne	r3, [r4, #72]
	b	.L106
.L112:
	.align	2
.L111:
	.word	enemies
	.word	rand
	.word	458129845
	.word	1431655766
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r6, #32
	mov	r0, #110
	mov	r1, #104
	mov	r2, #25
	mov	r3, #100
	ldr	lr, .L117
	ldr	ip, .L117+4
	ldr	r5, .L117+8
	str	r4, [lr]
	str	r4, [ip]
	ldr	lr, .L117+12
	ldr	ip, .L117+16
	str	r4, [lr]
	str	r4, [ip]
	stm	r5, {r0, r1}
	str	r4, [r5, #20]
	str	r4, [r5, #16]
	str	r4, [r5, #32]
	str	r4, [r5, #36]
	str	r4, [r5, #40]
	str	r2, [r5, #24]
	str	r3, [r5, #28]
	str	r6, [r5, #8]
	str	r6, [r5, #12]
	bl	initEnemies
	mov	lr, #1
	mov	ip, r6
	ldr	r1, .L117+20
	ldr	r3, .L117+24
	str	r4, [r1]
	str	r4, [r1, #4]
	str	r4, [r1, #20]
	str	r4, [r1, #32]
	str	lr, [r1, #24]
	str	lr, [r1, #28]
	mov	r2, r4
	mov	r0, lr
	ldm	r5, {r4, lr}
	str	r6, [r1, #16]
	str	r6, [r1, #12]
	add	r1, r3, #176
.L114:
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #12]
	str	ip, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r4, [r3, #36]
	str	lr, [r3, #40]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L114
	pop	{r4, r5, r6, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	demonMode
	.word	playerDefeated
	.word	player
	.word	enemiesDefeated
	.word	target
	.word	playerEnergyWave
	.word	enemyWaves
	.size	initGame, .-initGame
	.align	2
	.global	enemyWait
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyWait, %function
enemyWait:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #56]
	ldr	r3, .L144
	add	r2, r2, #1
	push	{r4, r5, r6, lr}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #1
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3
	str	r2, [r0, #56]
	bne	.L120
	ldr	r1, [r0, #48]
	cmp	r1, #3
	addne	r1, r1, #1
	streq	r3, [r0, #48]
	strne	r1, [r0, #48]
.L120:
	ldr	r3, [r0, #60]
	cmp	r2, r3
	blt	.L119
	mov	r2, #0
	mov	ip, #4
	mov	r1, #1
	mov	r3, r2
	str	ip, [r0, #48]
	str	r2, [r0, #56]
	str	r2, [r0, #52]
	str	r1, [r0, #40]
	ldr	ip, .L144+4
.L125:
	add	r2, ip, r3
	ldr	r2, [r2, #40]
	sub	r1, r2, #4
	cmp	r2, #2
	cmpne	r1, #1
	add	r3, r3, #88
	bls	.L119
	cmp	r3, #352
	bne	.L125
	ldr	r3, .L144+8
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r1, .L144+12
	smull	r2, r3, r0, r1
	ldr	r1, [r4, #24]
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, #0
	sub	r3, r0, r3
	bne	.L142
	cmp	r3, #0
	ble	.L127
.L129:
	mov	r1, #4
	mov	r2, #0
	mov	r3, #1
	str	r1, [r4, #48]
	str	r2, [r4, #52]
	str	r3, [r4, #40]
.L119:
	pop	{r4, r5, r6, lr}
	bx	lr
.L142:
	cmp	r1, #1
	beq	.L143
	cmp	r3, #0
	beq	.L127
	cmp	r3, #1
	beq	.L129
	mov	r1, #6
	mov	r2, #1
	mov	r3, #5
	str	r1, [r4, #52]
	str	r2, [r4, #48]
	str	r3, [r4, #40]
	b	.L119
.L143:
	cmp	r3, #0
	ble	.L129
.L127:
	mov	r3, #2
	str	r3, [r4, #48]
	str	r3, [r4, #52]
	str	r3, [r4, #40]
	b	.L119
.L145:
	.align	2
.L144:
	.word	1717986919
	.word	enemies
	.word	rand
	.word	1431655766
	.size	enemyWait, .-enemyWait
	.align	2
	.global	enemyVulnerable
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyVulnerable, %function
enemyVulnerable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r3, [r0, #56]
	ldr	r2, .L171
	add	r3, r3, #1
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	sub	sp, sp, #20
	str	r3, [r4, #56]
	bne	.L147
	ldr	r3, [r4, #48]
	cmp	r3, #4
	moveq	r3, #5
	movne	r3, #4
	str	r3, [r4, #48]
.L147:
	ldr	r5, .L171+4
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r3, [r4, #20]
	ldm	r5, {ip, lr}
	ldr	r2, [r4, #16]
	str	r1, [sp, #12]
	ldr	r1, [r4, #4]
	str	r0, [sp, #8]
	ldr	r6, .L171+8
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L149
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L167
.L149:
	ldr	r3, .L171+12
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L152
	ldr	r3, [r4, #80]
	cmp	r3, #0
	bne	.L168
.L152:
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #64]
	cmp	r3, r2
	beq	.L169
.L146:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L168:
	ldr	r2, [r4, #28]
	ldr	r3, .L171+16
	cmp	r2, #1
	ldr	r3, [r3]
	ble	.L170
	cmp	r3, #1
	ble	.L152
.L154:
	mov	r3, #0
	ldr	r2, .L171+20
	ldr	r1, .L171+24
	ldr	r0, .L171+28
	ldr	r6, .L171+32
	mov	lr, pc
	bx	r6
	mov	r3, #0
	mov	r2, r3
	mov	ip, #7
	mov	r0, #4
	mov	r1, #1
	str	r3, [r5, #20]
	str	r3, [r4, #56]
	ldr	r3, [r4, #64]
	cmp	r3, r2
	str	ip, [r4, #40]
	str	r0, [r4, #48]
	str	r1, [r4, #52]
	bne	.L146
.L169:
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	cmp	r2, r3
	beq	.L156
	mov	r3, #2
	mov	r2, #3
	str	r3, [r4, #48]
	str	r2, [r4, #40]
	str	r3, [r4, #52]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L167:
	mov	r3, #0
	ldr	r2, .L171+20
	ldr	r1, .L171+24
	ldr	r0, .L171+28
	ldr	r6, .L171+32
	mov	lr, pc
	bx	r6
	mov	r3, #0
	mov	r0, #7
	mov	r1, #4
	mov	r2, #1
	str	r0, [r4, #40]
	str	r3, [r4, #56]
	str	r3, [r5, #20]
	str	r1, [r4, #48]
	str	r2, [r4, #52]
	b	.L149
.L170:
	cmp	r3, #1
	bgt	.L152
	b	.L154
.L156:
	mov	r5, #0
	ldr	r3, .L171+36
	str	r5, [r4, #40]
	str	r5, [r4, #56]
	mov	lr, pc
	bx	r3
	ldr	r3, .L171+40
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #2
	str	r5, [r4, #52]
	str	r5, [r4, #48]
	str	r3, [r4, #60]
	b	.L146
.L172:
	.align	2
.L171:
	.word	1717986919
	.word	playerEnergyWave
	.word	collision
	.word	player
	.word	target
	.word	11025
	.word	1543
	.word	quack
	.word	playSoundB
	.word	rand
	.word	458129845
	.size	enemyVulnerable, .-enemyVulnerable
	.align	2
	.global	enemyApproach
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyApproach, %function
enemyApproach:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L183
	ldr	lr, [r5, #12]
	ldr	ip, [r5, #4]
	sub	sp, sp, #16
	add	r2, r0, #16
	add	lr, lr, #20
	sub	ip, ip, #10
	ldm	r2, {r2, r3}
	mov	r4, r0
	ldm	r0, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #4]
	ldr	lr, [r5, #8]
	ldr	ip, [r5]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	r6, .L183+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L180
	ldr	r2, [r5]
	ldr	r3, [r4]
	cmp	r2, r3
	blt	.L181
	ldrgt	r2, [r4, #32]
	addgt	r3, r2, r3
	strgt	r3, [r4]
	ldr	r2, [r5, #4]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	blt	.L182
.L178:
	ldrgt	r2, [r4, #36]
	addgt	r3, r2, r3
	strgt	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L181:
	ldr	r2, [r4, #32]
	sub	r3, r3, r2
	str	r3, [r4]
	ldr	r2, [r5, #4]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	bge	.L178
.L182:
	ldr	r2, [r4, #36]
	sub	r3, r3, r2
	str	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L180:
	mov	r3, #1
	mov	r2, #4
	str	r3, [r4, #80]
	str	r3, [r4, #52]
	str	r3, [r4, #48]
	str	r2, [r4, #40]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	player
	.word	collision
	.size	enemyApproach, .-enemyApproach
	.align	2
	.global	enemyCloseAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyCloseAttack, %function
enemyCloseAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r3, [r0, #56]
	ldr	r2, [r0, #48]
	add	r3, r3, r1
	cmp	r2, r1
	push	{r4, r5, r6, lr}
	mov	r4, r0
	str	r1, [r0, #80]
	str	r3, [r0, #56]
	beq	.L206
.L186:
	cmp	r2, #2
	beq	.L207
	cmp	r2, #3
	beq	.L194
.L185:
	pop	{r4, r5, r6, lr}
	bx	lr
.L207:
	ldr	r3, [r4, #68]
	ldr	r2, .L210
	lsl	r3, r3, #2
	smull	r0, r1, r3, r2
	asr	r3, r3, #31
	ldr	r2, [r4, #56]
	rsb	r3, r3, r1, asr #1
	cmp	r2, r3
	bne	.L185
	mov	r2, #3
	mov	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #76]
.L194:
	ldr	r3, .L210+4
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L196
	ldr	r3, .L210+8
	ldr	r3, [r3]
	cmp	r3, #1
	ldr	r3, [r4, #28]
	ble	.L208
	cmp	r3, #1
	ble	.L196
.L198:
	mov	ip, #0
	ldr	lr, .L210+12
	mov	r3, ip
	ldr	r2, .L210+16
	ldr	r1, .L210+20
	ldr	r0, .L210+24
	ldr	r5, .L210+28
	str	ip, [lr, #20]
	mov	lr, pc
	bx	r5
.L196:
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #68]
	cmp	r2, r3
	bne	.L185
	mov	r3, #0
	mov	r1, #4
	mov	r2, #1
	str	r1, [r4, #48]
	str	r3, [r4, #52]
	str	r3, [r4, #56]
	str	r2, [r4, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L206:
	ldr	r5, .L210+4
	ldr	r2, [r5, #20]
	cmp	r2, #0
	beq	.L187
	ldr	r2, .L210+8
	ldr	r2, [r2]
	cmp	r2, r1
	ldr	r2, [r0, #28]
	ble	.L209
	cmp	r2, #1
	ble	.L187
.L189:
	mov	ip, #0
	mov	r2, #3
	ldr	lr, .L210+12
	mov	r3, ip
	str	r2, [r4, #48]
	ldr	r1, .L210+20
	ldr	r2, .L210+16
	ldr	r0, .L210+24
	ldr	r6, .L210+28
	str	ip, [lr, #20]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #56]
.L187:
	ldr	r2, [r4, #68]
	ldr	ip, .L210
	lsl	r2, r2, #1
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #1
	cmp	r2, r3
	ldrne	r2, [r4, #48]
	bne	.L186
.L190:
	mov	r3, #0
	ldr	r2, .L210+16
	ldr	r1, .L210+32
	ldr	r0, .L210+36
	ldr	r6, .L210+28
	mov	lr, pc
	bx	r6
	mov	r3, #1
	mov	ip, #7
	mov	r0, #0
	mov	r1, #4
	ldr	r2, [r4, #48]
	add	r2, r2, r3
	str	r2, [r4, #48]
	str	r3, [r4, #76]
	str	r3, [r5, #40]
	str	ip, [r5, #16]
	str	r0, [r5, #32]
	str	r1, [r5, #36]
	b	.L186
.L208:
	cmp	r3, #1
	bgt	.L196
	b	.L198
.L209:
	cmp	r2, r1
	bgt	.L187
	b	.L189
.L211:
	.align	2
.L210:
	.word	1717986919
	.word	player
	.word	target
	.word	playerEnergyWave
	.word	11025
	.word	17243
	.word	clang
	.word	playSoundB
	.word	1543
	.word	quack
	.size	enemyCloseAttack, .-enemyCloseAttack
	.align	2
	.global	enemyRetreat
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyRetreat, %function
enemyRetreat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r3, [r0, #8]
	ldr	r2, [r0]
	cmp	r2, r3
	str	r5, [r0, #80]
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #12]
	beq	.L219
	ble	.L216
	ldr	ip, [r0, #32]
	sub	r2, r2, ip
	str	r2, [r0]
.L214:
	cmp	r1, r3
	blt	.L220
	ldrgt	r2, [r0, #36]
	addgt	r3, r2, r3
	strgt	r3, [r0, #4]
.L212:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L220:
	ldr	r2, [r0, #36]
	sub	r3, r3, r2
	str	r3, [r0, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L219:
	cmp	r1, r3
	bne	.L214
	ldr	r3, .L221
	str	r5, [r0, #40]
	str	r5, [r0, #56]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L221+4
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #2
	str	r5, [r4, #52]
	str	r5, [r4, #48]
	str	r3, [r4, #60]
	b	.L212
.L216:
	ldrlt	ip, [r0, #32]
	addlt	r2, ip, r2
	strlt	r2, [r0]
	b	.L214
.L222:
	.align	2
.L221:
	.word	rand
	.word	458129845
	.size	enemyRetreat, .-enemyRetreat
	.align	2
	.global	enemyDying
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyDying, %function
enemyDying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #56]
	ldr	r3, .L231
	add	r2, r2, #1
	push	{r4, r5}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	str	r2, [r0, #56]
	bne	.L223
	ldr	r2, [r0, #48]
	add	r2, r2, #1
	cmp	r2, #6
	str	r2, [r0, #48]
	ble	.L223
	mov	ip, #6
	ldr	r1, .L231+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #0
	str	r3, [r0, #84]
	str	r2, [r1]
	str	ip, [r0, #48]
	beq	.L223
	tst	r2, #3
	popeq	{r4, r5}
	beq	initEnemies
.L223:
	pop	{r4, r5}
	bx	lr
.L232:
	.align	2
.L231:
	.word	1717986919
	.word	enemiesDefeated
	.size	enemyDying, .-enemyDying
	.align	2
	.global	updateTargetPointer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTargetPointer, %function
updateTargetPointer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L254
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L234
	ldr	r2, .L254+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L250
.L234:
	tst	r3, #32
	beq	.L235
	ldr	r2, .L254+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L251
.L235:
	tst	r3, #64
	beq	.L236
	ldr	r2, .L254+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L252
.L236:
	tst	r3, #128
	bxeq	lr
.L253:
	ldr	r3, .L254+4
	ldrh	r3, [r3]
	tst	r3, #128
	bxne	lr
	ldr	r2, .L254+8
	ldr	r3, [r2]
	tst	r3, #1
	addeq	r3, r3, #1
	streq	r3, [r2]
	bx	lr
.L252:
	ldr	r0, .L254+8
	ldr	r1, [r0]
	cmp	r1, #0
	and	r2, r1, #1
	rsblt	r2, r2, #0
	cmp	r2, #1
	subeq	r1, r1, #1
	streq	r1, [r0]
	tst	r3, #128
	bne	.L253
	bx	lr
.L251:
	ldr	r1, .L254+8
	ldr	r2, [r1]
	cmp	r2, #1
	subgt	r2, r2, #2
	strgt	r2, [r1]
	b	.L235
.L250:
	ldr	r1, .L254+8
	ldr	r2, [r1]
	cmp	r2, #1
	addle	r2, r2, #2
	strle	r2, [r1]
	b	.L234
.L255:
	.align	2
.L254:
	.word	oldButtons
	.word	buttons
	.word	target
	.size	updateTargetPointer, .-updateTargetPointer
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L287
	ldr	r0, [r3, #84]
	cmp	r0, #0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #4
	mov	r1, #0
	ldr	ip, .L287+4
	ldr	r5, .L287+8
	ldr	r6, .L287+12
	ldr	r4, .L287+16
	ldr	r7, [r3, #48]
	beq	.L257
.L283:
	ldr	r0, [r3, #40]
	cmp	r0, #1
	beq	.L281
	cmp	r0, #5
	beq	.L282
	ldr	r0, [r3]
	lsl	r2, r2, #3
	orr	r0, r0, #16384
	strh	r0, [ip, r2]	@ movhi
	ldr	r0, [r3, #4]
	cmp	r1, #1
	subgt	r0, r0, #32
	add	lr, ip, r2
	orrgt	r0, r0, #53248
	orrle	r0, r0, r5
	strh	r0, [lr, #2]	@ movhi
.L270:
	ldr	lr, [r3, #24]
	ldr	r0, [r3, #52]
	add	lr, lr, #1
	lsl	lr, lr, #12
	add	r7, r0, r7, lsl #4
	add	r2, ip, r2
	orr	r7, lr, r7, lsl #3
	strh	r7, [r2, #4]	@ movhi
.L261:
	add	r1, r1, #1
	cmp	r1, #4
	add	r3, r3, #88
	beq	.L256
.L284:
	ldr	r0, [r3, #84]
	cmp	r0, #0
	ldr	r2, [r4, r1, lsl #2]
	ldr	r7, [r3, #48]
	bne	.L283
.L257:
	ldr	lr, [r3, #4]
	ldr	r0, [r3]
	cmp	r1, #1
	subgt	lr, lr, #32
	lsl	r2, r2, #3
	orr	r0, r0, #16384
	strh	r0, [ip, r2]	@ movhi
	orrgt	lr, lr, #53248
	add	r0, ip, r2
	orrle	lr, lr, r5
	strh	lr, [r0, #2]	@ movhi
	ldr	r0, [r3, #24]
	ldr	lr, [r3, #52]
	add	r0, r0, #1
	lsl	r0, r0, #12
	add	r7, lr, r7, lsl #4
	add	r1, r1, #1
	add	r2, ip, r2
	orr	r0, r0, r7, lsl #3
	cmp	r1, #4
	strh	r0, [r2, #4]	@ movhi
	add	r3, r3, #88
	bne	.L284
.L256:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L281:
	ldr	r0, [r3]
	lsl	r2, r2, #3
	strh	r0, [ip, r2]	@ movhi
	ldrsh	r0, [r3, #4]
	cmp	r1, #1
	add	lr, ip, r2
	orrgt	r0, r0, #36864
	orrle	r0, r0, r6
	strh	r0, [lr, #2]	@ movhi
	b	.L270
.L282:
	cmp	r7, #1
	beq	.L285
	cmp	r7, #3
	beq	.L286
	lslle	r2, r2, #3
	ble	.L265
	ldr	r0, [r3]
	lsl	r2, r2, #3
	orr	r0, r0, #16384
	cmp	r1, #1
	strh	r0, [ip, r2]	@ movhi
	add	lr, ip, r2
	ldr	r0, [r3, #4]
	bgt	.L280
.L268:
	orr	r0, r0, r5
	strh	r0, [lr, #2]	@ movhi
	b	.L265
.L286:
	ldr	r0, [r3]
	lsl	r2, r2, #3
	sub	r0, r0, #32
	cmp	r1, #1
	strh	r0, [ip, r2]	@ movhi
	add	lr, ip, r2
	ldr	r0, [r3, #4]
	ble	.L268
.L280:
	sub	r0, r0, #32
.L279:
	orr	r0, r0, #53248
	strh	r0, [lr, #2]	@ movhi
.L265:
	ldr	lr, [r3, #24]
	ldr	r0, [r3, #52]
	add	lr, lr, #1
	lsl	lr, lr, #12
	add	r7, r0, r7, lsl #5
	add	r2, ip, r2
	orr	r7, lr, r7, lsl #2
	strh	r7, [r2, #4]	@ movhi
	b	.L261
.L285:
	ldr	r0, [r3]
	sub	r0, r0, #32
	lsl	r2, r2, #3
	orr	r0, r0, r6
	cmp	r1, #1
	strh	r0, [ip, r2]	@ movhi
	add	lr, ip, r2
	ldrsh	r0, [r3, #4]
	ble	.L268
	b	.L279
.L288:
	.align	2
.L287:
	.word	enemies
	.word	shadowOAM
	.word	-16384
	.word	-32768
	.word	.LANCHOR0
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawTargetPointer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTargetPointer, %function
drawTargetPointer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L293
	ldr	r2, [r3]
	add	r3, r2, r2, lsl #2
	ldr	r1, .L293+4
	add	r3, r2, r3, lsl #1
	lsl	r3, r3, #3
	add	r0, r1, r3
	ldr	ip, [r0, #40]
	ldr	r3, [r1, r3]
	ldr	r1, .L293+8
	sub	r3, r3, #16
	cmp	ip, #7
	strh	r3, [r1, #8]	@ movhi
	ldrh	r3, [r0, #4]
	beq	.L290
	add	r3, r3, #8
	orr	r3, r3, #16384
	strh	r3, [r1, #10]	@ movhi
.L291:
	mov	r3, #720
	strh	r3, [r1, #12]	@ movhi
	bx	lr
.L290:
	cmp	r2, #1
	subgt	r3, r3, #16
	addle	r3, r3, #24
	orr	r3, r3, #16384
	strh	r3, [r1, #10]	@ movhi
	b	.L291
.L294:
	.align	2
.L293:
	.word	target
	.word	enemies
	.word	shadowOAM
	.size	drawTargetPointer, .-drawTargetPointer
	.align	2
	.global	initEnergyWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnergyWave, %function
initEnergyWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r0, #32
	mov	r1, #1
	ldr	r3, .L296
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r0, [r3, #16]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	bx	lr
.L297:
	.align	2
.L296:
	.word	playerEnergyWave
	.size	initEnergyWave, .-initEnergyWave
	.align	2
	.global	fireEnergyWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnergyWave, %function
fireEnergyWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L301
	ldr	r3, .L301+4
	ldr	r1, [r0]
	ldr	r3, [r3]
	ldr	r2, .L301+8
	ldr	r0, [r0, #4]
	sub	r1, r1, #36
	cmp	r3, #1
	str	r1, [r2]
	addgt	r0, r0, #23
	movgt	r1, #0
	movle	r1, #1
	suble	r0, r0, #23
	str	r0, [r2, #4]
	mov	r0, #1
	str	r1, [r2, #32]
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl r0
	ldr	r1, .L301+12
	lsl	r3, r3, #3
	ldr	ip, [r1, r3]!
	ldr	r3, [r1, #4]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	str	r0, [r2, #20]
	bx	lr
.L302:
	.align	2
.L301:
	.word	player
	.word	target
	.word	playerEnergyWave
	.word	enemies
	.size	fireEnergyWave, .-fireEnergyWave
	.align	2
	.global	playerRangedAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerRangedAttack, %function
playerRangedAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L318
	ldr	r3, [r4, #32]
	ldr	r2, [r4, #36]
	add	r3, r3, #1
	cmp	r2, #1
	str	r3, [r4, #32]
	beq	.L313
	cmp	r2, #3
	beq	.L314
	cmp	r2, #5
	beq	.L315
	cmp	r2, #6
	beq	.L316
.L303:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L314:
	ldr	r2, [r4, #28]
	ldr	ip, .L318+4
	lsl	r2, r2, #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	moveq	r2, #5
	moveq	r3, #1
	streq	r2, [r4, #36]
	streq	r3, [r4, #20]
	b	.L303
.L313:
	ldr	r2, [r4, #40]
	cmp	r2, #6
	beq	.L317
	cmp	r2, #7
	bne	.L303
	ldr	r2, [r4, #28]
.L308:
	ldr	ip, .L318+4
	rsb	r2, r2, r2, lsl #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	bne	.L303
	mov	r3, #0
	ldr	r2, .L318+8
	ldr	r5, .L318+12
	ldr	r1, .L318+16
	ldr	r0, .L318+20
	mov	lr, pc
	bx	r5
	mov	r2, #6
	ldr	r3, [r4, #36]
	add	r3, r3, #2
	str	r3, [r4, #36]
	str	r2, [r4, #40]
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireEnergyWave
.L316:
	ldr	r2, [r4, #28]
	cmp	r3, r2
	bne	.L303
	mov	r3, #0
	str	r3, [r4, #20]
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r3, [r4, #16]
	str	r3, [r4, #32]
	b	.L303
.L315:
	ldr	r2, [r4, #28]
	ldr	ip, .L318+4
	add	r2, r2, r2, lsl #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	moveq	r3, #6
	streq	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L317:
	ldr	r2, [r4, #28]
	ldr	r1, .L318+4
	smull	r6, r7, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r7, asr #1
	cmp	r3, r1
	moveq	r1, #7
	streq	r1, [r4, #40]
	bne	.L303
	b	.L308
.L319:
	.align	2
.L318:
	.word	player
	.word	1717986919
	.word	11025
	.word	playSoundB
	.word	5920
	.word	swish
	.size	playerRangedAttack, .-playerRangedAttack
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L331
	ldr	r3, [r2, #16]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L328
.L323:
	.word	.L322
	.word	.L328
	.word	.L328
	.word	.L328
	.word	.L324
	.word	.L325
	.word	.L328
	.word	.L326
.L326:
	ldr	r3, [r2, #32]
	ldr	r1, .L331+4
	add	r3, r3, #1
	push	{r4, r5}
	smull	r4, r5, r3, r1
	asr	r1, r3, #31
	rsb	r1, r1, r5, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r3, r1, lsl #1
	str	r3, [r2, #32]
	beq	.L330
	pop	{r4, r5}
	bx	lr
.L325:
	b	playerRangedAttack
.L324:
	b	playerCloseAttack
.L322:
	b	playerWait
.L328:
	bx	lr
.L330:
	pop	{r4, r5}
	b	playerDying.part.2
.L332:
	.align	2
.L331:
	.word	player
	.word	1717986919
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnergyWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnergyWave, %function
updateEnergyWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L335
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateEnergyWave.part.9
.L336:
	.align	2
.L335:
	.word	playerEnergyWave
	.size	updateEnergyWave, .-updateEnergyWave
	.align	2
	.global	drawEnergyWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnergyWave, %function
drawEnergyWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L339
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	drawEnergyWave.part.10
.L338:
	mov	r2, #512
	ldr	r3, .L339+4
	strh	r2, [r3, #48]	@ movhi
	bx	lr
.L340:
	.align	2
.L339:
	.word	playerEnergyWave
	.word	shadowOAM
	.size	drawEnergyWave, .-drawEnergyWave
	.align	2
	.global	fireEnemyEnergyWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyEnergyWave, %function
fireEnemyEnergyWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L354
	mov	r2, ip
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L353
.L342:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #44
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L342
.L353:
	push	{r4, r5, lr}
	ldr	r5, [r0, #28]
	cmp	r5, #1
	movgt	r1, #1
	lsl	lr, r3, #2
	ldr	r4, [r0]
	add	r2, lr, r3
	add	r2, r3, r2, lsl #1
	lsl	r2, r2, #2
	sub	r4, r4, #36
	str	r4, [ip, r2]
	add	r2, ip, r2
	ldr	r0, [r0, #4]
	str	r1, [r2, #32]
	mov	r1, #1
	subgt	r0, r0, #23
	addle	r0, r0, #23
	str	r0, [r2, #4]
	ldr	r2, .L354+4
	add	lr, lr, r3
	add	r3, r3, lr, lsl r1
	ldm	r2, {r0, r2}
	add	r3, ip, r3, lsl #2
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #20]
	pop	{r4, r5, lr}
	bx	lr
.L355:
	.align	2
.L354:
	.word	enemyWaves
	.word	player
	.size	fireEnemyEnergyWave, .-fireEnemyEnergyWave
	.align	2
	.global	enemyRangedAttack
	.syntax unified
	.arm
	.fpu softvfp
	.type	enemyRangedAttack, %function
enemyRangedAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #56]
	ldr	r2, [r0, #48]
	add	r3, r3, #1
	cmp	r2, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	str	r3, [r0, #56]
	beq	.L366
	cmp	r2, #3
	beq	.L367
	cmp	r2, #5
	beq	.L368
	cmp	r2, #6
	beq	.L369
.L356:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L367:
	ldr	r2, [r0, #72]
	ldr	ip, .L371
	lsl	r2, r2, #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	moveq	r2, #5
	moveq	r3, #1
	streq	r2, [r4, #48]
	streq	r3, [r4, #76]
	b	.L356
.L366:
	ldr	r2, [r0, #52]
	cmp	r2, #6
	beq	.L370
	cmp	r2, #7
	bne	.L356
	ldr	r2, [r0, #72]
.L361:
	ldr	ip, .L371
	rsb	r2, r2, r2, lsl #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	bne	.L356
	mov	r3, #0
	ldr	r2, .L371+4
	ldr	r0, .L371+8
	ldr	r5, .L371+12
	ldr	r1, .L371+16
	mov	lr, pc
	bx	r5
	mov	r2, #6
	ldr	r3, [r4, #48]
	add	r3, r3, #2
	str	r3, [r4, #48]
	str	r2, [r4, #52]
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireEnemyEnergyWave
.L369:
	ldr	r2, [r0, #72]
	cmp	r3, r2
	bne	.L356
	mov	r3, #0
	ldr	r2, .L371+20
	str	r3, [r0, #76]
	str	r3, [r0, #48]
	str	r3, [r0, #52]
	str	r3, [r0, #40]
	str	r3, [r0, #56]
	mov	lr, pc
	bx	r2
	ldr	r3, .L371+24
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, lsl #2
	str	r3, [r4, #60]
	b	.L356
.L368:
	ldr	r2, [r0, #72]
	ldr	ip, .L371
	add	r2, r2, r2, lsl #3
	smull	r0, r1, r2, ip
	asr	r2, r2, #31
	rsb	r2, r2, r1, asr #2
	cmp	r3, r2
	moveq	r3, #6
	streq	r3, [r4, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L370:
	ldr	r2, [r0, #72]
	ldr	r1, .L371
	smull	r6, r7, r2, r1
	asr	r1, r2, #31
	rsb	r1, r1, r7, asr #1
	cmp	r3, r1
	moveq	r1, #7
	streq	r1, [r0, #52]
	bne	.L356
	b	.L361
.L372:
	.align	2
.L371:
	.word	1717986919
	.word	11025
	.word	swish
	.word	playSoundB
	.word	5920
	.word	rand
	.word	458129845
	.size	enemyRangedAttack, .-enemyRangedAttack
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies.part.11, %function
updateEnemies.part.11:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L395
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r4, r0
	bne	.L394
.L374:
	ldr	r3, [r4, #40]
.L376:
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L373
.L380:
	.word	.L379
	.word	.L381
	.word	.L382
	.word	.L383
	.word	.L384
	.word	.L385
	.word	.L373
	.word	.L386
.L394:
	ldr	r5, .L395+4
	ldr	r3, [r0, #20]
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #16]
	str	r1, [sp, #12]
	ldm	r5, {ip, lr}
	ldr	r1, [r4, #4]
	str	r0, [sp, #8]
	ldr	r6, .L395+8
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L374
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ldr	r3, [r4, #40]
	beq	.L376
	cmp	r3, #7
	beq	.L386
	mov	r3, #0
	mov	r0, #7
	mov	r1, #4
	mov	r2, #1
	str	r0, [r4, #40]
	str	r3, [r4, #56]
	str	r3, [r5, #20]
	str	r1, [r4, #48]
	str	r2, [r4, #52]
.L386:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyDying
.L379:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyWait
.L381:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyVulnerable
.L382:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyApproach
.L383:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyRetreat
.L384:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyCloseAttack
.L385:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	enemyRangedAttack
.L373:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L396:
	.align	2
.L395:
	.word	demonMode
	.word	playerEnergyWave
	.word	collision
	.size	updateEnemies.part.11, .-updateEnemies.part.11
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemies.part.11
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L419
	add	r5, r4, #352
.L401:
	ldr	r3, [r4, #84]
	cmp	r3, #0
	bne	.L417
.L400:
	add	r4, r4, #88
	cmp	r4, r5
	bne	.L401
	ldr	r4, .L419+4
	add	r5, r4, #176
.L403:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L418
.L402:
	add	r4, r4, #44
	cmp	r5, r4
	bne	.L403
	ldr	r3, .L419+8
	ldr	r3, [r3, #20]
	cmp	r3, #0
	blne	updateEnergyWave.part.9
.L404:
	pop	{r4, r5, r6, lr}
	b	updateTargetPointer
.L418:
	mov	r0, r4
	bl	updateEnemyEnergyWaves.part.12
	b	.L402
.L417:
	mov	r0, r4
	bl	updateEnemies.part.11
	b	.L400
.L420:
	.align	2
.L419:
	.word	enemies
	.word	enemyWaves
	.word	playerEnergyWave
	.size	updateGame, .-updateGame
	.align	2
	.global	drawEnemyEnergyWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyEnergyWaves, %function
drawEnemyEnergyWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, #512
	ldr	r3, .L429
	ldr	r2, .L429+4
	ldr	lr, .L429+8
	ldr	r5, .L429+12
	add	r0, r3, #176
.L426:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	strheq	r4, [r2, #56]	@ movhi
	beq	.L425
	ldr	r1, [r3]
	ldr	ip, [r3, #32]
	strh	r1, [r2, #56]	@ movhi
	ldrsh	r1, [r3, #4]
	cmp	ip, #0
	orr	ip, r1, #36864
	orreq	r1, r1, r5
	strhne	ip, [r2, #58]	@ movhi
	strheq	r1, [r2, #58]	@ movhi
	strh	lr, [r2, #60]	@ movhi
.L425:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L426
	pop	{r4, r5, lr}
	bx	lr
.L430:
	.align	2
.L429:
	.word	enemyWaves
	.word	shadowOAM
	.word	12804
	.word	-32768
	.size	drawEnemyEnergyWaves, .-drawEnemyEnergyWaves
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	bl	drawEnemies
	ldr	r3, .L436
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L435
	mov	r2, #512
	ldr	r3, .L436+4
	strh	r2, [r3, #48]	@ movhi
.L433:
	bl	drawEnemyEnergyWaves
	ldr	r4, .L436+8
	bl	drawTargetPointer
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L436+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L435:
	bl	drawEnergyWave.part.10
	b	.L433
.L437:
	.align	2
.L436:
	.word	playerEnergyWave
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	updateEnemyEnergyWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyEnergyWaves, %function
updateEnemyEnergyWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemyEnergyWaves.part.12
	.size	updateEnemyEnergyWaves, .-updateEnemyEnergyWaves
	.comm	demonMode,4,4
	.comm	enemiesDefeated,4,4
	.comm	target,4,4
	.comm	playerDefeated,4,4
	.comm	playerEnergyWave,44,4
	.comm	enemyWaves,176,4
	.comm	enemies,352,4
	.comm	player,44,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.65, %object
	.size	CSWTCH.65, 16
CSWTCH.65:
	.word	4
	.word	2
	.word	5
	.word	3
	.ident	"GCC: (devkitARM release 47) 7.1.0"
