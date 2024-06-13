#!/bin/bash
function filter(){
echo "Welcome to Firewall Filter Tool"

while true
	do
		echo
		echo "########################################################################################"
		echo "Firewall Filter type-"
		echo "1)  Reject SYN Scan"
		echo "2)  Reject FIN Scan"
		echo "3)  Reject NULL Scan"
		echo "4)  Reject XMAS Scan"
		echo "5)  Reject Fragment Scan"
		echo "6)  Reject Data Length Scan"
		echo "7)  Reject TTL Scan"
		echo "8)  Reject Source Port Scan"
		echo "9)  Reject Stealth Scan"
		echo "10) To Clear all the filters"
		echo "11) Exit"
		echo "########################################################################################"
		echo -ne "Select Option for Scan: "
		read scan
		case $scan in 
			1)echo "Option 1- Reject SYN Scan Selected"
			 iptables -I INPUT -p tcp --tcp-flags ALL SYN -j REJECT --reject-with tcp-reset
			 echo "SYN scan rejection started sucessfully"
			;;
			2)echo "Option 2- Reject FIN Scan Selected"
			 iptables -I INPUT -p tcp --tcp-flags ALL FIN -j REJECT --reject-with tcp-reset
			 echo "FIN scan rejection started sucessfully"
			;;
			3)echo "Option 3- Reject NULL Scan Selected"
			 iptables -I INPUT -p tcp --tcp-flags ALL NONE -j REJECT --reject-with tcp-reset
			 echo "NULL scan rejection started sucessfully"
			;;
			4)echo "Option 4- Reject XMAS Scan Selected"
			 iptables -I INPUT -p tcp --tcp-flags ALL FIN,PSH,URG -j REJECT --reject-with tcp-reset	
			 echo "XMAS scan rejection started sucessfully"
			;;
			5)echo "Option 5- Reject Fragment Scan Selected"
			 iptables -I INPUT -p tcp -m length --length 40 -j REJECT --reject-with tcp-reset
			 echo "Fragment scan rejection started sucessfully"
			;;
			6)echo "Option 6- Reject Data Length Scan Selected"
			 echo -ne "Enter the range of packet to be rejected (ex-1:100) - "
			 read length							
			 iptables -I INPUT -p tcp -m length --length $length -j REJECT --reject-with tcp-reset
			 echo
			 echo "Specified Data Length scan rejection started sucessfully"
			;;
			7)echo "Option 7- Reject TTL Scan Selected"						
			 echo -ne "Enter the TTL of packet - "
			 read ttl
			 echo
			 iptables -I INPUT -p tcp -m ttl --ttl $ttl -j REJECT --reject-with tcp-reset
			 echo "Specified rejection of TTL scan started sucessfully"
			;;
			8)echo "Option 8- Reject Source Port Scan Selected"
			 echo -ne "Enter the port no. to be attacked - "
			 read port							
			 iptables -I INPUT -p tcp --sport $port -j ACCEPT 
			 iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
			 echo
			 echo "Specified rejection of Source Port scan started sucessfully"
			;;
			9)echo "Option 10- Reject Stealth Scan Selected"                     
			 iptables -I INPUT -p tcp -m length --length 44 -j REJECT --reject-with tcp-reset
		         echo "Stealth scan rejection started sucessfully"
		        ;;
		        10)echo "To clear all filters"
		         iptables -F
		         echo "All firewall packet filters cleared sucessfully"
		        ;;
		        11) break
			;;
			*)
		esac
	done
echo "Filter Applied Sucessfully..................."
echo "########################################################################################"
}
while true
    do
        filter
        echo
        break 
    done

