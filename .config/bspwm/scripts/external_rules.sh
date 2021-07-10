#!/bin/bash

window_id="$1"
window_class="$2"
window_instance="$3"
window_title="$(xwininfo -id "$window_id" | sed ' /^xwininfo/!d ; s,.*"\(.*\)".*,\1,')"

#window_title=$(xtitle $window_id)

#echo $window_title >> ~/test

case "$window_title" in
	"ranger")
		echo "state=floating"
		echo "center=on"
		echo "rectangle=789x512+264+130"
		;;
	"terminal-small")
		echo "state=floating"
		echo "rectangle=649x432+323+180"
		;;
	"Calculator")
		echo "state=floating"
		echo "rectangle=549x332+323+180"
		;;
	"zoom")
		echo "state=floating"
		echo "rectangle=549x332+323+180"
		;;
    "vlc")
        echo "layer=above border=off"
        ;;
esac