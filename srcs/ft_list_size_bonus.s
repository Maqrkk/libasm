		global			_ft_list_size
		section			.text
_ft_list_size:
		mov				rax, -1
loop:
		inc				rax
		cmp				rdi, 0				; is the list pointer NULL?
		je				return
		mov				rdi, [rdi + 8]		; move the next pointer to r8
		jmp				loop
return:
		ret
