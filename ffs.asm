bits 64
section .text
global ffs

ffs:
    xor rax, rax
    cmp rdi, 0
    je .done
    bsf rax, rdi
    inc rax
    .done:
        ret

