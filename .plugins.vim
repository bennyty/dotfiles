if 0
	"Saved macro for auto opening repo based on plug command
	"Yank the following line into a register and execute
^f'"zyi';!open http://github.com/z
endif
call plug#begin()

Plug 'AndrewRadev/sideways.vim'                        " :SidewaysLeft and :SidewaysRight to move function arguments && make argument objects with ia and aa
Plug 'AndrewRadev/splitjoin.vim'                       " gS and gJ to auto split and join blocks of code
Plug 'KabbAmine/vCoolor.vim'                           " Color picker <A-c>

Plug 'Shougo/unite.vim'                                " Bound space to pull searchable info from sources, kinda clunky in my workflow so far
Plug 'Shougo/vimproc.vim', { 'do': 'make' }            " Dependancy for unite.vim, multithreading?

Plug 'Shougo/unite-outline'                            " Sources for Unite.vim
Plug 'Shougo/unite-help'
Plug 'sgur/unite-everything'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-sudo'
Plug 'Shougo/neomru.vim'
" Plug 'Shougo/vinarise.vim'

Plug 'chrisbra/Colorizer'                              " Colors hex codes
Plug 'easymotion/vim-easymotion'                       " Easily jump to anywhere on screen
Plug 'ervandew/supertab'                               " Tab for autocomplete
Plug 'jeffkreeftmeijer/vim-numbertoggle'               " Switched from relative numbering to absolute when entering end exiting insert mode
Plug 'jiangmiao/auto-pairs'                            " Auto closes pairs. <M-b> to jump back if mistake close pair. <M-e> to fast wrap.
Plug 'junegunn/gv.vim'                                 " git commit browser :GV
Plug 'junegunn/limelight.vim'                          " Distraction free mode, paired with Goyo
Plug 'junegunn/vim-easy-align'                         " ga to start aligning.

" Plug 'kana/vim-textobj-user'                           " Framework for text objects, dependancy of all below
" Plug 'glts/vim-textobj-comment'                        " ic and ac for comments
" Plug 'kana/vim-textobj-function'                       " if and af for functions
" Plug 'kana/vim-textobj-fold'                           " iz and az for folds
" Plug 'Julian/vim-textobj-brace'                        " ij and aj for innermost brace

Plug 'luochen1990/rainbow'                             " Rainbow parenthesis
Plug 'kshenoy/vim-signature'                           " Display marks in gutter
Plug 'kurkale6ka/vim-swap'                             " <Leader>x for autoswap a=1 to 1=a. <Leader>cx for prompt swap pivot
Plug 'majutsushi/tagbar'                               " <F8> to toggle tagbar
Plug 'maxbrunsfeld/vim-yankstack'                      " <M-p> to paste from stack, broken af right now
Plug 'mhinz/vim-startify'                              " Fancy start screen
Plug 'mbbill/undotree', { 'on': 'UndoTreeToggle' }     " <F9> to toggle undo tree, havent found this to be very intitive.
Plug 'pangloss/vim-javascript'                         " Javascript syntax and indent support
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }             " :Dash to emulate K command in Dash (OSX only)
Plug 'rking/ag.vim'                                    " :Ag to run silver searcher
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " <F7> to open NerdTree for easy file tree browsing
Plug 'scrooloose/syntastic'                            " Auto syntax checking, might be set up right?
Plug 'sophacles/vim-processing'                        " Processing/Java syntax and indent support
Plug 'szw/vim-g'                                       " :Google
Plug 'terryma/vim-multiple-cursors'                    " <C-n> to make new cursor next word under cursor.
Plug 'tmux-plugins/vim-tmux'
Plug 'tommcdo/vim-exchange'                            " Normal mode cx{motion} to mark then same to switch. Visual mode is \X
Plug 'tpope/vim-abolish'                               " Working with variants of a word.
                                                       " :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{} --- to map iabbrev variants
                                                       " :%Subvert/facilit{y,ies}/building{,s}/g                                 --- to substitute variants
Plug 'tpope/vim-afterimage'                            " Edit ICO, PNG, and GIF icons.
Plug 'tpope/vim-commentary'                            " gc to toggle comments
Plug 'tpope/vim-fugitive'                              " :GStatus for git status :Gcommit for git commit etc
Plug 'tpope/vim-repeat'                                " Does some amazing magic to make a lot of plugins' mappings repeatable the . operator
Plug 'tpope/vim-sensible'                              " Sets a lot of default options to something reasonable
Plug 'tpope/vim-surround'                              " ysiw( will surround the inner word with (). Same with cs and ds for change and delete
Plug 'tpope/vim-unimpaired'                            " Paired mappings for [<Space> cos col con etc. Check :h unimpaired.txt
Plug 'tpope/vim-vinegar'                               " Press '-' in normal mode to open netrw in current buffer, awkward.
Plug 'wellle/targets.vim'                              " Text objects including NEXT text objects with cin(
Plug 'vim-airline/vim-airline'                         " Drop in vim statusline. Seems nice.
Plug 'vim-ctrlspace/vim-ctrlspace'                     " Super complex space manager. Manages buffers, windows, tabs, workspaces, and file switching inside bookmarked projects
Plug 'vim-scripts/bufexplorer.zip'                     " \be \bs \bv to open buffer manager. Seems kinda useless now that I use Ctrl-Space
Plug 'zhaocai/GoldenView.Vim'                          " Auto resizes splits to the golden ratio for nice viewing

call plug#end()
