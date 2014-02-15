#bash
export EDITOR=vim
alias rm=trash-put
set -o vi
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
HISTCONTROL=ignoreboth
shopt -s checkwinsize
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

MY_GIT_AUTHOR_EMAIL="stephen@stephendaves.com"
MY_GIT_AUTHOR_NAME="Stephen Daves"

set_default_git_user() {
    export GIT_AUTHOR_NAME=$MY_GIT_AUTHOR_NAME
    export GIT_AUTHOR_EMAIL=$MY_GIT_AUTHOR_EMAIL
}

set_default_git_user

#set git email based on remote path
function cd()
{
    builtin cd $@
    BRANCH=`git branch 2>/dev/null`
    if [ "$?" == "0" ]; then
        set_default_git_user

        SERVER='p''l''a''n''s''w''i''f''t'
        if [[ `git remote -v` =~ $SERVER ]]; then
            export GIT_AUTHOR_EMAIL="stephen@"$SERVER".com"
        fi

        SERVER='o''t''h''e''r''s''e''r''v''e''r'
        if [[ `git remote -v` =~ $SERVER ]]; then
            export GIT_AUTHOR_EMAIL="stephen@"$SERVER".com"
        fi

    fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
