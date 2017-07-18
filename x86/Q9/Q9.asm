
;FIRST 100 PRIME NUMBERS
; Tejeshwar.B.M & Rashmi.R
; 07/08/2016


   .MODEL  SMALL
    .DATA
           VAl1     DW     ?  
           SPACE DB 32,"$" 
           MESSAGE DB "*****List of first 100 Prime numbers as follows*******: $"
          
           .CODE
    MAIN    PROC

            MOV AX,DATA
            MOV DS,AX 
            
            MOV AH,09H
            MOV DX,OFFSET MESSAGE
            INT 21H
            
            
            MOV AX,2 
            CALL OUTDEC
            MOV AX,3
            CALL OUTDEC
            MOV AX,4
            MOV BX,0 
           
            PRIME:
                  CMP BX,100
                  JZ END
                  MOV VAL1,AX 
                    
                  
                  CALL TESTPRIME
                  
                  INC AX  
                  MOV CX,2
                  
            LOOP PRIME
            
             END:
             
             MOV AH,4CH
             INT 21H  
    
    MAIN    ENDP   
    
    
    
    
    
    
    
    TESTPRIME PROC  
        
            PUSH AX 
            MOV VAL1,AX  
            DEC AX
            MOV CX,AX

    LBL1:
            MOV AX,VAL1 
            MOV DX,0H
            DIV CX
            CMP DX,00
            JZ LBL2
            DEC CX
            CMP CX,1
            JNE LBL1
            JMP LBL3
    
    LBL2:   POP AX
            JMP EXIT    
    
    LBL3:   POP AX
            CALL OUTDEC
    
    EXIT:   RET
    
        
        
    TESTPRIME ENDP
    
    
    
    
    
    
   OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none

   PUSH BX 
   PUSH AX                       ; push DX onto the STACK

   CMP AX, 0                      ; compare AX with 0
   JGE START                     ; jump to label @START if AX>=0

   PUSH AX                        ; push AX onto the STACK

   MOV AH, 2                      ; set output function
   MOV DL, "-"                    ; set DL='-'
   INT 21H                        ; print the character

   POP AX                         ; pop a value from STACK into AX

   NEG AX                         ; take 2's complement of AX

   START:                        ; jump label

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   OUTPUT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE OUTPUT                    ; jump to label @OUTPUT if ZF=0

   MOV AH, 2                      ; set output function

   DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP DISPLAY 
   
   
   
    MOV AH,09H
        LEA DX,SPACE
        INT 21H 
                                  ; jump to label @DISPLAY if CX!=0
   POP AX
   POP BX
   INC BX
   
   RET                            ; return control to the calling procedure
 OUTDEC ENDP
       
            END     MAIN
    