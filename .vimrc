" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be improved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" ==============================
" Neobundle
" ==============================
" Because FW block git protocol
let g:neobundle#types#git#default_protocol = 'https'

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Colorschema
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'Shougo/vimproc', {
  \   'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak'
  \   }
  \ }

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'junegunn/vim-easy-align'

" Status Line
NeoBundle 'itchyny/lightline.vim'

" Search
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-easymotion.vim'
NeoBundle 'haya14busa/incsearch-fuzzy.vim'

" Util
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'surround.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'AutoClose' " Close quote
NeoBundle 'endwise.vim' " Close if-end if-fi
NeoBundleLazy 'sudo.vim', { 'autoload': { 'commands': ['sudo'] } }

" Error check
NeoBundle 'vim-scripts/errormarker.vim.git'
NeoBundle 'scrooloose/syntastic'

" Git
NeoBundle 'fugitive.vim'

" HTML
NeoBundleLazy 'mattn/emmet-vim', { 'autoload': { 'filetypes': ['html', 'eruby'] } }

" Markdown
NeoBundleLazy 'tpope/vim-markdown', { 'autoload': { 'filetypes': ['markdown'] } }

" Ruby
NeoBundleLazy 'tpope/vim-rake',  { 'autoload': { 'filetypes': ['ruby'] } }
NeoBundleLazy 'ruby-matchit',    { 'autoload': { 'filetypes': ['ruby'] } }
NeoBundleLazy 'tpope/vim-rails', { 'autoload': { 'filetypes': ['ruby'] } }
NeoBundleLazy 'Vim-Rspec',     { 'autoload': { 'filetypes': ['ruby'] } }

" Go
NeoBundle 'fatih/vim-go', { 'autoload': { 'filetypes': ['go'] } }

" Scala
NeoBundle 'derekwyatt/vim-scala.git', { 'autoload': { 'filetypes': ['scala'] } }

" CoffeeScript
NeoBundle 'vim-coffee-script', { 'autoload': { 'filetypes': ['coffee'] } }

" Typescript
NeoBundle 'leafgarland/typescript-vim', { 'autoload': { 'filetypes': ['typescript'] } }
NeoBundle 'Quramy/tsuquyomi', { 'autoload': { 'filetypes': ['typescript'] } }

call neobundle#end()

" call pathogen#infect()
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Installation check
NeoBundleCheck

" ==============================
" Visual
" ==============================

" color
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
syntax on

" show line number
set number

" don't be considered octal, hex number
set nrformats=""

" font setting
set guifont=Ricty\ Discord\ 12
set guifontwide=Ricty\ Discord\ 12

" TAB
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Display white space
set list
set listchars=tab:>>,trail:-,extends:»,precedes:«,nbsp:%

" Check set command
set modeline
set modelines=5

" Indent
set autoindent
set smartindent

" Search
set ignorecase
set smartcase
set wrapscan
set noincsearch
set nohlsearch

set showcmd
set showmatch
set laststatus=2

set clipboard=unnamedplus

set wildmenu
set wildmode=list:longest

" Edit
set hidden
set autoread
" more powerful backspacing
set backspace=indent,eol,start
" extended % matching
source $VIMRUNTIME/macros/matchit.vim
" Now we set some defaults for the editor
set textwidth=0 " Don't wrap words by default
set nobackup    " Don't keep a backup file
set viminfo='50,<1000,s100,\"50 " read/write a .viminfo file, don't store more than
" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
set helpfile=$VIMRUNTIME/doc/help.txt

" Use dict file
set complete+=k

" ==============================
" Encoding
" ==============================

set fileencodings=utf-8

autocmd FileType cvs :set fileencoding=euc-jp
autocmd FileType svn :set fileencoding=utf-8

" ==============================
" Key Mapping
" ==============================

" swap ; :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" copy ^ to $ without break
map Y y$

" display lies moving
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Change window size
map <kPlus> <C-W>+
map <kMinus> <C-W>-

" Move line which last modified
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Forcus center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" encoding
nmap ,U :set encoding=utf-8<CR>
nmap ,E :set encoding=euc-jp<CR>
nmap ,S :set encoding=cp932<CR>

" removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" ==============================
" Plugin
" ==============================

" neocomplcache
let g:neocomplcache_enable_at_startup=3

" For Git
nnoremap [git] <Nop>
nmap <Leader>g [git]

" gitv
nmap [git]v :<C-u>Gitv --all<cr>
nmap [git]V :<C-u>Gitv! --all<cr>
vmap [git]V :<C-u>Gitv! --all<cr>

" fugitive
nnoremap [git]d :<C-u>Gdiff<CR>
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]l :<C-u>Glog<CR>
nnoremap [git]a :<C-u>Gwrite<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]b :<C-u>Gblame<CR>

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'relativepath' ] ]
  \ },
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"⭤":""}',
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }

" QuickRun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
  \   'outputter': 'browser'
  \ }

" Unite
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_mru,file_rec,file_rec/async,file_rec/git,grepocate', 'max_candidates', 0)
call unite#filters#matcher_default#use(['matcher_fuzzy'])"

"" Use fuzzy as a default matcher
nnoremap [unite] <Nop>
nmap <Space> [unite]

nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer -no-quit<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> [unite]p :<C-u>Unite file_rec/git:--cached:--others:--exclude-standard<CR>
nnoremap <silent> [unite]r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

" Use the platinum searcher instead of unix grep
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'go'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['go', 'golint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" incsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-easymotion-/)
map ?  <Plug>(incsearch-easymotion-?)
map f  <Plug>(incsearch-fuzzy-/)
map F  <Plug>(incsearch-fuzzy-?)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"" vimfiler
""" Disable netrw.vim
let g:loaded_netrwPlugin = 1
""" Enable vimfiler as a default explorer
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <C-e> :<C-u>VimFilerExplorer<CR>

autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap <buffer><nowait> <CR> <Plug>(vimfiler_expand_or_edit)
endfunction

call vimfiler#custom#profile('default', 'context', {
  \ 'safe' : 0
  \ })

"" vim-easy-align
vmap <Leader>a <Plug>(EasyAlign)
let g:easy_align_delimiters = {
  \ '#': { 'pattern': '#\+', 'filter': 'v/^#/', 'ignore_groups': ['String'], 'ignore_unmatched': 0, 'delimiter_align': 'l' }
  \ }
