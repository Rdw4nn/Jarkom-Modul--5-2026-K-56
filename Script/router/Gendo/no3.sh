cat > /root/no3.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 3
# Router: Gendo

# Cabang Yui
ip route replace 192.239.0.0/23 via 192.239.4.110
ip route replace 192.239.3.0/25 via 192.239.4.110
ip route replace 192.239.4.0/27 via 192.239.4.110
ip route replace 192.239.4.32/28 via 192.239.4.110
ip route replace 192.239.4.136/29 via 192.239.4.110
ip route replace 192.239.4.144/30 via 192.239.4.110

# Cabang Hikari
ip route replace 192.239.2.0/24 via 192.239.4.114
ip route replace 192.239.3.224/27 via 192.239.4.114
ip route replace 192.239.4.148/30 via 192.239.4.114

# Cabang Asuka
ip route replace 192.239.3.128/26 via 192.239.4.118
ip route replace 192.239.4.48/29 via 192.239.4.118
ip route replace 192.239.4.96/30 via 192.239.4.118
ip route replace 192.239.4.152/29 via 192.239.4.118

# Cabang Fuyutsuki
ip route replace 192.239.3.192/27 via 192.239.4.122
ip route replace 192.239.4.56/29 via 192.239.4.122
ip route replace 192.239.4.72/29 via 192.239.4.122
ip route replace 192.239.4.160/29 via 192.239.4.122

# Cabang Shigeru
ip route replace 192.239.4.80/28 via 192.239.4.126
ip route replace 192.239.4.168/30 via 192.239.4.126

# Cabang Kaji
ip route replace 192.239.4.100/30 via 192.239.4.130

# Cabang Misato
ip route replace 192.239.4.64/29 via 192.239.4.134

EOF

chmod +x /root/no3.sh
bash /root/no3.sh
hostname
ip route