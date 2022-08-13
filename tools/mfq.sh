#!/bin/bash
# cat /var/cache/bind/security.log | egrep 'REFUSED|denied' | cut -d" " -f5,6 | sed 's/#/ /g' | awk '{print $1,$3}' | sort | uniq -c | sort -nr | less

# cat /var/cache/bind/security.log | egrep 'NXDOMAIN' | cut -d" " -f7,8 | sed 's/#/ /g' | awk '{print $1,$3}' | sort | uniq -c | sort -nr | less

cat /var/cache/bind/security.log | egrep 'REFUSED|denied' | cut -d" " -f5,6 | sed 's/#/ /g' | awk '{print $1,$3}' > /tmp/security.log.tmp;
cat /var/cache/bind/security.log | egrep 'NXDOMAIN' | cut -d" " -f7,8 | sed 's/#/ /g' | awk '{print $1,$3}' >> /tmp/security.log.tmp;
cat /tmp/security.log.tmp | sort | uniq -c | sort -nr | less;
rm -fr /tmp/security.log.tmp

