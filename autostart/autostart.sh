#!/bin/bash


#commands
#lxsession &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)
feh --bg-fill ~/.dwm/wall2.jpg
nm-applet &
cd ;albert &
slstatus &
picom -b --config ~/.dwm/autostart/picom.sample.conf
#picom -b --config ~/.dwm/autostart/picom.conf
volumeicon &
blueman-applet &
/usr/lib/xfce4/notifyd/xfce4-notifyd &



function_name () {
  commands
}


clock (){
	dte="$(date +"%d %l:%M%p"| sed 's/  / /g')"
	printf " %s" "$dte                                                                 "
}


cpu(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	icon1="💻"
	printf " %s %s" "$icon1" "$cpu% |"
}

memory(){
	mem="$(free -m | awk 'NR==2{printf "%sM", $3}')"
	icon2=""
	printf " %s %s " "$icon2" "$mem"
}

swap(){
	Swap="$(free -m | awk 'NR==3{printf "%s/%sswap\n", $3,$2,$3*100/$2 }')"
	icon3=""
	printf " %s %s " "$icon3" " $Swap |"
}
battery () {
	sp=$(cat /sys/class/power_supply/BAT0/capacity)
	ap=$(cat /sys/class/power_supply/AC/online)

	if [ "$ap" -eq "1" ]; then
		echo ""
	fi


	if [ "$sp" -ge "99" ]; then
		echo ""
	elif [ "$sp" -ge "75" ]; then
		echo ""
	elif [ "$sp" -ge "50" ]; then
		echo ""
	elif [ "$sp" -ge "25" ]; then
		echo ""
	elif [ "$sp" -ge "1" ]; then
		echo ""
	elif [ "$sp" -eq "0" ]; then
		echo ""
	fi
}


TEMP(){
	TEMP="$(sensors|awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
	icon4="🌡️️"
	printf " %s %s " "$icon4" "$TEMP |"
}

PUBLIC(){
	PUBLIC=$(curl -s https://ipinfo.io/ip)
	printf " %s " "$PUBLIC |"
}

#while a=1;do sleep 0.5;xsetroot -name "$(clock)$(cpu)$(memory)$(TEMP)$(battery)";done

#echo "$(clock)$(cpu)$(memory)$(swap)$(TEMP)$(battery)$(ping -c1 1.1.1.1 | awk -F= 'NR==2{printf $4 }')"

#while a=1;do echo "$(clock)$(cpu)$(memory)$(swap)$(TEMP)$(ping)";done


