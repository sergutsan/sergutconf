#!/bin/bash

##################################################################
# Configuration I carry around with me.                          #
#                                                                #
# Link it directly with 'ln -S ~/src/sergutconf/bashrc .bashrc'  #
# or indirectly adding this to your .XXXXrc:                     #
#                                                                #
# [ -f ~/src/sergutconf/bashrc ] && . ~/src/sergutconf/bashrc    #
#                                                                #
##################################################################


###################
#    User         #
#    prompt       #
###################

coloured_dollar() {
  [ $EXIT = 0 ] && echo '$' || echo $(red_dollar)
}

current_dir() {
  RESULT=`basename $PWD`
  [ "$RESULT" = "`basename $HOME`" ] && RESULT='~'
  echo $RESULT
}

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_branch_or_current_dir() {
  if [ -z "`git_branch`" ]; then
    RESULT=`current_dir`
  else
    RESULT=`git_branch`
  fi
  echo $RESULT
}

red_dollar() {
    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'


    echo "${Red}\$${RCol}"
}

PROMPT_COMMAND=__prompt_command 

__prompt_command() {
  local EXIT="$?"             # This needs to be first
  PS1="[\u@\h] \$(git_branch_or_current_dir) $(coloured_dollar EXIT) "
}

#####################
#    Environment    #
#    variables      #
#####################

# ...

#################
#    Aliases    #
#################

alias ls='ls -G --color'
