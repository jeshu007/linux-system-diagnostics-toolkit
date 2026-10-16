
#!/usr/bin/env bash

set -u

echo "==========================="
echo " LINUX MONITORING PROJECT "
echo "==========================="

echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"

echo
echo "------- SYSTEM UPTIME AND LOAD -------"
uptime

echo
echo "------- MEMORY USAGE -------"
free -h

echo
echo "------- DISK USAGE -------"
df -h

echo
echo "------- TOP CPU PROCESSES -------"
ps aux --sort=-%cpu | head -n 6

echo
echo "------- NETWORK INTERFACES -------"
ip -br addr

echo
echo "------- ROUTING TABLE -------"
ip route

echo
echo "------- DNS RESOLUTION TEST -------"
if getent hosts google.com >/dev/null 2>&1; then
    echo "DNS check: PASS - hostname resolved"
else
    echo "DNS check: FAIL - hostname did not resolve"
fi

echo
echo "------- EXTERNAL CONNECTIVITY CHECK -------"
if ping -c 2 -W 2 8.8.8.8 >/dev/null 2>&1; then
    echo "ICMP check: PASS - destination responded"
else
    echo "ICMP check: FAIL - no response received"
fi

echo
echo "-------------------------------"
echo "MONITORING CHECK COMPLETED"
echo "-------------------------------"
