"  ___                 __   ___              
" | _ ) ___ _ _  )___ \ \ / (_)_ __  _ _ __ 
" | _ \/ -_) ' \/(_-<  \ V /| | '  \| '_/ _|
" |___/\___|_||_|/__/   \_/ |_|_|_|_|_| \__|
                                            

" Source all external configs first
source ~/.config/nvim/.plugins.vim

" set diffopt=filler,vertical

" set listchars=tab:▸\ ,eol:¬,space:⋅
" set shell=/bin/zsh
let mapleader = "\<Space>"

" Re-source this file
nnoremap <Leader>so :so $MYVIMRC<CR> :echo "Sourced $MYVIMRC"<CR>
nnoremap <Leader>vim :e $MYVIMRC<CR>
nnoremap <Leader>plug :e .plugins.vim<CR>

" Mapping for quick finding git repos inside ' ' marks
nnoremap <Leader>gitopen ^f'"gyi':!open http://github.com/g

" Silently source any ".vimlocal" file in current directory; if exists
silent! so .vimlocal

" [[ mappings
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Easy multiline navigation
xnoremap j gj
xnoremap k gk

" Insert Mode  word wise
inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" Switch zg and zG as I find them unintuitive. Lowercase should be for local
" while uppercase should be for global list
nnoremap zg zG
nnoremap zG zg
nnoremap zug zuG
nnoremap zuG zug

" Fold text object
xnoremap iz :<C-U>silent!normal![zV]z<CR>
onoremap iz :normal viz<CR>

" Make Y consistent with D and C
noremap Y y$

" sudo vim
cmap w!! %!sudo tee > /dev/null %

" NEED BINDING FOR AUTOCORRECT LAST SPELLING MISTAKE
inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <c-f> [s1z=<c-o>

" Atomic xp
nnoremap <silent> <Plug>TransposeCharacters xph :call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters

" Make Q something useful
nnoremap Q @q

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Argument objects from sideways.vim
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Autospell 1
nnoremap z== 1z=

" vim-easy-align, easy align bindings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" VTR [Vim Tmux Runner]
let g:VtrOrientation = "h"
let g:VtrUseVtrMaps = 1
" let g:VtrClearSequence = ""
let g:VtrClearSequence = ""
nnoremap <leader>ar :VtrAttachToPane<cr>
nnoremap <leader>si :VtrSendCommandToRunner <cr>

let g:seek_enable_jumps = 1

" Rainbow parenthesis
let g:rainbow_active = 1

"NerdTree Toggle ;;
nnoremap <F7> :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=1

" Normally don't use netrw but sometime I end up in it.
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

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

"=======================================
" Tmux compatible cursor shapes in vim!
"=======================================
if empty($TMUX)
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif




" Sillyness {{{
" Press <Leader>rot to start rotating lines and <C-c> (Control+c) to stop.

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

nmap <leader>rot <Plug>(RotateLines)
" }}}
"
" vim: foldmethod=marker
