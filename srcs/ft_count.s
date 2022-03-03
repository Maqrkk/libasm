		global		_ft_count
		section		.text
_ft_count:
		mov			rcx, -1					; start the counter at -1
		mov			rax, 0					; set the result to 0 at the start
loop:
		inc			rcx						; increase counter for the current character
		cmp			byte [rdi + rcx], sil	; compare to the target character
		jne			no_match				; skip incrementing total if not a match
		inc			rax
no_match:
		cmp			byte [rdi + rcx], 0		; is the current character a terminating character?
		jne			loop					; if not, loop
end:
		ret
