bits 64
section .text
global strchr
global index

index:
strchr:
    xor rcx, rcx

    .loop:
        mov al, [rdi + rcx]

        cmp al, 0
        je .bad_ending

        cmp al, sil
        je .end

        inc rcx
        jmp .loop

    .end:
        lea rax, [rdi + rcx]
        ret

    .bad_ending:
        cmp sil, 0
        je .end

        mov rax, 0
        ret