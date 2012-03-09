/usr/bin/xset r rate 170 50
/usr/bin/xset b off
/usr/bin/xset fp+ /usr/share/fonts/local/ 
/usr/bin/xset fp+ /usr/share/fonts/TTF
/usr/bin/xset fp rehash
/usr/bin/xrdb -merge /home/cra/.Xterm-test
/usr/bin/xrdb -merge /home/cra/.Xresources
/usr/bin/urxvtd -q -f -o 
/usr/bin/xbindkeys &
xmodmap .xmodmap
/usr/lib/notification-daemon-1.0/notification-daemon &
dropboxd &
/usr/bin/stalonetray --kludges force_icons_size &
udiskie &
parcellite &
ssh-agent ion3
