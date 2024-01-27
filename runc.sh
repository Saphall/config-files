# -----------------LINUX------------------- #
# This file helps to build the C programs into 'build/' folder.

# Commands :
# _______________________________________
# | chmod +x runc.sh (first time only) |
# | ./runc.sh                          |
# | ./build/FILE_NAME_HERE              |
# -_____________________________________-
# eg. To run file `helloworld.c`, AFTER RUNNING `./runc.sh` RUN THE PROGRAM AS `./build/helloworld`

# This compiles every C files(inside any directory) into `build/` folder.
# So, after running `./runc.sh`, you can run program as:
# ----------------------------------------
# >  ./build/FILE_NAME_HERE
# ----------------------------------------
#                           - Saphal Shakha


#! /bin/bash

# Compile each C file in the current directory
for c_file in *.c; do
    if [ -f "$c_file" ]; then
        rm -rf build
        mkdir build
        executable_name="build/$(basename "$c_file" .c)"
        gcc "$c_file" -o "$executable_name"
    fi
done

# Compile C files in subdirectories
for folder in */; do
    cd "$folder" || continue
    if [ -n "$(find . -maxdepth 1 -name '*.c' -print -quit)" ]; then
        mkdir -p build/
        for c_file in *.c; do
            if [ -f "$c_file" ]; then
                executable_name="build/$(basename "$c_file" .c)"
                gcc "$c_file" -o "$executable_name"
            fi
        done
    fi
    cd ..
done

echo "\e[1;32m[+] C Compilation completed!"
echo "\e[0mRun >  \e[1;33m./build/'FILE_NAME_HERE'"
