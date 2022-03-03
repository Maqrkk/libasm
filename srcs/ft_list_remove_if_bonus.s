		global		_ft_list_remove_if
		section		.text
		extern		_free
_ft_list_remove_if:
		cmp			rdi, 0				; is begin_list a NULL pointer?
		je			return
		cmp			qword [rdi], 0		; is the list empty?
		je			return
		cmp			rdx, 0				; is the cmp function NULL?
		je			return
		mov			r10, rdx			; the cmp function
		mov			rdx, rdi			; save the pointer to the list
		mov			rcx, [rdx]			; first element in the list
		mov			r8, 0				; pointer for previous element
loop:
		mov			rdi, [rcx]			; get the data of the element
		push		rcx					; save registers
		push		r10
		push		rsi
		push		r8
		push		rdx
		call		r10					; call the cmp function
		pop			rdx					; restore registers
		pop			r8
		pop			rsi
		pop			r10
		pop			rcx
		cmp			eax, 0				; do we need to delete this?
		jne			next_item
delete_item:
		mov			rdi, rcx			; save current list item to free
		cmp			rcx, [rdx]			; is this the head?
		jne			not_head
		mov			rax, [rcx + 8]
		mov			[rdx], rax
		jmp			free_item
not_head:
		mov			rax, [rcx + 8]		; tmp = this->next
		mov			[r8 + 8], rax		; prev->next = tmp
free_item:
		mov			rcx, [rcx + 8]		; tmp = tmp->next
		push		rcx					; save registers
		push		r10
		push		rsi
		push		r8
		push		rdx
		call		_free				; free the deleted element
		pop			rdx					; restore registers
		pop			r8
		pop			rsi
		pop			r10
		pop			rcx
		cmp			rcx, 0				; was this the last element?
		jne			loop
		ret
next_item:
		mov			r8, rcx				; prev list element
		mov			rcx, [rcx + 8]		; tmp = tmp->next
		cmp			rcx, 0				; is this the last element?
		jne			loop
return:
		ret
