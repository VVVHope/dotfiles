#!/bin/bash

# Rust
rustup update
rustup component add rust-analyzer rust-src

# Python
sudo pip install -U setuptools
sudo pip install 'python-lsp-server[all]'

# C/C++
sudo apt update
sudo apt install llvm clangd

#fonts-font-awesome fonts-firacode fonts-symbola fonts-powerline fonts-material-design-icons-iconfont fonts-recommended