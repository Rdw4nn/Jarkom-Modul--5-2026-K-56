cat > /root/no8.sh <<'EOF'
#!/bin/sh
set -e

# Modul 5 - Soal Nomor 8
# Node: Tokyo3-Core

# Instalasi Netcat
if ! command -v nc.traditional >/dev/null 2>&1; then
    apt-get update
    apt-get install -y netcat-traditional
fi

# Listener TCP port 80
while true; do
    printf 'Welcome to %s\n' "$(hostname)" | \
    nc.traditional -l -n -v -p 80 -q 1 || true
    sleep 1
done &

# Listener TCP port 8080
while true; do
    printf 'syifa imutz\n' | \
    nc.traditional -l -n -v -p 8080 -q 1 || true
    sleep 1
done

EOF

chmod +x /root/no8.sh
bash /root/no8.sh