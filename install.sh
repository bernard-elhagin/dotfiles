#!/bin/bash

#
# Utils
#

# Change to the dotfiles directory
cd "$HOME/dotfiles" || exit

#
# Actual symlink stuff
#

# VIM
echo -n "Copying VIM settings.."
if [[ -d $HOME/.vim ]]; then
    echo "$HOME/.vim already exists...skipping."
else
    ln -s "$HOME/dotfiles/vim" "$HOME/.vim"
    echo "done."
fi

# prezto
echo -n "Copying zprezto.."
if [[ -d $HOME/.zprezto ]]; then
    echo "$HOME/.zprezto already exists...skipping."
else
    ln -s "$HOME/dotfiles/zprezto" "$HOME/.zprezto"
    echo "done."
fi

# bin
echo -n "Copying bin.."
if [[ -d $HOME/bin ]]; then
    echo "$HOME/bin already exists...skipping."
else
    ln -s "$HOME/dotfiles/bin" "$HOME/bin"
    echo "done."
fi

# fzf
echo -n "Copying fzf.."
if [[ -d $HOME/.fzf ]]; then
    echo "$HOME/.fzf already exists...skipping."
else
    ln -s "$HOME/dotfiles/fzf" "$HOME/.fzf"
    echo "done."
fi

# tmux
echo -n "Copying tmux settings.."
if [[ -d $HOME/.tmux ]]; then
    echo "$HOME/.tmux already exists...skipping."
else
    ln -s "$HOME/dotfiles/tmux" "$HOME/.tmux"
    echo "done."
fi

# tmuxinator
echo -n "Copying tmuxinator settings.."
if [[ -d $HOME/.tmuxinator ]]; then
    echo "$HOME/.tmuxinator already exists...skipping."
else
    ln -s "$HOME/dotfiles/tmuxinator" "$HOME/.tmuxinator"
    echo "done."
fi

# i3
echo -n "Copying i3 settings.."
if [[ -d $HOME/.i3 ]]; then
    echo "$HOME/.i3 already exists...skipping."
else
    ln -s "$HOME/dotfiles/i3" "$HOME/.i3"
    echo "done."
fi

# fonts
echo -n "Copying fonts.."
if [[ -d $HOME/.local/share/fonts ]]; then
    echo "$HOME/.local/share/fonts already exists...skipping."
else
    ln -s "$HOME/dotfiles/fonts" "$HOME/.local/share/fonts"
    echo "done."
fi

declare -a FILES_TO_SYMLINK=(
  'zprezto/runcoms/zlogin'
  'zprezto/runcoms/zlogout'
  'zprezto/runcoms/zpreztorc'
  'zprezto/runcoms/zprofile'
  'zprezto/runcoms/zshenv'
  'zprezto/runcoms/zshrc'
  'p10k.zsh'
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

  for i in "${FILES_TO_SYMLINK[@]}"; do

    sourceFile="$(pwd)/$i"
    targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

    ln -fs "$sourceFile" "$targetFile"

  done

  unset FILES_TO_SYMLINK
}

main
#source $HOME/.zshrc
