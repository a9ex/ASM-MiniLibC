bits 64
section .text
global memfrob

memfrob:
    xor rcx, rcx

    .loop:
        cmp rcx, rsi
        je .end

        xor byte [rdi + rcx], 42

        inc rcx
        jmp .loop
    .end:
        lea rax, [rdi]
        ret
