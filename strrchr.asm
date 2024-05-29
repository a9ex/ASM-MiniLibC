bits 64
global strrchr
global rindex
section .text

rindex:
strrchr:
    xor rcx, rcx

    .strlen:
        mov al, byte[rdi + rcx]
        cmp al, 0
        je .loop

        inc rcx
        jmp .strlen

    .loop:
        cmp rcx, 0
        jl .bad_ending

        cmp byte[rdi + rcx], sil
        je .end

        dec rcx
        jmp .loop

    .end:
        lea rax, [rdi + rcx]
        ret

    .bad_ending:
        inc rcx
        cmp sil, 0
        je .end

        mov rax, 0
        ret