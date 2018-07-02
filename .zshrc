# Alias {{{

# All commands are prefixed with space -> do not store in history
alias ..=' cd ..'
alias ...=' cd ...'
alias l=' ls -alh'

# Git
alias gs=" git status"
# quick log
alias gl=" git log --graph"
# previous commit
alias gp=" git log --stat --max-count=1 --format=medium"
# quick diff
alias gd=" git diff"
alias gds=" git diff --staged"

# Ignore from history
alias exit=" exit"

# }}}
# Export {{{

export EDITOR="nvim"
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# }}}
# History {{{

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history
# Save timestamp and duration
setopt extended_history
# Adds commands as they are typed, don't wait until shell exit
setopt inc_append_history
# When trimming history, remove oldest duplicates first
setopt hist_expire_dups_first
# Do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups
# Remove line from history when first character is a space
setopt hist_ignore_space
# When searching history, don't display already cycled results twice
setopt hist_reduce_blanks
# Don't execute, just expand history
setopt hist_verify
# Import new comands and appends typed commands to history
setopt share_history

# }}}
# Completion {{{

autoload -Uz compinit && compinit

# When completing fomr the middle of a word, move the cursor to the end of the
# # word
setopt always_to_end
# Show completion menu on successive tab press (requires unsetop menu_complete)
set auto_menu
# Any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory
setopt auto_name_dirs
# Allow completion from withing a word/phrase
setopt complete_in_word

# Do not autoselect the first completion entry
unsetopt menu_complete

# Enable autocompletion menu
zstyle ':completion:*:*:*:*:*' menu select
# Automatically update PATH entries
zstyle ':completion:*' rehash true
# Keep dirs and files separated
zstyle ':completion:*' list-dirs-first true

# }}}
# Prompt {{{

autoload -U colors && colors

# Enable command substitution in prompt (and parameter expansion, arithmetic expansion)
setopt promptsubst

local ret_status="%(?:%{$fg_bold[green]%}›:%{$fg_bold[red]%}›)"
local dir="%{$fg[cyan]%}%3d"

PROMPT='%{${ret_status}%} %{${dir}%} %{$(gitprompt)%}%{$reset_color%}'

# }}}
# Key bindings {{{

# Use emacs-like key bindings by default
bindkey -e

bindkey '^r' history-incremental-search-backward

# }}}
# Hooks {{{

eval "$(direnv hook zsh)"
eval "$(jump shell)"

# }}}
# FZF {{{

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# }}}
# Functions {{{

go-cover() { 
  t=$(mktemp)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}

go-cover-web() {
  t=$(mktemp)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

# }}}

# vim: set foldmethod=marker :
