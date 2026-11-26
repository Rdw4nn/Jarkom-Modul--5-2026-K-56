cat > /root/melchior.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 7
# Node: Magi-Melchior

apt-get update
apt-get install -y iptables netcat-traditional

EOF

chmod +x /root/melchior.sh
bash /root/melchior.sh