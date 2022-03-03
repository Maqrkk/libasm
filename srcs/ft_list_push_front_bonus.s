		global			_ft_list_push_front
		section			.text
		extern			_malloc
_ft_list_push_front:
		cmp				rdi, 0				; null pointer?
		je				error
		push			rdi					; push the pointer to the stack
		mov				r9, rsi				; save original data
		mov				rdi, 16				; we want to malloc space for 2 pointers
		push			r9
		push			r8
		call			_malloc
		pop				r8
		pop				r9
		pop				rdi					; restore original pointer
		cmp				rax, 0				; did malloc fail?
		je				error2
		mov				r8, [rdi]			; put the address of the original pointer
		mov				[rax + 8], r8		; into the 'next' field of the new struct
		mov				[rax], r9			; put the data into the data field of the struct
		mov				[rdi], rax			; update the original pointer to point to the struct
error:
		ret
error2:
		mov				rax, 25
		ret
