;Reverse a string 
;Tejeshwar.B.M & Rashmi.R
;06/08/2016


.data
String1 db 10,13,'Arabian sea', '$'
Length1 dw $-String1-1

.code
Main proc
MOV AX, @data
MOV DS, AX
MOV SI, offset String1
MOV CX, Length1
ADD SI, CX

Back: 
MOV DL, [SI]
MOV AH, 02H
INT 21H
DEC SI
LOOP Back
MOV AH, 4CH
INT 21H

Main endp
End Main