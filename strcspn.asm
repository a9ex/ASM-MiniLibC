bits 64
section .text
global strcspn

strcspn:
    xor rcx, rcx
    xor r8, r8
    xor r9, r9

    .loop:
        mov al, byte [rdi + rcx]

        cmp al, 0
        je .bad_ending

        mov r9b, byte [rsi + r8]
        cmp al, r9b
        je .end

        cmp r9b, 0
        je .reloop

        inc r8
        jmp .loop

    .reloop:
        inc rcx
        mov r8, 0
        jmp .loop

    .end:
        mov rax, rcx
        ret

    .bad_ending:
        mov rax, rcx
        ret