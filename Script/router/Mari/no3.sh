cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Mari

# Default route ke Yui
ip route replace default via 192.239.4.137
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route