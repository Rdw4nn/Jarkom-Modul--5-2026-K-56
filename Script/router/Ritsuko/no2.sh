cat > /root/no2.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 2
# Router: Ritsuko

# Asuka
ip link set eth0 up
ip addr replace 192.239.4.158/30 dev eth0

# Switch-Lab
ip link set eth1 up
ip addr replace 192.239.4.49/29 dev eth1

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh

hostname
ip -br addr
ip route
sysctl net.ipv4.ip_forward