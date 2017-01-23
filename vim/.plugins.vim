if 0
	"Saved macro for auto opening repo based on plug command
	"Yank the following line into a register and execute
^f'"zyi';!open http://github.com/z
endif



call plug#begin()

" Syntax {{{
Plug 'scrooloose/syntastic'                            " Auto syntax checking, might be set up right?
Plug 'tpope/vim-git', { 'for': 'git' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'jelera/vim-javascript-syntax'                    " Javascript syntax
Plug 'pangloss/vim-javascript'                         " Javascript indent support
Plug 'sophacles/vim-processing'                        " Processing/Java syntax and indent support
Plug 'eagletmt/ghcmod-vim'                             " Haskell - Gaslow Haskell Compiler Vim integration
" Plug 'keith/swift.vim'                                 " Swift syntax
Plug 'kballard/vim-swift'                              " Better? Swift syntax

Plug 'vim-erlang/vim-erlang-runtime'                   " Erlang
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'

Plug 'adimit/prolog.vim'                               " Prolog

Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete', } " F#
Plug 'sheerun/vim-polyglot'                            " 70+ syntaxs
" }}}

" Visual sugar {{{
" Plug 'jeffkreeftmeijer/vim-numbertoggle'               " Switches from relative numbering to absolute when entering end exiting insert mode
Plug 'junegunn/goyo.vim'                               " Distraction free mode
Plug 'junegunn/limelight.vim'                          " Distraction free mode, paired with Goyo
Plug 'mhinz/vim-startify'                              " Fancy start screen
Plug 'reedes/vim-pencil'                               " Writing assist (I use for note taking
Plug 'kshenoy/vim-signature'                           " Display marks in gutter
Plug 'luochen1990/rainbow'                             " Rainbow parenthesis
Plug 'chrisbra/Colorizer'                              " Colors hex codes
Plug 'vimwiki/vimwiki'                                 " Take notes and keep todo lists
Plug 'zhaocai/GoldenView.Vim'                          " Auto resizes splits to the golden ratio for nice viewing
Plug 'tpope/vim-afterimage'                            " Edit ICO, PNG, and GIF icons.
Plug 'KabbAmine/vCoolor.vim'                           " Color picker <A-c>
Plug 'vim-airline/vim-airline'                         " Drop in vim statusline. Seems nice.
" }}}

" Text Editing utilities (moves text around) {{{
Plug 'AndrewRadev/sideways.vim'                        " :SidewaysLeft and :SidewaysRight to move function arguments && make argument objects with ia and aa
Plug 'AndrewRadev/splitjoin.vim'                       " gS and gJ to auto split and join blocks of code
Plug 'ervandew/supertab'                               " Tab for autocomplete
Plug 'junegunn/vim-easy-align'                         " ga to start aligning.
Plug 'jiangmiao/auto-pairs'                            " Auto closes pairs. <M-b> to jump back if mistake close pair. <M-e> to fast wrap.
Plug 'easymotion/vim-easymotion'                       " Easily jump to anywhere on screen
Plug 'kurkale6ka/vim-swap'                             " <Leader>x for autoswap a=1 to 1=a. <Leader>cx for prompt swap pivot
Plug 'mattn/emmet-vim', { 'for': 'html' }              " Emmet
Plug 'maxbrunsfeld/vim-yankstack'                      " <M-p> to paste from stack, mapping is broken af right now
Plug 'mjbrownie/swapit'                                " Use <C-a> and <C-x> to swap true/false etc.
Plug 'terryma/vim-multiple-cursors'                    " <C-n> to make new cursor next word under cursor.
Plug 'thirtythreeforty/lessspace.vim'                  " Automatically remove trailing whitespace
Plug 'tmux-plugins/vim-tmux'
Plug 'tommcdo/vim-exchange'                            " Normal mode cx{motion} to mark then same to switch. Visual mode is \X
Plug 'tpope/vim-abolish'                               " Working with variants of a word.
                                                       " :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{} --- to map iabbrev variants
                                                       " :%Subvert/facilit{y,ies}/building{,s}/g                                 --- to substitute variants
Plug 'tpope/vim-commentary'                            " gc to toggle comments
Plug 'tpope/vim-repeat'                                " Does some amazing magic to make a lot of plugins' mappings repeatable the . operator
Plug 'tpope/vim-sensible'                              " Sets a lot of default options to something reasonable
" Plug 'tpope/vim-sleuth'                                " Automatically sets the shiftwidth and expandtab based on this file and nearby similar files
Plug 'tpope/vim-surround'                              " ysiw( will surround the inner word with (). Same with cs and ds for change and delete
Plug 'tpope/vim-unimpaired'                            " Paired mappings for [<Space> cos col con etc. Check :h unimpaired.txt
Plug 'tpope/vim-eunuch'                                " Many Unix helpers
" }}}

" Organizers {{{
Plug 'mbbill/undotree', { 'on': 'UndoTreeToggle' }     " <F9> to toggle undo tree, havent found this to be very intitive.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " <F7> to open NerdTree for easy file tree browsing
" Plug 'majutsushi/tagbar', { 'on': 'TagBarToggle' }     " <F8> to toggle tagbar
Plug 'majutsushi/tagbar'                               " <F8> to toggle tagbar
Plug 'tpope/vim-vinegar'                               " Press '-' in normal mode to open netrw in current buffer, awkward.
Plug 'vim-ctrlspace/vim-ctrlspace'                     " Super complex space manager. Manages buffers, windows, tabs, workspaces, and file switching inside bookmarked projects
" Plug 'vim-scripts/bufexplorer.zip'                     " \be \bs \bv to open buffer manager. Seems kinda useless now that I use Ctrl-Space
" }}}

" External utilities {{{
Plug 'szw/vim-g'                                       " :Google
Plug 'junegunn/gv.vim'                                 " git commit browser :GV
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }             " :Dash to emulate K command in Dash (OSX only)
Plug 'rking/ag.vim', { 'on': 'Ag' }                    " :Ag to run silver searcher
Plug 'tpope/vim-fugitive'                              " :GStatus for git status :Gcommit for git commit etc
Plug 'tpope/vim-dispatch'
" Plug 'thinca/vim-quickrun'                             " This plugin has proved unstable
" }}}

" Unite {{{
Plug 'Shougo/unite.vim'                                " Bound space to pull searchable info from sources, kinda clunky in my workflow so far
Plug 'Shougo/vimproc.vim', { 'do': 'make' }            " Dependancy for unite.vim, multithreading?

Plug 'Shougo/unite-outline'                            " Sources for Unite.vim
Plug 'Shougo/unite-help'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-sudo'
Plug 'Shougo/neomru.vim'
Plug 'naquad/unite-digraphs'
Plug 'ujihisa/unite-colorscheme'
" }}}

" Text objects {{{
Plug 'wellle/targets.vim'                              " Text objects including NEXT text objects with cin(
" Plug 'kana/vim-textobj-user'                           " Framework for text objects, dependancy of all below
" Plug 'glts/vim-textobj-comment'                        " ic and ac for comments
" Plug 'kana/vim-textobj-function'                       " if and af for functions
" Plug 'kana/vim-textobj-fold'                           " iz and az for folds
" Plug 'Julian/vim-textobj-brace'                        " ij and aj for innermost brace
" }}}


call plug#end()
