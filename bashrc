#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000

PYTHONPATH=.
export PYTHONIOENCODING='utf_8'
export PATH="~/scripts:$PATH"
export PAGER="less"
export EDITOR="vim"

export TODOTXT_DEFAULT_ACTION='ls'

#PROMPT="[%n@%m %B%F{green}%*%f%b %~] 
# %(!.#.$) "
PS1="[\u@\h \[\033[01;32m\]\D{%H:%M:%S}\[\033[00m\] \w]\n $ "
alias gdb="gdb -q"
alias bc="bc -ql"
alias x="setsid startx; exit"
#alias xron="xrandr --output VGA --auto"
#alias xroff="xrandr --output VGA --off"
alias ls="ls --color"
alias ll="ls -al"
#alias grep="grep --color=auto"
alias psg="ps ax | grep"
alias ps="ps -ejH --forest"
alias xln="ssh lend"

alias um="udiskie-umount"
alias t="devtodo"
alias y="wyrd"
alias scpresume="rsync --partial --progress --rsh=ssh"
alias wanip="curl ifconfig.me"

alias crl="crontab -l" 
alias cre="crontab -e"

## project shorcuts
alias cheese="echo use guvcview"
#alias alsi="cd /home/cra/projects/misis/AlSi"
alias alc="cd /home/cra/projects/allods_client/trunk/client"

alias shut="sudo shutdown -h now; exit"
alias sus="sudo acpitool -s"
alias susl="sudo acpitool -s && slock"
alias lockx="slock"
#alias jtux="jack_connect \"TuxGuitar:Output Port 0\" system:playback_1 && jack_connect \"TuxGuitar:Output Port 0\" system:playback_2"
#alias jchdr="jack_connect Hydrogen-1:out_L system:playback_1 && jack_connect Hydrogen-1:out_R system:playback_2"
alias acnct="aconnect 20:0 128:0"
alias jcnct="jack_connect fluidsynth:r_00 system:playback_1 && jack_connect fluidsynth:l_00 system:playback_2"
alias jklk="jack_connect klick:out system:playback_1 && jack_connect klick:out system:playback_2"
alias 7za-ultra="7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"
alias 7za-store-sfx="7za a -t7z -m0=lzma -mx=0 -mfb=64 -md=32m -ms=on -sfx"

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

function st() {
  echo "******SVN******"
  svn status
  echo "******GIT******"
  git st
}
