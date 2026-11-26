cat > /root/no6.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 6
# Node: Relay-Node

# Simpan konfigurasi jaringan
mkdir -p /etc/network
if [ -f /etc/network/interfaces ] && [ ! -f /etc/network/interfaces.no6.bak ]; then
    cp /etc/network/interfaces /etc/network/interfaces.no6.bak
fi

cat > /etc/network/interfaces <<'NET'
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.239.3.226
    netmask 255.255.255.224
    gateway 192.239.3.225
NET

# Terapkan IP statis
ip link set eth0 up
ip -4 addr flush dev eth0
ip addr add 192.239.3.226/27 dev eth0
ip route replace default via 192.239.3.225 dev eth0

# DNS dari soal nomor 4
printf 'nameserver 8.8.8.8\nnameserver 1.1.1.1\n' > /etc/resolv.conf
EOF

chmod +x /root/no6.sh
bash /root/no6.sh

hostname
ip -br addr
ip route
ping -c 4 192.239.3.225