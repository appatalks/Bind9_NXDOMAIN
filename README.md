For publiclly available private recursive DNS Server;

Goal: Allow authorized networks access to a Recursive DNS Server quering direct from the global root servers.
Goal: Maintain easy to update blacklist for NXDOMAIN routing.

Step 1: Custimize Global "named.conf"

acl "trusted": Authorized IP Ranges
options: Global Server Directives; 
zone "rpz": Where all the magic happens.
logging: Logging for monitoring.
category: Logging stuff.
include: Additonal Configurations

Step 2: Create a "blockeddomain.hosts"

Empty Zone file with inlcude reference to "blacklist.db"

Step 3: Generate a blacklist "blacklist.db" of domains that will respond with NXDOMAIN

$ echo "example.com CNAME ." >> blacklist.db

Step 4: Use the DNS Server.




** This Readme assumes you know some level of server administration **
