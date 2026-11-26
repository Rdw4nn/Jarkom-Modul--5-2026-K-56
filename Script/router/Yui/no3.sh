cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Yui

# Default route ke Gendou
ip route replace default via 192.239.4.109

# Cabang Mari
ip route replace 192.239.4.32/28 via 192.239.4.138

# Cabang Rei
ip route replace 192.239.0.0/23 via 192.239.4.142

# Cabang Shinji
ip route replace 192.239.4.0/27 via 192.239.4.146
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route