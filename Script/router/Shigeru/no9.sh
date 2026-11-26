cat > /root/no9.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 9
# Router: Shigeru
# Routing Troubleshooting

# 1. Hapus policy routing yang salah
ip rule del priority 90 iif eth1 lookup 100 2>/dev/null || true

# 2. Bersihkan routing table 100
ip -4 route flush table 100 2>/dev/null || true

# 3. Hapus blackhole route menuju Switch-Dogma
ip route del blackhole 192.239.4.72/29 2>/dev/null || true

# 4. Kembalikan default route menuju Gendou
ip route replace default via 192.239.4.125 dev eth0

# 5. Aktifkan kembali IP forwarding
sysctl -w net.ipv4.ip_forward=1

echo "Routing Shigeru telah diperbaiki."

EOF

chmod +x /root/no9.sh
bash /root/no9.sh