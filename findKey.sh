#!/bin/bash


folder="$1"

if [ -z "$folder" ]; then
    echo "usage: $0 /path/to/folder"
    exit 1
fi

# exclude common noisy folders and files
excludes='(node_modules|CHANGELOG\.md|\.lock$|\.min\.js$|\.map$)'

patterns=(
    '[Aa][Pp][Ii][_ -]?[Kk]ey[ =:\"\x27]+[a-zA-Z0-9_\-]{10,}'
    '[Ss]ecret[_ -]?[Kk]ey[ =:\"\x27]+[a-zA-Z0-9_\-]{10,}'
    '[Tt]oken[ =:\"\x27]+[a-zA-Z0-9_\-]{10,}'
    '[Aa]uthorization[ =:\"\x27]+[a-zA-Z0-9_\-]{10,}'
    '(password|passwd|pwd)[ =:\"\x27]+[a-zA-Z0-9!@#\$%^&*()_+=\-]{6,}'
    'BEGIN PRIVATE KEY'
)

echo "scanning folder: $folder"
echo

# scan all non-excluded files
find "$folder" -type f | grep -Ev "$excludes" | while read -r file; do
    for pattern in "${patterns[@]}"; do
        grep -Eina "$pattern" "$file" 2>/dev/null | while read -r match; do
            echo "[+] $file:"
            echo "    $match"
            echo
        done
    done
done
