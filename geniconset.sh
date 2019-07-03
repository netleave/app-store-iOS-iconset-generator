#!/bin/bash

copySRC () {
        if [ ! -f $1 ]; then
		echo "Sorry! Source file [$1] not found."
		exit 1
	fi
	cp $1 $2
}

createicon () {
	copySRC Icon1024-appstore.png $1
	sips -z $2 $3 $1 &> /dev/null
}

genicon () {
        if [ ! -f $1 ] && [ ! -d $1 ]; then
		case "$1" in
		        Icon1024-appstore.png)
				createicon $1 1024 1024
		            ;;
		        icon_16x16.png)
				createicon $1 16 16
		            ;;
			icon_16x16@2x.png)
				createicon $1 32 32
		            ;;
			icon_32x32.png)
				createicon $1 32 32
		            ;;
			icon_32x32@2x.png)
				createicon $1 64 64
		            ;;
			icon_128x128.png)
				createicon $1 128 128
		            ;;
			icon_128x128@2x.png)
				createicon $1 256 256
		            ;;
			icon_256x256.png)
				createicon $1 256 256
		            ;;
			icon_256x256@2x.png)
				createicon $1 512 512
		            ;;
			icon_512x512.png)
				createicon $1 512 512
		            ;;
			iPhoneIcon@3x.png)
				createicon $1 180 180
		            ;;
			iPhoneIcon@2x.png)
				createicon $1 120 120
		            ;;
			iPadProIcon@2x.png)
				createicon $1 167 167
		            ;;
			iPadMiniIcon@2x.png)
				createicon $1 152 152
		            ;;
			iPhoneSpotlightIcon@3x.png)
				createicon $1 120 120
		            ;;
			iPhoneSpotlightIcon@2x.png)
				createicon $1 80 80
		            ;;
			iPadSpotlightIcon@2x.png)
				createicon $1 80 80
		            ;;
			iPhoneSettingIcon@3x.png)
				createicon $1 87 87
		            ;;
			iPhoneSettingIcon@2x.png)
				createicon $1 58 58
		            ;;
			iPadSettingIcon@2x.png)
				createicon $1 58 58
		            ;;
			iPhoneNotificationIcon@3x.png)
				createicon $1 60 60
		            ;;
			iPhoneNotificationIcon@2x.png)
				createicon $1 40 40
		            ;;
			iPadNotificationIcon@2x.png)
				createicon $1 40 40
		            ;;
		        *)
		            echo "Sorry! No portfolio found. [$1]"
		            exit 1
	         esac

#                echo "$0: GENERATE:[$1]"
                echo "INFO - GENERATE:[$1]"
#                echo "$0: $1 NOT exists"
#                exit 1
        else
		height=`sips --getProperty pixelHeight $1 | sed -E "s/.*pixelHeight: ([0-9]+)/\1/g" | tail -1`
		width=`sips --getProperty pixelWidth $1 | sed -E "s/.*pixelWidth: ([0-9]+)/\1/g" | tail -1`

#                echo "$0: EXISTS:[$1] ($width x $height)"
                echo "INFO - EXISTS:[$1] ($width x $height)"
        fi
}

if [ $# -eq 0 ]; then
#	genicon Icon1024-appstore.png
	genicon icon_16x16.png
	genicon icon_16x16@2x.png
	genicon icon_32x32.png
	genicon icon_32x32@2x.png
	genicon icon_128x128.png
	genicon icon_128x128@2x.png
	genicon icon_256x256.png
	genicon icon_256x256@2x.png
	genicon icon_512x512.png
	genicon iPhoneIcon@3x.png
	genicon iPhoneIcon@2x.png
	genicon iPadProIcon@2x.png
	genicon iPadMiniIcon@2x.png
	genicon iPhoneSpotlightIcon@3x.png
	genicon iPhoneSpotlightIcon@2x.png
	genicon iPadSpotlightIcon@2x.png
	genicon iPhoneSettingIcon@3x.png
	genicon iPhoneSettingIcon@2x.png
	genicon iPadSettingIcon@2x.png
	genicon iPhoneNotificationIcon@3x.png
	genicon iPhoneNotificationIcon@2x.png
	genicon iPadNotificationIcon@2x.png

        today=$(date +"%Y%m%d")
#        if [[ $1 == *"."* ]]; then
#                backupdest="${1%.*}."$today".${1##*.}"
#        else
#                backupdest=$1"."$today
#        fi
else
        echo $0$': illegal option\nusage: geniconset.sh'
fi
