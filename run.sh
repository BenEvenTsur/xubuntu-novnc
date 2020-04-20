#!/bin/sh
export DISPLAY=$HOSTNAME:1
/usr/sbin/sshd -D &
printf "$PASSWORD\n$PASSWORD\n\n" | vncpasswd
vncserver -localhost -depth 24 -geometry $(echo $WIDTH'x'$HEIGHT) :1
/noVNC/utils/launch.sh --vnc localhost:5901 &
startxfce4