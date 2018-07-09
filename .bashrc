# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH=$PATH:~/bin
export PATH=$PATH:/opt/gradle/bin
export PATH=$PATH:~/Documents/android-studio/bin
export JAVA_HOME=/usr/java/jdk1.8.0_162

alias ne="emacs -nw"
alias vim="nvim"
alias vi="nvim"
alias blih="blih -u jeremy.levilain@epitech.eu"
alias i3config="ne ~/.config/i3/config"
alias polyconf="ne ~/.config/polybar/config"
alias bashrc="ne ~/.bashrc && source ~/.bashrc"
alias discord="~/Documents/Discord/Discord &"
alias sudo="sudo "
alias android="studio.sh &"
alias idea="~/Documents/idea/bin/idea.sh &"
alias pycharm="~/Documents/pycharm/bin/pycharm.sh &"
alias tetris="~/delivery/PSU_tetris_2017/tetris"
alias sfvalgrind="valgrind --suppressions=/home/jlevilain/bin/valgrind_suppressions"
alias mina="pinta &"
alias postman="~/Documents/Postman/Postman &"
alias gp="git push"

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

setxkbmap fr

export LIBRARY_PATH=$LIBRARY_PATH:/home/jlevilain/.graph_programming/lib
export LD_LIBRARY_PATH=$LIBRARY_PATH:/home/jlevilain/.graph_programming/lib
export CPATH=$CPATH:/home/jlevilain/.graph_programming/include
