		global		_ft_index_of
		section		.text
_ft_index_of:
		mov			rax, -1					; start the counter at -1
loop:
		inc			rax						; increase the counter
		cmp			byte [rdi + rax], sil	; compare to the target character
		je			match
		cmp			byte [rdi + rax], 0		; compare to the terminating character
		jne			loop					; loop if not at the end
end:
		mov			rax, -1					; not found, set rax to -1
match:
		ret
