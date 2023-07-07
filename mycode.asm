.MODEL SMALL
.STACK 100H
.DATA 
Hello DB "Hello World$" 
newline db 0ah, 0dh,"$"

.CODE
MAIN PROC
    MOV AX, @DATA ;Main Function 
    MOV DS, AX 
    
    ;Lea = Load effective address
    ;1 for single digit input
    ;2 for single digit output
    ;9 for string output
    
    mov ah, 9
    lea dx, Hello
    int 21H   
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 9
    lea dx, Hello
    int 21H
    
    mov ah, 2   ;Creating newline using decimal
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    mov ah, 9
    lea dx, Hello
    int 21H      
    
    mov ah, 1  ;first input 
    int 21h
    mov bh, al 
    
    mov ah, 2   ;Creating newline using decimal
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 1  ;second input
    int 21h
    mov ch, al
    
    sub bh, ch  ;bh=bh-ch
    add bh, 30h
    
    mov ah, 2   ;Creating newline using decimal
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h    
    
    mov ah, 2  ;output
    mov dl, bh
    int 21h
     
    MOV AH, 4CH ;End of Code
    INT 21H
    MAIN ENDP
END MAIN
