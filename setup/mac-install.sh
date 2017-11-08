#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install utilities
brew install wget git zsh zsh-completions wget tmux tmuxinator-completion
sudo gem install tmuxinator
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Configure tmuxinator
mkdir -p ~/.bin ~/bin
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O ~/.bin/tmuxinator.zsh

# Install terminal utilities
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

# Install development utilities
mkdir -p ~/go/{src,pkg,bin}
curl -s https://php-osx.liip.ch/install.sh | bash -s 7.1

# Configure dotfiles
git clone https://github.com/thisiserico/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -sF ~/dotfiles/vim/colors ~/.vim/colors
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/NERDTreeBookmarks ~/.NERDTreeBookmarks
zsh ~/dotfiles/zshrc
vim +PluginInstall +qall
git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
cd tmux-MacOSX-pasteboard && make reattach-to-user-namespace && cp reattach-to-user-namespace ~/bin && cd .. && rm -rf tmux-MacOSX-pasteboard
tmux source ~/.tmux.conf
