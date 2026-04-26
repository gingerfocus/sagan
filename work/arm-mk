#!/usr/bin/env bash

AFLAGS="-mcpu=cortex-m4 -mthumb"
LFLAGS="-T env/linker.ld"

case "$1" in
    "build" | "b")
        file="$2"

        arm-to-gnu "$file"

        sed -i '1i\
        \.syntax unified\
        \.thumb\
        \.cpu cortex-m4\
        ' "${file%.*}.s"

        sed -i '/global/a \
        \.thumb_func' "${file%.*}.s"

        arm-none-eabi-as $AFLAGS env/startup.s -o startup.o
        arm-none-eabi-as $AFLAGS "${file%.*}.s" -o "${file%.*}.o"
        arm-none-eabi-ld $LFLAGS "startup.o" "${file%.*}.o" -o "${file%.*}.elf"
        ;;
    "run" | "r")
        elf="$2"
        qemu-system-arm -M netduinoplus2 -cpu cortex-m4 -nographic \
            -kernel "$elf" \
            -gdb tcp::1234 -S &

        pid=$!

        gdb -ex 'target remote localhost:1234' \
            -ex 'load' \
            -ex 'stepi' \
            -ex 'layout asm' \
            -ex 'layout regs' \
            "$elf"

        kill $pid

            # -ex 'break __main' \
            # -ex 'continue' \
        ;;
    "clean" | "c")
        rm -f *.o *.elf *.s
        # killall qemu-system-arm
        ;;
    "" | *)
        echo "usage: $0 build|run|clean <filename>"
        ;;
esac
