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

# tmux
echo -n "Copying tmux settings.."
`ln -s $HOME/dotfiles/tmux $HOME/.tmux`
echo "done"

# tmuxinator
echo -n "Copying tmuxinator settings.."
`ln -s $HOME/dotfiles/tmuxinator $HOME/.tmuxinator`
echo "done"

# i3
echo -n "Copying i3 settings.."
`ln -s $HOME/dotfiles/i3 $HOME/.i3`
echo "done"

declare -a FILES_TO_SYMLINK=(
  'zprezto/runcoms/zlogin'
  'zprezto/runcoms/zlogout'
  'zprezto/runcoms/zpreztorc'
  'zprezto/runcoms/zprofile'
  'zprezto/runcoms/zshenv'
  'zprezto/runcoms/zshrc'
  'fzf.sh'
  'vimrc'
  'tmux/tmux.conf'
  'tmux.conf.local'
  'zsh/functions'
  'zsh/aliases_home.zsh'
  'zsh/aliases_work.zsh'
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
