🚀 1️⃣ Menu-Driven Utility (Production-Style)
🎯 What this utility will do

Create file

Write/append to file

View file

Check permissions

Exit cleanly

📜 file_manager.sh (Menu-Driven Script)
#!/bin/bash
set -euo pipefail

LOG_FILE="./file_manager.log"

log() {
    echo "$(date '+%F %T') | $1" >> "$LOG_FILE"
}

create_file() {
    read -rp "Enter file name: " file
    if [[ ! -e "$file" ]]; then
        touch "$file"
        chmod 754 "$file"
        log "File created: $file"
        echo "File created with permission 754"
    else
        echo "File already exists"
    fi
}

write_file() {
    read -rp "Enter file name: " file
    if [[ -w "$file" ]]; then
        echo "Type content (Ctrl+D to save):"
        cat >> "$file"
        log "Written to file: $file"
    else
        echo "No write permission"
        log "Write failed (permission): $file"
    fi
}

view_file() {
    read -rp "Enter file name: " file
    if [[ -f "$file" ]]; then
        cat "$file"
    else
        echo "File not found"
    fi
}

check_permissions() {
    read -rp "Enter file name: " file
    if [[ -e "$file" ]]; then
        ls -l "$file"
    else
        echo "File does not exist"
    fi
}

while true; do
    echo "----------------------------"
    echo "1. Create File"
    echo "2. Write to File"
    echo "3. View File"
    echo "4. Check Permissions"
    echo "5. Exit"
    echo "----------------------------"
    read -rp "Choose an option: " choice

    case $choice in
        1) create_file ;;
        2) write_file ;;
        3) view_file ;;
        4) check_permissions ;;
        5) log "Program exited"; exit 0 ;;
        *) echo "Invalid option" ;;
    esac
done

🔥 2️⃣ Logging + Error Codes (Senior Practice)
🧾 Logging

Every action logged to:

file_manager.log


Example log:

2026-02-14 15:10:22 | File created: devops.txt
2026-02-14 15:11:03 | Written to file: devops.txt

🚨 Error Codes (Industry Standard)
Code	Meaning
0	Success
1	General error
2	Permission denied
3	File not found

Example:

exit 2


👉 Interview line:

“I use exit codes so monitoring tools and CI pipelines can detect failures.”

📁 3️⃣ GitHub Repo Structure (REAL WORLD)
shell-file-manager/
│
├── README.md
├── scripts/
│   └── file_manager.sh
│
├── logs/
│   └── file_manager.log
│
├── tests/
│   └── test_file_manager.sh
│
└── .gitignore

🧾 .gitignore
logs/*.log

🧾 README.md (Short & Professional)
# Shell File Manager Utility

A menu-driven Bash utility to manage files in a production-safe way.

## Features
- File creation with permission control
- Safe write/append
- Permission checks
- Logging
- Exit codes
- Menu-driven interface

## Usage
```bash
chmod +x scripts/file_manager.sh
./scripts/file_manager.sh

Author

DevOps Engineer


---

# 🧪 4️⃣ Unit Tests for Shell Script (YES, WE DO THIS)

We use **basic bash testing** (interview-friendly).

---

## 📜 `tests/test_file_manager.sh`

```bash
#!/bin/bash

TEST_FILE="test_devops.txt"

echo "Running tests..."

# Test file creation
./scripts/file_manager.sh <<EOF
1
$TEST_FILE
5
EOF

if [[ -f "$TEST_FILE" ]]; then
    echo "✅ File creation test passed"
else
    echo "❌ File creation test failed"
    exit 1
fi

# Cleanup
rm -f "$TEST_FILE"
echo "All tests passed"


Run tests:

chmod +x tests/test_file_manager.sh
./tests/test_file_manager.sh

🎯 Interview-Ready Explanations (SAVE THESE 🔥)
❓ Why menu-driven?

“Menu-driven scripts improve usability and reduce human error in production.”

❓ Why logging?

“Logs help in debugging, auditing, and monitoring script behavior.”

❓ Why functions?

“Functions improve readability, reusability, and testability.”

❓ Why unit tests?

“Even shell scripts should be tested to avoid production incidents.”

⭐ FINAL SENIOR DEVOPS TIP

This exact project is LinkedIn + GitHub worthy.
Recruiters LOVE seeing menu-driven + logging + tests in shell scripting.
