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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
if [ -f $HOME/.aliases/personal ]; then
    source $HOME/.aliases/personal 
fi

# Kube aliases
if [ -f $HOME/.aliases/kube ]; then
    source $HOME/.aliases/kube  
fi

# source <(kubectl completion bash | sed 's/kubectl/k/g')

# Fast Context switching command
if [ -f $HOME/.aliases/kontext_switching ]; then
    source $HOME/.aliases/kontext_switching  
fi

# Recommendation aliases
if [ -f $HOME/.aliases/recommendations ]; then
    source $HOME/.aliases/recommendations  
fi

# Terraform
if [ -f $HOME/.aliases/terraform ]; then
    source $HOME/.aliases/terraform  
fi



# Add flags to make homebrew packages visible
export CFLAGS="-I/opt/homebrew/include -L/opt/homebrew/lib/" 

# EVALS
eval "$(jump shell)"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oleksandr.lytvyn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oleksandr.lytvyn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oleksandr.lytvyn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oleksandr.lytvyn/google-cloud-sdk/completion.zsh.inc'; fi

# loomi-agentic-api specific setup
# Add uv to your PATH
export PATH="${PATH}:${HOME}/.local/bin"

# Set up Google Cloud credentials for private package access
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"

# Configure uv for private registry access
export UV_KEYRING_PROVIDER="subprocess"
export UV_INDEX_PRIVATE_REGISTRY_USERNAME="oauth2accesstoken"

# Add GOPATH/bin to PATH
export PATH="$PATH:$(go env GOPATH)/bin"   


# Claude-Code Settings
export ANTHROPIC_BASE_URL=https://api.tools.bloomreach.ai  # This does not change
export ANTHROPIC_AUTH_TOKEN=<YOUR_ANTHROPIC_AUTH_TOKEN_HERE>
export LITELLM_API_KEY=<YOUR_LITELLM_API_KEY_HERE>
export PATH="$HOME/.local/bin:$PATH"
