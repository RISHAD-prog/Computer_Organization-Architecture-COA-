.MODEL SMALL
.STACK 100H
.DATA
VOWEL DB "GIVEN INPUT IS A VOWEL $"
CONSONENT DB "GIVEN INPUT IS A CONSONENT $"

newline db 0ah, 0dh , "$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    mov ah, 1
    int 21h
    mov bh, al 
    
    cmp bh,5ah
    jl  uppercase 
    jg  lowercase
    
    uppercase:
    cmp bh, 41h 
    je  vowel_output
    jne 1
     
    1:
    cmp bh, 45h
    je  vowel_output 
    jne 2
    2:
    cmp bh, 49h  
    je  vowel_output 
    jne 3 
    3:
    cmp bh, 4fh     
    je  vowel_output 
    jne 4 
    4:
    cmp bh, 55h 
    je  vowel_output
    jne consonent_output 
     
    lowercase:
    cmp bh, 61h 
    je  vowel_output
    jne e
     
    e:
    cmp bh, 65h
    je  vowel_output 
    jne i
    i:
    cmp bh, 69h  
    je  vowel_output 
    jne o 
    o:
    cmp bh, 6fh     
    je  vowel_output 
    jne u 
    u:
    cmp bh, 75h 
    je  vowel_output
    jne consonent_output  
    
    
    vowel_output: 
    mov ah , 9
    lea dx, newline
    int 21h
    
    mov ah , 9
    lea dx, VOWEL
    int 21h
    JMP EXIT  
    
    consonent_output:
    mov ah , 9
    lea dx, newline
    int 21h
    
    mov ah , 9
    lea dx, CONSONENT
    int 21h

    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP 
END MAIN
