# Skloňování
jeden="balíček"
dva_az_ctyri="balíčky"
zbytek="balíčků"

# Funkce na zobrazení skloňování
function noOf () {
case $1 in
    1)
        echo $jeden
    ;;
    [2-4])
        echo $dva_az_ctyri
    ;;
    *)
        echo $zbytek
    ;;
esac
}

# Spočítáme, kolik je v Pacmanu updatů
pacman=$(checkupdates 2>/dev/null | wc -l)

# Spočítáme updaty v AUR (Arch User Repository)
aur=$(yay -Qua | wc -l)


# Otestujeme zda jsou nějaké updaty
if [ $pacman == 0 ]
    then
        pacmanZprava=0
    else
        pacmanZprava=$pacman
    fi
if [ $aur == 0 ]
    then
        aurZprava=0
    else
        aurZprava=$aur
    fi


# Zobrazíme výstup
printf "Pacman: $pacmanZprava | AUR: $aurZprava"
