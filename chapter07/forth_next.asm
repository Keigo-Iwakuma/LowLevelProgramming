next:
    mov w, pc
    add pc, 8  ; the call size is 8 bytes
    mov w, [w]
    jmp [w]