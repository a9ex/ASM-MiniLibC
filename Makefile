##
## EPITECH PROJECT, 2024
## MiniLibC
## File description:
## Makefile
##

SRC :=  strcasecmp.asm \
		strchr.asm \
		strcmp.asm \
		strcspn.asm \
		strlen.asm \
		strncmp.asm \
		strpbrk.asm \
		strrchr.asm \
		strstr.asm \
		memset.asm \
		memcpy.asm \
		memmove.asm \
		memfrob.asm \
		ffs.asm \
		strfry.asm \
		syscall.asm

ASM := nasm

OBJ = $(SRC:%.asm=build/%.o)

NAME :=	libasm.so

all: $(NAME)

$(NAME): $(OBJ)
	ld -shared -o $(NAME) $(OBJ)

clean:
	rm -f $(NAME)

coverage:
	gcovr -r . --html-details -o criterion.html --exclude tests/
	firefox criterion.html

fclean:	clean
	@rm -f $(OBJ)
	@rm -f *vgcore.*
	@rm -f *.gcno
	@rm -f *.gcda
	@rm -f criterion.html
	@rm -f build/*.o

re: fclean $(NAME)

build/%.o: %.asm
	@mkdir -p build
	@$(ASM) -f elf64 $< -o $@