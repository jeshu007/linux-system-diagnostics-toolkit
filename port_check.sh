#!/usr/bin/env bash
echo "--------------------------------------"
echo "LINUX NETWORK PORT MONITOR"
echo "--------------------------------------"
echo "Date: $(date)"
echo
echo "----------LISTENING TCP/UDP SOCKETS-------"
ss -tuln
echo
echo "---------ACTIVE TCP CONNECTIONS------------"
ss -tn
echo
echo "----------SOCKET OUTPUT LINE COUNT-----------"
ss -tuln | wc -l
echo
echo "-----------PORT MONITORING COMPLETED-----------"
