cat > /root/no2.sh <<'EOF'
#!/bin/sh

# Modul 5 - Soal Nomor 2
# Router: Yui

# Gendou
ip link set eth0 up
ip addr replace 192.239.4.110/30 dev eth0

# Switch-Hangar
ip link set eth4 up
ip addr replace 192.239.3.1/25 dev eth4

# Mari
ip link set eth3 up
ip addr replace 192.239.4.137/30 dev eth3

# Rei
ip link set eth2 up
ip addr replace 192.239.4.141/30 dev eth2

# Shinji
ip link set eth1 up
ip addr replace 192.239.4.145/30 dev eth1

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh