#!/bin/sh

# Bersihkan chain FORWARD agar aturan zona bersih dan terurut
iptables -F FORWARD
iptables -P FORWARD ACCEPT

# 1. Izinkan balasan (ESTABLISHED, RELATED) untuk koneksi yang dimulai dari dalam zona
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 2. Pengecualian: izinkan ICMP echo-request (ping) dari subnet Terminal masuk dari arah Gendo
iptables -A FORWARD -i eth0 -s 192.239.4.56/29 -p icmp --icmp-type echo-request -j ACCEPT

# 3. Tolak semua koneksi baru lainnya yang datang dari sisi Gendo (eth0) tanpa menyebut subnet luar satu per satu
iptables -A FORWARD -i eth0 -j DROP

EOF