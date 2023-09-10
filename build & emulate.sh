mkdir -p build
riscv64-elf-gcc -Wall -Wextra -c -mcmodel=medany kernel.c -o build/kernel.o -ffreestanding
riscv64-elf-as -c entry.S -o build/entry.o
riscv64-elf-ld -T linker.ld -lgcc -nostdlib build/kernel.o build/entry.o -o build/kernel.elf
qemu-system-riscv64 -machine virt -bios none -kernel build/kernel.elf -serial mon:stdio
