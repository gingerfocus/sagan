			AREA    text , CODE, READONLY
			EXPORT	__main				
			ENTRY			
				
__main	PROC
        ldr r0, =list1
        ldr r1, =list2
        ldr r2, =eol1
begin   ldr r3, [r0], #4        ; post index load
        add r3, r3, r3, LSL #1  ; 3x = x + 2x
        str r3, [r1], #4        ; post index store
        cmp r0, r2              ; check if at end
        bne begin
endless	b			endless
		ENDP

        AREA    data , DATA, READWRITE
		ALIGN
list1   dcd 1,2,3,4,5,6,7,8,9,10,11,-2
eol1
list2   dcd 0,0,0,0,0,0,0,0,0,0,0,0
	
		END
