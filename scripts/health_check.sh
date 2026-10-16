#!/usr/bin/env bash

set -u

echo "======================================"
echo " LINUX SYSTEM HEALTH CHECK"
echo "======================================"
echo "Date: $(date)"

echo
echo "----- DISK USAGE CHECK -----"

usage=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

if [[ ! "$usage" =~ ^[0-9]+$ ]]; then
    echo "UNKNOWN: Could not determine disk usage"
elif (( usage >= 90 )); then
    echo "CRITICAL: Root filesystem usage is ${usage}%"
elif (( usage >= 80 )); then
    echo "WARNING: Root filesystem usage is ${usage}%"
else
    echo "OK: Root filesystem usage is ${usage}%"
fi

echo
echo "----- MEMORY INFORMATION -----"
free -h

echo
echo "Health check completed."

