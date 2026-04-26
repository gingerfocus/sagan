;******************** (C) Andrew Wolfe *******************************************
; @file    HW7 Problem 2
; @author  Andrew Wolfe
; @date    2023
;*******************************************************************************
	
			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC

			ldr		r0, =strarray	; Pointer to array of string pointers
			ldr		r1, =7			; Number of pointers in strarray
			bl		mysort			; Call sorting routine
endless		b		endless

		ENDP

									; r0 = i, r1=j
mysort		PROC
            push {r4, r5, lr}
            mov r4, r0          ; save
            mov r5, r1          ; save
sortloop    mov r0, r4          ; load argument
            mov r1, r5          ; load argument
            bl compare_and_swap ; sort next item
            add r4, r4, #4      ; index pointer to next unsorted
            subs r5, r5, #1     ; decriment index 
            bne sortloop        ; if still going then loop
            pop {r4, r5, lr}
            bx		lr
            ENDP

    ;; find smalles and swap to start
compare_and_swap	PROC
            push {r4, r5, r6, r7}
            mov r3, r0          ; save start pointer
            mov r2, r0          ; pointer best value

    ;; compare the strings (r0, r2)
compareloop
            mov r6, #0
            mov r7, #0

letterloop  ldr r4, [r0, r6, LSL #2]
            ldr r5, [r2, r7, LSL #2]

            cmp r4, #0
            bne yes

            cmp r5, #0
            bne end

            cmp r4, r5
            addeq r6, r6, #1
            addeq r7, r7, #1
            beq letterloop

            blt yes
            b end
yes         mov r2, r0

end         add r0, r0, #4
            subs r1, r1, #1
            bne compareloop

            ;; now swap the values
            ldr r0, [r2]
            ldr r1, [r3]
            str r0, [r3]
            str r1, [r2]

            pop {r4, r5, r6, r7}
			bx		lr
			ENDP
				
strarray	DCD	str1, str2, str3, str4, str5, str6, str7
	
str1		DCB	"First string",0
str2		DCB	"Second string",0
str3		DCB	"So, do I really need a third string",0
str4		DCB	"Tetraphobia is the fear of the number 4",0
str5		DCB	"A is for apple",0
str6		DCB	"Z is called \'zed\' in Canada",0
str7		DCB	"M is for middle",0
		END
