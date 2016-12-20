#!/bin/sh
deploy_theme() {
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
}

deploy_font() {
    sudo apt install python-pip eog &&
    mkdir -p $HOME/roboto-src &&
    cd $HOME/roboto-src &&
    git clone https://github.com/google/roboto.git &&
    cd roboto &&
    pip install -r requirements.txt &&
    make &&
    mkdir $HOME/.fonts

    cp $HOME/roboto-src/roboto/out/RobotoOTF/* $HOME/.fonts &&
    xfconf-query -c xsettings -p /Gtk/FontName -s 'Roboto 11'
}

deploy_theme

#optional
#deploy_font
