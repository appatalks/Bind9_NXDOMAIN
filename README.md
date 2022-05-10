Now Deployable as an Automatic, Deploy and Forget AMI via the Amazon Market Place:</p>
https://aws.amazon.com/marketplace/pp/prodview-pap4alojvsuny?sr=0-2&ref_=beagle&applicationId=AWSMPContessa
</p>
1) Launch as a t2.micro or above in a Public Subnet for general home of office use. </p>
2) Attach an Elastic IP for persistence. </p>
3) Adjust Security Group whitelisting IP Ranges that are used. (https://www.google.com/search?&q=whatsmyip) </p>
4) Point your home/office router to the Elastic Public IP </p>


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
Bitcoin Donation: 16CowvxvLSR4BPEP9KJZiR622UU7hGEce5<p>
Ethereum Donation: 0xf75278bd6e2006e6ef4847c9a9293e509ab815c5<p></p>

