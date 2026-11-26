cat > /root/no2.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 2
# Router: Shigeru

# Gendou
ip link set eth0 up
ip addr replace 192.239.4.126/30 dev eth0

# Switch-Monolith
ip link set eth1 up
ip addr replace 192.239.4.81/29 dev eth1

# Makoto
ip link set eth2 up
ip addr replace 192.239.4.169/30 dev eth2

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh

hostname
ip -br addr
ip route
sysctl net.ipv4.ip_forward