cat > /root/no4.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 4
# Router: Gendou

# IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# NAT Masquerade
iptables -t nat -C POSTROUTING -s 192.239.0.0/21 -o eth0 -j MASQUERADE 2>/dev/null || \
iptables -t nat -A POSTROUTING -s 192.239.0.0/21 -o eth0 -j MASQUERADE

EOF

chmod +x /root/no4.sh
bash /root/no4.sh