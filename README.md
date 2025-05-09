# Key-Finder


# findKey.sh - Sensitive Info Finder

`findKey.sh` is a simple Bash script that recursively scans a folder to find hardcoded API keys, secrets, passwords, and tokens in source code or text files.

## Features

- Scans all files in a given directory recursively
- Detects common credentials like:
  - API keys (e.g., `API_KEY`, `apiKey`)
  - Secrets (e.g., `SECRET_KEY`)
  - Passwords (e.g., `password`, `pwd`)
  - Tokens and Authorization headers
  - Private keys (e.g., `-----BEGIN PRIVATE KEY-----`)
- Supports loose patterns for better catch rate

![Screenshot 2025-05-09 at 4 59 23 PM](https://github.com/user-attachments/assets/2dc68fca-53f7-4622-8e25-8ecf0c15d9d2)

## Usage

```bash
chmod +x findKey.sh
./findKey.sh /path/to/target_folder
