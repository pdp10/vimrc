" ###########
" # Plugins #
" ###########

" -------------------------------------
" To install:
" :PlugInstall
" cd ~/.vim/plugged/vimproc.vim && make
" -------------------------------------


call plug#begin('~/.vim/plugged')

" syntax checker
Plug 'scrooloose/syntastic'

" Unite (file manager)
"   depend on vimproc
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

" AG
Plug 'rking/ag.vim'

" GIT
Plug 'tpope/vim-fugitive'

call plug#end()

set nocompatible


" ###################
" ### Plugin conf ###
" ###################

" syntastic
" run on demand with :SyntasticCheck :Errors
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


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

" File Management
" unite + ag (requires package: silversearcher-ag)
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" two powerful searches in addition to /
" --- type <space>/ to search all occurrences of a given string in all files
"  in the current directory
nnoremap <space>/ :Ag 
" --- type <space>\ to search a file in the filetree
nnoremap <space>\ :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>



" ----------------------------------------------------------------------------

" ###############
" # Main config #
" ###############

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Features {{{1
"
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------




" ###################
" # Personal config #
" ###################

"------------------------------------------------------------
" Configuration for netrw (file browser)
" Open file browser: :Vex, :Hex, :Ex (same buffer).
" Change buffer: :bn, :bp
" Change tab: Ctrl+w (twice)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"------------------------------------------------------------


"------------------------------------------------------------
" Opens a new file located in the same directory as the current file
" on this buffer (,e), new tab (,t), or new window (,s ,v).
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
"------------------------------------------------------------


"------------------------------------------------------------
" Spellchecking
" use :set nospell to disable spelling
" files: http://ftp.vim.org/vim/runtime/spell/
if has("spell") " if vim support spell checking
    " Download dictionaries automatically
    if !filewritable($HOME."/.vim/spell")
        call mkdir($HOME."/.vim/spell","p")
    endif
    set spellsuggest=10 " z= will show suggestions (10 at most)
    " auto spell checking for text, HTML, LaTeX, markdown and rst
    "autocmd BufEnter *.txt,*.tex,*.html,*.md,*.rst setlocal spell
    "autocmd BufEnter *.txt,*.tex,*.html,*.md,*.rst setlocal spelllang=en
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif
"------------------------------------------------------------


"------------------------------------------------------------
" Set colorscheme
colorscheme koehler  " ron
" Colour line numbers
hi LineNr ctermfg=grey
"------------------------------------------------------------


"------------------------------------------------------------
" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
:nnoremap \wn :match ExtraWhitespace /\s\+$/<CR>
:nnoremap \wf :match<CR>

"------------------------------------------------------------


"------------------------------------------------------------
" statusline
" add a title on top of the shell
" this reports the full filename making %F in statusline redundant
set title

hi User1 ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black cterm=bold gui=bold

" skip the mode as already shown in statusline
set noshowmode
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffText#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffChange#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Visual#%{(mode()=='v')?'\ \ VISUAL\ ':''}

set statusline+=%1*            " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}

set statusline+=\ %n:\ %t\     " file name

set statusline+=%#WarningMsg#
set statusline+=\ %h           " help file flag
set statusline+=%m             " modified flag
set statusline+=%r             " read only flag
set statusline+=%w             " write

set statusline+=%#LineNr#      " colour
set statusline+=\%=            " align left

" add syntastic warnings
set statusline+=%#WarningMsg#
set statusline+=%{SyntasticStatuslineFlag()}\  " syntastic

set statusline+=%#LineNr#       " colour
set statusline+=%y\             " filetype

set statusline+=%1*             " colour
set statusline+=\ %P\ %l,%c\    " percent row:col
"------------------------------------------------------------

