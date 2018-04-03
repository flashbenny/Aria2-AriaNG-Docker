#!bin/sh
if [ ! -f /conf/aria2.conf ];then
    echo "Error: Can't find Aria2 Config file."
else
	if [ ! -f /conf/aria2.session ];then
		touch /conf/aria2.session
	fi
fi
darkhttpd /AriaNG/  --port 18800 &
aria2c --conf-path=/conf/aria2.conf
