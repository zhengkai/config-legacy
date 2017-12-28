#!/bin/bash

export GOROOT=/usr/local/go
export GOARCH=amd64
export GOOS=linux
export GOPATH=/go

/usr/local/go/bin/godoc -http ':6060'
