bits 64
section .text
global syscall

syscall:
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10

    mov rax, rdi
    mov rdi, rsi
    mov rsi, rdx
    mov rdx, rcx
    mov r10, r8
    mov r8, r9
    mov r9, [rsp + 64]

    syscall

    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi

    ret
