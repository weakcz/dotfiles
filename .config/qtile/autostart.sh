#!/usr/bin/env bash 
xsetroot -cursor_name left_ptr &

# Nastavíme českou klávesnici
setxkbmap cz &

# Spustíme kompozitor (umožňuje grafické efekty jako je průhlednost, stíny a tak dále)
picom &

# Polkit (abysme mohli zadávat hesla)
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Pozadí plochy
nitrogen --restore &

# Program na automatické připojování disků
udiskie &

# Zobrazování notifikací
dunst &

# tray ikony
killall pamac-tray &
pamac-tray &
nm-applet &
blueman-applet &
parcellite -n &

# monero miner
# killall xmr-stak-rx
# /home/weak/xmr-stak-rx --noTest