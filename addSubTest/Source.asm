INCLUDE C:\Irvine\Irvine32.inc

.stack 4096
ExitProcess proto, dwExitCode:dword

.data
Rval SDWORD ?
Xval SDWORD 26
Yval SDWORD 30
Zval SDWORD 40

.code
	main PROC
	;inc and dec
	mov ax, 1000h
	inc ax				;AX = 1001h
	dec ax				;AX = 1000h

	; expression Rval = -Xval + (Yval - Zval)
	mov eax, Xval
	neg eax				;eax = -26
	mov ebx, Yval		;30 in ebx, ebx = Yval = 30
	sub ebx, Zval		;40 - 30 = -10
	mov eax, ebx
	mov Rval,eax

	;zero flag example
	mov cx, 1
	sub cx, 1		;ZF = 1
	mov ax, 0FFFFh
	inc ax			;ZF = 1

	;sign flag example
	mov cx, 0
	sub cx, 1		;SF = 1
	mov ax, 7FFFh

	;CARRY FLAG EXAMPLE
	mov al, 0FFh
	add al, 1			; CF = 1 , AL = 00

	;Overflow flag example;
	mov al, +127
	add al, 1		;OF = 1
	mov al, -128
	sub al, 1		;OF = 1

	INVOKE ExitProcess, 0
main ENDP
END main
