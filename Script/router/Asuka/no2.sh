cat > /root/no2.sh <<'EOF'
#!/bin/sh

# Modul 5 - Soal Nomor 2
# Router: Asuka

# Gendou
ip link set eth0 up
ip addr replace 192.239.4.118/30 dev eth0

# Switch-Archive
ip link set eth1 up
ip addr replace 192.239.4.97/30 dev eth1

# Kensuke
ip link set eth3 up
ip addr replace 192.239.4.153/30 dev eth3

# Ritsuko
ip link set eth2 up
ip addr replace 192.239.4.157/30 dev eth2

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1
EOF

chmod +x /root/no2.sh
bash /root/no2.sh