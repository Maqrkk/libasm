		global		_ft_strdup
		section		.text
		extern		_malloc
		extern		_ft_strlen
		extern		_ft_strcpy
_ft_strdup:
		push		rdi				; push the argument string to the stack (for alignment)
		call		_ft_strlen		; get the length of the argument in rax
		mov			rdi, rax		; put the length as argument to malloc
		inc			rdi				; strlen++ for the terminating character
		call		_malloc
		pop			rsi				; pop the argument from the stack into rsi (second argument for strcpy)
		cmp			rax, 0			; if rax is 0, malloc failed.
		je			on_error
		mov			rdi, rax		; put the address of the newly malloced string in rdi (first argument to strcpy)
		push		rdi
		call		_ft_strcpy		; copy the string in the new space
		pop			rdi				; re-align the stack before returning
		ret
on_error:
		ret							; if malloc failed, we just return
