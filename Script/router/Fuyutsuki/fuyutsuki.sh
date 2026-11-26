#!/bin/sh

ip route replace default via 192.239.4.121 dev eth0
ip route replace 192.239.3.192/27 via 192.239.4.162 dev eth2
ip route replace 192.239.4.72/29 via 192.239.4.166 dev eth3

EOF