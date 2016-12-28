call pathogen#infect() 

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=DarkGray
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgray
colorscheme default
set vb t_vb=
set backspace=indent,eol,start
set guifont=Monaco:h12
set incsearch
set smartcase
set cindent
set hlsearch
set nowrap
set scrolloff=5
set tabstop=2
set shiftwidth=2
set expandtab
set wildmode=longest,list
set background=dark
set wrap
set ruler
set nu
set foldmethod=manual
set foldnestmax=1
set mouse=a
set clipboard=unnamed
syntax on
:filetype on
filetype plugin indent on
:autocmd FileType c,cpp,perl,php :set nocindent
set nocompatible
set wildmode=list:longest

nnoremap <C-s> :update<CR>
cnoremap <C-s> <Esc>:update<CR>
inoremap <C-s> <Esc>:update<CR>
" nnoremap <C-p> :w<CR><Esc>:!pdflatex % &<CR>
" cnoremap <C-p> <Esc>:w<CR><Esc>:!pdflatex % &<CR>
" inoremap <C-p> <Esc>:w<CR><Esc>:!pdflatex % &<CR>

noremap  <buffer> <silent> j      gj
noremap  <buffer> <silent> k      gk
noremap  <buffer> <silent> <Up>   gk
noremap  <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End>  g<End>
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
inoremap <buffer> <silent> <Home> <C-o>g<Home>
inoremap <buffer> <silent> <End>  <C-o>g<End>

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
""  :20 : up to 20 lines of command-line history will be remembered"  
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

set dir=~/.vim/tmp/swap/
set backupdir=~/.vim/tmp/backup/
set undodir=~/.vim/tmp/undo/
