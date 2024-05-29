bits 64
section .text
global strncmp

strncmp:
    xor rcx, rcx
    xor rax, rax
    xor r8, r8

    cmp rdx, 0
    je .nothing_to_compare

    .loop:
        cmp rcx, rdx
        je .ending

        mov al, byte [rdi + rcx]
        mov ah, byte [rsi + rcx]

        cmp al, 0
        je .ending

        cmp ah, 0
        je .ending

        cmp al, ah
        jne .ending

        inc rcx
        jmp .loop

    .ending:

        xor rcx, rcx

        mov r8b, al
        mov cl, ah

        xor rax, rax
        mov rax, r8
        sub rax, rcx
        ret

    .nothing_to_compare:
        xor rax, rax
        ret