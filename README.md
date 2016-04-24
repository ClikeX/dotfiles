Dotfiles
========

Special thanks to [](https://github.com/cies) for showing me the art of dotfiles, and for sharing [his](https://github.com/cies/dotfiles). Which I shamelessly stole to get started with them myself.

Installing/updating
-------------------

Bootstrapping sets up a `.gitconfig` for you and links the actual dotfiles from the repo to their targets (this assumes `$USER` is your Github username).

```
git clone https://github.com/$USER/dotfiles.git ~/.dotfiles
(cd ~/.dotfiles; script/bootstrap)
```

There's the install commmand which runs all `**/install.sh` files, they install packages and setup other things that straight dotfiles cannot do. These scripts are written in `sh`, are `zsh` is not yet assumed to be available (one of these scripts will install `zsh`).

```
(cd ~/.dotfiles; script/install)
```

If not already on `zsh` you probably want to run the following.

```
chsh -s /usr/bin/zsh $USER
```

Packages I use that are available in Ubuntus
--------------------------------------------

Basic work:

```
sudo apt-get install -y htop zsh tree git curl tmux
sudo apt-get install -y aspell-nl idutch spell ispell myspell-nl wdutch
sudo apt-get install -y openssh-server
sudo apt-get install -y python-software-properties  # some tools for apt
```

Programming:

```
sudo apt-get install -y build-essential
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev \
                        libxml2-dev libxslt1-dev libcurl4-openssl-dev \
                        libffi-dev
sudo apt-get install -y sqlite3 libsqlite3-dev
sudo apt-get install -y postgresql libpq-dev
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
sudo apt-get install -y imagemagick nodejs libqtwebkit-dev
```

GUI stuff:

```
sudo apt-get install -y inkscape gimp
```

Fix annoying "perl: warning: Setting locale failed."
----------------------------------------------------

```
sudo locale-gen en_US en_US.UTF-8 nl_NL nl_NL.UTF-8
sudo dpkg-reconfigure locales
```
