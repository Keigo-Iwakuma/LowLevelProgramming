docol:
    sub rstack, 8
    mov [rstack], pc
    add w, i
    mov pc, w
    jmp next

exit:
    mov pc, [rstack]
    add rstack, 8
    jmp next