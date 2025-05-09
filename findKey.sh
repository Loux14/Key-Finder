#!/bin/bash

folder="$1"

if [ -z "$folder" ]; then
    echo "usage: $0 /path/to/folder"
    exit 1
fi

# regex
patterns=(
    'api[_-]?key.{0,10}[=:\"\x27 ]+[a-zA-Z0-9_\-]{8,}'
    'secret.{0,10}[=:\"\x27 ]+[a-zA-Z0-9_\-]{8,}'
    'token.{0,10}[=:\"\x27 ]+[a-zA-Z0-9_\-]{8,}'
    'authorization.{0,10}[=:\"\x27 ]+[a-zA-Z0-9_\-]{8,}'
    'pass(word|wd)?.{0,10}[=:\"\x27 ]+[a-zA-Z0-9!@#\$%^&*()_+=\-]{4,}'
    '-----BEGIN PRIVATE KEY-----'
)

echo "scanning folder: $folder"
echo

# scan
find "$folder" -type f | while read -r file; do
    for pattern in "${patterns[@]}"; do
        grep -Eina "$pattern" "$file" 2>/dev/null | while read -r match; do
            echo "[+] possible credential in $file:"
            echo "    $match"
            echo
        done
    done
done
