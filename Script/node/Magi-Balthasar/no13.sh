#!/bin/sh
set -e

# Modul 5 - Soal Nomor 13
# Node: Magi-Balthasar (192.239.4.59)

# Reset chain INPUT agar bersih & idempoten
iptables -F INPUT
iptables -P INPUT ACCEPT

# Izinkan loopback & koneksi yang sudah terbentuk
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Daftar IP yang diizinkan ke TCP 5000 & 5001:
# - Magi-Casper: 192.239.4.58
# - Pilot: Unit-01 (.4.66), Unit-02 (.4.67), Unit-00 (.4.68), Sachiel (.3.130)
for SRC in 192.239.4.58 192.239.4.66 192.239.4.67 192.239.4.68 192.239.3.130; do
    iptables -A INPUT -p tcp -s "$SRC" -m multiport --dports 5000,5001 -j ACCEPT
done

# Tolak seketika (TCP RST) semua koneksi lain ke port 5000 & 5001
iptables -A INPUT -p tcp -m multiport --dports 5000,5001 -j REJECT --reject-with tcp-reset

EOF