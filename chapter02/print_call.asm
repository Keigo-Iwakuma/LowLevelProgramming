section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline:
    mov rax, 1             ; 'write' syscall id
    mov rdi, 1             ; 'stdout' file descriptor
    mov rsi, newline_char  ; written data address
    mov rdx, 1             ; written data size
    syscall
    ret

print_hex:
    mov rax, rdi
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
iterate:
    push rax
    sub rcx, 4
    sar rax, cl
    and rax, 0xf
    lea rsi, [codes + rax]

    mov rax, 1

    push rcx
    syscall
    
    pop rcx
    pop rax
    test rcx, rcx
    jnz iterate

    ret
_start:
    mov rdi, 0x112234455667788
    call print_hex
    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall