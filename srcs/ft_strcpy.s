		global		_ft_strcpy
		section		.text
_ft_strcpy:
		mov			rax, -1					; start the counter at -1
loop:
		inc			rax						; increase the counter
		mov			cl, byte[rsi + rax]		; mov the current character of the source to cl register
		mov			byte [rdi + rax], cl	; copy current character from cl register to the destination
		cmp			byte [rdi + rax], 0		; check if we just copied a 0
		jne			loop					; if not, loop
		mov			rax, rdi				; copy destination in the return register
		ret
