;******************** (C) Andrew Wolfe ************************
; @file    HW4 Problem 2
; @author  Andrew Wolfe
; @date   Due 10/16/2023
;*************************************************************

			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC
	
		ldr			r0,=data
		ldr			r1,[r0]     ; index=0
		cmp			r1,#0xffffffff	
		bne			fail        ; x != -1
		add			r0,#4       ; index=1
		ldr			r1,[r0]
		cmp			r1,#0xffffffff	
		bmi			fail
		add			r0,#8       ; index=3
		ldr			r1,[r0]
		cmp			r1,#0x00000000	
		bls			fail        ; x < 0
		sub			r0,#4       ; index=2
		ldr			r1,[r0]
		cmn			r1,#0xffffffff	
		bne			fail
		add			r0,#8       ; index=4
		ldr			r1,[r0]
		teq			r1,#0xffffffff ; eor
		bne			fail
		add			r0,#4          ; index=5
		ldr			r1,[r0]
		tst			r1,#0xffffffff ; and
		bne			fail           ; -1
		add			r0,#8          ; index=7
		ldr			r1,[r0]
		tst			r1,#0x02    ;
		beq			fail
		sub			r0,#4       ; index=6
		ldr			r1,[r0]
		teq			r1,#0xffffffff	
		beq			fail		; x != -1

pass	b			pass
fail	b			fail

		ENDP
		ALIGN
data	dcd			-1,1,1,1,-1,0,1,-1
eodata
			
