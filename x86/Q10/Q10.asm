;tower of hanoi
;Tejeshwar.B.M & Rashmi.R
;08/08/2016

.DATA


MOVEDISK DB "MOVE DISK $"
FROMPEG  DB " FROM PEG $"
TOPEG    DB " TO PEG $"
NEWLINE DB 10,13,"$" 


.CODE

MAIN PROC
 MOV AX,DATA
 MOV DS,AX   
 MOV AH,1
 INT 21H 
 MOV BL, AL                   ; save First digit in BL in ASCII code
 SUB BL, 30H
 MOV BH,0
  MOV AH,09H
 LEA DX,NEWLINE
 INT 21H
 
 MOV AX,BX
 MOV BX,1
 MOV CX,2
 MOV DX,3
 CALL HANOI   
    
   MOV AH,4CH
   INT 21H
   
      
    
    
    
MAIN ENDP  

          
          
          

HANOI PROC
 
 CMP AX,0
 JZ LABEL1
 PUSH AX
 PUSH BX   
 PUSH CX
 PUSH DX
 
 DEC AX 
 PUSH AX
 MOV AX,CX
 MOV CX,DX
 MOV DX,AX
 POP AX
 
 CALL HANOI
 
 POP DX
 POP CX
 POP BX
 POP AX
 
 PUSH AX
 PUSH DX
 
 MOV AX,DATA
 MOV DS,AX
 MOV AH,09H
 MOV DX,OFFSET MOVEDISK
 INT 21H 
 
 POP DX
 POP AX
 
 CALL OUTDEC
 
 PUSH AX
 PUSH DX
 
  MOV AH,09H
 MOV DX,OFFSET FROMPEG
 INT 21H 
 
 POP DX
 POP AX
 
 PUSH AX
 MOV AX,BX
 
 CALL OUTDEC
 
 POP AX
 
 PUSH AX
 PUSH DX
 
 MOV AH,09H
 MOV DX,OFFSET TOPEG
 INT 21H 
 
 POP DX
 POP AX
 
 PUSH AX
 MOV AX,CX
 
 CALL OUTDEC
 
 POP AX
            
 DEC AX
 
 PUSH AX
 
 MOV AX,DX
 MOV DX,BX
 MOV BX,AX
 
 POP AX 
 
 PUSH AX  
 PUSH DX
 
 MOV AH,09H
 LEA DX,NEWLINE
 INT 21H
 
 POP DX
 POP AX
 
 
 CALL HANOI
 
 RET
 
 
 LABEL1: RET
 

    

HANOI ENDP 





   OUTDEC PROC

   PUSH AX
   PUSH BX                       
   PUSH CX                       
   PUSH DX                        

   CMP AX, 0                      ; compare AX with 0
   JGE START                     
   PUSH AX                        

   MOV AH, 2                     
   MOV DL, "-"                    
   INT 21H                        ; print the character

   POP AX                         

   NEG AX                        

  START:                        ; jump label

   XOR CX, CX                     
   MOV BX, 10                     

   OUTPUT:                       
     XOR DX, DX                   
     DIV BX                       
     PUSH DX                      
     INC CX                      
     OR AX, AX                   
   JNE OUTPUT                    

   MOV AH, 2                      

  DISPLAY:                      
     POP DX                       
     OR DL, 30H                   
     INT 21H                     
   LOOP DISPLAY                  

   POP DX                        
   POP CX                         
   POP BX                         
   POP AX
   RET                           
 OUTDEC ENDP




END MAIN   








