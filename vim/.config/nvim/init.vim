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

" appearance --------------------------------------------------------

" brings in a few colorschemes
Plug 'rafi/awesome-vim-colorschemes'

" statusbar
Plug 'itchyny/lightline.vim'

" editing -----------------------------------------------------------

" add/remove/change surrounding text like quotes, parens...
Plug 'tpope/vim-surround'

" autodetect indentation settings
Plug 'tpope/vim-sleuth'

" Move around file
Plug 'easymotion/vim-easymotion'

" project-wide search, á la Sublime Text and friends
Plug 'ctrlpvim/ctrlp.vim'

" auto-comment/auto-uncomment
Plug 'tomtom/tcomment_vim'

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
