#!/bin/bash

# this script automates this: https://golang.org/doc/install
# for macs with homebrew installed

# check whether homebrew is installed and error if not
if [[ ! $(command -v brew) ]]; then
    echo "Please install hombrew and try again"
    exit 1
fi

# checking whether go is installed
echo "Checking whether you already have go"
if [[ $(command -v go) ]]; then
    echo "Go already installed!"
    go version
else
    # installing go
    echo "Installing go"
    brew install go

    if [[ $(command -v go) ]]; then
	echo "Go was successfully installed."
    fi
fi

# creating workspace
# NOTE: If you want this workspace in a different place,
# update your GOPATH.
if [ -d ~/go ]; then
   echo "go directory exists"
else
    echo "Creating go directory"
    mkdir ~/go
fi
if [ -d ~/go/src ]; then
    echo "go/src directory exists"
else
    echo "Creating src directory"
    mkdir ~/go/src
    echo "Workspace created"
fi

# testing your installation
# this will create a hello directory and a test file, build it, and run it
echo "Testing your installation"
if ! [ -d ~/go/src/hello ]; then
    echo "creating Hello directory"
    mkdir ~/go/src/hello
    printf "package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Println(\"hello, world!\")\n}" > ~/go/src/hello/hello.go
fi

cd ~/go/src/hello
go build
./hello
