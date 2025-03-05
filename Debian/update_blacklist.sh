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
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Remote
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Risk
wget https://raw.githubusercontent.com/ShadowWhisperer/BlockLists/master/RAW/Scam
wget https://raw.githubusercontent.com/appatalks/Bind9_NXDOMAIN/refs/heads/main/tools/whitelist.txt

# Prep
cp /var/cache/bind/blacklist.db .
cat blacklist.db | awk '{print $1}'| sort > blacklist.current

# Adding New Lists
# grep -v "#" dnscrypt-proxy.blacklist.txt >> blacklist.current
cat Malware >> blacklist.current
cat Remote >> blacklist.current
cat Risk >> blacklist.current
cat Scam >> blacklist.current
cat blacklist.current | sort | uniq > newblacklist.zones

# Remove whitelisted domains if whitelist.txt exists
if [ -f whitelist.txt ]; then
    grep -vFxf whitelist.txt newblacklist.zones > filtered.zones
    mv filtered.zones newblacklist.zones
fi

for i in $(cat newblacklist.zones); do echo "$i CNAME ." >>  newblacklist.db; done

# Restart 
systemctl stop named.service
cp newblacklist.db /var/cache/bind/blacklist.db
chown bind:bind /var/cache/bind/blacklist.db
systemctl start named.service
