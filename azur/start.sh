#!/bin/bash
#Firewall
sleep 30
set -x
PATH=/usr/sbin:/sbin:/usr/bin:/bin
systemctl disable ufw;
systemctl stop ufw;
#redirect to LXC container
iptables -t nat -A PREROUTING -i tun0 -p tcp --dport 80 -j DNAT --to 172.15.172.2:80;
iptables -t nat -A PREROUTING -i tun0 -p tcp --dport 8000 -j DNAT --to 172.15.172.2:8000;
iptables -t nat -A PREROUTING -i tun0 -p tcp --dport 3306 -j DNAT --to 172.15.172.2:3306;
#Start Play
pulseaudio -D --system
sleep 10
pactl set-sink-mute 0 false
pactl set-sink-volume 0 100%
sleep 20
(cvlc -I dummy http://172.15.172.2:8000/radio.mp3 --loop &)
lxc start azuracast
sleep 20
lxc start azuracast
