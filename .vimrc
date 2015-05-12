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
set tabstop=4           " <tab> is 4 wide
set shiftwidth=4        " <shift> is 4 wide

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

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
