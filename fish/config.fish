set -x LANG en_US.UTF-8

if test -d ~/.cargo
    set -gx PATH ~/.cargo/bin $PATH
end

# ALIASES
## Root related
alias c "cat"
alias gp "git push"
alias gpl "git pull"
alias gca "git add -A"
alias gcam "git commit -am"
alias grc "git rebase --continue"
alias garc "git add -A && git rebase --continue"

## Editor related
alias e "emacs -nw"
alias ne "e"
alias vi "nvim"
alias vim "vi"

direnv hook fish | source

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent

set -gx NODE_OPTIONS --max_old_space_size=4096 $NODE_OPTIONS

starship init fish | source

if [ uname = "Darwin" ]
    set -x EDITOR "code --wait"

    if test -d ~/bin
        set -gx PATH ~/bin $PATH
    end

    if test -d ~/Library/Python/3.7
        set -gx PATH ~/Library/Python/3.7/bin $PATH
    end

    if test -d ~/Documents/flutter
        set -gx PATH ~/Documents/flutter/bin $PATH
    end

    alias j8 "set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8.0_241); set -gx PATH (/usr/libexec/java_home -v 1.8.0_241)/bin $PATH"

    set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/binutils/bin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths
    set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
    set -gx CXXFLAGS "-I/usr/local/opt/openssl@1.1/include"
end
