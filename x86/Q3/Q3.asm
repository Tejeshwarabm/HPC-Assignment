;contiguous chunk of memory to contain 10 numbers and store there sum.
;Tejeshwar.B.M & Rashmi.R
;08/08/2016


.data
MSG DB 10,13,"ENTER THE NUMBER:",'$'                   
        
NUM DB ?         

.code
Main proc
        
    MOV AX, data
    MOV DX, AX
         
    MOV CX, 10 
    XOR BX, BX
    L1:
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
       
    MOV AH, 01H
    INT 21H
       
     MOV NUM, AL
    CALL ASCII_TO_HEX
    MOV NUM, AL
    
    ADD BL, AL
    LOOP L1       
        
    XOR DX, DX
    XCHG DX, BX
    
    MOV AH, 4CH
    INT 21H
 
Main endp  

ASCII_TO_HEX PROC NEAR

MOV AL,NUM

CMP AL,39H

JA S1

SUB AL,30H

JMP S2

S1: SUB AL,37H

S2: MOV NUM,AL

RET

ASCII_TO_HEX endp
END main