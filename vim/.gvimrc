"-- window positioning -------------------------------------------------
"" Set window position at top left of screen
winpos 0 0

"-- gui element removing -----------------------------------------------
set guioptions-=m " menubar
set guioptions-=T " toolbar
set guioptions-=r " right scrollbar
set guioptions-=c " use console dialogs instead of popups

"-- window size ---------------------------------------------------------
" Tells gvim that we will not be using any of that toolbar crud and size
" the window appropriately
set guiheadroom=-20
" Deprecated window size... only thing that works for me on Ubuntu :P
"winsize 152 65
" 'Modern' way of setting window size
set lines=76 columns=163

set title titlestring=GVIM

"-- font ----------------------------------------------------------------
set guifont=PragmataPro\ Mono\ 11
