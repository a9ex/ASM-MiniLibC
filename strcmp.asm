bits 64
section .text
global strcmp

strcmp:
    xor rcx, rcx
    xor rax, rax
    xor rdx, rdx

    .loop:
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

        mov dl, al
        mov cl, ah

        xor rax, rax
        mov rax, rdx
        sub rax, rcx
        ret