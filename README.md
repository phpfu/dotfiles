# Dotfiles

## Requirements

* [pip](https://pip.pypa.io/en/stable/installing/)
* [rbenv](https://github.com/sstephenson/rbenv#homebrew-on-mac-os-x)
* [rcm](https://github.com/thoughtbot/rcm#installation)
* [tmux](https://tmux.github.io/)
* [zgen](https://github.com/tarjoilija/zgen)
* [zsh](http://www.zsh.org/)

On Ubuntu:

```
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get -y install python-pip rbenv rcm tmux zsh
git clone https://github.com//zgen.git $HOME/.zgen
chsh -s $(which zsh)
git clone git@github.com:jadb/dotfiles $HOME/.dotfiles && cd $_
```

On MacOS:

```
sudo easy_install pip // or `brew install python`
brew tap thoughtbot/formulae
brew install rcm tmux rbenv
git clone https://github.com//zgen.git $HOME/.zgen
chsh -s $(which zsh)
git clone git@github.com:jadb/dotfiles $HOME/.dotfiles && cd $_
```

## Install & Update

To install, run:

```
env RCRC=$HOME/.dotfiles/rcrc rcup
```

This command will create symlinks for config files in your home directory. Setting the RCRC environment 
variable tells rcup to use standard configuration options:

* Exclude the `README.md` and `LICENSE` files, which are part of the dotfiles repository but do not need 
to be symlinked in. 
* Give precedence to personal overrides which by default are placed in ~/.dotfiles.local

You can safely run rcup multiple times to update:

```
rcup
```

You will also want to install a [patched font](https://github.com/arialdomartini/oh-my-git#the-font)
if you choose to use the default theme provided.

## Customizations

To not clutter your `$HOME` directory, all customizations should go in `$HOME/.dotfiles.local`:

* `gitconfig`
* `tmux.conf`
* `zshrc`

For example, your `~/.dotfiles.local/gitconfig` might look like this:

```
[user]
	name = Jad Bitar
	email = jadbitar@mac.com
[github]
	user = jadb
[ghi]
	token = !security find-internet-password -a jadb  -s github.com -l 'ghi token' -w
```

and your `~/.dotfiles.local/tmux.conf`:

```
# Center the window list
set -g status-justify centre
```

and your `~/.dotfiles.local/zshrc`:

```
# recommended by brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
```

To add your own aliases, functions and scripts, use the `$HOME/.dotfiles.local/zshrc.d` folder which will
be sourced recursively (just one level deep).

For example your `~/.dotfiles.local/zshrc.d/aliases` might look like this:

```
alias todo='$EDITOR ~/.todo'
```

and your functions could be included in `~/.dotfiles.local/zshrc.d/functions`.

## Credits

I've read a lot and copy/pasted a ton but can't remember every source. The 2 main ones though are:

* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

## License

Copyright (c) 2015, Jad Bitar and licensed under [The MIT License](https://github.com/jadb/dotfiles/blob/master/LICENSE).
