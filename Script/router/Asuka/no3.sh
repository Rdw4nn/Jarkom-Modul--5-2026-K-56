cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Asuka

# Default route ke Gendou
ip route replace default via 192.239.4.117

# Cabang Kensuke
ip route replace 192.239.3.128/26 via 192.239.4.154

# Cabang Ritsuko
ip route replace 192.239.4.48/29 via 192.239.4.158
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route