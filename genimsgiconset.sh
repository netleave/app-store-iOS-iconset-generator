#!/bin/bash

copySRC () {
        if [ ! -f $1 ]; then
		echo "Sorry! Source file [$1] not found."
		exit 1
	fi
	cp $1 $2
}

createicon () {
#	cp Icon1024-appstore.png $1
	copySRC Icon1024-appstore.png $1
	sips -z $3 $2 $1 &> /dev/null
}

cropicon () {
#	cp Icon1024-appstore.png $1
	copySRC Icon1024-appstore.png $1
#	sips -Z $2 $1 &> /dev/null
	sips -c $3 $2 $1 &> /dev/null
}


createwicon () {
#	cp icon-imessage-iPhone@3x.png $1
#	copySRC icon-imessage-iPhone@3x.png $1
	copySRC icon-1024imessage.png $1
	sips -z $3 $2 $1 &> /dev/null
}

genicon () {
        if [ ! -f $1 ] && [ ! -d $1 ]; then
		case "$1" in
		        Icon1024-appstore.png)
				createicon $1 1024 1024
		            ;;
		        Icon-Small@2x.png)
				createicon $1 58 58
		            ;;
		        icon-87.png)
				createicon $1 87 87
		            ;;
		        icon-imessage-iPadPro.png)
				createwicon $1 148 110
		            ;;
			icon-imessage-iPad.png)
				createwicon $1 134 100
		            ;;

			icon-1024imessage.png)
				cropicon $1 1024 768
		            ;;
			icon-imessage-iPhone@3x.png)
#				cropicon $1 180 135
				createwicon $1 180 135
		            ;;
			icon-imessage-iPhone@2x.png)
				createwicon $1 120 90
		            ;;
			icon-imessage-msg2@2x.png)
				createwicon $1 64 48
		            ;;
			icon-imessage-msg2@3x.png)
				createwicon $1 96 72
		            ;;
			icon-imessage-msg@2x.png)
				createwicon $1 54 40
		            ;;
			icon-imessage-msg@3x.png)
				createwicon $1 81 60
		            ;;
		        *)
		            echo "Sorry! No portfolio found. [$1]"
		            exit 1
	         esac

#                echo "INFO[$0]: GENERATE:[$1]"
                echo "INFO - GENERATE:[$1]"
#                echo "$0: $1 NOT exists"
#                exit 1
        else
		height=`sips --getProperty pixelHeight $1 | sed -E "s/.*pixelHeight: ([0-9]+)/\1/g" | tail -1`
		width=`sips --getProperty pixelWidth $1 | sed -E "s/.*pixelWidth: ([0-9]+)/\1/g" | tail -1`

#                echo "INFO[$0]: EXISTS:[$1] ($width x $height)"
                echo "INFO - EXISTS:[$1] ($width x $height)"
        fi
}

if [ $# -eq 0 ]; then
#	genicon Icon1024-appstore.png
	genicon icon-1024imessage.png
	genicon icon-imessage-iPhone@3x.png
	genicon icon-imessage-iPadPro.png
	genicon icon-imessage-iPad.png
	genicon icon-imessage-iPhone@2x.png
	genicon icon-imessage-msg2@2x.png
	genicon icon-imessage-msg2@3x.png
	genicon icon-imessage-msg@2x.png
	genicon icon-imessage-msg@3x.png
	genicon Icon-Small@2x.png
	genicon icon-87.png
        today=$(date +"%Y%m%d")
#        if [[ $1 == *"."* ]]; then
#                backupdest="${1%.*}."$today".${1##*.}"
#        else
#                backupdest=$1"."$today
#        fi
else
        echo $0$': illegal option\nusage: geniconset.sh'
fi
