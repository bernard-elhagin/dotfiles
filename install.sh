#!/bin/bash

#
# Utils
#

# Change to the dotfiles directory
cd $HOME/dotfiles

#
# Actual symlink stuff
#

# VIM
echo -n "Copying VIM settings.."
`ln -s $HOME/dotfiles/vim $HOME/.vim`
echo "done"

# prezto
echo -n "Copying zprezto.."
`ln -s $HOME/dotfiles/zprezto $HOME/.zprezto`
echo "done"

# bin
echo -n "Copying bin.."
`ln -s $HOME/dotfiles/bin $HOME/bin`
echo "done"

# fzf
echo -n "Copying fzf.."
`ln -s $HOME/dotfiles/fzf $HOME/.fzf`
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
#source $HOME/.zshrc
