set number
set relativenumber
set tabstop=4
set shiftwidth=4
set smartindent
set scrolloff=4
syntax on
set incsearch
set hlsearch
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"set foldmethod=indent


call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
call plug#end()


"======================================================================================
"---------------------------------------FOR PLUGINS------------------------------------
"======================================================================================
let g:coc_global_extensions = ['coc-json']
"set shortcut for nerdtree
nnoremap <C-n> :NERDTree<CR>

"set shorcut for ack and make not jump to the first result automatically
let g:ackprg = 'ag --nogroup --nocolor --column --noaffinity'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"setting for coc.nvim in lightline
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

"=================================coc.nvim settings====================================
let g:coc_global_extensions = ['coc-json']

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
"==================================end coc.nvim settings===============================

"setting for find references and definition
nnoremap <silent><F2> <C-]>
nnoremap <silent><F3> <c-o>
"nmap <silent> <F4> <Plug>(coc-references)
"nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
"nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

"setting for color
if &term == 'screen'
	set t_Co=256
endif
colorscheme gruvbox
set background=dark
