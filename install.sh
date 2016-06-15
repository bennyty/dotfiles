#!/bin/bash

inquire ()  {
	echo -n "$1 [y/n]? "
	read answer
	finish="-1"
	while [ "$finish" = '-1' ]
	do
		finish="1"
		if [ "$answer" = '' ];
		then
			answer=""
		else
			case $answer in
				y | Y | yes | YES ) answer="y";;
				n | N | no | NO ) answer="n";;
				*) finish="-1";
					echo -n 'Invalid response -- please reenter:';
					read answer;;
			esac
		fi
	done
}

link () {
	ln -sin $1 $2
}

# link () {
# 	if [ -e $2 ] ; then
# 		inquire "$2 already exists, do you want to overwrite?"
# 		if [ $answer = "y" ];
# 		then
# 			ln -sfn $1 $2
# 		fi
# 	fi
# }

link ~/.dotfiles/.vimrc ~/.vimrc

link ~/.dotfiles/.spacemacs ~/.spacemacs
link ~/.dotfiles/.uniteSettings.vim ~/.uniteSettings.vim
link ~/.dotfiles/.gvimrc ~/.gvimrc
link ~/.dotfiles/.zshrc ~/.zshrc
link ~/.dotfiles/colorschemes/ben.zsh-theme ~/.oh-my-zsh/themes/ben.zsh-theme
# link ~/.dotfiles/.aliases ~/.aliases

link ~/.dotfiles/vim ~/.vim
link ~/.dotfiles/emacs ~/.emacs.d
