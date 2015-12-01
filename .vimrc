execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai

set smartcase
set autoindent
set number

set shiftwidth=4
set softtabstop=4
set expandtab

" Easy multiline navigation
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Enter and shift enter to pad lines
nnoremap <C-CR> o<Esc>
nnoremap <S-CR> O<Esc>

" GoldenView Bindings
let g:goldenview__enable_default_mapping = 0 " Disable default mappings

nnoremap <C-w>w <Plug>GoldenViewNext
nnoremap <C-g> <Plug>GoldenViewSplit
nnoremap <C-w><Space> <Plug>GoldenViewSwitchMain

" Easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" no more stupid shift key
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" EASY MOTION
" ===========
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap <Space> <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Space> <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
