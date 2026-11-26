cat > /root/no2.sh <<'EOF'
#!/bin/sh

# Modul 5 - Soal Nomor 2
# Router: Hikari

# Gendou
ip link set eth0 up
ip addr replace 192.239.4.114/30 dev eth0

# Switch-Comm
ip link set eth1 up
ip addr replace 192.239.2.1/24 dev eth1

# Kaworu
ip link set eth2 up
ip addr replace 192.239.4.149/30 dev eth2

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh