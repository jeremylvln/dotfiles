# PATH
if test -d ~/bin
    set -gx PATH ~/bin $PATH
end

if test -d ~/personal/Garden
    set -gx PATH ~/personal/Garden/bin $PATH
end

if test -d /opt/gradle
    set -gx PATH /opt/gradle/bin $PATH
end

if test -d /opt/apache-maven
    set -gx PATH /opt/apache-maven/bin $PATH
end

# set -gx JAVA_HOME /usr/java/jdk1.8.0_201-amd64

# ALIASES
## Root related
alias c "lolcat"
alias cat "c"
alias gp "git push"
alias gpl "git pull"

## Editor related
alias e "emacs -nw"
alias ne "e"
alias vi "nvim"
alias vim "vi"

## Valgrind related
alias va "valgrind"
alias valeak "valgrind --leak-check=full --show-leak-kinds=all"

## Epitech related
alias blih "blih -u jeremy.levilain@epitech.eu"
alias epitechcli "java -jar ~/personal/EpitechCLI/build/libs/EpitechCLI-1.0.0-all.jar"

# THE FUCK INTEGRATION
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end

source config.color.fish
