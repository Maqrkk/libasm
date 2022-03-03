		global		_ft_strcmp
		section		.text
_ft_strcmp:
		mov			rax, -1					; start counter at -1
		mov			rcx, 0					; set rcx to 0
loop:
		inc			rax						; increase the counter
		mov			cl, byte [rdi + rax]	; move the current character from the second argument to the cl register
		cmp			cl, byte [rsi + rax]	; compare the cl register t the current character from the first argument
		ja			greater					; if it's greater, jump to 'greater' label
		jb			smaller					; if it's smaller, jump to 'smaller' label
		cmp			byte [rdi + rax], 0		; if they were equal, check if the character is the null termination character
		jne			loop					; if not, loop
end:
		mov			rax, 0					; strings are equal, set rax to 0
		ret
greater:
		mov			rax, 1
		ret
smaller:
		mov			rax, -1
		ret
