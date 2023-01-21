if status is-interactive
    # Commands to run in interactive sessions can go here
  set -g fish_greeting
end

bass source ~/.gvm/environments/default

set -Ux EDITOR nvim

#set -x GOROOT /usr/local/go
#set -x GOPATH /Users/nicoxcwang/go
#set -x GOBIN $GOPATH/bin
#set -x PATH $PATH:$GOBIN

set -gx PATH $PATH /Users/nicoxcwang/.local/bin
