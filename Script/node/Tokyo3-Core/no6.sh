cat > /root/no6.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 6
# Node: Tokyo3-Core

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
    address 192.239.4.106
    netmask 255.255.255.252
    gateway 192.239.4.105
NET

# Terapkan IP statis
ip link set eth0 up
ip -4 addr flush dev eth0
ip addr add 192.239.4.106/30 dev eth0
ip route replace default via 192.239.4.105 dev eth0

# DNS dari soal nomor 4
printf 'nameserver 8.8.8.8\nnameserver 1.1.1.1\n' > /etc/resolv.conf
EOF

chmod +x /root/no6.sh
bash /root/no6.sh

hostname
ip -br addr
ip route
ping -c 4 192.239.4.105