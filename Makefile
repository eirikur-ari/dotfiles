SHELL=/bin/bash

.PHONY: build test clean

build:
	mkdir -p build/dotfiles
	rsync -a ./ ./build/dotfiles --exclude='build/' --exclude='.git/'
	#find . -type f -not -iname './.*' -not -iname 'build/' -exec cp '{}' 'build/dotfiles/{}' ';'

test:
	bats --tap test/bats/system

release: test build
	mkdir -p build/dist
	tar -zcf build/dist/dotfiles-1.0.0.tar.gz ./build/dotfiles

install:
	sh install.sh

clean:
	rm -rf build/
