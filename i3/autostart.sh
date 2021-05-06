#!/bin/bash

#network-manager-applet
echo 'nm'
nm-applet &
#xfce4-power-manager &
#xfce4-volumed-pulse &
#/bin/bash ~/scripts/run-mailsync.sh &
echo 'fci'
fcitx5 & 

proc_number=`ps -ef | grep -w blueman-tray | grep -v grep|wc -l`
echo 'blueman'
if [ $proc_number -le 0 ]; then
	blueman-tray &
fi

proc_number=`ps -ef | grep -w redshift | grep -v grep|wc -l`
if [ $proc_number -le 0 ]; then
    redshift &
fi

proc_number=`ps -ef | grep -w remmina | grep -v grep|wc -l`
echo 'remmina'
if [ $proc_number -le 0 ]; then
    LANG=zh_CN /usr/bin/remmina --icon &
fi

proc_number=`ps -ef | grep -w mobmonitor | grep -v grep|wc -l`
echo 'mobmonitor'
if [ $proc_number -le 0 ]; then
    ~/scripts/mobmonitor ttyUSB0 &
fi

proc_number=`ps -ef | grep -w xwinwrap | grep -v grep|wc -l`
echo 'xwinwrap'
if [ $proc_number -le 0 ]; then
    mkfifo /tmp/wallpaper; xwinwrap -b -fs -sp -nf -ov -- mplayer -shuffle -slave -input file=/tmp/wallpaper -nosound -loop 0 -wid WID -nolirc ~/.config/wallpaper/scene_01.mp4 &
fi

start-pulseaudio-x11
xinput --set-prop 'pointer:Logitech G502' 'libinput Accel Speed' -0.75
#设置声卡默认输出
#pacmd set-card-profile 1 output:analog-stereo+input:analog-stereo
