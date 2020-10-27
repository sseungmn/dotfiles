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

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remmaped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  
  " coc-snippets"
  let g:coc_snippet_next='<tab>'
  " GoTo code navigation
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Symbol renaming
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code
  xmap <leader>f <Plug>(coc-format-selected)
  nmap <leader>f <Plug>(coc-format-select)

  " always show signcolumns
  set signcolumn=no
" }}}

Plug 'Nathanaelkane/vim-indent-guides'
" {{{
  "<Leader>ig : default mapping to toggle 
  let g:indentguides_spacechar = '┆'
  let g:indentguides_tabchar = '|'
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 1
  let g:indent_guides_guide_size = 2
  au BufNewFile,BufReadPost *.py
  \  let g:indent_guides_guide_size = 4
" }}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {{{
  let g:airline#extensions#tabline#enabled = 1 	 " turn on buffer list
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline_theme='papercolor'
  set laststatus=2				                 " turn on bottom bar
" }}}

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

  command! FZMru call fzf#run({
    \ 'source': v:oldfiles,
    \ 'sink': 'e',
    \ 'option': '-m -x +s',
    \ 'down': '20%'
    \ })

  command! FZBuf call fzf#vim#buffers({
    \ 'sink': 'e',
    \ 'option': '-m -e -x +s',
    \ 'down': '15%'
    \ })
"}}}

Plug 'christoomey/vim-tmux-navigator'
Plug 'Blueyed/vim-diminactive'
" {{{
  let g:diminactive_enable_focus = 1
" }}}
" working when using vim inside Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

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
set hidden
set nobackup noswapfile

set relativenumber

set smarttab expandtab
set cindent
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set foldmethod=marker


" Give more space for displaying message.
set cmdheight=2

au BufNewFile,BufReadPost *.py set tabstop=4 shiftwidth=4
au BufNewFile,BufReadPost *.py setlocal foldmethod=indent

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"clear highlight after searching
nnoremap <esc> :noh<return><ESC>
