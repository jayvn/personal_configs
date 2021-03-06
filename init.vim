" vim - plug
call plug#begin('~/.vim/plugged')

Plug 'itchyny/vim-cursorword'
Plug 'chrisbra/NrrwRgn'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular', { 'on':  'Tab' }
Plug 'vim-scripts/peaksea'
Plug 'tpope/vim-commentary'
Plug 'benmills/vimux'
Plug 'Numkil/ag.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Raimondi/delimitMate'
Plug 'JuliaLang/julia-vim'
Plug 'mhinz/vim-startify'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'simnalamburt/vim-mundo'
Plug 'tmhedberg/SimpylFold'
Plug 'noscript/vim-wipeout'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ivalkeen/vim-ctrlp-tjump'

"Plug 'yegappan/mru'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/unite.nvim'
"Plug 'jayvn/vim-endwise'
"Plug 'godlygeek/csapprox'
"Plug 'critiqjo/lldb.nvim'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'scrooloose/nerdcommenter'
"Plug 'james9909/stackanswers.vim'
"Plug 'plasticboy/vim-markdown'
"Plug 'vale1410/vim-minizinc'
"Plug 'jalvesaq/vimcmdline'
"Plug 'vim-scripts/taglist.vim'

" Colorschemes
Plug 'KabbAmine/yowish.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jnurmine/Zenburn'
Plug 'jonathanfilip/vim-lucius'
Plug 'jpo/vim-railscasts-theme'
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'noscript/codeblocks-dark.vim'
Plug 'romainl/flattened'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
" seoul256 (dark):
""   Range:   233 (darkest) ~ 239 (lightest)
"let g:seoul256_background = 236
"colo seoul256
call plug#end()

"solarized gruvbox badwolf molokai zenburn peaksea seoul256
"":highlight Normal ctermfg=grey ctermbg=black
if has('gui_running')
    set bg=dark
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_bold = 1
else
    " colorscheme solarized
    " let g:solarized_termcolors=256
    " let g:solarized_bold = 1
    "colo
    set bg=dark
    colo seoul256
    let g:seoul256_background = 234
endif

let mapleader="\<Space>"

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
"" Snippets {
"
"        " Use honza's snippets.
"
"        let g:neosnippet#snippets_directory='~/.vim/neosnippets'
"
"         "Enable neosnippet snipmate compatibility mode
"
"        let g:neosnippet#enable_snipmate_compatibility = 1
"
"         "For snippet_complete marker.
"
"            if has('conceal')
"
"                set conceallevel=2 concealcursor=i
"
"            endif
"
"         "Enable neosnippets when using go
"
"        let g:go_snippet_engine = "neosnippet"
"
"        " Disable the neosnippet preview candidate window
"
"        " When enabled, there can be too much visual noise
"
"        " especially when splits are used.
"
"        set completeopt-=preview
"
"" }

let g:deoplete#enable_at_startup = 1
set autoindent
set shiftwidth=4
set expandtab
filetype plugin indent on
syntax enable
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
"set matchtime=1
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set pastetoggle=<F2>
set wildmenu
set cursorline
set wrap
set lazyredraw
set fdm=indent
set foldlevelstart=12

set ignorecase
set smartcase

" Vimux Configuration
" {
    "map <Leader>jl :call VimuxRunCommand("clear; julia " . bufname("%"))<CR>
    map <LocalLeader>o :call VimuxRunCommand("clear; julia")<CR>
    function! VimuxSlime()
        call VimuxSendText(@v)
        call VimuxSendKeys("Enter")
    endfunction

    " If text is selected, save it in the v buffer and send that buffer it to tmux
    vmap K "vy :call VimuxSlime()<CR>

    " Select current paragraph and send it to tmux
    nmap <LocalLeader>jl vipK<CR>
    nmap K VK<CR>

    "let g:VimuxUseNearest=0
" }

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"nmap <leader>f i <esc>x:%!astyle -k3xkxnxcxC100pjCYHxnxcxk<CR>:w<esc>gi<esc>
"nmap <leader>f i <esc>xgg=GgggqGg;
"nmap <leader>f i <esc>x:%!astyle -k3xkxnxcpjCYHA3<CR>:w<esc>gi<esc>
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

nmap <leader>q :q<CR>

nnoremap ; :
inoremap kj <esc>:up<CR>l

nmap H gT
nmap L gt
set so=999

set formatoptions+=w
set formatoptions+=o
set tw=100
set hidden

"nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if !exists('g:loaded_matchit')
    runtime macros/matchit.vim
endif

"plugin stuff:

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " bind K to grep word under cursor
    " nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    if &filetype == 'mail'
" Preserve space after e-mail signature separator
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal `z
    normal h
  endif
endfunction

" GUI Options {

  " Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

  " Toggle between normal and relative numbering.
  nnoremap <leader>rn :call NumberToggle()<cr>

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
  if has('statusline')
      set laststatus=2
      " Broken down into easily includeable segments
      set statusline=%<%f\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      "set statusline+=%{fugitive#statusline()} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
" }
" Keybindings {
  " Save file
    "nnoremap <Leader>w :call StripTrailingWhitespace()<CR> :w<CR>
    nnoremap <Leader>w :up<CR>
    "Copy and paste from system clipboard
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P
" }

" Airline {
    "let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#enabled = 2
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#right_sep = ' '
    let g:airline#extensions#tabline#right_alt_sep = '|'
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = '|'
    "let g:airline_theme= 'serene'
" }
" CtrlP {
" Open file menu
let g:ctrlp_by_filename=0
let g:ctrlp_cmd='CtrlPMRU'
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
"nnoremap <Leader>f :CtrlPMRUFiles<CR>
" }
"let g:nerdtree_tabs_open_on_console_startup=1

"set statusline += % #warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline += % *
set ff=unix

let g:vim_markdown_folding_disabled=1

"autocmd! BufWritePost * Neomake

"nmap <CR> li<CR><esc>k$

"ctags stuff
" nmap <Leader>tf :call CtagsFind(expand('<cword>'))<CR>
" use <C-]> instead
" com! -nargs=+ Tf :call CtagsFind("<args>")
" split window and search for tag
nmap <Leader>ts :exe('stj '.expand('<cword>'))<CR>

let cmdline_follow_colorscheme = 1

" open new tab and search for tag
fun! CtagsFind(keyword)
    tabe
    exe "tj ".a:keyword
endfunction
nmap <Leader>id :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>
noremap <expr> n (v:searchforward ? 'n' : 'N')
noremap <expr> N (v:searchforward ? 'N' : 'n')
nnoremap <Leader>f :call StripTrailingWhitespace()<CR> :w<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-n> :FZF<CR>

let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : ['a:abstract', 'i:immutable', 't:type', 'f:function', 'm:macro']
    \ }

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
nnoremap <Leader>tg :TagbarToggle<CR>
nnoremap <Leader>g :CtrlPTag<CR>
map <Leader>jl :tabe<CR>:terminal<CR>julia<CR>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1
" Reload file
nmap <Leader>rl :e<CR>
