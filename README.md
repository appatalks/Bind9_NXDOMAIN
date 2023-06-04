<p></p>

Adding Change Control History
<p></p>

Do not just Deploy! Go through the configs and makes sure they will work for your setup.
Eventually I will work in logic to be a lot more automated.
<p></p>


</p>


</br>
** This Readme assumes you know some level of server administration **
<p></p>
For publiclly available private recursive DNS Server<p><p></p>
Goal: Allow authorized networks access to a Recursive DNS Server quering direct from the global root servers.<p>
Goal: Maintain easy to update blacklist for NXDOMAIN routing.<p>
<p></p>
Step 1: Custimize Global "named.conf"<p>
Step 2: Create a "blockeddomain.hosts"<p></p>
Step 3: Generate a "blacklist.db" of domains that will respond with NXDOMAIN<p>
Step 4: Use the DNS Server & Profit</p>
</p>
