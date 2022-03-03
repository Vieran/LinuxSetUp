# Set up Neovim

## create relative directories
```bash
export PACKAGES=${HOME}/packages
export APPS=${HOME}/apps
[ ! -d "${PACKAGES}" ] && mkdir -p ${PACKAGES}
[ ! -d "${APPS}" ] && mkdir -p ${APPS}
```



## install neovim

```bash
cd ${PACKAGES}
[ ! -f "nvim-linux64.tar.gz" ] && wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
cd ${APPS}
[ -e "nvim-linux64" ] && rm -rf nvim-linux64 && echo "nvim-linux64 exists, remove and re decompress"
tar -zxvf ${PACKAGES}/nvim-linux64.tar.gz
cd nvim-linux64 && mkdir nvim && cd nvim && wget https://github.com/Vieran/LinuxSetUp/raw/main/init.vim
mkdir autoload && cd autoload && wget https://github.com/junegunn/vim-plug/raw/master/plug.vim
```



## install nodejs

```bash
cd ${PACKAGES}
[ ! -f "node-v14.17.0-linux-x64.tar.xz" ] && wget https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz
cd ${APPS}
[ -e "node-v16.14.0-linux-x64" ] && rm -rf node-v14.17.0-linux-x64 && echo "node-v14.17.0-linux-x64 exits, remove and re decompress"
tar -xf ${PACKAGES}/node-v16.14.0-linux-x64.tar.xz
```



## install llvm

```bash
# build llvm from source is very complex, you can try to install it via privilege
sudo apt-get install llvm

# if you don't have privilege, build it from source!
# download and decompress it
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=${APPS}/llvm-version -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lldb;compiler-rt;lld;polly;deuginfo-tests" --enable-optimized ../llvm
make -j
make install

#in arch linux , you just need to execute 'sudo pacman -S llvm ccls'
```



## install ccls

```bash
pushd ${PACKAGES}
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${APPS}/llvm-version -DCMAKE_INSTALL_PREFIX=${APPS}/ccls -DCMAKE_CXX_COMPILER=g++ # need g++ to support c++17
cmake --build Release --target install
```



## install scripts in neovim

```bash
NVIM=${APPS}/nvim-linux64
export XDG_CONFIG_HOME=${NVIM}
export PATH=${NVIM}/bin:$PATH
NODEJS=${APPS}/node-v14.17.0-linux-x64
export PATH=${NODEJS}/bin:$PATH
CCLS=${APPS}/ccls
export PATH=${CCLS}/bin:$PATH
LLVM=${APPS}/llvm-version
export PATH=${LLVM}/bin:$PATH
export PATH=${LLVM}/libexec:$PATH
export LIBRARY_PATH=${LLVM}/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=${LLVM}/lib:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=${LLVM}/include:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=${LLVM}/include:$C_INCLUDE_PATH
export MANPATH=${LLVM}/share:$MANPATH

vim -c ":PlugInstall"
```



## update bashrc

```bash
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

CCLS=\${APPS}/ccls
export PATH=\${CCLS}/bin:\$PATH
EOF
```
