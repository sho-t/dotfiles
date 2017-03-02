" KeyMap Setting--------------------------
noremap ; :

" Move 
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"Yank & Paste
noremap <silent> Y y$
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"VisualMode indent
vnoremap < <gv
vnoremap > >gv

"It as Esc
inoremap jj <Esc>
inoremap <silent> っj <ESC>

"Off the highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" Delete option 
nnoremap dh d0
nnoremap dl d$
noremap PP "0p
noremap x "_x

"Bring the search word to the center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"Move with wrapped text
nnoremap j gj
nnoremap k gk

"Increment & Decrement
nnoremap + <C-a>
nnoremap - <C-x>

"Select until the end of the line
vnoremap v $h

"Space
noremap <Space>h ^
noremap <Space>l $
noremap <Space>j <C-f>
noremap <Space>k <C-b>
noremap <Space>w :w<CR>
noremap <Space>q :q<CR>

"Jump to corresponding parenthesis
nnoremap <Tab> %
vnoremap <Tab> %

"Winddow Option
nnoremap s <Nop>
"new
nnoremap sn :<C-u>new
nnoremap sv :<C-u>vne

"move
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
