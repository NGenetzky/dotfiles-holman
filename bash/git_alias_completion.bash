
# src: https://gist.github.com/mwhite/6887990

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
    if [ -f /usr/share/bash-completion/completions/git ] && ! shopt -oq posix; then
        . /usr/share/bash-completion/completions/git
    fi
fi


function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
if [ $(function_exists __git_complete) ]; then
    for al in `__git_aliases`; do
        alias g$al="git $al"

        complete_func=_git_$(__git_aliased_command $al)
        function_exists $complete_fnc && __git_complete g$al $complete_func
    done
fi
