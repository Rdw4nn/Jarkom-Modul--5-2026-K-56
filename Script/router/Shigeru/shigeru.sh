#!/bin/sh

ip route replace default via 192.239.4.125 dev eth0
ip route replace 192.239.4.88/29 via 192.239.4.170 dev eth2

EOF