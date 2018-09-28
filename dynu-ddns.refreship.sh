#!/bin/sh
# Script to refresh ip on dynu dns service

username="******"
password="******"
password=$(echo -n $password|sha256sum|head -c 64)
myip=$(dig +short myip.opendns.com @resolver1.opendns.com)

echo "wget http://api.dynu.com/nic/update?myip="$myip"&username="$username"&password="$password
wget -t100 -Oout.txt "http://api.dynu.com/nic/update?myip="$myip"&username="$username"&password="$password 

out=$(cat out.txt)
echo $out

rm out.txt
