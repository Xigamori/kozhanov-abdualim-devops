#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Kozhanov_Abdualim_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo "Name: Abdualim"
echo "Surname: Kozhanov"
echo "Group: IT2-2313"
echo "Student ID: 37019"
echo "=============================="
echo "System Information"
echo "=============================="
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -o), kernel $(uname -r)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h
echo "=============================="

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
