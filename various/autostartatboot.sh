#!/bin/bash

#1 INSTALL

# cron is a tool for scheduling tasks (with per minute precision)
# crontab lets you edit rules, so run: $ sudo crontab -e
# add:
# @reboot /bin/bash /home/pi/dev/IoT-WtF/various/autostartatboot.sh
# and make sure this filepath exists

#2

# autostart vnc server
# sudo /usr/bin/x11vnc -geometry 800x480 -display :0 &>log/vncout.log

# start jackd sound server (and supercollider)
# use default sound out 
# make sure in raspi-config's advanced options, to force audio over 3.5mm jack !
# sudo /usr/local/bin/jackd -P75 -dalsa -dhw:0 -p1024 -n3 -s -r48000 &

# or, for external usb soundcard
# sudo /usr/local/bin/jackd -P75 -dalsa -dhw:1 -p1024 -n3 -s -r48000 &


# run supercollider startup script
# su root -c "sclang -D /home/pi/dev/startup.scd"

