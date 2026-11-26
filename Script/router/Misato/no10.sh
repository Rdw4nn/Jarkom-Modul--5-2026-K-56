cat > /root/no10.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 10
# Router: Misato
# Menghapus SNAT yang salah pada jaringan Cage

if iptables -t nat -C POSTROUTING \
    -s 192.239.4.64/29 \
    ! -d 192.239.0.0/16 \
    -o eth0 \
    -j SNAT --to-source 172.31.99.1 2>/dev/null
then
    iptables -t nat -D POSTROUTING \
        -s 192.239.4.64/29 \
        ! -d 192.239.0.0/16 \
        -o eth0 \
        -j SNAT --to-source 172.31.99.1
fi

echo "NAT Misato berhasil diperbaiki."

iptables -t nat -S

EOF

chmod +x /root/no10.sh
bash /root/no10.sh