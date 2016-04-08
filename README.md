# Dotfiles - fashioned after Zach's

Love to [Zach](https://github/holman) for [his](https://github.com/holman/dotfiles), he showed me a wonderful way to organize 'm.

While Zach's dotfiles are biased towards OSX and `$EDITOR_OF_THE_WEEK`, mine are biased towards Ubuntu's and Emacs (Spacemacs to be more precise).


## Installing/updating

Bootstrapping sets up a `.gitconfig` for you and links the actual dotfiles from the repo to their targets (this assumes `$USER` is your Github username).

    git clone https://github.com/$USER/dotfiles.git ~/.dotfiles
    (cd ~/.dotfiles; script/bootstrap)

There's the install commmand which runs all `**/install.sh` files, they install packages and setup other things that straight dotfiles cannot do.
These scripts are written in `sh`, are `zsh` is not yet assumed to be available (one of these scripts will install `zsh`).

    (cd ~/.dotfiles; script/install)

If not already on `zsh` you probably want to run the following.

    chsh -s /usr/bin/zsh $USER


## TODO

* Get some of my XFCE/Xubuntu settings into this repo
* Get `rbenv` in the mix
* Tmux to the max
* Port Zsh tweak from old repo
* Break `script/install` up into a desktop, a server and boxen specific variants
* Break up the PATH by topic?
* Steal more tricks from oh-my-zsh
* Steal more tricks from carlhuda/janus or spf13
* Add Vim startup message: "consider using Emacs instead"

More TODOs in `emacs/personal/README.md`


## Packages I use that are available in Ubuntus

Basic work:

    sudo apt-get install -y htop zsh tree git curl vim tmux w3m
    sudo apt-get install -y aspell-nl idutch spell ispell myspell-nl wdutch
    sudo apt-get install -y openssh-server
    sudo apt-get install -y python-software-properties  # some tools for apt

Programming:

    sudo apt-get install -y build-essential
    sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev \
                            libxml2-dev libxslt1-dev libcurl4-openssl-dev \
                            libffi-dev
    sudo apt-get install -y sqlite3 libsqlite3-dev
    sudo apt-get install -y postgresql libpq-dev
    sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
    sudo apt-get install -y imagemagick nodejs libqtwebkit-dev

GUI stuff:

    sudo apt-get install -y inkscape gimp


## Packages that need a special repo (PPA) to work

Emacs daily snapshot:

    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt-get update
    sudo apt-get install emacs-snapshot


## Heroku

**todo**


## Haskell (using `stack`)

    sudo apt-key adv --keyserver keyserver.ubuntu.com \
      --recv-keys 575159689BEFB442
    echo 'deb http://download.fpcomplete.com/ubuntu wily main' | \
      sudo tee /etc/apt/sources.list.d/fpco.list
    sudo apt-get update && sudo apt-get install stack -y


## Keyboard mapping

This maps `CAPS` to an extra `CTRL` and setup up the `RightALT` as the compose key
(allowing: `RightALT` `"` `e` -> `ë`). This works also in console screens.

    sudo bash -c "cat > /etc/default/keyboard" << EOL
    # KEYBOARD CONFIGURATION FILE
    # Consult the keyboard(5) manual page.
    XKBMODEL="pc105"
    XKBLAYOUT="us"
    XKBVARIANT="euro"
    XKBOPTIONS="compose:ralt,ctrl:nocaps"
    BACKSPACE="guess"
    EOL
    sudo dpkg-reconfigure keyboard-configuration


## Fix annoying "perl: warning: Setting locale failed."

    sudo locale-gen en_US en_US.UTF-8 nl_NL nl_NL.UTF-8
    sudo dpkg-reconfigure locales
