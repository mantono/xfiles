#!/bin/bash

xcompmgr -n &
redshift -l 10:18 -b 1:0.7 -t 7000:3400 -m randr &
xbindkeys &
setxkbmap se &
xrdb ~/.Xresources &

if [ -z $(pidof syncthing) ]
then
	syncthing -no-browser &
fi

if [ -n "${GPG_AGENT_INFO}" ]; then
	 kill $(echo ${GPG_AGENT_INFO} | cut -d':' -f 2) >/dev/null 2>&1
fi
gpg-agent --daemon --use-standard-socket &
echo $(date) > /tmp/test &

HOSTNAME=$(/bin/hostname)
~/.config/local/$HOSTNAME
i3
