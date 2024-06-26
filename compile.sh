#!/bin/bash

# Check if a file argument is provided
if [ "$#" -eq 1 ]; then
    file="$1"

    # Check if the file exists and has a .typ extension
    if [ -f "$file" ] && [[ "$file" == *.typ ]]; then
        out_file="${file%%.*}"
        out_file="${out_file//docs/out}.pdf" 

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file"
    else
        echo "Error: File not found or not a .typ file."
    fi
else
    # If no argument is provided, compile all Typst files recursively
    find docs -name "*.typ" | while read file; do
        out_file="${file%%.*}"
        out_file="${out_file//docs/out}.pdf" 

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file" 
    done
fi
