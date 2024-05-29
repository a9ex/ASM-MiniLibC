bits 64
section .text
global strstr

strstr:
    xor rcx, rcx
    xor rax, rax
    xor r10, r10
    xor r11, r11
    xor r9, r9

    .loop:
        mov al, byte [rdi + rcx]
        cmp al, 0
        je .ending

        .inner_loop:
            xor r11, r11
            add r11, rcx
            add r11, r10

            mov al, byte [rdi + r11]
            mov r9b, byte [rsi + r10]

            cmp r9b, 0
            je .good_ending

            cmp al, 0
            je .ending

            cmp al, r9b
            jne .bad_ending

            inc r10
            jmp .inner_loop

        .bad_ending:
            inc rcx
            xor r10, r10
            jmp .loop

    .ending:
        mov r9b, byte [rsi + r10]
        cmp r9b, 0
        je .good_ending

        xor rcx, rcx
        mov rax, rcx
        ret

    .good_ending:
        lea rax, [rdi + rcx]
        ret