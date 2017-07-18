
; 3x3 matrix multiplication
; Tejeshwara.B.M & Rashmi.R  
; 08/08/2016


.MODEL SMALL
 .STACK 100H

 .DATA
  

    A       DW  1,2,1
            DW  2,1,2
            DW  1,2,1    
            
            
    B       DW 2,1,1
            DW 1,1,1
            DW 1,1,1
                    
    C       DW 0,0,0
            DW 0,0,0
            DW 0,0,0
                  
    VAR1 DW 3
    VAR2 DW ?
    VAR3 DW ?
    VAR4 DW ?
    
    
    SUM1 DW ?
    SUM2 DW ? 
    MM DW 2       
            
            
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     CALL MATMUL

     LEA SI, C                ; set SI=offset address of ARRAY
     MOV CX, 3                    ; set CX=5

     LOOP_1:                     ; loop label
       MOV BX, 3                  ; set BX=4

       LOOP_2: 
                                  ; loop label
         MOV AH, 2                ; set output function
         MOV DL, 20H              ; set DL=20H
         INT 21H                  ; print a character

         MOV AX, [SI]             ; set AX=[SI]

         CALL OUTDEC              ; call the procedure OUTDEC

         ADD SI, 2                ; set SI=SI+2
         DEC BX                   ; set BX=BX-1
       JNZ LOOP_2                ; jump to label @LOOP_2 if BX=0

       MOV AH, 2                  ; set output function
       MOV DL, 0DH                ; set DL=0DH
       INT 21H                    ; print a character

       MOV DL, 0AH                ; set DL=0AH
       INT 21H 
                          ; print a character
     LOOP LOOP_1                 ; jump to label @LOOP_1 while CX!=0
          
     
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP

    
 
 
 
 
  MATMUL PROC
    
    
    
    

MOV AX,0  

LOOP1:

  MOV BX,0

  LOOP2: 
  
       MOV DX,0 
       MOV CX,0

       LOOP3:
             
          MOV VAR2,AX
          MOV VAR3,BX
          MOV VAR4,DX 
          
          
          MOV DX,0
          MUL VAR1  
          
          ADD AX,VAR4 
          LEA SI,A 
          MUL MM
          ADD SI,AX
          MOV AX,[SI]
          MOV SUM1,AX
          
          
          MOV AX,VAR4
          MOV DX,0
          MUL VAR1
          ADD AX,VAR3 
          MUL MM
          LEA SI,B
          ADD SI,AX
          MOV AX,[SI] 
          
          MUL SUM1
          
          ADD CX,AX
           
          MOV AX,VAR2
          MOV BX,VAR3
          MOV DX,VAR4
         

          INC DX
          CMP DX,2
        JBE LOOP3
       
       
      MOV VAR2,AX
      MOV VAR3,BX
      MOV VAR4,DX 
      MOV DX,0
      
     
      MUL VAR1 
      ADD AX,VAR3
      LEA SI,C 
      MUL MM
      ADD SI,AX
      MOV [SI],CX
      
      
      MOV AX,VAR2
      MOV BX,VAR3
      MOV DX,VAR4 
        
      INC BX
      CMP BX,2
    JBE LOOP2
   
   INC AX 
   CMP AX,2
JBE LOOP1    
    
 RET
 
 MATMUL ENDP
    
    

 OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none

   PUSH BX                        ; push BX onto the STACK
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

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
   LOOP DISPLAY                  ; jump to label @DISPLAY if CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP

