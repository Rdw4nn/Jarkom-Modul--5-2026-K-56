cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Hikari

# Default route ke Gendou
ip route replace default via 192.239.4.113

# Cabang Kaworu
ip route replace 192.239.3.224/27 via 192.239.4.150
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route