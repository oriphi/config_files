#!/bin/bash

# Install Tmux
echo "Copying Tmux Config Files"
cp Tmux/tmux.conf ~/.tmux.conf
cp -r Tmux/tmux ~/.config


# Install Zsh
echo "Copying Zshrc"
cp Zsh/zshrc ~/.zshrc

# Install Nvim

echo "Copying Nvim Config Files"
mkdir -p ~/.config/nvim/
cp Nvim/init.vim ~/.config/nvim/
cp -r Nvim/rplugin ~/.config/nvim/

echo "Installing vimplug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -n "Clone Repos [Y/N]? "
read -r ANSW

if [ $ANSW == "Y" ]
then
	# Git clone repo
	echo -n "Install Path: "
	read -r INSTALL_PATH

	mkdir -p $INSTALL_PATH
	cd $INSTALL_PATH
	git clone https://github.com/tmux/tmux
	git clone https://github.com/zsh-users/zsh
	git clone https://github.com/neovim/neovim
fi

