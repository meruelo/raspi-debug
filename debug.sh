#!/bin/bash
if [ -f "$1" ]; then
	# 1st: Start QEMU in server mode.
	qemu-system-arm -kernel "$1" -cpu arm1176 -m 256 -M versatilepb -s -S 2>/dev/null &
	sleep 1s # Let QEMU start-up
	
	# 2nd: Run GDB
	if [-f "$2" ]; then
		path = "$2"
	else
		path="$(echo "$1" | sed 's/\(.*\)\/\(kernel.img\)/\1/')"
		path="$path/build/output.elf"

		if [!-f $path ]; then
			echo 'Elf file not found'
			exit 1
		fi
	fi
	./arm-2008q3/bin/arm-none-eabi-gdb -ex "file $path" -ex "target remote :1234"

	#3rd: End
	$(ps | grep qemu | sed 's/\([0-9]\{1,5\}\).*/\1/' | xargs kill -s SIGTERM )

else
	echo 'Image not found'
	exit 1
fi
