** This Readme assumes you know some level of server administration **

For publiclly available private recursive DNS Server;

Goal: Allow authorized networks access to a Recursive DNS Server quering direct from the global root servers.
Goal: Maintain easy to update blacklist for NXDOMAIN routing.

Step 1: Custimize Global "named.conf"
Step 2: Create a "blockeddomain.hosts"
Step 3: Generate a blacklist "blacklist.db" of domains that will respond with NXDOMAIN
Step 4: Use the DNS Server & Profit

Bitcoin Donation: 16CowvxvLSR4BPEP9KJZiR622UU7hGEce5
Ethereum Donation: 0xf75278bd6e2006e6ef4847c9a9293e509ab815c5
