# -----------------LINUX------------------- #
# This file helps to build the C++ programs into 'build/' folder.

# Commands :
# _________________________________________
# | chmod +x runcpp.sh (first time only) |
# | ./runcpp.sh                          |
# | ./build/FILE_NAME_HERE                |
# -_______________________________________-
# eg. To run file `helloworld.cpp`, AFTER RUNNING `./runcpp.sh` RUN THE PROGRAM AS `./build/helloworld`

# This compiles every C++ files(inside any directory) into `build/` folder.
# So, after running `./runcpp.sh`, you can run program as:
# ----------------------------------------
# >  ./build/FILE_NAME_HERE
# ----------------------------------------
#                           - Saphal Shakha


#! /bin/bash

# Compile each C++ file in the current directory
for cpp_file in *.cpp; do
    if [ -f "$cpp_file" ]; then
        rm -rf build
        mkdir build
        executable_name="build/$(basename "$cpp_file" .cpp)"
        g++ "$cpp_file" -o "$executable_name"
    fi
done

# Compile C++ files in subdirectories
for folder in */; do
    cd "$folder" || continue
    if [ -n "$(find . -maxdepth 1 -name '*.cpp' -print -quit)" ]; then
        mkdir -p build/
        for cpp_file in *.cpp; do
            if [ -f "$cpp_file" ]; then
                executable_name="build/$(basename "$cpp_file" .cpp)"
                g++ "$cpp_file" -o "$executable_name"
            fi
        done
    fi
    cd ..
done

echo "\e[1;32m[+] C++ Compilation completed!" 
echo "\e[0mRun >  \e[1;33m./build/'FILE_NAME_HERE'"
