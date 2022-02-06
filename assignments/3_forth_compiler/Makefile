ASM     = nasm
FLAGS   = -f elf64 -g -I src/
LINKER  = ld

all: bin/forthress

bin/forthress: obj/forthress.o obj/util.o
	mkdir -p bin
	$(LINKER) -o bin/forthress obj/forthress.o obj/util.o

obj/forthress.o: src/forthress.asm src/macro.inc src/words.inc src/util.inc
	mkdir -p obj
	$(ASM) $(FLAGS) src/forthress.asm -o obj/forthress.o

obj/util.o: src/util.inc src/util.asm
	mkdir -p obj 
	$(ASM) $(FLAGS) src/util.asm -o obj/util.o

clean:
	rm -rf bin obj

.PHONY: clean
	