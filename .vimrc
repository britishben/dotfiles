" BPM's VimRC

""""""""""""
" BOOLEANS "
""""""""""""
set nocompatible          " don't force vi compatibility - useless?
syntax enable             " enable syntax processing
set history=500           " how many lines vim should remember
set visualbell            " Turn off sound
set ttyfast               " Terminal is fast
set modelines=0           " Don't use them, so no loss here
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch             " show matching parenthesis
set nowrap                " don't wrap lines
if has('mouse')
    set mouse=a               " Enable mouse support in console
endif
set number                " show line numbers
set showcmd               " show (partial) command in bottom bar
set ruler                 " show cursor position
set autoread              " If a file is changed outside of vim, reload it without asking
set lazyredraw            " redraw only when we need to (not during macros)
set showmatch             " highlight matching [{()}]
set smarttab              " turn <tab>s into indents at the beginning of a line
set scrolloff=3           " 3 lines of context on page scroll
set sidescrolloff=3       " 3 characters margin when scrolling right
set spelllang=en_gb       " use {set spell} to enable spellchecking
set spellfile=~/.vim/.vimspell.utf-8.add

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set ffs=unix

runtime macros/matchit.vim " Extended % matching if/else/etc

"""""""""""
" PLUGINS "
"""""""""""
if !has("compatible")   "don't load plugins in vi mode

let autoload_dir=expand('~/.vim/autoload')
if !isdirectory(autoload_dir)
    call mkdir(autoload_dir, "p", 0700)
endif

let vim_plug=autoload_dir.'/plug.vim'
if !filereadable(vim_plug)
    let vim_plug_loc="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    if executable("curl")
        silent !curl -fLo vim_plug vim_plug_loc
    elseif executable("wget")
        silent !wget -qO vim_plug vim_plug_loc
    elseif executable("ftp")
        silent !ftp -io vim_plug vim_plug_loc
    else
        echo "Can't download " vim_plug_loc "\n"
        exit 1
    endif
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if exists("g:loaded_plug")
    call plug#begin('~/.vim/plugged')
    Plug 'fatih/vim-go'
    call plug#end()
endif

endif "compatible

""""""""""""""
" WHITESPACE "
""""""""""""""
set expandtab             " turn <tab>s into spaces
set nojoinspaces          " one space after punctuation
set shiftwidth=4          " indent is 4 wide
set softtabstop=4         " keypress <tab> is 4 wide
set tabstop=4             " existing <tab> is 4 wide
set autoindent            " indent newline to match previous line
set copyindent            " copy the previous indentation on autoindenting

"""""""""""
" COLOURS "
"""""""""""
silent! colorscheme desert
set background=dark       " pick colours for dark backgrounds
set t_Co=256              " 256 colours

""""""""""
" SPLITS "
""""""""""
set splitbelow          " new split at bottom
set splitright          " new split at right

" Easier split navigation (remove Ctrl-W first)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

""""""""""""
" SEARCHES "
""""""""""""
set ignorecase            " Do case insensitive matching
set smartcase             " Do smart case matching
set incsearch             " Incremental search
set hlsearch              " highlight search terms

if has("wildmenu")
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.o,*.a,*.pyc                  " ignore compiled files
    set wildignore+=*.swp,*.tmp,*~                " ignore temp files
    set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.ico " ignore images
    if has("win16") || has("win32")
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    else
        set wildignore+=.git\*,.hg\*,.svn\*
    endif
endif

"""""""""""""""""
" NETRW EXPLORE "
"""""""""""""""""
let g:netrw_banner=0          "Show/Hide netrw banner
let g:netrw_liststyle=3       "Nerdtree-style explorer mode
let g:netrw_browsesplit=4     "Open file in previous window
let g:netrw_altv=1            "Not sure what this does :P
let g:netrw_winsize=25        "Percentage of window to take up

"Open with \ex
:nnoremap <leader>ex :Vex<cr>

""""""""""
" REMAPS "
""""""""""

"\ev opens this file.
:nnoremap <leader>ev :split $MYVIMRC<cr>
"\sv reloads this config.
:nnoremap <leader>sv :source $MYVIMRC<cr>

"Y yanks to the end of the line, not the whole line.
:nnoremap Y y$

"Shift-Tab to get a real \t
:inoremap <S-Tab> <C-V><Tab>

"Return clears Search
":nnoremap <cr> :noh<cr><cr>
":nnoremap <cr> :let @/ = ""

"""""""""""""
" OVERRIDES "
"""""""""""""

" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Handle Vue plugins
autocmd BufNewFile,BufRead *.vue set filetype=javascript

"""""""""""""""""
" ABBREVIATIONS "
"""""""""""""""""

iabbrev @@  britishben@gmail.com

"""""""
" EOF "
"""""""

""""""""""""""""
" EXPERIMENTAL "
""""""""""""""""

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" Catch trailing whitespace with \s
set listchars=tab:»-,trail:∙,nbsp:•,precedes:←,extends:→,eol:¶
nmap <silent> <leader>s :set nolist!<CR>

" sudo write
ca w!! w !sudo tee >/dev/null "%"
