sudo apt update -y

sudo apt install gnupg -y
sudo apt install openssl -y
sudo apt install curl -y
sudo apt install wget -y
sudo apt install gawk -y
sudo apt install xargs -y
sudo apt install iconv -y
sudo apt remove netcat -y
sudo apt install netcat-openbsd -y
sudo apt install git-lfs -y
sudo apt install graphviz -y
sudo apt install ffmpeg -y
sudo apt install mpv -y
sudo apt install mkvtoolnix-gui -y
sudo apt install google-android-platform-tools-installer -y
sudo apt install texlive-full -y

# C++ toolchain
sudo apt install llvm lld lldb clang clangd make -y

# Rust alternative utils
sudo apt install ripgrep -y # grep
sudo apt install fd-find -y # find
sudo apt install sd -y # sed
sudo apt install git-delta -y # git pager
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
sudo apt install bat -y # cat

# embedded dev
sudo apt install openocd -y
sudo apt install gdb-multiarch -y
sudo apt install kicad kicad-libraries kicad-demos kicad-packages3d xsltproc -y

# GNU Image Manipulation Program
sudo apt install gimp -y

# Vector graphics editor using the SVG file format
sudo apt install inkscape -y

# Editor
sudo apt install libtree-sitter-dev -y
sudo apt install emacs-pgtk -y

# spell checker
sudo apt install enchant-2 -y
sudo apt install libenchant-2-dev -y
sudo apt install aspell -y
sudo apt install aspell-en -y
sudo apt install hunspell-en -y

# NeoVim & NvChad
sudo apt install neovim -y
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Install Nerd fonts
# bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"

sudo apt dist-upgrade -y
sudo apt autoremove -y

# fonts for Windows Subsystem for Linux
#ln -s /mnt/c/Windows/Fonts /usr/share/fonts/windows

#openbsd-netcat
#net-utils
#sys-utils
#mingw-w64-clang-x86_64-blender
#mingw-w64-clang-x86_64-postgresql

#pacman -Qe
