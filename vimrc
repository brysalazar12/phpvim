call pathogen#infect()
let mapleader=","
set nocompatible
set viminfo='1000,f1,:1000,/1000
set history=1000
filetype plugin on
set tabstop=4
set softtabstop=4
set shiftwidth=4 
set expandtab
set relativenumber
set number

"------ Persistent Undo (undo even after quit) ----
set undofile
set undodir=~/.vim/undodir

"------  Visual Options  ------
syntax on
"set number
"set nowrap
set vb
set ruler


" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" ,q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" ,Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" save using ,s
inoremap <Leader>s <esc><left> :update<CR><right>
nnoremap <Leader>s :update<CR>

" map escape to kj
inoremap kj <esc>


" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" ,v = Paste
map <Leader>v "+gP
inoremap <Leader>v <esc> "+gP

" ,c = Copy
map <Leader>c "+y

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Wtf is Ex Mode anyways?
nnoremap Q <nop>

"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch


" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>


"------  Buffer Navigation  ------
"" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>
"resize window of current buffer
nnoremap <C-RIGHT> :vertical resize +2<CR>
nnoremap <C-LEFT> :vertical resize -2<CR>
nnoremap <C-DOWN> :resize -2<CR>
nnoremap <C-UP> :resize +2<CR>


"------  Window Navigation  ------
"" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
noremap <Leader>1 :buffer 1<CR>
noremap <Leader>2 :buffer 2<CR>
noremap <Leader>3 :buffer 3<CR>
noremap <Leader>4 :buffer 4<CR>
noremap <Leader>5 :buffer 5<CR>
noremap <Leader>6 :buffer 6<CR>
noremap <Leader>7 :buffer 7<CR>
noremap <Leader>8 :buffer 8<CR>
noremap <Leader>9 :buffer 9<CR>
noremap <Leader>10 :buffer 10<CR>
noremap <Leader>11 :buffer 11<CR>
noremap <Leader>12 :buffer 12<CR>
noremap <Leader>13 :buffer 13<CR>
noremap <Leader>14 :buffer 14<CR>
noremap <Leader>15 :buffer 15<CR>
noremap <Leader>16 :buffer 16<CR>
noremap <Leader>17 :buffer 17<CR>
noremap <Leader>18 :buffer 18<CR>
noremap <Leader>19 :buffer 19<CR>
noremap <Leader>20 :buffer 20<CR>
noremap <Leader><tab> :b#<CR>




"---- NERDDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']

"setting root dir in NT also sets VIM's cd
"let NERDTreeChDirMode=2
"
"" Toggle visibility using ,n
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" These prevent accidentally loading files while focused on NERDTree
" autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
" autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
" autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
" autocmd FileType nerdtree noremap <buffer> <c-l> <nop>
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"---------- ultisnips ------------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---- PDV PHP Documentator for vim ----
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <F2> :call pdv#DocumentWithSnip()<CR>


"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
let temp = @@
norm! gvy
let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
let @@ = temp
endfunction


" vimgrep
" search current word in php file
nnoremap <F3> :noautocmd vimgrep /<C-R><C-W>/gj **/*.php <CR>
" search current word in js file
nnoremap <F5> :noautocmd vimgrep /<C-R><C-W>/gj **/*.js <CR>
" search visual selected text php file
vnoremap <F3> y :noautocmd vimgrep /<C-R>"/gj **/*.php <CR>

" open todo.txt
let cwd = getcwd()
let todovar = cwd . "/todo.txt"
nnoremap <F4> :execute 'edit ' . todovar <CR>
