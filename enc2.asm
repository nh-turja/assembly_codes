.MODEL SMALL
.STACK 100H
.DATA
ENCRYPT DB 65 DUP(' '), 
        DB 'QWERTYUIOPASDFGHJKLZXCVBNM', 
        DB 37 DUP(' ')
DECRYPT DB 65 DUP(' '), 
        DB 'KXVMCNOPHQRSZYIJADLEGWBUFT', 
        DB 37 DUP(' ')  
ORIGINAL DB 'DIPU', 30 DUP('$')
ENCODED DB 80 DUP('$')
DECODED DB 80 DUP('$')
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX
LEA DI, ORIGINAL
LEA BX, ENCRYPT
LEA SI, ENCODED
ENCR:
MOV AL, [DI]
CMP AL, '$'
JE END_1
XLAT
MOV [SI], AL
INC DI
INC SI
JMP ENCR
END_1:
MOV [SI],AL
LEA DI,ENCODED
LEA BX,DECRYPT
LEA SI, DECODED
DECOD:
MOV AL, [DI]
CMP AL, '$'
JE END_2
XLAT
MOV [SI],AL
INC DI
INC SI
JMP DECOD
END_2:
MOV [SI], AL
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN