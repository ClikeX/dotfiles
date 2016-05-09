
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

### Add binaries in this dotfiles repo to the PATH
export PATH="$ZSH/bin:$PATH"

### Make locals work
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

### Added for rbenv to work
export PATH="$HOME/.rbenv/bin:$PATH"

### Added for pyenv to work
export PATH="$PYENV_ROOT/bin:$PATH"

### Make GHC 7.8.4 from Stack work
export PATH="$HOME/.stack/programs/x86_64-linux/ghc-7.10.2/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
