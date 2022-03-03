		global		_ft_strlen
		section		.text
_ft_strlen:
		mov			rax, -1					; start the counter at -1
loop:
		inc			rax						; increase counter by 1
		cmp			byte [rdi + rax], 0		; compare the character to 0
		jne			loop					; if not equal, loop
		ret
