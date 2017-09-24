#!/bin/bash

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
vps="aneka";

if [[ $vps = "zvur" ]]; then
	source="http://scripts.gapaiasa.com"
else
	source="https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim"
fi

# go to root
cd
# check registered ip
wget -q -O IP $source/IP.txt
if ! grep -w -q $MYIP IP; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo ""
	else
		echo "Hubungi : Moch Dawn (https://web.facebook.com/profile.php?id=100013679919271)"
	fi
	rm -f /root/IP
	exit
fi
# download script
cd
wget -O /usr/bin/benchmark https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/benchmark.sh
wget -O /usr/bin/speedtest $source/Debian7/speedtest_cli.py
wget -O /usr/bin/ps-mem $source/Debian7/ps_mem.py
if [[ $vps = "zvur" ]]; then
	wget -O /etc/issue.net $source/Debian7
else
	wget -O /etc/issue.net $source/Debian7
fi
wget -O /usr/bin/autokill https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/autokill.sh
wget -O /usr/bin/banned-user https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/banned-user.sh
wget -O /usr/bin/banner https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/banner.sh
wget -O /usr/bin/delete-user-expire https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/delete-user-expire.sh
wget -O /usr/bin/disable-user-expire https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/disable-user-expire.sh
wget -O /usr/bin/dropmon https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/dropmon.sh
wget -O /usr/bin/menu https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/menu.sh
wget -O /usr/bin/unbanned-user https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/unbanned-user.sh
wget -O /usr/bin/user-active-list https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-active-list.sh
wget -O /usr/bin/user-add https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-add.sh
wget -O /usr/bin/user-add-pptp https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-add-pptp.sh
wget -O /usr/bin/user-del https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-del.sh
wget -O /usr/bin/user-expire-list https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-expire-list.sh
wget -O /usr/bin/user-gen https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-gen.sh
wget -O /usr/bin/user-limit https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-limit.sh
wget -O /usr/bin/user-list https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-list.sh
wget -O /usr/bin/user-login https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-login.sh
wget -O /usr/bin/user-pass https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-pass.sh
wget -O /usr/bin/user-renew https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/user-renew.sh
wget -O /usr/bin/edit-port https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/edit-port.sh
wget -O /usr/bin/edit-port-dropbear https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/edit-port-dropbear.sh
wget -O /usr/bin/edit-port-openssh https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/edit-port-openssh.sh
wget -O /usr/bin/edit-port-squid https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/edit-port-squid.sh
wget -O /usr/bin/edit-port-openvpn https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/edit-port-openvpn.sh
wget -O /usr/bin/benchmark https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/benchmark.sh
wget -O /usr/bin/root-pass https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/root-pass.sh
wget -O /usr/bin/update https://raw.githubusercontent.com/Mochie150297/AbraKadabra/master/BimSalabim/update.sh

chmod +x /usr/bin/autokill
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/banner
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/edit-port
chmod +x /usr/bin/edit-port-dropbear
chmod +x /usr/bin/edit-port-openssh
chmod +x /usr/bin/edit-port-squid
chmod +x /usr/bin/edit-port-openvpn
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/root-pass
chmod +x /usr/bin/update
