#!/bin/sh
set -e

# Modul 5 - Soal Nomor 14
# Node: Pen-Pen (192.239.3.194)

# Jadwal dalam UTC (WIB - 7 jam)
PILOT_START="01:00"
PILOT_STOP="09:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="10:00"
STAF_STOP="16:00"

# Reset chain INPUT & custom chain PENPEN_ACL
iptables -F INPUT
iptables -P INPUT ACCEPT
iptables -F PENPEN_ACL 2>/dev/null || iptables -N PENPEN_ACL

# Izinkan loopback & koneksi yang sudah terbentuk
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Arahkan trafik ping & TCP 80 ke chain PENPEN_ACL
iptables -A INPUT -p icmp --icmp-type echo-request -j PENPEN_ACL
iptables -A INPUT -p tcp --dport 80 -j PENPEN_ACL

# 1. Terduga Dummy System: Entry-Plug (.4.50), Dummy-Plug (.4.51), Spy (.4.102) -> Selalu ditolak
for IP in 192.239.4.50 192.239.4.51 192.239.4.102; do
    iptables -A PENPEN_ACL -s "$IP" -j DROP
done

# 2. Pilot: Unit-01 (.4.66), Unit-02 (.4.67), Unit-00 (.4.68), Sachiel (.3.130)
for IP in 192.239.4.66 192.239.4.67 192.239.4.68 192.239.3.130; do
    iptables -A PENPEN_ACL -s "$IP" -m time --timestart "$PILOT_START" --timestop "$PILOT_STOP" --weekdays "$PILOT_DAYS" -j ACCEPT
    iptables -A PENPEN_ACL -s "$IP" -j DROP
done

# 3. Staf Geofront: Lilith (.4.74), Adam (.4.75)
for IP in 192.239.4.74 192.239.4.75; do
    iptables -A PENPEN_ACL -s "$IP" -m time --timestart "$STAF_START" --timestop "$STAF_STOP" -j ACCEPT
    iptables -A PENPEN_ACL -s "$IP" -j DROP
done

# 4. Lainnya -> RETURN ke INPUT (ACCEPT)
iptables -A PENPEN_ACL -j RETURN

EOF
