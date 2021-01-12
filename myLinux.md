# myLinux

*incase of display problem in Chinese, this file should be written in English*

### APT

```bash
#change apt source
mv /etc/apt/sources.list /etc/apt/sources.list.bk
vim /etc/apt/sources.list
#add the following lines
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free

#update apt
apt update
```



### TOOLS

```bash
#install some necessary tools
apt install gcc git curl wget make sudo neovim

#modified the sudoers file to provide non-root user a privilege to sudo
vim /etc/sudoers
#add the following line after the "root ALL=(ALL) ALL"
#user ALL=(ALL) ALL

#install X11
apt install xorg xorg-dev

#install display-manager
apt install lightdm
#set lightdm as default display-manager
dpkg-reconfigure lightdm

#install windows-manager
apt install dwm suckless-tools
#get dwm's source code to configure if you like(any configuration must be done at build-time)
apt-get source dwm #more info please search in Debian wiki

#install vmware-tools if needed
apt install open-vm-tools

#download source-code-pro font
git clone https://github.com/adobe-fonts/source-code-pro.git
mkdir /usr/local/share/fonts/adobe-source-code-pro
cp source-code-pro/OTF /usr/local/share/fonts/adobe-source-code-pro
cd /usr/local/share/fonts/adobe-source-code-pro
chmod 644 *
fc-cache -v

#install alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
source $HOME/.cargo/env
cargo install alacritty
#apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
#cargo build --release

#infocmp alacritty
#tic -xe alacritty,alacritty-direct extra/alacritty.info
#cp target/release/alacritty /usr/local/bin

#mkdir -p /usr/local/share/man/man1
#gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

#mkdir -p ~/.bash_completion
#cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
#echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
```



### NeoVim

```bash
#set nvim
mkdir ~/.config/nvim
nvim ~/.config/nvim/init.vim

#add the following into file
set number
set relativenumber
syntax on
set shiftwidth=4
set autoindent
set tabstop=4
```

