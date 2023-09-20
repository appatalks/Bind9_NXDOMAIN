#!/bin/bash
######################################################################
# Update BlackLists
# 

# Set-up Temp Folder
mkdir -p /root/bind-blacklists/"$(date +"%d-%m-%Y")"
cd /root/bind-blacklists/"$(date +"%d-%m-%Y")"

# Grab New Lists
# notracking was archived Aug 8, 2023.
# wget https://github.com/notracking/hosts-blocklists/raw/master/dnscrypt-proxy/dnscrypt-proxy.blacklist.txt
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Malware

# Prep
cp /var/cache/bind/blacklist.db .
cat blacklist.db | awk '{print $1}'| sort > blacklist.current

# Adding New Lists
grep -v "#" dnscrypt-proxy.blacklist.txt >> blacklist.current
cat Malware >> blacklist.current
cat blacklist.current | sort | uniq > newblacklist.zones
for i in $(cat newblacklist.zones); do echo "$i CNAME ." >>  newblacklist.db; done

# Restart 
systemctl stop named.service
cp newblacklist.db /var/cache/bind/blacklist.db
chown named:named /var/cache/bind/blacklist.db
systemctl start named.service

