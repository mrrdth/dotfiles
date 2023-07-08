# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

 # If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

 # Path to your oh-my-zsh installation.
 export ZSH=$HOME/.oh-my-zsh

 # Custom scripts
 export PATH=$HOME/scripts:$PATH

 # Set name of the theme to load --- if set to "random", it will
 # load a random theme each time oh-my-zsh is loaded, in which case,
 # to know which specific one was loaded, run: echo $RANDOM_THEME
 # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
 ZSH_THEME="powerlevel10k/powerlevel10k"

 # Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"`

 # Uncomment the following line if you want to disable marking untracked files
 # under VCS as dirty. This makes repository status check for large repositories
 # much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

 # Which plugins would you like to load?
 # Standard plugins can be found in ~/.oh-my-zsh/plugins/*
 # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
 # Example format: plugins=(rails git textmate ruby lighthouse)
 # Add wisely, as too many plugins slow down shell startup.
 plugins=(
   git
 )

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias ssh-tmux="~/bin/ssh-tmux"
alias tmuxconf="vim ~/.tmux.conf"

export TERM=xterm-256color

__git_files () {
  _wanted files expl 'local files' _files
}

# Legacy
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Enables zfz
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /etc/bash_completion.d/hgd
export PATH="${PATH}:${HOME}/bin"

fixup_ssh_auth_sock() {
  if [[ -n ${SSH_AUTH_SOCK} && ! -e ${SSH_AUTH_SOCK} ]]
  then
    local new_sock=$(echo /tmp/ssh-*/agent.*(=UNom[1]))
     if [[ -n ${new_sock} ]]
     then
       export SSH_AUTH_SOCK=${new_sock}
     fi
  fi
}
if [[ -n ${SSH_AUTH_SOCK} ]]
then
  autoload -U add-zsh-hook
  add-zsh-hook preexec fixup_ssh_auth_sock
fi
