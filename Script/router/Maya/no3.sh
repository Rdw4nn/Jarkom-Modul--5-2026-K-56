cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Maya

# Default route ke Fuyutsuki
ip route replace default via 192.239.4.161
EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route