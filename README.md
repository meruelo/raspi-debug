This script file is used to start QEMU and GDB with your kernel.img file and kernel.elf so you can debug pleasently. 

The script takes two arguments:
+ $1 (mandatory) - Relative path to your kernel.img file
+ $2 (optional)  - Relative path to your kernel.elf file. If no argument is providen it will try to locate a file at build/output.elf from the kernel.img path location).

The script will need to have both QEMU (qemu-system-arm) and GDB (arm-noneabi-gdb) in the $PATH. 
