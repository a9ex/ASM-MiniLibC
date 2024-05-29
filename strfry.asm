bits 64
global strfry
section .text

strfry:
    xor rcx, rcx; length of the string
    xor r8, r8; our counter
    xor r10, r10
    xor r11, r11

    .strlen:
        mov al, byte[rdi + rcx]
        cmp al, 0
        je .loop
        inc rcx
        jmp .strlen

    .loop:
        xor r9, r9
        xor rdx, rdx
        cmp r8, rcx
        je .end

        rdrand rax
        div rcx

        ; rdx modulo
        ; rax quotient

        mov r10b, byte [rdi + r8]
        mov r11b, byte [rdi + rdx]

        mov r9b, r10b
        mov byte [rdi + r8], r11b
        mov byte [rdi + rdx], r9b

        inc r8
        jmp .loop
    .end:
        lea rax, [rdi]
        ret
