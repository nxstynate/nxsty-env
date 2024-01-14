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
# if [ -d "$HOME/bin" ]; then
# PATH="$HOME/bin:$PATH"
# fi
# fish directions from error:
if [ -d "$HOME/bin" ]; then
	'set PATH"$HOME/bin:$PATH"'
fi

# set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ]; then
# 	PATH="$HOME/.local/bin:$PATH"
# fi
# eval "$(/bin/brew shellenv)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/stelbent-compact.minimal.omp.json)"

eval "$(oh-my-posh init bash --config ~/.poshthemes/stelbent-compact.minimal.omp.json)"

# Terminal icons
alias ls='logo-ls'
alias ll='logo-ls -al'

# Autocompletion bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

# Fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias ctrl-f='fzf'

# Set Ctrl+F as a shortcut to start fzf
if [[ ! $FZF_CTRL_T_COMMAND ]]; then
	export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git --exclude node_modules --exclude .cache'
fi
bind -x '"\C-f": "$(which fzf) $(eval $FZF_CTRL_T_COMMAND)"'

# Start tmux automatically
if command -v tmux >/dev/null; then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Start Fish shell
if command -v fish >/dev/null; then
	exec fish
fi
. "$HOME/.cargo/env"
