INCLUDE C:\Irvine\Irvine32.inc

;combining all the all the instructions learned in chapter 4.1~4.1.8
;.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD
.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h, 20h,30h,40h,50h
arrayW WORD 100h, 200h, 300h
arrayD DWORD 10000h, 20000h
.code
main PROC
	;demonstrating MOVZX instruction
	mov bx, 0A69Bh			  ;bx is for 16 bits
	movzx eax, bx             ;EAX = 0000A69Bh
	movzx edx, bl             ;EDX = 0000009Bh
	movzx cx,bl               ;cx  = 009Bh

	;demonstrating MOVSX instruction
	mov bx,0A69Bh
	movsx eax,bx			;EAX = FFFFA69Bh
	movsx edx, bl			;EDX = FFFFFF9Bh
	mov bl, 7Bh				
	movsx cx,bl				;007Bh

	;Memory to Memory exchange
	mov ax, val1			;AX = 1000h
	xchg ax,val2			;AX =2000h ,val2 = 1000h

	;Direct-offset Addressin (byte array)
	mov al, arrayB			;AL = 10h
	mov al, [arrayB + 1]	;AL = 20h
	mov al, [arrayB + 2]	;AL = 30h

	;direct-offset addressing (word array)
	mov ax,arrayW			;AX = 100h
	mov ax, [arrayW + 2]	;AX = 200h

	;direct-offset addressing (doubleWord array)
	mov eax, arrayD			;EAX = 10000h
	mov eax,[arrayD+4]		;EAX = 20000h
	mov eax, [arrayD+4]		;EAX = 20000

	INVOKE ExitProcess,0
main ENDP
END main
