cat > /root/no4.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 4
# DNS Configuration

printf 'nameserver 8.8.8.8\nnameserver 1.1.1.1\n' > /etc/resolv.conf

EOF

chmod +x /root/no4.sh
bash /root/no4.sh

hostname
cat /etc/resolv.conf