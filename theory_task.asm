.MODEL SMALL
.STACK 1000H
.DATA 
Hello DB "Hello World$"
Bye DB "Bye World$"
startpoint DB "starting index:$"   
Endpoint DB "End index:$"
newline db 0ah, 0dh, "$"

.CODE
MAIN PROC
    MOV AX, @DATA  
    MOV DS, AX 
    
    
    
    mov ah, 9
    lea dx, startpoint
    int 21h
    
    mov ah,1
    int 21h
    mov bh, al
     
    mov ah, 9
    lea dx, newline
    int 21h
     
    mov ah, 9
    lea dx, Endpoint
    int 21h 
    
    mov ah,1
    int 21h
    mov ch, al
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    firstloop:
        
        mov ah, 9
        lea dx, Hello
        int 21h
               
        mov ah, 9
        lea dx, newline
        int 21h
        
        inc bh
               
        cmp bh,ch
        jne firstloop             
        je  secondoutput
    
    secondoutput:
        
        mov ah, 9
        lea dx, Bye
        int 21h
    
    exit:    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN