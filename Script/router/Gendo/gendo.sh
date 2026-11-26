cat > /root/gendo.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 5
# Router: Gendou

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# Bersihkan rule INPUT dan FORWARD
iptables -F INPUT
iptables -F FORWARD

# Default policy OUTPUT
iptables -P OUTPUT ACCEPT

# Izinkan koneksi ESTABLISHED dan RELATED
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Izinkan loopback
iptables -A INPUT -i lo -j ACCEPT

# Izinkan DHCP dari NAT1
iptables -A INPUT -i eth0 -p udp --sport 67 --dport 68 -j ACCEPT

# Izinkan jaringan internal mengakses Gendou
iptables -A INPUT ! -i eth0 -s 192.239.0.0/21 -j ACCEPT

# Izinkan jaringan internal mengakses internet
iptables -A FORWARD ! -i eth0 -s 192.239.0.0/21 -o eth0 -j ACCEPT

# Izinkan komunikasi antar-LAN
iptables -A FORWARD ! -i eth0 -s 192.239.0.0/21 ! -o eth0 -d 192.239.0.0/21 -j ACCEPT

# Default policy DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP

EOF

chmod +x /root/gendo.sh
bash /root/gendo.sh