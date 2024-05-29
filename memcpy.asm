bits 64
section .text
global memcpy

memcpy:
    xor rcx, rcx
    xor r8, r8
    .loop:
        cmp rcx, rdx
        je .end

        mov r8b, byte [rsi + rcx]
        mov byte [rdi + rcx], r8b

        inc rcx
        jmp .loop
    .end:
        lea rax, [rdi]
        ret
