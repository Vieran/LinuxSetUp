set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'

call plug#end()

"---------------------------------------FOR PLUGINS
"set shortcut for nerdtree
nnoremap <C-n> :NERDTree<CR>

"set shorcut for ack and make not jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"set airline for coc.nvim and ale
set statusline^=%{coc#status()}
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1

"setting for ale
let g:ale_disable_lsp = 1
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_lint_on_save = 1

"setting for tagbar
nnoremap <silent><F10> :TagbarToggle<CR>
nnoremap <silent><F11> <C-]>
nnoremap <silent><F12> <c-o>
let g:tagbar_autofocus = 1 "this make tagbar focus when open
