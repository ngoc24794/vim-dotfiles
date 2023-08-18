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

" Coc extension
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <F2> <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>Re <Plug>(coc-codeaction-refactor)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
