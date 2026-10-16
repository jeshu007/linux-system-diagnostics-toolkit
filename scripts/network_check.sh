#!/usr/bin/env bash
set -u 
echo
echo "-----------------------------------------"
echo "-----NETWORK TROUBLESHOOTING REPORT----------"
echo "------------------------------------------"
echo "DATE:$(date)"
echo
echo "------------DEFAULT ROUTE CHECK------------"
if ip route | grep -q '^default '; then
echo "PASS:DEFAULT ROUTE EXISTS"
else
echo "FAIL:No Default Route Exists"
fi
echo
echo "----2.LOCAL CONNECTIVITY CHECK-----------"
if ping -c 2 -W 2 127.0.0.1 >/dev/null 2>&1; then
echo "PASS LOOPBACK RESPONDED"
else
echo "FAIL LOOPBACK NOT RESPONDED"
fi
echo
echo "--------3.EXTERNAL CONNECTIVITY CHECK---------------------"
if ping -c 2 -W 2 8.8.8.8 >/dev/null 2>&1;then
echo "PASS:External IP RESPONDED"
else
echo "FAIL:External IP not RESPONDED"
fi
echo
echo "----------4.DNS RESOLUTION CHECK-----------------"
if getent hosts google.com >/dev/null 2>&1;then
echo "PASS:DNS RESOLUTION SUCCEEDED"
else
echo "FAIL:DNS RESOLUTION FAILED"
fi
echo
echo "------------------------------------------------"
echo "---------NETWORK CHECK COMPLETED----------------"
echo "------------------------------------------------"


