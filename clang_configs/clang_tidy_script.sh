#!/bin/bash

# Find all C++ files in the project directory and its subdirectories
files=$(find . -name "*.cpp")

for file in $files; do
    echo "Running clang-tidy for file: $file"
    clangTidyOutput=$(clang-tidy "$file" -- -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -DMY_DEFINES ...)
    echo "$clangTidyOutput"
    
    # Check if clang-tidy found any warnings
    if [[ $clangTidyOutput == *"warning:"* ]]; then
        echo "clang-tidy found warnings in file: $file"
        echo "$clangTidyOutput"
        exit 1
    fi
done
echo "clang-tidy done successful for all files."
