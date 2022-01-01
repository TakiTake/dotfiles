"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.config/nvim')
  let s:dein_toml_path = g:rc_dir . '/dein.toml'
  let s:dein_toml_lazy_path = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:dein_toml_path, { 'lazy': 0 })
  call dein#load_toml(s:dein_toml_lazy_path, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax enable
filetype plugin indent on

" https://gist.github.com/XVilka/8346728
"set termguicolors

set t_Co=256
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let base16colorspace=256

colorscheme base16-default-dark

" Display white space
set list
set listchars=tab:>>,trail:-,extends:»,precedes:«,nbsp:%

" Left margin
set foldcolumn=1
highlight FoldColumn ctermbg=Black

" tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" swap ; :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Share clipboard
set clipboard=unnamed,unnamedplus

" copy ^ to $ without break
map Y y$

" display lies moving
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" keymapping for terminal mode
tnoremap <silent> <C-[> <C-\><C-n>

" remove extra spaces
augroup remove_trailing_spaces
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
