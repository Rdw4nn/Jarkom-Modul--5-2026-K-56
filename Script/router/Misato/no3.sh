cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Misato

# Default route ke Gendou
ip route replace default via 192.239.4.133
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route