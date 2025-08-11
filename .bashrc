# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export EDITOR=micro

alias tft='waydroid show-full-ui'

alias go-win='CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc GOOS=windows GOARCH=amd64 go build -ldflags "-s -w"'

alias raylib='go get -v -u github.com/gen2brain/raylib-go/raylib'

alias d4='echo $(($RANDOM % 4 + 1))'
alias d6='echo $(($RANDOM % 6 + 1))'
alias d8='echo $(($RANDOM % 8 + 1))'
alias d10='echo $(($RANDOM % 10 + 1))'
alias d12='echo $(($RANDOM % 12 + 1))'
alias d20='echo $(($RANDOM % 20 + 1))'

lf () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}
