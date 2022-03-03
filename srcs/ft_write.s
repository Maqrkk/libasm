		global		_ft_write
		section		.text
		extern		___error
_ft_write:
		mov			rax, 0x2000004		; set the rax regiser to the number for the write system call
		syscall
		jc			on_error			; if the carry flag is set we have an error, jump to 'on_error'
		ret
on_error:
		mov			rdx, rax			; move the rax register (error number) to rdx
		push		rdx					; push rdx to save it, and align stack
		call		___error			; call the error function so rax points to errno
		pop			rdx					; pop the stack back into rdx
		mov			[rax], rdx			; move the value of rdx (error number) into the adress pointed to by rax (errno)
		mov			rax, -1				; set rax to -1 for return value
		ret
