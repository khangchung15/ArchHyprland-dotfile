[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Enable fastfetch on starting terminal and clear screen
fastfetch --kitty-direct /home/kevin/Downloads/fastfetch.png
neoclear() {
    /usr/bin/clear
    fastfetch --kitty-direct /home/kevin/Downloads/fastfetch.png
}
alias clear='neoclear'

bind -x '"\C-l": clear'

eval "$(oh-my-posh init bash --config ~/.poshthemes/my-atomic.omp.json)"

export PATH="$HOME/.local/bin:$PATH"
