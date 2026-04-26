			AREA    text , CODE, READONLY
			EXPORT	__main				
			ENTRY			
    
__main      PROC

            ldr r0, =samplelist
            ldr r1, =eol1
            ldr r2, =resultlist
            ldr r3, =eol2

nextitem    mov r4, #0
            ldr r5, [r0], #4
            mov r6, #32

nextbit     and r7, r5, 0xc0000000 ; and with 1100000...
            cmp r7, 0xc0000000     ; check if it is still 110000...
            it eq
            addeq r4, r4, #1    ; if <= (matches first 2 bits) mov in 1
            lsl r5, r5, #1      ; get new first 2 bits
            subs r6, r6, #1     ; if (i-- != 0)
            bne nextbit         ;   next bit

            str r4, [r2], #4    ; str sum
            cmp r0, r1          ; if (!eol)
            blt nextitem        ;   next item

endless     b endless
            ENDP
    
            AREA    data , DATA, READWRITE
            ALIGN
samplelist  dcd     0x12345678, 0xbeeffeed, 0x55555555, 0xa5a5a5a5
eol1
resultlist  dcd     0,0,0,0
eol2
