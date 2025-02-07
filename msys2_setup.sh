pacman -Suy --noconfirm

pacman -S --noconfirm mingw-w64-clang-x86_64-gnupg
pacman -S --noconfirm mingw-w64-clang-x86_64-emacs
pacman -S --noconfirm mingw-w64-clang-x86_64-libtree-sitter
pacman -S --noconfirm mingw-w64-clang-x86_64-git-lfs
pacman -S --noconfirm mingw-w64-clang-x86_64-graphviz
pacman -S --noconfirm mingw-w64-clang-x86_64-ffmpeg
pacman -S --noconfirm mingw-w64-clang-x86_64-mpv
pacman -S --noconfirm mingw-w64-clang-x86_64-mkvtoolnix-gui
#pacman -S --noconfirm mingw-w64-clang-x86_64-pkgconf
pacman -S --noconfirm mingw-w64-clang-x86_64-autotools
pacman -S --noconfirm mingw-w64-clang-x86_64-openssl
pacman -S --noconfirm mingw-w64-clang-x86_64-python
pacman -S --noconfirm mingw-w64-clang-x86_64-python-pygments
pacman -S --noconfirm mingw-w64-clang-x86_64-python-lsp-server
pacman -S --noconfirm mingw-w64-clang-x86_64-python-setuptools
pacman -S --noconfirm mingw-w64-clang-x86_64-python-ujson
pacman -S --noconfirm mingw-w64-clang-x86_64-openxr-sdk
pacman -S --noconfirm mingw-w64-clang-x86_64-android-tools

# Rust alternative utils
pacman -S --noconfirm mingw-w64-clang-x86_64-ripgrep # grep
pacman -S --noconfirm mingw-w64-clang-x86_64-fd # find
pacman -S --noconfirm mingw-w64-clang-x86_64-sd # sed
pacman -S --noconfirm mingw-w64-clang-x86_64-delta # git pager
pacman -S --noconfirm mingw-w64-clang-x86_64-bat # cat

# embedded dev
pacman -S --noconfirm mingw-w64-clang-x86_64-openocd
pacman -S --noconfirm mingw-w64-clang-x86_64-gdb-multiarch

# spell checker
pacman -S --noconfirm mingw-w64-clang-x86_64-enchant
pacman -S --noconfirm mingw-w64-clang-x86_64-aspell
pacman -S --noconfirm mingw-w64-clang-x86_64-aspell-en
pacman -S --noconfirm mingw-w64-clang-x86_64-hunspell-en

# Group
pacman -S --noconfirm mingw-w64-clang-x86_64-texlive-full
pacman -S --noconfirm mingw-w64-clang-x86_64-toolchain
pacman -S --noconfirm mingw-w64-clang-x86_64-nerd-fonts # in msys64\clang64\share\fonts
pacman -S --noconfirm mingw-w64-clang-x86_64-eda
pacman -S --noconfirm mingw-w64-clang-x86_64-vulkan-devel

# GNU Image Manipulation Program
pacman -S --noconfirm mingw-w64-clang-x86_64-gimp3

# Vector graphics editor using the SVG file format
pacman -S --noconfirm mingw-w64-clang-x86_64-inkscape

# Ruby
pacman -S --noconfirm mingw-w64-clang-x86_64-ruby
pacman -S --noconfirm mingw-w64-clang-x86_64-ruby-native-package-installer

# NeoVim & NvChad
pacman -S --noconfirm mingw-w64-clang-x86_64-neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

#openbsd-netcat
#net-utils
#sys-utils
#mingw-w64-clang-x86_64-blender
#mingw-w64-clang-x86_64-postgresql

#pacman -Qe
