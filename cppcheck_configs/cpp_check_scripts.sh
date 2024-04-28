#!/bin/bash

# Find all C++ files in the project directory and its subdirectories
files=$(find . -name "*.cpp")

# Iterate over each file
for file in $files; do
    # Run cppcheck for the current file and capture its output in XML format
    cppcheck --enable=all --suppress=missingIncludeSystem --xml --language=c++ -i cppcheck.xml --enable=all --inconclusive --debug --template=gcc "$file" 2>> cppcheck-result.xml

    # Read the cppcheck result XML file for the current file
    cppcheckOutput=$(cat cppcheck-result.xml)

    # Check if cppcheck found any errors for the current file
    if grep -q '<error ' cppcheck-result.xml; then
        # Print cppcheck output for debugging
        echo "cppcheck found errors in file: $file"
        echo "$cppcheckOutput"
        
        # Exit with non-zero status to indicate failure
        exit 1
    fi
done

echo "cppcheck successful. No errors found."
