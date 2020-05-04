#! /usr/bin/env bash

# Path settings
DOTPATH=${DOTPATH:-$HOME/.dotfiles}
BACKUP=${BACKUP:-$HOME/.backup}

# load environment
source $DOTPATH/etc/env.sh

if [ ! -d $BACKUP ]; then
  println "create backup folder..."
  mkdir -p $BACKUP
fi

# create symlink for dotfiles
println "create symlink for dotfiles..."

println "create symlink for zsh..."
if [ -e $HOME/.zshrc ]; then
  cp $HOME/.zshrc $BACKUP/.zshrc.$(date +%Y%m%d)
fi
ln -fs $DOTPATH/zsh/.zshrc $HOME/.zshrc

println "create symlink for git..."
if [ -e $HOME/.gitconfig ]; then
  cp $HOME/.gitconfig $BACKUP/.gitconfig.$(date +%Y%m%d)
fi
ln -fs $DOTPATH/git/.gitconfig $HOME/.gitconfig

