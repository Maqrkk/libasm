		global		_ft_list_sort
		section		.text
_ft_list_sort:
		cmp			rdi, 0				; is begin_list a NULL pointer?
		je			return
		cmp			qword [rdi], 0		; is the list empty?
		je			return
		cmp			rsi, 0				; is the cmp function NULL?
		je			return
		mov			rdx, rdi			; save the pointer to the list in rdx
		mov			rcx, [rdi]			; move the list to rcx
		cmp			qword [rcx + 8], 0	; is the next field empty? (list length 1)
		je			return
		mov			r10, rsi			; cmp function
setup_loop:
		mov			r8, rcx				; first list element
		mov			r11, 0				; swapped (boolean)
sort_loop:
		mov			r9, [r8 + 8]		; next list element
		mov			rdi, [r8]			; data of first element
		mov			rsi, [r9]			; data of the second element
		push		r8					; save register before function call
		push		r9
		push		r10
		push		r11
		push		rcx
		push		rdx
		push		rdi
		call		r10					; call the cmp function given as argument
		pop			rdi					; pop registers back
		pop			rdx
		pop			rcx
		pop			r11
		pop			r10
		pop			r9
		pop			r8
		cmp			eax, 0				; if <= 0, no need to swap
		jle			after_swap
swap:
		mov			r11, 1				; set swapped bool to 1
		push		qword [r9]			; swap the two items
		push		qword [r8]
		pop			qword [r9]
		pop			qword [r8]
		cmp			rcx, r8				; do we need to update our head?
		jne			after_swap
		mov			rcx, r8
		mov			[rdx], rcx
after_swap:
		mov			r8, r9				; tmp = tmp->next
		cmp			qword [r8 + 8], 0	; is it the last link?
		jne			sort_loop			; if not, keep sorting
		cmp			r11, 1				; if it was the last, have we swapped?
		je			setup_loop			; if we did, sort again
return:
		ret
