alias rsync='rsync -avh --info=progress2 '
alias deact='mamba deactivate'
act() {
    mamba activate "$1"
}
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias psa='ps -aux'
function psgrep() {
    ps -aux | grep "$1"
}
alias sigint='kill -INT'
function gsync() {
     git add .
     git commit -a -m "$1"
     git push origin master
 }
 git config --global alias.adog "log --all --decorate --oneline --graph"

alias studio="cd /studio/projects"

