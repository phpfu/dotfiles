# Load rbenv
eval "$(rbenv init -)"

# Set language
export LANG=en_US.UTF-8

# Set editor
export EDITOR='vim'

# Set bin
export PATH="$HOME/.bin:$PATH"

# Load zgen
source "${HOME}/.zgen/zgen.zsh"

# Check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # Git
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitfast

    # Node
    zgen oh-my-zsh plugins/bower
    zgen oh-my-zsh plugins/coffee
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/npm
    zgen load clauswitt/zsh-grunt-plugin

    # PHP
    zgen oh-my-zsh plugins/composer
    zgen oh-my-zsh plugins/cakephp3
    zgen load shengyou/robo-zsh-plugin

    # Python
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/virtualenv

    # Miscellaneous
    zgen oh-my-zsh plugins/colored-man
    zgen oh-my-zsh plugins/colorize
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/emoji-clock
    zgen oh-my-zsh plugins/emoji
    zgen oh-my-zsh plugins/encode64
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/gnu-utils
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/vagrant
    zgen oh-my-zsh plugins/wd
    zgen oh-my-zsh plugins/zsh_reload

    zgen load ascii-soup/zsh-url-highlighter
    zgen load b4b4r07/enhancd
    zgen load djui/alias-tips
    zgen load horosgrisa/autoenv
    zgen load horosgrisa/mysql-colorize
    zgen load skx/sysadmin-util
    zgen load rimraf/k
    zgen load voronkovich/mysql.plugin.zsh
    zgen load willghatch/zsh-snippets
    zgen load zsh-users/zsh-syntax-highlighting

    # OS-specific
    if [[ $CURRENT_OS == 'OS X' ]]; then
        zgen oh-my-zsh plugins/brew
        zgen oh-my-zsh plugins/brew-cask
        zgen oh-my-zsh plugins/gem
        zgen oh-my-zsh plugins/osx
    elif [[ $CURRENT_OS == 'Linux' ]]; then

        if [[ $DISTRO == 'CentOS' ]]; then
            zgen oh-my-zsh plugins/centos
        fi
    elif [[ $CURRENT_OS == 'Cygwin' ]]; then
        zgen oh-my-zsh plugins/cygwin
    fi

    # Completions and auto-suggestions
    zgen load zsh-users/zsh-completions src
    zgen load tarruda/zsh-autosuggestions

    # Theme
    if [ "$SSH_CONNECTION" ]; then
        zgen load mafredri/zsh-async
        zgen load sindresorhus/pure
    else
        zgen load arialdomartini/oh-my-git
        zgen load arialdomartini/oh-my-git-themes oppa-lana-style
    fi

    # save all to init script
    zgen save
fi

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# Icons for the oh-my-git prompt using custom patched font
#                            
#                            
#                            
omg_is_a_git_repo_symbol=''
omg_has_untracked_files_symbol=''
omg_has_adds_symbol=''
omg_has_deletions_symbol=''
omg_has_cached_deletions_symbol=''
omg_has_modifications_symbol=''
omg_has_cached_modifications_symbol=''
omg_ready_to_commit_symbol=''
omg_is_on_a_tag_symbol=''
omg_needs_to_merge_symbol=''
omg_detached_symbol=''
omg_can_fast_forward_symbol=''
omg_has_diverged_symbol=''
omg_not_tracked_branch_symbol=''
omg_rebase_tracking_branch_symbol=''
omg_merge_tracking_branch_symbol=''
omg_should_push_symbol=''
omg_has_stashes_symbol=''
omg_has_action_in_progress_symbol=''
# Alter theme's prompt when not in a git repo
omg_ungit_prompt='%~\n> ' 

# History settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Load supplementary aliases/functions/scripts
for config in "$HOME"/.zshrc.d/* ; do
    source "$config"
done

# Load custom aliases/functions/scripts
if [ -d "$HOME"/.dotfiles.local/zshrc.d ]; then
    for config in "$HOME"/.dotfiles.local/zshrc.d/* ; do
        source "$config"
    done
fi

# Local config
[[ -f ~/.dotfiles.local/zshrc ]] && source ~/.dotfiles.local/zshrc

# Cleanup
unset -v config