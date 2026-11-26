cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Fuyutsuki

# Default route ke Gendou
ip route replace default via 192.239.4.121

# Cabang Maya
ip route replace 192.239.3.192/27 via 192.239.4.162

# Cabang Toji
ip route replace 192.239.4.72/29 via 192.239.4.166
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route