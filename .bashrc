# visual customization
## important aliases
alias ll='ls -alG'
alias on='source activate'
alias off='source deactivate'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

ssbt() {
    # override sbt command to handle messed up stty
    sbt "$@"
    stty echo
}

scala_project() {
    # create new scala project skeleton
    mkdir -p $1/src/{main,test}/{java,resources,scala}
    mkdir $1/{lib,project,target}

    # create an initial build.sbt file
    echo '
name := "'$1'"
version := "0.1.0"
scalaVersion := "2.12.3"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.1" % "test"' > $1/build.sbt 
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_conda_env() {
  if [ -z "$CONDA_DEFAULT_ENV" ]; then echo ""; else echo " ($CONDA_DEFAULT_ENV)"; fi
}

function code_find() {
  find . -name "*.py" -exec grep -Hin --color=always $1 {} \;
}

export PS1='\[\033[0;36m\]\u$(parse_conda_env)\[\033[0m\] in \[\033[1;31m\]$(pwd)\[\033[0m\]\[\033[0;32m\]$(parse_git_branch)\n\[\033[1;33m\][\$\$] \[\033[0m\]'
