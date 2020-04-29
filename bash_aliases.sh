#Check status of website without 'getting' content
alias hstat='curl –o /dev/null –silent –head –write-out '\''%{http_code}\n'\'''

#Random string for random things
alias random='< /dev/urandom tr -dc "_A-Z-a-z-0-9\!\%\#\&\+\=\$" | head -c${1:-15};echo;'

alias untar='tar -axvf'

#List by columns with classifier
alias l='ls -CF'

#List all except . and .. dirs
alias la='ls -A'

#List EVERYTHING, really
alias ll='ls -alF'

#Default
alias ls='ls --color=auto'

#Saner defaults for windows volume
alias mountwin='mount -o ro,loop,show_sys_files,streams_interface=windows'

#Add this to your .bashrc, it is not an alias

#Keep a large history and add a time stamp to the log
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%Y-%m-%d %T "
## Colors?  Used for the prompt.
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

PROMPT_COMMAND=smile_prompt

function smile_prompt
{
if [ "$?" -eq "0" ]
then
#smiley
SC="${GREEN}:)"
else
#frowney
SC="${RED}:("
fi
if [ $UID -eq 0 ]
then
#root user color
UC="${RED}"
else
#normal user color
UC="${BWHITE}"
fi
#hostname color
HC="${BYELLOW}"
#regular color
RC="${BWHITE}"
#default color
DF='\[\e[0m\]'
PS1="[${UC}\u${RC}@${HC}\h ${RC}\W${DF}] ${SC}${DF} "
}

#Poor mans CSV output
csv() {
        column -s, -t < $1 | less -#2 -N -S
}
