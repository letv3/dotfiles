# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# plugins=(ssh-agent)
# zstyle :omz:plugins:ssh-agent agent-forwarding yes
# zstyle :omz:plugins:ssh-agent identities ~/.ssh/github_keypair

[ -n "$SSH_AUTH_SOCK" ] || eval "$(ssh-agent)"
# ssh-add ~/.ssh/github_keypair


alias python=/usr/local/bin
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ollytvyn/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ollytvyn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ollytvyn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ollytvyn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(jump shell)"
