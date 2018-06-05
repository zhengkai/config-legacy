# export ZSH=$HOME/conf/zsh/oh-my-zsh
#
# plugins=(
# 	git
# )
#
# source $ZSH/oh-my-zsh.sh

source $HOME/conf/zsh/prompt.zsh
source $HOME/conf/zsh/vi.zsh
source $HOME/conf/zsh/export.zsh
source $HOME/conf/zsh/alias.zsh
source $HOME/conf/zsh/timer.zsh

HISTFILE=$HOME/conf/zsh/history.txt
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt inc_append_history

if [ -z "$(declare -f -F j)" ] && [ -f /usr/share/autojump/autojump.zsh ]; then
	. /usr/share/autojump/autojump.zsh
fi

