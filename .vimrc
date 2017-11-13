""""""
" => Vundle Config
""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

""""""                                                                                               
" => Colors
""""""
syntax on " enable syntax processing

""""""
" => Spaces and Tabs
""""""
set tabstop=2 " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces

""""""
" => UI Config
""""""
set number " show line numbers
set relativenumber " show relative line numbers
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw less, faster macros
set showmatch " highlights matching [{()}]

""""""
" => Searching
""""
set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

""""""
" => Folding
""""""
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" space open/closes fold around current block
nnoremap <space> za
set foldmethod=indent " fold based on indent level

""""""
" => Moving
""""""
" move vertically by visual lines
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ don't do anything now
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
 
""""""
" => Leader
""""""
let mapleader="," " leader is the comma
" jk is escape
inoremap jk <esc> 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-J> <C-W><C-K>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow 
set splitright 

""""""
" => From Reddit
""""""
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
