#!/bin/bash

# Find all C++ files in the project directory and its subdirectories
files=$(find . -name "*.cpp")

# Iterate over each file
for file in $files; do
    clang-format "$file" > format_errors.txt 2>&1
    
    # Compare the original file with the formatted version
    if ! cmp -s "$file" format_errors.txt; then
        echo "Formatting failed for file: $file. Reasons:"
        cat format_errors.txt
        exit 1
    fi
done

echo "Formatting successful for all files."
