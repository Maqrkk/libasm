		global			_ft_atoi_base
		section			.text
		extern			_ft_count
		extern			_ft_index_of
_ft_atoi_base:
		cmp				rdi, 0					; if str is NULL
		je				return_0
		cmp				byte [rdi], 0			; if str is empty
		je				return_0
		cmp				rsi, 0					; if base is NULL
		je				return_0
		cmp				byte [rsi], 0			; if base is empty
		je				return_0
		cmp				byte [rsi + 1], 0		; if base is 1 char
		je				return_0
check_base_for_valid_chars:
		mov				rcx, -1					; base-index counter
check_base_loop:
		inc				rcx						; base_index++
		mov				rdx, 0					; current char to check
		mov				dl, byte [rsi + rcx]
		cmp				dl, 0					; is the current character \0?
		je				check_base_done			; if so, we're done checking.
		cmp				dl, 43					; is the current character +?
		je				return_0
		cmp				dl, 45					; is the current character -?
		je				return_0
		push			rdi						; save registers before call to ft_count
		push			rsi
		push			rcx
		mov				rdi, rsi				; move base to rdi
		mov				rsi, 0					; empty rsi
		mov				sil, dl					; move current character into rsi
		call			_ft_count
		pop				rcx						; restore registers
		pop				rsi
		pop				rdi
		cmp				rax, 1					; does it occur more than once?
		jg				return_0
		jmp				check_base_loop			; check the next character
check_base_done:
		mov				r11, rcx				; base-len
		mov				rcx, 0					; str-index counter
		mov				rdx, 0					; the return value
		mov				r8, rdi					; str
		mov				r10, 0					; sign
		mov				rdi, rsi				; base
		mov				rsi, 0					; empty rsi
check_signs_in_str:
		mov				sil, byte [r8 + rcx]	; mov current char to r9
		cmp 			sil, 45					; is it a -
		je				remove_minus_sign
		cmp				sil, 43					; is it a +
		je				remove_plus_sign
		jmp				start_atoi
remove_minus_sign:
		mov				r10, 1					; set sign to 1
remove_plus_sign:
		inc				rcx
start_atoi:
		mov				sil, byte [r8 + rcx]	; update the character
		cmp				sil, 0					; are we done?
		je				return
		imul			rdx, r11				; multiply temp result by the base_length
		push			rdi
		call			_ft_index_of
		pop				rdi
		cmp				rax, -1					; if the character is not in the base
		je				return_0
		add				rdx, rax				; add the current value to the total
		inc				rcx						; str-index++
		jmp				start_atoi
return:
		mov				rax, rdx				; put return value in rax
		cmp				r10, 1					; do we need to multiply by -1?
		je				negate
		ret
return_0:
		mov				rax, 0
		ret
negate:
		neg				rax
		ret
