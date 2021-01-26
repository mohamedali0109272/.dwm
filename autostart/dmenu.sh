#!/bin/bash

while true; do
    choice=$(echo -e "menu\nfile\ncalc\nBookmarks\nshutdown" |dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "dmenu")
    if [[ $choice == "calc" ]];then
        echo "this is calc" | dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 |xargs -i python -c "print({})"  | dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "results"
    elif [[ $choice == "menu" ]];then
        ls /usr/share/applications/ |sed "s/\.desktop//g"| dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "menu" |xargs -i cat /usr/share/applications/{}.desktop |grep Exec= |head -n1|sed "s/^.*=//" | xargs -i sh -c {}
        break
    elif [[ $choice == "" ]]; then
      break
    elif [[ $choice == "shutdown" ]]; then
      shutdown now
      break
    elif [[ $choice == "Bookmarks" ]]; then
      cat .config/chromium/Default/Bookmarks | grep "\"url\":" | sed "s/\"url\": \"//g" | sed "s/\s//g" |sed "s/\"//g" |dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "chromium"
      break
    elif [[ $choice == "file" ]];then
        while true; do
            file=$(ls -a |dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "$(pwd)"| xargs file |awk -F: '{ print $1 }')
            dir=$(echo $file | xargs file |grep "directory" | awk '{ print $2 }')
            ext=$(echo $file |awk -F. '{print $NF}')
            if [[ $dir == "directory" ]];then
              cd $file
            elif [[ $file == "" ]]; then
              break
            elif [[ $ext == "txt" ]] || [[ $ext == "srt" ]]; then
              vim $file
            elif [[ $ext == "mkv" ]] || [[ $ext == "mp4" ]]; then
              op=$(echo -e "mpv\nrm" |dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "open with" ) 
              sh -c "$op $file"
            else
                op=$(echo -e "vim\nfeh\nmpv\nrm" |dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "open with" ) 
                if [[ $op == "vim" ]]; then
                    st vim $file
                elif [[ $op == "rm" ]]; then
                    rm1="$(pwd)/$file"
                    sh -c "rm $rm1"
                else
                    sh -c "$op $file"
                fi 
            fi
        done
        break
    else
        echo "this file ( $file ) is unknown"
    fi
done
 