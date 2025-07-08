#!/bin/bash
set -euo pipefail

# Ensure typst CLI is available
if ! command -v typst >/dev/null 2>&1; then
    echo "Error: typst CLI not found. Please install typst to continue." >&2
    exit 1
fi

# Check if a file argument is provided
if [ "$#" -eq 1 ]; then
    file="$1"

    # Check if the file exists and has a .typ extension
    if [ -f "$file" ] && [[ "$file" == *.typ ]]; then
        echo "Compiling Typst file: $file"
        # Determine relative path within docs directory
        rel_path=${file#docs/}
        out_file="./out/${rel_path%.typ}.pdf"

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file" --format pdf --root .
    else
        echo "Error: File not found or not a .typ file."
    fi
else
    # If no argument is provided, compile all Typst files recursively
    find docs -name "*.typ" | while IFS= read -r file; do
        rel_path=${file#docs/}
        out_file="./out/${rel_path%.typ}.pdf"

        mkdir -p "$(dirname "$out_file")"
        typst compile "$file" "$out_file" --format pdf --root .
    done
fi
