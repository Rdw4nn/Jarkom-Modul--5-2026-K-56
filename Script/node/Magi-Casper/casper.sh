cat > /root/casper.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 7
# Node: Magi-Casper

apt-get update
apt-get install -y iptables netcat-traditional

EOF

chmod +x /root/casper.sh
bash /root/casper.sh