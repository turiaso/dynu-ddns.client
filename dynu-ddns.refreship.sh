#!/bin/sh
# Script to refresh ip on dynu dns service

username="JohnDoeIKTNT"
#randombitsonfire@gmail.com
password="R&om4kbits"
password=$(echo -n $password|sha256sum|head -c 64)
echo username: $username
echo password: $password
# alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
myip=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo myip: $myip

#| sha256sum

echo "wget http://api.dynu.com/nic/update?myip="$myip"&username="$username"&password="$password
wget -t100 -Oout.txt "http://api.dynu.com/nic/update?myip="$myip"&username="$username"&password="$password 

out=$(cat out.txt)

echo $out

rm out.txt
