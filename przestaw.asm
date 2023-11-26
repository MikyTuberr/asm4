.686
.model flat
public _przestaw
.code
_przestaw PROC
	push ebp ; zapisanie zawarto�ci EBP na stosie
	mov ebp,esp ; kopiowanie zawarto�ci ESP do EBP
	push ebx ; przechowanie zawarto�ci rejestru EBX
	mov ebx, [ebp+8] ; adres tablicy tabl
	mov ecx, [ebp+12] ; liczba element�w tablicy
	dec ecx
	
ptl:
	mov eax, [ebx]
	cmp eax, [ebx+4]
	jle gotowe ; skok, gdy nie ma przestawiania

	mov edx, [ebx+4]
	mov [ebx], edx
	mov [ebx+4], eax

gotowe:
	add ebx, 4 
	loop ptl ; organizacja p�tli
	pop ebx ; odtworzenie zawarto�ci rejestr�w
	pop ebp
	ret ; powr�t do programu g��wnego

_przestaw ENDP
 END
