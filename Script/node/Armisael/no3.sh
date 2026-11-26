cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Konfigurasi sementara Armisael
ip link set eth0 up
ip addr replace 192.239.4.82/29 dev eth0
ip route replace default via 192.239.4.81
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip -br addr
ip route
ping -c 4 192.239.4.81