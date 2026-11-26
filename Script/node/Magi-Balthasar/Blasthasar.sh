cat > /root/balthasar.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 7
# Node: Magi-Balthasar

apt-get update
apt-get install -y iptables netcat-traditional

EOF

chmod +x /root/balthasar.sh
bash /root/balthasar.sh