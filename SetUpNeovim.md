##!/bin/bash

# create relative directories
PACKAGES=${HOME}/packages
APPS=${HOME}/apps
[ ! -d "${PACKAGES}" ] && mkdir -p ${PACKAGES}
[ ! -d "${APPS}" ] && mkdir -p ${APPS}


# install neovim
pushd ${PACKAGES}
[ ! -f "nvim-linux64.tar.gz" ] && wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
pushd ${APPS}
[ -e "nvim-linux64" ] && rm -rf nvim-linux64 && echo "nvim-linux64 exists, remove and re decompress"
tar -zxvf ${PACKAGES}/nvim-linux64.tar.gz
cd nvim-linux64 && mkdir nvim && cd nvim && wget https://github.com/Vieran/LinuxSetUp/raw/main/init.vim
mkdir autoload && cd autoload && wget https://github.com/junegunn/vim-plug/raw/master/plug.vim


# install nodejs
popd  # return back to PACKAGES dir
[ ! -f "node-v14.17.0-linux-x64.tar.xz" ] && wget https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz
pushd ${APPS}
[ -e "node-v16.14.0-linux-x64" ] && rm -rf node-v14.17.0-linux-x64 && echo "node-v14.17.0-linux-x64 exits, remove and re decompress"
tar -xf ${PACKAGES}/node-v16.14.0-linux-x64.tar.xz


# install llvm and ccls(build from source is too complex)
sudo apt-get install llvm ccls
#sudo pacman -S llvm ccls


# install scripts in neovim
NVIM=\${APPS}/nvim-linux64
export XDG_CONFIG_HOME=\${NVIM}
export PATH=\${NVIM}/bin:\$PATH
NODEJS=\${APPS}/node-v14.17.0-linux-x64
export PATH=\${NODEJS}/bin:\$PATH
vim -c ":PlugInstall"

## update bashrc
cat >> ${HOME}/.bashrc << EOF
ORIGIN_PATH=\${PATH}

export PACKAGES=\${HOME}/packages
export APPS=\${HOME}/apps
export TERM=screen-256color

NVIM=\${APPS}/nvim-linux64
export XDG_CONFIG_HOME=\${NVIM}
export PATH=\${NVIM}/bin:\$PATH

NODEJS=\${APPS}/node-v14.17.0-linux-x64
export PATH=\${NODEJS}/bin:\$PATH
EOF
