#!/bin/bash

#
# Utils
#

# Get the dotfiles directory's absolute path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

dir=~/dotfiles                        # dotfiles directory
dir_backup=~/dotfiles_old             # old dotfiles backup directory

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to the dotfiles directory
echo -n "Changing to the $dir directory..."
cd $dir
echo "done"

#
# Actual symlink stuff
#

# VIM
echo -n "Copying VIM settings.."
`ln -s $HOME/dotfiles/vim ~/.vim`
echo "done"

# prezto
echo -n "Copying zprezto.."
`ln -s $HOME/dotfiles/zprezto ~/.zprezto`
echo "done"

# bin
echo -n "Copying bin.."
`ln -s $HOME/dotfiles/bin ~/bin`
echo "done"

# fzf
echo -n "Copying fzf.."
`ln -s $HOME/dotfiles/fzf ~/.fzf`
echo "done"

declare -a FILES_TO_SYMLINK=(
  'zprezto/runcoms/zlogin'
  'zprezto/runcoms/zlogout'
  'zprezto/runcoms/zpreztorc'
  'zprezto/runcoms/zprofile'
  'zprezto/runcoms/zshenv'
  'zprezto/runcoms/zshrc'
  'fzf.sh'
  'tmux.conf'
  'vimrc'
  'zsh/functions'
  'zsh/aliases_home.zsh'
  'zsh/aliases_ssh.zsh'
  'git/gitconfig'
  'git/gitignore'
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  local i=''
  local sourceFile=''
  local targetFile=''

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  for i in ${FILES_TO_SYMLINK[@]}; do

    sourceFile="$(pwd)/$i"
    targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

    `ln -fs $sourceFile $targetFile`

  done

  unset FILES_TO_SYMLINK
}

main
#source ~/.zshrc
