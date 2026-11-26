#!/bin/sh
set -e

# Modul 5 - Soal Nomor 17
# Router: Fuyutsuki (Gateway Switch-Terminal)
# Sumber: Magi-Casper (192.239.4.58)
# Tujuan Asli: Zeruel (192.239.4.82) -> Dialihkan ke Pen-Pen (192.239.3.195)

# Pasang utilitas conntrack jika belum tersedia untuk melihat tabel conntrack
command -v conntrack >/dev/null 2>&1 || (apt-get update -qq && apt-get install -y -qq conntrack)

# Bersihkan tabel nat Fuyutsuki agar tidak dobel saat pemulihan (No 20)
iptables -t nat -F

# Alihkan hanya trafik TCP dari Magi-Casper ke Zeruel agar menuju Pen-Pen
iptables -t nat -A PREROUTING -s 192.239.4.58 -d 192.239.4.82 -p tcp -j DNAT --to-destination 192.239.3.195

EOF
