cat > /root/no10.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 10
# Router: Gendou
# Menghapus pengecualian NAT jaringan Cage

if iptables -t nat -C POSTROUTING \
    -s 192.239.4.64/29 \
    -o eth0 \
    -j RETURN 2>/dev/null
then
    iptables -t nat -D POSTROUTING \
        -s 192.239.4.64/29 \
        -o eth0 \
        -j RETURN
fi

# Pastikan rule MASQUERADE normal tersedia
iptables -t nat -C POSTROUTING \
    -s 192.239.0.0/21 \
    -o eth0 \
    -j MASQUERADE 2>/dev/null || \
iptables -t nat -A POSTROUTING \
    -s 192.239.0.0/21 \
    -o eth0 \
    -j MASQUERADE

echo "NAT Gendou berhasil diperbaiki."

iptables -t nat -S

EOF

chmod +x /root/no10.sh
bash /root/no10.sh