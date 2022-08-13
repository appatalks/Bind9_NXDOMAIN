#!/bin/bash
cat /var/cache/bind/queries.log | cut -d" " -f5,6 | sed 's/#/ /g' | awk '{print $1,$3}' | sort | uniq -c | sort -nr | less

