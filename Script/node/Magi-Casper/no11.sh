#!/bin/sh
set -e

# Modul 5 - Soal Nomor 11
# Node: Magi-Casper (192.239.4.58)

# Pastikan paket iptables terpasang
command -v iptables >/dev/null 2>&1 || (apt-get update -qq && apt-get install -y -qq iptables)

# Reset chain INPUT agar bersih & idempoten
iptables -F INPUT
iptables -P INPUT ACCEPT

# 1. Izinkan loopback & balasan koneksi yang dimulai Casper (termasuk reply ping keluar)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 2. Tolak semua ping masuk (ICMP echo-request), termasuk dari satu switch
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 3. Pastikan layanan TCP 5000 tetap terbuka
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

EOF