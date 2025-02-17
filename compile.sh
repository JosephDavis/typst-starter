#!/bin/bash

# Check if a file argument is provided
if [ "$#" -eq 1 ]; then
    file="$1"

    # Check if the file exists and has a .typ extension
    if [ -f "$file" ] && [[ "$file" == *.typ ]]; then
        echo "Compiling Typst file: $file"
        # Extract filename with extension
        filename_with_ext=$(basename "$file")
        out_file="${filename_with_ext%.*}"
        out_file="./compiled/${out_file}.pdf" 

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file" --format pdf --root .
    else
        echo "Error: File not found or not a .typ file."
    fi
else
    # If no argument is provided, compile all Typst files recursively
    find docs -name "*.typ" | while read file; do
        # Extract filename with extension
        filename_with_ext=$(basename "$file")
        out_file="${filename_with_ext%.*}"
        out_file="./compiled/${out_file}.pdf"

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file" --format pdf --root .
    done
fi
