#!/bin/bash
sleep 10
pulseaudio -D --system
sleep 10
pactl set-sink-mute 0 false
pactl set-sink-volume 0 100%
sleep 20
php /var/azuracast/www/util/cli.php azuracast:radio:restart
#start play music
cvlc -I dummy http://localhost:8000/radio.mp3 --loop &
