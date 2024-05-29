bits 64
section .text
global strlen

strlen:
    xor rax, rax                    ; we will use rax as a counter, initialize it to 0 with xor
    .loop:
        cmp byte[rdi + rax], 0      ; compare the byte at rdi + rax with 0 (end of string)
        je .end                     ; if it is 0, we are done, jump to the end
        inc rax                     ; else increment rax, and repeat the loop
        jmp .loop
    .end:
        ret                         ; return the value of rax