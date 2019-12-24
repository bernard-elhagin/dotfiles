# Start local kafka
alias kafkarun='sudo kafka-server-start.sh /opt/kafka/config/server.properties'
alias zoorun='sudo zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties'

# Package manager aliases
alias pacman='pacman --color=always'
alias pss='pacman -Ss'
alias pS='sudo pacman -S'
alias yss='yay -Ss'
alias ys='yay -S'
alias pfiles='pacman -Fl'

alias gs='git status'
alias gc='git commit'
alias gaa='git add --all'
alias gpgm='git push github master'

alias mci='mvn clean install'

alias r='ranger'

alias zd='z dot'

alias tx='tmuxinator start'

if (command -v exa >/dev/null); then
    alias ll='exa   -l --header --time-style=long-iso --group-directories-first'
    alias lll='exa -al --header --time-style=long-iso --group-directories-first'
fi
