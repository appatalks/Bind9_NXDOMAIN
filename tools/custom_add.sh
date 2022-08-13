#!/bin/bash
######################################################################
# Update BlackLists
# Add a list line-by-line of new domains you'd like to add.
# ex: ./custom_add.sh New_list.txt

LIST=$1
cp /var/cache/bind/blacklist.db .
cat blacklist.db | awk '{print $1}'| sort > blacklist.current
cat $LIST >> blacklist.current
cat blacklist.current | sort | uniq > newblacklist.zones
for i in $(cat newblacklist.zones); do echo "$i CNAME ." >>  newblacklist.db; done
systemctl stop named.service
cp newblacklist.db /var/cache/bind/blacklist.db
chown named:named /var/cache/bind/blacklist.db
systemctl start named.service

