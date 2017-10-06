#!/usr/bin/env bash

#!/bin/bash

# Header logging
e_header() {
    printf "\n$(tput setaf 7)%s$(tput sgr0)\n" "$@"
}

# Success logging
e_success() {
    printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$@"
}

# Error logging
e_error() {
    printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$@"
}

# Warning logging
e_warning() {
    printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
}

# Ask for confirmation before proceeding
seek_confirmation() {
    printf "\n"
    e_warning "$@"
    read -p "Continue? (y/n) " -n 1
    printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

# Test whether we're in a git repo
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
    if [ $(type -P $1) ]; then
      return 0
    fi
    return 1
}

# Test whether a Homebrew formula is already installed
# $1 - formula name (may include options)
formula_exists() {
    if $(brew list $1 >/dev/null); then
        printf "%s already installed.\n" "$1"
        return 0
    fi

    e_warning "Missing formula: $1"
    return 1
}

read -r -p "Are you sure? [Y/n]" response
if [[ $response =~ ^(yes|y|Y| ) ]]; then

sudo xcodebuild -license

# Check for Homebrew
if ! type_exists 'brew'; then
    e_header "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for Homebrew
	if type_exists 'brew'; then
	    e_header "Updating Homebrew..."
	    # Use the latest version of Homebrew
	    brew update
	    [[ $? ]] && e_success "Done"

	    e_header "Updating any existing Homebrew formulae..."
	    # Upgrade any already-installed formulae
	    brew upgrade --all
	    [[ $? ]] && e_success "Done"
	    
    else
        printf "\n"
        e_error "Error: Homebrew not found."
        printf "Aborting...\n"
        exit
    fi

# Install command-line tools using Homebrew.

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri
brew install curl

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
#brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install Caskroom/cask/java
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hping
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nikto
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install theharvester
brew install ucspi-tcp # `tcpserver` etc.
brew link glib
brew install wireshark
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli
brew install ffmpeg
brew install graphicsmagick
brew install node
brew install optipng
brew install phantomjs
brew install jpeg
brew install lnav
brew install cheat
brew install siege
brew install sproxy
brew install testdisk
brew install photorec	
brew install youtube-dl

brew cask install osxfuse
brew install ntfs-3g
# sudo mv "/Volumes/SSD/sbin/mount_ntfs" "/Volumes/SSD/sbin/mount_ntfs.orig"
# sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/SSD/sbin/mount_ntfs"


sudo chmod -R go+w /Library/Python/2.7/site-packages/
brew install https://raw.github.com/gleitz/howdoi/master/howdoi.rb


# Remove outdated versions from the cellar.
brew cleanup

fi
