# Created by newuser for 5.8

# export LANG=ja_JP.UTF-8
# export LC_ALL='ja_JP.UTF-8'
export SHELL=/bin/zsh
autoload colors
colors

### prompt ######################
function precmd_func() {
    PROMPT="├───>%{${fg[red]}%}%(!.#.$)%{${reset_color}"
#           │   │ └─dbus.service 
#      │   │ │ ├─1658 /usr/lib/at-spi-bus-launcher
    if [ 0 -eq ${#vcs_info_msg_0_} ]; then
        print "├─>${fg[red]}[$USERNAME@$HOST]${fg[cyan]} -->$PWD${reset_color}"
        return
    fi
    print "├─>${fg[red]}[$USERNAME@$HOST]${vcs_info_msg_0_} ${fg[cyan]} -->$PWD${reset_color}"
    # print "┃     You are in ${vcs_info_msg_0_}"
    # PROMPT="┗━━━${vcs_info_msg_0_}, %{${fg[red]}%}%(!.#.$)%{${reset_color}"
}
PROMPT="┗━━━%{${fg[red]}%}%(!.#.$)%{${reset_color}"
#PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{$reset_color}%}"
#RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
#RPROMPT=""
export LS_COLORS

# git設定
autoload -Uz vcs_info
precmd_vcs_info() {
    vcs_info
}
precmd_functions+=(precmd_vcs_info)
autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_func

setopt prompt_subst
#RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "${fg[yellow]}"
#zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' formats "${fg[green]}%c%u[%b]$reset_color"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

### autojump ########################
autoload -U compinit && compinit
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
#setopt correct
setopt list_packed
setopt nolistbeep
alias ls='exa'
# alias la='ls -a'
# alias ll='ls -l'
alias cp='cp -i'
alias -g L='| less'
alias -g G='| grep'
alias pcp='xsel --clipboard --input'
alias pps='xsel --clipboard --output'
alias rcc='riscv64-unknown-elf-gcc'
alias robjdump='riscv64-unknown-elf-objdump'
alias objdump=objdump -M intel
alias vim=nvim

##  zsh setting  #######################
export TERM=xterm-256color
HGENCODING=utf-8
export HGENCODING
setopt auto_pushd
setopt pushd_ignore_dups
setopt complete_aliases
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
zstyle ':completion:*:(processes|jobs)' menu yes select=2
bindkey "\e[Z" reverse-menu-complete
function chpwd() { exa }

export LSCOLORS=gxfxcxdxbxegedabagacad

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=$PATH:/etc/opt/risc-v/bin

# ✔
# かっこいい


#      │   │ │ ├─1658 /usr/lib/at-spi-bus-launcher
#           │   │ │ ├─1664 /usr/bin/dbus-daemon --config-file=/usr/share/defaults/at-spi2/accessibility.conf --nofork --print-address 3
#           │   │ │ └─1671 /usr/lib/at-spi2-registryd --use-gnome-session
#           │   │ ├─apps.slice 
#           │   │ │ └─apps-org.gnome.Terminal.slice 
#           │   │ │   ├─gnome-terminal-server.service 
#           │   │ │   │ └─1666 /usr/lib/gnome-terminal-server
#           │   │ │   └─vte-spawn-b3f4f29c-a2a2-4532-aca3-3593a9d97044.scope 
#           │   │ │     ├─1678 /bin/zsh
#           │   │ │     ├─2226 systemctl status
#           │   │ │     └─2227 less
#           │   │ └─dbus.service 
#           │   │   ├─663 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
#           │   │   ├─714 /usr/lib/dconf-service
#           │   │   ├─729 /usr/lib/kactivitymanagerd
#           │   │   ├─74

