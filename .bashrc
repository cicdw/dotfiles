## important aliases
alias ll='ls -alG'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
 }

parse_conda_env() {
    if [ -z "$CONDA_DEFAULT_ENV" ]; then echo ""; else echo " ($CONDA_DEFAULT_ENV)"; fi
}

function code_find() {
            find . -name "*.py" -exec grep -Hin --color=always $1 {} \;
}

export PS1='\e[0;36m\u$(parse_conda_env)\e[m in \[\e[1;31m\]$(pwd)\[\e[0m\]\e[0;32m$(parse_git_branch)\e[m\n\e[1;33m[\$\$]\e[m '
