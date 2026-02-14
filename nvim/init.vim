" Plugins
" Use the neovim command in the vim-plug repo to install: https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'tinted-theming/base16-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi' " Use readline/emacs shortcuts in insert mode and the command line
Plug 'michaeljsmith/vim-indent-object'
Plug 'bfrg/vim-cpp-modern' " Better C/C++ syntax highlighting
Plug 'dag/vim-fish' " Syntax highlighting for fish script
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter-based highlighting

call plug#end()

" Gruvbox theme
colorscheme base16-gruvbox-dark-hard
hi CursorLineNr guifg=gui04 guibg=gui00
set termguicolors

" Disable italics in comments
hi Comment cterm=none gui=none
hi link LspCxxHlGroupMemberVariable Normal

" Show line numbers
set number

" Highlight current line number
set cursorline
hi cursorline guibg=NONE

" Allow copying from and pasting to OS clipboard
set clipboard=unnamed

" Hide insert and visual indicator at the bottom since I am using lightline
set noshowmode

" Change <esc> delay to 5 ms
" This eliminates the delay when switching between insert and normal modes
set timeoutlen=300
set ttimeoutlen=5

" Enable mouse support
set mouse=a

" Set tab equal to 4 spaces since that's what I use most often
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent autoindent

" Show a 100-character-wide ruler/column and wrap text at 100 characters
set colorcolumn=100
set textwidth=100

" Make search case-insensitive unless a capital letter is specifically typed
set ignorecase
set smartcase

" Start searching as you type instead waiting to press enter
set incsearch

" Persistent undo
set undodir=~/.local/share/nvim/undo
set undofile

" Change C comment string to double-slash (//)
autocmd FileType c setlocal commentstring=//\ %s

" Having a longer updatetime (default is 4000 ms) leads to noticeable delays and poor user 
" experience, so we set it to a faster 300 ms
set updatetime=300

" Show signs and line numbers in the same column
set signcolumn=number

" Map leader to space
let mapleader = ' '

" Faster save shortcut (Space + w)
nmap <leader>w :w<CR>

" Easily paste last yanked text
nmap <leader>p "0p
nmap <leader>P "0P

" Disable Ex mode since I never intend to use it
nmap Q <Nop>

" Make it easier to enter commands
nmap ; :

" Map Ctrl+j to Escape to make it easier to go to normal mode
if !exists('g:vscode')
    " For some bizarre reason, having this enabled in the VSCode Neovim extension causes all sorts 
    " of trouble with pasting text, and only when C-j is used as the keybinding. So, we won't 
    " enable it in VSCode.
    nnoremap <C-j> <Esc>
    inoremap <C-j> <Esc>
    vnoremap <C-j> <Esc>
    snoremap <C-j> <Esc>
    xnoremap <C-j> <Esc>
    cnoremap <C-j> <C-c>
    onoremap <C-j> <Esc>
    lnoremap <C-j> <Esc>
    tnoremap <C-j> <Esc>
endif

" Use vim-commentary keybindings for commenting in VSCode
if exists('g:vscode')
    xmap gc <Plug>VSCodeCommentary
    nmap gc <Plug>VSCodeCommentary
    omap gc <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
    nmap gC <Plug>VSCodeCommentaryLine
endif

" Disable arrow keys so that I am forced to use vim navigation keys
nnoremap <Left> :echoe 'Use h'<CR>
nnoremap <Right> :echoe 'Use l'<CR>
nnoremap <Up> :echoe 'Use k'<CR>
nnoremap <Down> :echoe 'Use j'<CR>

" Clear search results with Ctrl + l
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
