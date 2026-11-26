#!/bin/sh
set -e

# Modul 5 - Soal Nomor 15
# Node: Tokyo3-Core (192.239.4.106)

# Reset chain INPUT agar bersih & counter mulai dari 0
iptables -F INPUT
iptables -P INPUT ACCEPT

# 1. Izinkan loopback & paket balasan (termasuk echo-reply untuk ping keluar Tokyo3-Core)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 2. Batasi ping masuk (echo-request) maksimal 5 per detik, buang kelebihannya
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

EOF
