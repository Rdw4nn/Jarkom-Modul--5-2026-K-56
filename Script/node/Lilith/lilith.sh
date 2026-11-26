cat > /root/lilith.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 7
# Node: Lilith

apt-get update
apt-get install -y netcat-traditional

EOF

chmod +x /root/lilith.sh
bash /root/lilith.sh