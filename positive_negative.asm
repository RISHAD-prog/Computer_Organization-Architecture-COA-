.MODEL SMALL
.STACK 100H
.DATA
first_input DB "Enter a number: $"
output_positive DB "Positive$"
output_negative DB "Negative $"
newline db 0ah,0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    mov ah, 9
    lea dx, first_input
    int 21h
    
    mov ah, 1 
    int 21h
    sub al, 30h
    mov bl, al
    
    
    mov ah, 1
    int 21h 
    
    
    mov ah, 9
    lea dx, newline
    int 21h
     
    CMP bl, 0
    JG  positive
    JL  negative
    JMP exit
    
    positive:
    mov ah, 9
    lea dx, output_positive
    int 21h
    jmp exit
    
    negative:
    mov ah, 9
    lea dx, output_negative
    int 21h
    jmp exit 
    
    exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN