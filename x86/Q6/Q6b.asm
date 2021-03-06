;factorial of a positive integer using (b) ,
;Tejeshwara.B.M & Rashmi.R
;06/08/2016

.data

MSG1 DB 10,13," ENTER A NUMBER : $"

MSG2 DB 10,13," OUT OF RANGE $"


NUM DB ?

RESULT DW 02H DUP(?)


.code
	
Main proc


MOV AX,DATA

MOV DS,AX


MOV DX,OFFSET MSG1

MOV AH,09H

INT 21H


MOV AH,01H

INT 21H

MOV NUM,AL


CALL ASCII_TO_HEX

MOV BL,NUM

CMP BL,0CH

JA INVALID



XOR AX,AX

XOR DX,DX

MOV AX,0001H

CMP BL,01H

JB NEXT

CALL FACT

NEXT: MOV RESULT,AX ; LOWER WORD FROM AX

MOV RESULT+2,DX ; HIGHER WORD FROM DX

JMP EXIT


INVALID:
MOV DX,OFFSET MSG2

MOV AH,09H

INT 21H

EXIT: MOV AH,04CH

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

FACT PROC NEAR

CMP BL,01H

JZ L1

PUSH BX

DEC BX

CALL FACT

POP BX

MOV CX,AX

MOV AX,DX

XOR DX,DX

MUL BX

XCHG AX,CX

MUL BX

ADD DX,CX

RET

L1: MOV AX,0001H

RET

FACT endp

END Main