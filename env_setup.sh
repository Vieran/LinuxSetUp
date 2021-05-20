##!/bin/bash

# setup relative directories
PACKAGES=${HOME}/packages
APPS=${HOME}/apps
[ ! -d "${PACKAGES}" ] && mkdir -p ${PACKAGES}
[ ! -d "${APPS}" ] && mkdir -p ${APPS}

# install neovim
pushd ${PACKAGES}
[ ! -f "nvim-linux64.tar.gz" ] && wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim-linux64.tar.gz
pushd ${APPS}
[ -e "nvim-linux64" ] && rm -rf nvim-linux64 && echo "nvim-linux64 exists, remove and re unzip"
tar -zxvf ${PACKAGES}/nvim-linux64.tar.gz .
pushd nvim-linux64 && mkdir nvim && pushd nvim && wget https://github.com/Vieran/LinuxSetUp/raw/main/init.vim
mkdir autoload && pushd autoload && wget https://github.com/junegunn/vim-plug/raw/master/plug.vim
# install scripts in vim

# install ctags
pushd ${PACKAGES}
[ -e "ctags" ] && rm -rf ctags && echo "ctags exists, remove and re download"
git clone https://github.com/universal-ctags/ctags.git && pushd ctags
./autogen.sh
./configure --prefix=${APPS}/ctags
make -j
make install

# install nodejs
pushd ${PACKAGES}
[ ! -f "node-v14.17.0-linux-x64.tar.xz" ] && wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.xz
pushd ${APPS}
[ -e "node-v14.17.0-linux-x64" ] && rm -rf node-v14.17.0-linux-x64 && echo "node-v14.17.0-linux-x64 exits, remove and re unzip"
tar -xf ${PACKAGES}/node-v14.17.0-linux-x64.tar.xz


## bashrc
cat >> ${HOME}/.bashrc << EOF
ORIGIN_PATH=\${PATH}

export PACKAGES=\${HOME}/packages
export APPS=\${HOME}/apps
export TERM=screen-256color

NVIM=\${APPS}/nvim-linux64
export XDG_CONFIG_HOME=\${NVIM}
export PATH=\${NVIM}/bin:\$PATH

CTAGS=\${APPS}/ctags
export PATH=\${CTAGS}/bin:\$PATH

NODEJS=\${APPS}/node-v14.17.0-linux-x64
export PATH=\${NODEJS}/bin:\$PATH
EOF
