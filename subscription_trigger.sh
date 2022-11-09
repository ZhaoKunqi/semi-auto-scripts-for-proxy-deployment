#!/bin/bash

#Get IPv4 Address
./CloudflareST -n 100 -t 5 -dn 15 -dt 15 -url https://speed.cloudflare.com/__down?bytes=500000000 -f cloudflare_ipv4_list.txt -o ipv4_raw_result.txt

#Get IPv6 Address
./CloudflareST -n 100 -t 5 -dn 15 -dt 15 -url https://speed.cloudflare.com/__down?bytes=500000000 -f cloudflare_ipv6_list.txt -o ipv6_raw_result.txt

#Clean IPv4 Address
cat ipv4_raw_result.txt|grep -oP "([0-9]{1,3}[\.]){3}[0-9]{1,3}">ipv4_result.txt
rm -rf ipv4_raw_result.txt

#Clean IPv6 Address
cat ipv6_raw_result.txt|egrep -o '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))'>ipv6_result.txt
rm -rf ipv6_raw_result.txt

#Add IPv4 address to raw VLESS list
for vless in $(cat vless_list.txt)
do
  for ip in $(cat ipv4_result.txt)
  do
    echo $vless >> subscription_raw
    sed -i "s/ADDRESS/$ip/g" subscription_raw
    sed -i "s/IPADDR/$ip/g" subscription_raw
  done
done

#Add IPv6 address to raw VLESS list
for vless in $(cat vless_list.txt)
do
  for ip in $(cat ipv6_result.txt)
  do
    echo $vless >> subscription_raw
    sed -i "s/ADDRESS/[$ip]/g" subscription_raw
    sed -i "s/IPADDR/$ip/g" subscription_raw
  done
done

#Encode raw vless list to subscription file
cat subscription_raw|base64 > vless

#delete raw vless list
rm -rf subscription_raw
