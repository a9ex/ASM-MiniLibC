bits 64
section .text
global memmove

memmove:                        ; To avoid overlapping, we need to check if the destination address is greater than the source address
    cmp rsi, rdi                ; if the destination address is greater than the source address, we need to copy from the beginning of the source address to the end of the source address
    jg .memmove                 ; if the destination address is less than the source address, we need to copy from the end of the source address to the beginning of the source address
    jmp .memmove2
    .memmove:
        xor rcx, rcx            ; init rcx to 0
        xor r8, r8              ; same with r8
        .loop:
            cmp rcx, rdx        ; compare rcx (our counter by convention) with rdx (our length)
            je .end             ; if they are equal, we are done (we have copied all the bytes)
            mov r8b, byte [rsi + rcx] ; move the byte at the source address + rcx to r8b (r8b is the lower 8 bits of r8)
            mov byte [rdi + rcx], r8b ; move the byte at r8b to the destination address + rcx
            inc rcx
            jmp .loop
        .end:
            lea rax, [rdi]
            ret
    .memmove2:
        xor rcx, rcx
        xor r8, r8
        .loop2:
            cmp rcx, rdx
            je .end2
            mov r8b, byte [rsi + rdx - 1]
            mov byte [rdi + rdx - 1], r8b
            dec rdx
            jmp .loop2
        .end2:
            lea rax, [rdi]
            ret
