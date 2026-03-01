#!/bin/bash
EOF
echo "IP for scanning:"
read ip

#nmap scan
echo -e "Starting nmap...\n"
sleep 3
nmap $ip -p- -T5 -oN nmap_results.txt | tee nmap_results.txt
echo "================================="
echo "       NMAP SCAN RESULTS"
echo "================================="

cat nmap_results.txt

#ffuf scan
echo -e "Starting ffuf...\n"
sleep 3
ffuf -u http://$ip/FUZZ -w /usr/share/wordlists/seclists/Discovery/Web-Content/common.txt -ac  
echo -e "ffuf finished!\n"

#whatweb scan
echo -e "Staring whatweb...\n"
sleep 3
whatweb -u http://$ip -v -a 3 -o whatweb_results.txt 
echo -e "whatweb done!\n"



