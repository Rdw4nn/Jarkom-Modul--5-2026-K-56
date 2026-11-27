#!/bin/sh
set -e

# Modul 5 - Soal Nomor 12
# Perbaikan hardening di Magi-Casper (tetap INPUT DROP & anti-ping masuk)

# Reset chain dengan aman
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F INPUT
iptables -F OUTPUT

# 1. Izinkan loopback
iptables -A INPUT -i lo -j ACCEPT

# 2. Izinkan paket balasan dari koneksi yang dimulai Casper (ICMP reply, DNS reply, apt-get HTTP/HTTPS)
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# 3. Tolak ping masuk ke Casper (mempertahankan syarat Soal 11 & 12)
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

# 4. Izinkan layanan TCP 5000 Casper
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT

# 5. Pertahankan default policy INPUT DROP agar lalu lintas masuk tak diizinkan tetap ditolak
iptables -P INPUT DROP

EOF
