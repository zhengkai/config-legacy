bindkey -v

bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^/' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init {
    zle reset-prompt
}

function zle-keymap-select {
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
