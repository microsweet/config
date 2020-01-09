echo copy config from git resposity to .config
cp -r ./i3/ ~/.config
cp -r ./rofi/ ~/.config
cp -r ./dunst/ ~/.config
cp -r ./picom/ ~/.config
cp -r ./polybar/ ~/.config

cp ~/.config/local-config.ini ~/.config/polybar/

rm -rf ~/.config/nvim
cp -r ./vim/ ~/.config/nvim
ln -s ~/.config/nvim ~/.vim
cp -r ./fish/ ~/.config
cp -r ./ranger/ ~/.config
cp -r ./neofetch/ ~/.config
cp -r ./fontconfig/ ~/.config
cp -r ./zsh/ ~/.config

cp -r ./Scripts/ ~/

cp ../config/zshrc ~/.zshrc
cp ../config/xprofile ~/.xprofile
echo copy complete

echo set local config
cat ~/.config/local-config >> /home/microsweet/.config/i3/config 

#sed -i '/\[bar\/i3mainbar\]/a\monitor\ \=\ \$\{env\:MONITOR\:eDP\}' ~/.config/polybar/config

#sed -i '/width\ \=\ 100\%/a\height\ \=\ 45' ~/.config/polybar/config

#sed -i 's/rightModules/left\ netspeed\ battery\ memory\ cpu\ line\ backlight\ pulseaudio\ headphone/g' ~/.config/polybar/config

#sed -i 's/12\;3/18\;3/g' ~/.config/polybar/config

#sed -i 's/eno1/wlp1s0/g' ~/.config/polybar/modules.ini

echo set local config complete
