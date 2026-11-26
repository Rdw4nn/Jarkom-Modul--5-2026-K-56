cat > /root/no2.sh <<'EOF'
#!/bin/sh

# Modul 5 - Soal Nomor 2
# Router: Fuyutsuki

# Gendou
ip link set eth0 up
ip addr replace 192.239.4.122/30 dev eth0

# Switch-Terminal
ip link set eth1 up
ip addr replace 192.239.4.57/29 dev eth1

# Maya
ip link set eth2 up
ip addr replace 192.239.4.161/30 dev eth2

# Toji
ip link set eth3 up
ip addr replace 192.239.4.165/30 dev eth3

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh