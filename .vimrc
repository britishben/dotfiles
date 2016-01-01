" BPMcKenna's VimRC

""""""""""""
" BOOLEANS "
""""""""""""

set nocompatible        " don't force vi compatability
set history=10000       " how many lines vim should remember
syntax enable           " enable syntax processing
set mouse=a             " Enable mouse support in console
set number              " show line numbers
set showcmd             " show (partial) command in bottom bar
set ruler               " show cursor position
set t_Co=256            " 256 colours
set background=dark     " pick colours for dark backgrounds
set autoread            " If a file is changed outside of vim, reload it without asking
set lazyredraw          " redraw only when we need to (not during macros)
set showmatch           " highlight matching [{()}]
set autoindent          " indent newline to match previous line
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set expandtab           " turn <tab>s into spaces
"set smarttab			" turn <tab>s into indents at the beginning of a line
set softtabstop=4		" keypress <tab> is 4 wide
set tabstop=4           " existing <tab> is 4 wide
set shiftwidth=4        " indent is 4 wide
set nojoinspaces		" one space after punctuation
set spelllang=en        " use {set spell} to enable spellchecking
set spellfile=~/.vimspell.utf-8.add

let g:netrw_liststyle=3       "Nerdtree-style explorer mode

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
" WILDMENU "
""""""""""""

" visual autocomplete for command menu
set wildmenu 
" ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

""""""""""
" REMAPS "
""""""""""

" ev opens this file.
":nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" sv reloads this config.
":nnoremap <leader>sv :source $MYVIMRC<cr>  

inoremap jk <esc>   " make jk quit insert mode

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
