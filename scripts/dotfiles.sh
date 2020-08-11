#!/bin/bash

# Install my dotfiles for vagrant user
echo -e "\e[33m**********\e[39mBegin .dotfiles\e[33m**********\e[39m"
git clone https://github.com/ntalekt/dotfiles.git /home/vagrant/.dotfiles

function link_file() {
  echo "linking ~/.$1"
  ln -sf "/home/vagrant/.dotfiles/.$1" "/home/vagrant/.$1"
}

link_file bash_prompt
link_file bashrc
link_file dircolors
link_file inputrc
link_file vim
link_file vimrc
echo -e "\e[33m**********\e[39mEnd .dotfiles\e[33m**********\e[39m"
