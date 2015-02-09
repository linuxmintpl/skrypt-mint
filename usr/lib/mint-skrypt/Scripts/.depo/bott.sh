#!/bin/bash

# Eve Installer 0.9.1
#
# Last Update: 19/06/10

TITLE="BS-UBUNTU v0.8.2"

choices=`/usr/bin/zenity --title="Botones" --width=200 --height=150 \
                         --list --column="Selected" --column="Package"\
                         --checklist FALSE "Derecha" FALSE "Izquierda" `

if [ $? -eq 0 ]
then
        IFS="|"
        for choice in $choices
        do
              if [  "$choice" = "Derecha" ];
                   then
                       if [  $? -eq 0  ]
                       then
gconftool -s --type string /apps/metacity/general/button_layout ":minimize,maximize,close";
gconftool -s --type bool /apps/panel/toplevels/panel_0/background/stretch "True";
gconftool -s --type bool /apps/panel/toplevels/top_panel_screen0/background/stretch "True";
gconftool -s --type bool /desktop/gnome/interface/hide_decorator_tooltip "TRUE" ;
                      fi
              
             elif [ "$choice" = "Izquierda" ];
                   then
                       if [  $? -eq 0  ]
                       then                
gconftool -s --type string /apps/metacity/general/button_layout "maximize,minimize,close:";
gconftool -s --type bool /apps/panel/toplevels/panel_0/background/stretch "True";
gconftool -s --type bool /apps/panel/toplevels/top_panel_screen0/background/stretch "True";
gconftool -s --type bool /desktop/gnome/interface/hide_decorator_tooltip "TRUE" ;
                         fi
        done
        IFS=""
else
        echo cancel selected
fi

