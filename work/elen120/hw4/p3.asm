;******************** (C) Andrew Wolfe **********************
; @file    HW4 Problem 3
; @author  Andrew Wolfe
; @date    Oct. 21, 2024
;***********************************************************

			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC
	
			ldr 	r2,=listsize
			ldr		r3,[r2]
			ldr		r2,=list
			mov 	r0,#0
loop 		ldrsh 	r1,[r2]     ; add sh suffix to load singed halfwords
			cmp		r1,#0
            it gt
			addgt	r0,#1       ; change lt to gt
			add 	r2,#2       ; change increment from 4 to 2
			subs	r3,#1
			bne		loop

endless		b			endless

		ENDP
		ALIGN
list		dcw			-2, 0, 1, 5, -3, -5, 3, 9, 2, 12 ; change to dcw for halfwords
		ALIGN
listsize	dcd			10
	
		END
