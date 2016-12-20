#!/bin/sh
sudo add-apt-repository ppa:numix/ppa
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update

#gtk numix
sudo apt install numix-gtk-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
xfconf-query -c xfwm4 -p /general/theme -s "Numix"

#paper icons
sudo apt-get install paper-icon-theme
xfconf-query -c xsettings -p /Net/IconThemeName -s 'Paper'

#cursor
xfconf-query -c xsettings -p /Net/IconThemeName -s 'Paper'
sudo apt-get install paper-cursor-theme
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s 'Paper'
