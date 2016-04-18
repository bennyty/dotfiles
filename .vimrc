" |3[-|\|'_\" .\/||\/||2(

" Source all external configs first
source ~/.vim/.plugins.vim
" Unite!
source ~/.vim/.uniteSettings.vim

syntax on
filetype plugin indent on

set t_Co=256
syntax on
set background=dark
colorscheme Ben-Molokai

set smartcase
set autoindent
set autowrite
set autoread
set number
set showcmd
set hidden
set ignorecase
set foldmethod=marker
"set foldlevelstart=1000
" set foldlevelstart=2
set foldnestmax=1
set foldenable

set shiftwidth=4
set tabstop=4
set softtabstop=0
set noexpandtab

set listchars=tab:▸\ ,eol:¬

" Re-source this file
nnoremap <Leader>so :so $MYVIMRC<CR> :echo "Sourced $MYVIMRC"<CR>
nnoremap <Leader>vim :e $MYVIMRC<CR>
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Automatically set foldlevel to max fold level in buffer + 1
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Mapping for quick finding git repos inside ' ' marks
nnoremap <Leader>gitopen ^f'"gyi':!open http://github.com/g

" [[ mappings
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" Easy multiline navigation
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
xnoremap j gj
xnoremap k gk

" Leader k to lookup because K is remapped
nmap <Leader>k <Plug>DashSearch

" Faster Movement
noremap J 5gj
noremap K 5gk

" Make Y consistent with D and C
noremap Y y$

" Atomic xp
nnoremap <silent> <Plug>TransposeCharacters xph :call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters

" I hit q way too often
nnoremap Q q
nnoremap q <Nop>

" vim-wiki conflict with Ctrl-Space
nmap <Nop> <Plug>VimwikiTabIndex
nmap <Leader>wt <Plug>VimwikiToggleListItem

" No Processing
let g:processing_no_default_mappings = 1 " Disable default mappings
let g:processing_fold = 1

" Argument objects from sideways.vim
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Autospell 1
nnoremap z== 1z=

" GoldenView Bindings
let g:goldenview__enable_default_mapping = 0 "Disable default mappings

nmap <C-w>w <Plug>GoldenViewNext
nmap <silent> <C-s> <Plug>GoldenViewSplit
nmap <C-w><Space> <Plug>GoldenViewSwitchMain

" Disable M-p from AutoPairs so that YankStack can use it
let g:AutoPairsShortcutToggle = ''
" let g:AutoPairsFlyMode = 1

" Easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vim-easy-align, easy align bindings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" No more stupid shift key
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
nnoremap q; q:

" Easier write files with spaces {{{
command! -bang -nargs=* W :call W(<q-bang>, <q-args>) 

function! W(bang, filename) 
	:exe "w".a:bang." ". substitute(a:filename, ' ', '\\ ', 'g') 
endfu
" }}}

" Exchange default mappings
nmap cx <Plug>(Exchange)
xmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

" Swap default mappings
vnoremap <Leader>x  <Plug>SwapSwapOperands
vnoremap <Leader>cx <Plug>SwapSwapPivotOperands
nnoremap <Leader>x  <Plug>SwapSwapWithR_WORD
nnoremap <Leader>X  <Plug>SwapSwapWithL_WORD

" Rainbow parenthesis
let g:rainbow_active = 1

"NerdTree Toggle ;;
nnoremap <F7> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1

"Tagbar Toggle {{{
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_compact = 1
let g:tagbar_width = 40
" }}}

" Undo Tree Toggle
nnoremap <F9> :UndoTreeToggle<CR>

"=============
" EASY MOTION
"=============
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap <Space> <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>e <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"============
" SimpleFold
"============
function! Num2S(num, len)
	let filler = "                                                            "
	let text = '' . a:num
	return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

function! FoldText()
	let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
	let diff = v:foldend - v:foldstart + 1
	return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
endfunction

set foldtext=FoldText()

" Ctrl-Space ag
if executable("ag")
	let g:CtrlSpaceGlobCommand = 'ag -l --hidden --ignore .git --nocolor -g ""'
endif

"=======================================
" Tmux compatible cursor shapes in vim!
"=======================================
if empty($TMUX)
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif






" Sillyness {{{
" Press \rot to start rotating lines and <C-c> (Control+c) to stop.

function! s:RotateString(string)
    let split_string = split(a:string, '\zs')
    return join(split_string[-1:] + split_string[:-2], '')
endfunction

function! s:RotateLine(line, leading_whitespace, trailing_whitespace)
    return substitute(
        \ a:line,
        \ '^\(' . a:leading_whitespace . '\)\(.\{-}\)\(' . a:trailing_whitespace . '\)$',
        \ '\=submatch(1) . <SID>RotateString(submatch(2)) . submatch(3)',
        \ ''
    \ )
endfunction

function! s:RotateLines()
    let saved_view = winsaveview()
    let first_visible_line = line('w0')
    let last_visible_line = line('w$')
    let lines = getline(first_visible_line, last_visible_line)
    let leading_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''^\s*'')'
    \ )
    let trailing_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''\s*$'')'
    \ )
    try
        while 1 " <C-c> to exit
            let lines = map(
                \ range(len(lines)),
                \ '<SID>RotateLine(lines[v:val], leading_whitespace[v:val], trailing_whitespace[v:val])'
            \ )
            call setline(first_visible_line, lines)
            redraw
            sleep 50m
        endwhile
    finally
        if &modified
            silent undo
        endif
        call winrestview(saved_view)
    endtry
endfunction

nnoremap <silent> <Plug>(RotateLines) :<C-u>call <SID>RotateLines()<CR>

nmap \rot <Plug>(RotateLines)
" }}}
"
