call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{{
  let g:coc_global_extensions = [
  \  'coc-snippets',
  \  'coc-pairs',
  \  'coc-python',
  \  'coc-prettier',
  \  'coc-json',
  \  ]

  " Use tab for trigger completion with character ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is no mapped by other
  " plugin.
  inoremap <silent><expr> <TAB>
  \ pumvisible() ? "<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
  endfunction
 
  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Usr <CR> just to select current item"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_doc()<CR>

  function! s:show_doc() 
    if &filetype == 'vim'
      execute 'h ' . expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " coc-snippets"
  let g:coc_snippet_next='<tab>'
  " GoTo code navigation
  nmap <silent> gd :call CocAction('jumpDefinition')<CR>
  nmap <silent> gl :call CocAction('jumpDeclaration')<CR>
  nmap <silent> gi :call CocAction('jumpImplemetation')<CR>
  nmap <silent> gr <Plug>(coc-references)

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> dg :CocDiagnostics<CR>
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Symbol renaming
  nmap <F2> <Plug>(coc-rename)

" }}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {{{
  let g:airline#extensions#tabline#enabled = 1 	 " turn on buffer list
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline_theme='papercolor'
  set laststatus=2				                 " turn on bottom bar
" }}}
Plug 'Yggdroot/indentLine'
Plug 'preservim/tagbar'
"{{{
  nmap <F8> :TagbarToggle<CR>
  let g:tagbar_width = max([30, winwidth(0) / 5 ])
"}}}

Plug 'preservim/nerdcommenter'
" {{{
  vmap ++ <plug>NERDCommenterToggle
  nmap ++ <plug>NERDCommenterToggle
   "add <command+/> to ++ on iterm2 key-mapping"
" }}}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"{{{
  let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden'

  nnoremap <silent> <C-p> :FZAll<CR>
  nnoremap <silent> <C-b> :FZBuf<CR>

  command! FZAll call fzf#run({
    \ 'sink': 'e',
    \ 'option': '-m -e -x +s',
    \ 'down': '20%'
    \ })

  command! FZBuf call fzf#vim#buffers({
    \ 'sink': 'e',
    \ 'option': '-m -e -x +s',
    \ 'down': '15%'
    \ })
"}}}
Plug 'pbogut/fzf-mru.vim'
"{{{
  nnoremap <silent> <C-o> :FZFMru<CR> 
  let g:fzf_mru_relative = 0
"}}}

Plug 'christoomey/vim-tmux-navigator'
Plug 'Blueyed/vim-diminactive'
" {{{
  let g:diminactive_enable_focus = 1
" }}}
" working when using vim inside Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'metakirby5/codi.vim'

Plug 'tpope/vim-fugitive'

Plug 'morhetz/gruvbox'

call plug#end()

"------------------------------------------""
"-----------general config-----------------""
"------------------------------------------""

colorscheme gruvbox

" set mapleader
let mapleader=","
" use wildcharm where i would use <TAB>
set wildcharm=<C-z>
inoremap jk <ESC>

" turecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" to navigate pane
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bq :bprevious <BAR> bd #<CR>
nnoremap <leader>bl :ls<CR>

" basic settings
syntax enable
filetype plugin indent on
highlight Comment ctermfg=4

"clear highlight after searching
nnoremap <esc> :noh<return><ESC>

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <silent> <leader>h :wincmd <<CR>
nnoremap <silent> <leader>j :wincmd +<CR>
nnoremap <silent> <leader>k :wincmd -<CR>
nnoremap <silent> <leader>l :wincmd ><CR>

set hidden
set nobackup noswapfile

set relativenumber

set smarttab expandtab
set cindent
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set foldmethod=marker
set splitright
set splitbelow

set clipboard=unnamed

" Give more space for displaying message.
set cmdheight=2

au BufNewFile,BufReadPost *.py set tabstop=4 shiftwidth=4
au BufNewFile,BufReadPost *.py setlocal foldmethod=indent
autocmd FileType python map <buffer> <leader>e :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader>e :w<CR>:exec '!python3' shellescape(@%, 1)<CR>


let g:python3_host_prog='~/.pyenv/versions/ws1_virtualenv/bin/python3.8'
