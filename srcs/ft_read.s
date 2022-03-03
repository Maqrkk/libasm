		global		_ft_read
		section		.text
		extern		___error
_ft_read:
		mov			rax, 0x2000003		; set the rax register to the number for the read system call
		syscall
		jc			on_error			; if the carry flag is set we have an error, jump to 'on_error'
		ret
on_error:
		mov			rdx, rax			; move the rax register (error number) to rdx
		push		rdx					; push rdx to save it, and align stack
		call		___error			; call the error function so rax points to errno
		pop			rdx					; pop the stack back into rdx
		mov			[rax], rdx			; move the value of rdx (the error number) into the adress pointed to by rax (errno)
		mov			rax, -1				; set rax to -1 for return value
		ret
