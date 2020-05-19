echo copy config from git resposity to .config
cp -r ./i3/ $HOME/.config
cp -r ./rofi/ $HOME/.config
cp -r ./dunst/ $HOME/.config
cp -r ./picom/ $HOME/.config
cp -r ./polybar/ $HOME/.config
cp -r ./alacritty/ $HOME/.config
cp -r ./mpd/ $HOME/.config
if [ ! -d "/$HOME/.config/mpd/playlists" ]; then
	mkdir $HOME/.config/mpd/playlists
fi

cp $HOME/.config/local-config.ini $HOME/.config/polybar/

rm -rf $HOME/.config/nvim
if [ ! -d "/$HOME/.config/vim-plugin/" ]; then
	mkdir $HOME/.config/vim-plugin
else
	echo '文件夹已存在'
fi
cp -r ./vim/ $HOME/.config/nvim
ln -s $HOME/.config/vim-plugin $HOME/.config/nvim/plugged
rm -f $HOME/.vim
ln -s $HOME/.config/nvim $HOME/.vim
cp -r ./fish/ $HOME/.config
cp -r ./ranger/ $HOME/.config
cp -r ./neofetch/ $HOME/.config
cp -r ./fontconfig/ $HOME/.config
cp -r ./zsh/ $HOME/.config
#win字体文件，自行创建符号链接到/usr/share/fonts/
#cp -r ./winfont/ $HOME/.config

cp -r ./Scripts/ $HOME/.Scripts

cp ../config/zshrc $HOME/.zshrc
#cp ../config/p10k.zsh $HOME/.p10k.zsh
cp ../config/xprofile $HOME/.xprofile
echo copy complete

echo set local config
cat $HOME/.config/local-config >> $HOME/.config/i3/config 

#sed -i '/\[bar\/i3mainbar\]/a\monitor\ \=\ \$\{env\:MONITOR\:eDP\}' ~/.config/polybar/config

#sed -i '/width\ \=\ 100\%/a\height\ \=\ 45' ~/.config/polybar/config

#sed -i 's/rightModules/left\ netspeed\ battery\ memory\ cpu\ line\ backlight\ pulseaudio\ headphone/g' ~/.config/polybar/config

#sed -i 's/12\;3/18\;3/g' ~/.config/polybar/config

#sed -i 's/eno1/wlp1s0/g' ~/.config/polybar/modules.ini

echo set local config complete
