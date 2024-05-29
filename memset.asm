bits 64
section .text
global memset

memset:
    xor rcx, rcx

    .loop:
        cmp rcx, rdx
        je .end

        mov byte [rdi + rcx], sil
        inc rcx

        jmp .loop
    .end:
        lea rax, [rdi]
        ret
