" Configuration file
" -------------------------------------
" VIM
" ln -s ~/.vim/vimrc ~/.vimrc
"
" NEOVIM
" mkdir ~/.config/nvim
" ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
"
" PLUGINS
" :PlugInstall
" -------------------------------------

" ###########
" # Plugins #
" ###########
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  " syntax checker
  Plug 'neomake/neomake'
  " GIT
  Plug 'tpope/vim-fugitive'
call plug#end()
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" ###############
" # Main config #
" ###############
if has('nvim')
    cabbrev term vs term://bash
else
    " these settings are defaults in NVIM
    syntax on
    filetype indent plugin on
    set nocompatible
    set wildmenu
    set showcmd
    set hlsearch
    set backspace=indent,eol,start
    set autoindent
    set ruler
    set laststatus=2
    set belloff=all
    set ttimeoutlen=50
    set cmdheight=2
    cabbrev term vert term
endif

set hidden
set ignorecase
set smartcase
set nostartofline
set confirm
set mouse=a
set cmdheight=2
set number
set nosmarttab
set shiftwidth=4
set softtabstop=4
set expandtab
set splitright
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" ###################
" ### Plugin conf ###
" ###################

" neomake
" run on demand with :Neomake
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 1000)
let g:neomake_open_list = 2

" git
" -- git-fugitive
" to execute any git command, use :Git [args]
nnoremap ga :Git add %:p<cr><cr>
" instead of gs, one can use :G
nnoremap gs :Gstatus<cr>
nnoremap gc :Gcommit -v -q %:p<cr>
nnoremap gd :Gdiff<cr>
nnoremap gb :Git branch<Space>
nnoremap go :Git checkout<Space>
"------------------------------------------------------------


"------------------------------------------------------------
" ###################
" # Personal config #
" ###################

" some useful commands
" --------------------
" /string                  - highlight string in current file
" * (opp #)                - highlight string under cursor in current file
"
" :Ag string               - find string in all files in pwd using Ag (faster)
" :grep -r string          - find string in all files in pwd using grep
" <space>/                 - find string under cursor in all files in pwd using grep
"                            (or Ag if enabled)
"
" <space>\*file-pattern*   - find a file using a *file-pattern* in pwd

" The Silver Searcher :Ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
 
endif

" bind <space>/ to grep word under cursor in pwd
nnoremap <space>/ :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind <space>\ to find all files in pwd with a certain pattern
nnoremap <space>\ :Vex<SPACE>**/


" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" Opens a new file located in the same directory as the current file
" on this buffer (,e), new tab (,t), or new window (,s ,v).
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>


" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:nnoremap \wn :match ExtraWhitespace /\s\+$/<CR>
:nnoremap \wf :match<CR>


" Configuration for netrw (file browser)
" Open file browser: :Vex, :Hex, :Ex (same buffer).
" Change buffer: :bn, :bp
" Change tab: Ctrl+w (twice)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" Set colorscheme
colorscheme koehler  " ron
" Colour line numbers
hi LineNr ctermfg=grey
" add a title on top of the shell
" this reports the full filename making %F in statusline redundant
set title


" statusline
hi statusline guifg=lightgrey guibg=black ctermfg=lightgrey ctermbg=black
hi User1 ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black cterm=bold gui=bold

au InsertEnter * hi User1 ctermbg=red ctermfg=black guibg=red guifg=black cterm=bold gui=bold
au InsertLeave * hi User1 ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black cterm=bold gui=bold

set statusline=
set statusline+=%1*            " colour
set statusline+=\ %n:\ %t\     " file name
set statusline+=%#WarningMsg#
set statusline+=\ %h           " help file flag
set statusline+=%m             " modified flag
set statusline+=%r             " read only flag
set statusline+=%w             " write
set statusline+=%#LineNr#      " colour
set statusline+=\%=            " align left
set statusline+=%Y\             " filetype
set statusline+=\ %P\ %l,%c\    " percent row:col
"------------------------------------------------------------
