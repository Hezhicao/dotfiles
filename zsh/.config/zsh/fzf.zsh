# fzf-tab
zstyle ':fzf-tab:complete:*' fzf-bindings 'tab:accept' 'ctrl-n:toggle+down' 'ctrl-p:toggle+up' 'ctrl-l:toggle'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always --icons $realpath'
zstyle ':completion:*' format '[%d]'
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' switch-group 'alt-,' 'alt-.'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:git-checkout:*' sort false

fzf-choose-dirs-widget() {
    local selected_dir
    selected_dir="$(dirs -lv | fzf --height 40% --select-1 | cut -f 2)"
    cd "$selected_dir"
    zle push-line # Clear buffer. Auto-restored on next prompt.
    BUFFER="cd ${(q)selected_dir}"
    zle accept-line
    local ret=$?
    zle reset-prompt
    return $ret
}
