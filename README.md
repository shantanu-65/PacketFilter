# PacketFilter
PacketFilter protects Linux systems from data breaches, unauthorized access, and other network security threats.

# What is PacketFilter?
Packet filter lets you control what traffic will be allowed into and out of your network using iptables.iptables is a user-space utility program that allows a system administrator to configure the IP packet rules of the Linux kernel firewall. Basically, it protects your network by filtering packets according to the rules that you define.

# Features
Inspecting and filtering network traffic based on a set of rules. These rules define what traffic is allowed and what is blocking,based on the criteria such as the source and destination IP address,port number, and protocol.

# This Tool Tested on:
Ubuntu

Kali Linux

![Firewallfilter1](https://github.com/shantanu-65/PacketFilter/assets/172571474/a15fea74-049c-4970-9b13-f4b75c242038)

# Main Points
1) Reject SYN scan - rejects the SYN flag packets which are used in TCP connection.

2) Reject FIN scan - rejects FIN flag packets used in TCP for connection termination.

3) Reject NULL scan - rejects NULL flag packets which are used in TCP connection which hold a sequence number of “zeros” (0000000) 

4) Reject Xmas scan - rejects the PSH, URG and FIN flags of the TCP header.

5) Reject Fragment scan - It rejects fragment scan which split up the TCP header over several packets to make it harder for packet filters, intrusion detection systems, and other annoyances to detect what you are doing.

6) Reject Data Length scan - This scan let you reject the random data length of your choice.

7) Reject TTL scan -  reject Time to live (TTL) value that signifies how long a packet of data can exist in a network before it is discarded.

8) Reject Source Port scan - reject a source port which will carry network packets to the destination port. 

9) Reject Stealth scan - reject this scan that does not create a log on the destination device.

# Installing
https://github.com/shantanu-65/PacketFilter

cd PacketFilter

bash pfilter.sh

PacketFilter is created to help in penetration testing and it is not responsible for any misuse or illegal purposes.





