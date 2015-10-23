#!/bin/sh
#Check if our script is running, if not start..
case "$(pidof -x RPi_Start.py | wc -w)" in

0)  echo "Restarting...        $(date)" >> /home/pi/Desktop/sensorlog.txt
    sudo /home/pi/RPi_Start/RPi_Start.py &
    ;;
1)  echo "OK...                $(date)"
    ;;
*)  echo "Remove Duplicate...  $(date)" >> /home/pi/Desktop/sensorlog.txt
    sudo kill $(pidof -x RPi_Start.py | awk '{print $1}')
    ;;
esac
