cat > /root/no2.sh <<'EOF'
#!/bin/sh

# Modul 5 - Operation Geofront
# Soal Nomor 2
# Router: Gendou

# DHCP NAT1
ip link set eth0 up
/gns3/bin/udhcpc -i eth0 -n -q

# Switch-Cmd
ip link set eth1 up
ip addr replace 192.239.4.105/30 dev eth1

# Fuyutsuki
ip link set eth2 up
ip addr replace 192.239.4.121/30 dev eth2

# Shigeru
ip link set eth3 up
ip addr replace 192.239.4.125/30 dev eth3

# Misato
ip link set eth4 up
ip addr replace 192.239.4.133/30 dev eth4

# Kaji
ip link set eth5 up
ip addr replace 192.239.4.129/30 dev eth5

# Asuka
ip link set eth6 up
ip addr replace 192.239.4.117/30 dev eth6

# Hikari
ip link set eth7 up
ip addr replace 192.239.4.113/30 dev eth7

# Yui
ip link set eth8 up
ip addr replace 192.239.4.109/30 dev eth8

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1

EOF

chmod +x /root/no2.sh