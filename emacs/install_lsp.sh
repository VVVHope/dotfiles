#!/bin/bash

# Rust
rustup update
rustup component add rls rust-analysis rust-src

# Python
sudo pip install -U setuptools
sudo pip install 'python-lsp-server[all]'

# C/C++
sudo apt update
sudo apt install llvm clangd
