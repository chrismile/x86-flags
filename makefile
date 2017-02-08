all: flags

flags: ./flags.asm
	nasm -f elf flags.asm
	ld -melf_i386 -e main -dynamic-linker /lib/ld-linux.so.2 flags.o -o flags -lc

clean:
	rm -f *.o flags