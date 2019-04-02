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
" show which line changed using git
Plug 'airblade/vim-gitgutter'


call plug#end()

set nocompatible


" ###################
" ### Plugin conf ###
" ###################

" syntastic
" :SyntasticCheck , :Errors
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1  " :SyntasticCheck
let g:syntastic_check_on_wq = 0

" git
" -- vim-gitgutter
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk


" File Management
" unite + ag (requires package: silversearcher-ag)
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" --- type ¬ to search the string under the cursor in all files in the current 
"  dir
nmap ¬ :Ag <c-r>=expand("<cword>")<cr><cr>
" --- type <space>/ to search all occurrences of a given string in all files
"  in the current directory
nnoremap <space>/ :Ag 



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
" Colour the limit column 
if (exists('+colorcolumn'))
    set colorcolumn=   "80
    highlight ColorColumn ctermbg=0 guibg=lightgrey
endif
"------------------------------------------------------------


"------------------------------------------------------------
" Set colorscheme
colorscheme koehler  " ron
" Colour line numbers
hi LineNr ctermfg=grey
" clear the colour of the mode 
hi clear ModeMsg
hi ModeMsg term=bold cterm=bold gui=bold 
"------------------------------------------------------------


"------------------------------------------------------------
" statusline

" change the colour of the statusline based on mode
if version >= 700
  au InsertEnter * hi statusline guibg=Red1 ctermfg=15 guifg=White ctermbg=1
  au InsertLeave * hi statusline guibg=Black ctermfg=15 guifg=White ctermbg=0
endif
" default the statusline to white when entering Vim
hi statusline guibg=Black ctermfg=15 guifg=White ctermbg=0

" Formats the statusline
set statusline=%F\                           " file name
set statusline+=\%=                          "align left

" Puts in syntastic warnings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Puts in the current git status
"set statusline+=%{FugitiveStatusline()}
" the above status line can take a lot of space cutting the filename when
" vertical windows are open. As this information is not necessary all the time 
" it makes more sense to have specific commands. See below

set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %p%%\ %l:%c\ b%n    "percent row:col buffer
"------------------------------------------------------------


"------------------------------------------------------------
" fugitive git bindings
nnoremap ga :Git add %:p<CR><CR>
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit -v -q %:p<CR>
nnoremap gd :Gdiff<CR>
nnoremap gb :Git branch<Space>
"------------------------------------------------------------

