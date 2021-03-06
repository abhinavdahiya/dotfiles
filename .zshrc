# Path to your oh-my-zsh installation.
export ZSH=/Users/abhinavdahiya/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

DEFAULT_USER="abhinavdahiya"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker go vagrantbrew composerzsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/aria2/bin:/usr/local/mysql/bin"

# GO path setup
export GOPATH="$HOME/Projects/go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOBIN

# python virtualenvwrapper
export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Projects

# export MANPATH="/usr/local/man:$MANPATH"
source "/usr/local/bin/virtualenvwrapper.sh"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias php-local="cd ~/Projects/php-local"

# location of dockerenv images
export DOCKERENV_PATH=~/Projects/dockerenv

# alias for starting go dockerenv
alias goimports="godev-exec goimports "
export GODEV_VERSION=1.0.0
function godev-up() {
	if [ -z "$1" ]; then
		docker run --rm -ti -v "${PWD}:/go/src/github.com/abhinavdahiya/${PWD##*/}" -w "/go/src/github.com/abhinavdahiya/${PWD##*/}" godev:$GODEV_VERSION /bin/sh
	else
		echo "$1"
		docker run --rm -ti -v "${PWD}:/go/src/$1" -w "/go/src/$1" godev:$GODEV_VERSION /bin/sh
	fi
}

function godev-run() {
	docker run --rm -t -v "${PWD}:/go/src/github.com/abhinavdahiya/${PWD##*/}" -w "/go/src/github.com/abhinavdahiya/${PWD##*/}" godev:$GODEV_VERSION /tmp/go-exec.sh $1
}

function godev-exec() {
	echo "${@:1}"
	docker run --rm -t -v "${PWD}:/go/src/github.com/abhinavdahiya/${PWD##*/}" -w "/go/src/github.com/abhinavdahiya/${PWD##*/}" godev:$GODEV_VERSION ${@:1}
}

function godev-build() {
	docker build -t godev:$GODEV_VERSION $DOCKERENV_PATH/go
}

# alias for starting cpp dockerenv
export CPPDEV_VERSION=1.0.0
function cppdev-up() {
	docker run --rm -ti -v "${PWD}:/app/${PWD##*/}" -w "/app/${PWD##*/}" cppdev:$CPPDEV_VERSION /bin/sh
}

function cppdev-run() {
	docker run --rm -t -v "${PWD}:/app/${PWD##*/}" -w "/app/${PWD##*/}" --name "cppdev" cppdev:$CPPDEV_VERSION /tmp/cpp-exec.sh $1
}
