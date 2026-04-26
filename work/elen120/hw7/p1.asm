;******************** (C) Andrew Wolfe *******************************************
; @file    HW7 Problem 1
; @author  Andrew Wolfe
; @date    2023
;*******************************************************************************

	
			AREA    main, CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	    PROC
	
			ldr		r0, =array	; Pointer to array of string pointers
			ldr		r1, =10			; Number of items in array
			bl		mysort			; Call sorting routine
endless		b		endless

		ENDP

									;r0 = i, r1=j
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
            push {r4, r5}
            mov r5, r0          ; save start pointer
            ldr r2, [r0]        ; current best value
            mov r4, r0          ; pointer best value
compareloop ldr r3, [r0]        ; next value
            cmp r2, r3          ; compare
            it le
            movle r2, r3
            it le
            movle r4, r0
            add r0, r0, #4
            subs r1, r1, #1
            bne compareloop

            ;; now swap the values
            ldr r0, [r4]
            ldr r2, [r5]
            str r0, [r5]
            str r2, [r4]

            pop {r4, r5}
			bx		lr
			ENDP
						
			ALIGN
			AREA mydata, DATA, READONLY
array		DCD		9,2,5,1,8,6,7,0,3,4

		END
