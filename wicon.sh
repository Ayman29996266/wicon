#! /usr/bin/bash

if [ $1 == '-l' ]; then
    echo
    nmcli device wifi rescan
    echo '---------------------------------------------------------------'
    echo 
    nmcli -c no -f IN-USE,SSID,RATE,SIGNAL,SECURITY,BARS device wifi list | grep IN-USE
    echo 
    nmcli -c no -f IN-USE,SSID,RATE,SIGNAL,SECURITY,BARS device wifi list | grep -v IN-USE
    echo
    echo '---------------------------------------------------------------'


elif [ $1 == '-s' ]; then
    echo
    echo '----------------------------------------------------------------------------'
    echo
    iwconfig wlan0
    echo '----------------------------------------------------------------------------'


elif [ $1 == '-d' ]; then
    nmcli device disconnect wlan0


elif [ $1 == '-p' ]; then
    nmcli device wifi show-password


elif [ $1 == '-c' ]; then
    if [ $# == 2 ]; then
        echo
        nmcli device wifi connect $2

    elif [ $# == 3 ]; then
        echo
        nmcli device wifi connect $2 password $3
    fi


elif [ $1 == '-ls' ]; then
    miniserve --hide-theme-selector -F -t Ayman -D -r -g -z -o -U -u -d archlinux -q /home/ayman/Ay-serv/


elif [ $1 == '-ps' ]; then
    miniserve --hide-theme-selector -F -t Ayman -D -r -g -z -o -U -u -d archlinux -q /home/ayman/Ay-serv/  | ssh -R 80:localhost:8080 localhost.run


else
    echo
    echo '---------------------------------------------------------------------------'
    echo
    echo 'Usage: wicon [option]'
    echo '(only one option at a time, other options will be ignored)'
    echo
    echo
    echo 'Options:'
    echo '  -h                     print this message'
    echo '  -l                     list all available networks'
    echo '  -c <SSID> <password>   connect to a network ( enter password for the first connection only )'
    echo '  -d                     disable current network connection'
    echo '  -s                     show current connection info'
    echo '  -p                     show current network password'
    echo
    echo
    echo '  -ls                    make a local server with predefined settings'
    echo '  -ps                    make a public server with predefined settings'
    echo
    echo '---------------------------------------------------------------------------'
    echo '                    Powered with: iwd - networkmanager'
    echo '---------------------------------------------------------------------------'
fi
