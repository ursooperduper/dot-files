"execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" ##############################################################################
" ##  Mouse Control                                                           ##
" ##############################################################################
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" ##############################################################################
" ## General                                                                  ##
" ##############################################################################
set novisualbell                        " no sounds
set noerrorbells
set autoread                            " reload files changed outside vim
set noswapfile
set nobackup
set nowb

" ##############################################################################
" ## Colors                                                                   ##
" ##############################################################################
set t_Co=256

set background=light
" colorscheme molokai
" colorscheme pencil
syntax enable                           " enable syntax proceessing

" ##############################################################################
" ## Spaces & Tabs                                                            ##
" ##############################################################################
set tabstop=2                           " number of visual spaces per TAB
set softtabstop=2                       " number of spaces in tab when editing
set shiftwidth=2
set expandtab                           " tabs are spaces
"set autoindent
"set smartindent
"set smarttab
"set nowrap                              " don't wrap lines
set linebreak                           " wrap lines at convenient spots

" ##############################################################################
" ## UI Config                                                                ##
" ##############################################################################
set number                              " show line numbers
set showcmd                             " show command in bottom bar
set showmode                            " show current mode at the bottom
set cursorline                          " highlight current line
filetype indent on                      " load filetype-specific indent files
set wildmenu                            " visual autocomplete for command menu
set lazyredraw                          " redraw only when we need to
set showmatch                           " highlight matching [{()}]
set ruler                               " always show current position
set cmdheight=2                         " set height of the command bar
set hid                                 " a buffer becomes hidden when abandoned

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" ##############################################################################
" ## Status Line                                                              ##
" ##############################################################################
set laststatus=2                        " always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l        " format the status line

" ##############################################################################
" ## Searching                                                                ##
" ##############################################################################
set incsearch                           " search as characters are entered
set hlsearch                            " highlight matches
" Mapped to ,<space>, this will remove highlights. You can also
" just type :nohlsearch, but this mapping may speed things up.
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase                           " ignore case when searching
set smartcase                            " be smart about cases when searching
set magic                                " for regular expressions, turn magic on

" ##############################################################################
" ## Folding                                                                  ##
" ##############################################################################
set foldenable                           " enable folding
set foldlevelstart=10                    " open most folds by default
set foldnestmax=10                       " 10 nested fold max
nnoremap <space> za                      " space open/closes folds
set foldmethod=indent                    " fold based on indent level

" ##############################################################################
" ## Leader Shortcuts                                                         ##
" ##############################################################################
let mapleader=","             " leader is comma
nnoremap <leader>u :GundoToggle<CR>      "toggle gundo, a great visual undo stack
nnoremap <leader>s :mksession<CR>        " save session (reopen session with vim -S)

" ##############################################################################
" ## Backups                                                                  ##
" ##############################################################################
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" ##############################################################################
" ## Helper Functions                                                         ##
" ##############################################################################
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

filetype plugin on

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"autocmd vimenter * NERDTree

map <leader>f :NERDTreeToggle<CR>

" close vim if the only thing open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"
" Configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Color Scheme Switcher Plugin
let g:colorscheme_switcher_keep_background = 1

let g:vim_markdown_folding_disabled=1

"source ~/vcomments.vim
"map <C-c> :call Comment()<CR>
"map <C-u> :call Uncomment()<CR>
