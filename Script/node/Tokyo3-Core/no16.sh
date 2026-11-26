#!/bin/sh
set -e

# Modul 5 - Soal Nomor 16 (menggabungkan aturan No 15 & No 16)
# Node: Tokyo3-Core (192.239.4.106)
# Sumber yang diawasi: Dummy-Plug (192.239.4.51)

iptables -F INPUT
iptables -P INPUT ACCEPT

# 1. Izinkan loopback & koneksi yang sudah terbentuk
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 2. (No 15) Batasi ping masuk maksimal 5 per detik, buang kelebihannya
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 3. (No 16) Log & tolak seketika koneksi TCP dari Dummy-Plug ke port 22, 23, dan 3306
iptables -A INPUT -s 192.239.4.51 -p tcp -m multiport --dports 22,23,3306 -j LOG --log-prefix "SCAN-NERV: "
iptables -A INPUT -s 192.239.4.51 -p tcp -m multiport --dports 22,23,3306 -j REJECT --reject-with tcp-reset

EOF
