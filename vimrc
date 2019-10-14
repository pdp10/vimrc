" configuration file
" ----------------------------------------------------------------------------
" See README
"
" suggested packages: python-flake8, python-pylint, ag-silversearcher
" ----------------------------------------------------------------------------


" ###########
" # Plugins #
" ###########
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
    " syntax checker
    Plug 'neomake/neomake'
    " git
    Plug 'tpope/vim-fugitive'
call plug#end()
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" ###############
" # Main config #
" ###############
if has('nvim')
    " type <C-\><C-N> to leave terminal mode
    cabbrev term vs term://bash
else
    cabbrev term vert term
endif

" these settings should be defaults in NVIM
syntax on
filetype indent plugin on
set nocompatible
set autoindent
set backspace=indent,eol,start
set belloff=all
set hlsearch
set laststatus=2
set ruler
set showcmd
set ttimeoutlen=50
set wildmenu

" other settings
set cmdheight=2
set confirm
set hidden
set ignorecase
set smartcase
set mouse=a
set nosmarttab
set nostartofline
set number
set shiftwidth=4
set softtabstop=4
set splitright
set expandtab
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
let g:neomake_python_flake8_maker = { 'args': ['--max-line-length=100'] }
let g:neomake_python_enabled_makers = ['flake8', 'pylint']

" git
" -- git-fugitive
" to execute any git command, use :Git [args]
" essentially `git add this_file`
nnoremap ga :Gwrite %:p<cr>
" instead of gs, one can use :G
nnoremap gs :Gstatus<cr>
nnoremap gc :Gcommit -v -q %:p<cr>
nnoremap gd :Gdiff<cr>
nnoremap gb :Git branch<Space>
nnoremap go :Git checkout<Space>
"------------------------------------------------------------


"------------------------------------------------------------
" #################
" # Commands conf #
" #################

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

" map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" opens a new file located in the same directory as the current file
" on this buffer (,e), new tab (,t), or new window (,s ,v).
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:nnoremap \wn :match ExtraWhitespace /\s\+$/<CR>
:nnoremap \wf :match<CR>

" netrw configuration (file browser)
" Open file browser: :Vex, :Hex, :Ex (same buffer).
" Change buffer: :bn, :bp
" Change tab: Ctrl+w (twice)
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=2  "open in a new vertical split
let g:netrw_altv=1
let g:netrw_winsize=25
"------------------------------------------------------------


"------------------------------------------------------------
" ##############
" # Style conf #
" ##############

" set colorscheme
colorscheme koehler

" colour line numbers
hi LineNr ctermfg=grey

" add a title on top of the shell
" this reports the full filename making %F in statusline redundant
set title

" statusline
" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction
hi statusline guifg=lightgrey guibg=black ctermfg=lightgrey ctermbg=black
hi User1 ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black cterm=bold gui=bold
au InsertEnter * hi User1 ctermbg=red ctermfg=black guibg=red guifg=black cterm=bold gui=bold
au InsertLeave * hi User1 ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black cterm=bold gui=bold
set statusline=
set statusline+=%1*             " colour
set statusline+=\ %n:\ %t\      " file name
set statusline+=%#WarningMsg#
set statusline+=\ %h            " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " read only flag
set statusline+=%w              " write
set statusline+=%#LineNr#       " colour
set statusline+=\%=             " align left
set statusline+=\ %y                                " FileType
set statusline+=\ %-3(%{FileSize()}%)               " File size
set statusline+=\ %P\ %l,%c\  " percent, row:col
"------------------------------------------------------------
