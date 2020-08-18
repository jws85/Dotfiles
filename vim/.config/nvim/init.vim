" The intent here is to make a pretty basic vim config that doesn't
" depend on a lot of external stuff.  In general, you should only
" need:
"  - Vim 7+ with Ruby/Python support (vim-nox on Deb/'buntus)
"  - Git
" (See here: https://github.com/junegunn/vim-plug/wiki/requirements)
" (I haven't tried them yet but Vim 8 / neovim are supposed to be
" even easier to work with in this regard.)
"
" I'm avoiding stuff that needs separate compilation.

"" Script/plugin installer ==========================================

call plug#begin(stdpath('data') . '/plugged')

" sane defaults
Plug 'tpope/vim-sensible'

let mapleader = ' '

" language modes ----------------------------------------------------

Plug 'sheerun/vim-polyglot'

" appearance --------------------------------------------------------

" brings in a few colorschemes
Plug 'rafi/awesome-vim-colorschemes'

" statusbar
Plug 'itchyny/lightline.vim'

" opening -----------------------------------------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <Leader><Space> :Files<cr>

" editing -----------------------------------------------------------

" add/remove/change surrounding text like quotes, parens...
Plug 'tpope/vim-surround'

" autodetect indentation settings
Plug 'tpope/vim-sleuth'

" extend repeat to more things
Plug 'tpope/vim-repeat'

" various movement things
Plug 'tpope/vim-unimpaired'

" auto-comment/auto-uncomment
Plug 'tpope/vim-commentary'

call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Basics ============================================================

" Disable bells/beeping on 'error'
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Menus =============================================================

set wildmenu
set wildmode=list:longest,full

" Themeing ==========================================================

" colorscheme
if !has('gui_running')
    set t_Co=256
endif
colorscheme jellybeans

" statusbar
set noshowmode
let g:lightline = { 'colorscheme': 'jellybeans' }

" Editing ===========================================================

" Disable autocomment when you hit enter
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
