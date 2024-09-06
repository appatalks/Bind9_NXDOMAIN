#!/bin/bash
######################################################################
# Update BlackLists
#
mkdir -p /root/bind-blacklists/"$(date +"%d-%m-%Y")"
cd /root/bind-blacklists/"$(date +"%d-%m-%Y")"
# wget https://github.com/notracking/hosts-blocklists/raw/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Malware
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Remote
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Risk
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Scam
cp /var/cache/bind/blacklist.db .
cat blacklist.db | awk '{print $1}'| sort > blacklist.current
# grep -v "#" dnscrypt-proxy.blacklist.txt >> blacklist.current
cat Malware >> blacklist.current
cat Remote >> blacklist.current
cat Risk >> blacklist.current
cat Scam >> blacklist.current
cat blacklist.current | sort | uniq > newblacklist.zones
for i in $(cat newblacklist.zones); do echo "$i CNAME ." >>  newblacklist.db; done
systemctl stop named.service
cp newblacklist.db /var/cache/bind/blacklist.db
chown bind:bind /var/cache/bind/blacklist.db
systemctl start named.service
