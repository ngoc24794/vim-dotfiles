" Leader key
nnoremap <SPACE> <Nop>
let mapleader=' '

" Fuzzy finder
" Sibling files
nnoremap <silent> <Space>. :Files <C-r>=expand("%:h")<CR>/<CR>
map <leader>ff :Files<CR>
map <leader>bb :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <leader>r :History<CR>
" Commits command
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Space>C :Commits<CR>
nnoremap <silent> <Space>c :BCommits<CR>

" Insert or delete a above/below empty line
nnoremap <silent><leader>h m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>l m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" File browser
let NERDTreeShowHidden=1
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <leader>o :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Quit document
nnoremap <silent><leader>q :q<CR>

" Save document
noremap <silent><leader>ww :w<CR>
noremap <silent><leader>wa :wa<CR>

" Escape insert mode
inoremap jk <ESC>

" Escape terminal mode
tnoremap jk <ESC>

" Airline tabs
nnoremap <silent><leader><tab> :bn<CR>
nnoremap <silent><leader><S-tab> :bp<CR>
nnoremap <silent><leader>bd :bd<CR>

" Navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shortcut for far.vim find
nnoremap <silent> <C-f>  :Farf<cr>
vnoremap <silent> <C-f>  :Farf<cr>

" Shortcut for far.vim replace
nnoremap <silent> <leader>fr  :Farr<cr>
vnoremap <silent> <leader>fr  :Farr<cr>

nnoremap <silent> <leader>gd  :GitGutterDiffOrig<cr>

" Prettier format code
nnoremap gp :silent %!prettier --stdin-filepath %<CR>
