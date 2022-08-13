#!/bin/bash
#cat /var/log/queries.log | cut -d" " -f4,6 | sed 's/#/ /g' | awk '{print $1}' | sort | uniq -c | sort -nr | less
cat /var/cache/bind/queries.log | cut -d" " -f5,6 | sed 's/#/ /g' | awk '{print $1}' | sort | uniq -c | sort -nr | less

