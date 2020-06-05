#----------------------------------------Oh My Zsh---------------------------------------#
export ZSH="./.oh-my-zsh"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh



#-----------------------------------------Aliases----------------------------------------#
alias v='nvim'



#-----------------------------------------Prompt-----------------------------------------#
autoload -Uz vcs_info
autoload -U colors && colors
autoload -Uz compinit && compinit

precmd() { vcs_info } # calls vcs_info before each prompt

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f"
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f"
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:git*:*' formats '[%b%m%c%u] ' # default ' (%s)-[%b]%c%u-'
zstyle ':vcs_info:git*:*' actionformats '[%b|%a%m%c%u] ' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

setopt PROMPT_SUBST

local SUFFIX=$(printf '%%F{white}\u276f%.0s%%f')

export PROMPT="%F{blue}%c%f%B | %F{red}j%f%F{208}e%f%F{yellow}f%f%F{green}f%f%F{cyan}r%f%F{blue}e%f%F{67}y%f $(printf '%%F{grey}\u276f%.0s%%f')%b "
export RPROMPT="\${vcs_info_msg_0_}%F{blue}%~%f"
export ZLE_RPROMPT_INDENT=0


#-------------------------------------Base 16 Shell--------------------------------------#
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "PROMPT" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
