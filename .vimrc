" BPM's VimRC

""""""""""""
" BOOLEANS "
""""""""""""
set nocompatible          " don't force vi compatability - useless?
set history=10000         " how many lines vim should remember
syntax enable             " enable syntax processing
set mouse=a               " Enable mouse support in console
set visualbell            " Turn off sound
set number                " show line numbers
set showcmd               " show (partial) command in bottom bar
set ruler                 " show cursor position
set autoread              " If a file is changed outside of vim, reload it without asking
set lazyredraw            " redraw only when we need to (not during macros)
set showmatch             " highlight matching [{()}]
set autoindent            " indent newline to match previous line
set smarttab              " turn <tab>s into indents at the beginning of a line
set scrolloff=3           " 3 lines of context on page scroll
set spelllang=en_gb       " use {set spell} to enable spellchecking
set spellfile=~/.vim/.vimspell.utf-8.add
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set ffs=unix

runtime macros/matchit.vim    "Extended % matching if/else/etc

""""""""""""""
" WHITESPACE "
""""""""""""""
set expandtab             " turn <tab>s into spaces
set nojoinspaces          " one space after punctuation
set shiftwidth=4          " indent is 4 wide
set softtabstop=4         " keypress <tab> is 4 wide
set tabstop=4             " existing <tab> is 4 wide

"""""""""""
" COLOURS "
"""""""""""
colorscheme desert
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

if has("wildmenu")
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.o,*.a,*.pyc " ignore compiled files
    set wildignore+=*.swp,*.tmp,*~ " ignore temp files
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

""""""""""
" REMAPS "
""""""""""

"\ev opens this file.
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"\sv reloads this config.
:nnoremap <leader>sv :source $MYVIMRC<cr>

"inoremap jk <esc>   " make jk quit insert mode

" Y yanks to the end of the line, not the whole line.
:nnoremap Y y$

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

"set modeline

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Catch trailing whitespace
set listchars=tab:»-,trail:∙,nbsp:•,precedes:←,extends:→,eol:¶
nmap <silent> <leader>s :set nolist!<CR>
