# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


if [ $(id -u) -eq 0 ]
then
	export PS1="[1;31m\u[m@[1;32m\h[m: \w\n\\$ "
else
	export PS1="\u@[1;32m\h[m: \w\`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'\`\n\\$ "
fi

alias c="clear"
alias l="ls -lah --group-directories-first"
alias t="tmux -2 attach"
alias e="exit"
alias v="vim"
alias jb="ssh jumao@juicebox.restek.wwu.edu"
alias tmux="tmux -2"
