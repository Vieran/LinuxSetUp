set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set scrolloff=4

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'

call plug#end()

"=============================================================================================
"---------------------------------------FOR PLUGINS-------------------------------------------
"=============================================================================================

"set shortcut for nerdtree
nnoremap <C-n> :NERDTree<CR>

"set shorcut for ack and make not jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"set airline for coc.nvim and ale
set statusline^=%{coc#status()}
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1

"==============================================coc.nvim settings=========================================
let g:coc_global_extensions = ['coc-clangd', 'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"=========================================end coc.nvim settings==========================================


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
