if 0
	"Saved macro for auto opening repo based on plug command
	"Yank the following line into a register and execute
^f'"zyi';!open http://github.com/z
endif


call plug#begin()

" Syntax {{{
Plug 'tpope/vim-git', { 'for': 'git' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'pangloss/vim-javascript'                         " Javascript indent support
Plug 'posva/vim-vue'

" Plug 'sheerun/vim-polyglot'                            " 70+ syntaxs
" Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}

" Visual sugar {{{
Plug 'dracula/vim', { 'as': 'dracula' }                " Dracula colorscheme/theme for vim
" Plug 'jeffkreeftmeijer/vim-numbertoggle'               " Switches from relative numbering to absolute when entering end exiting insert mode
" Plug 'junegunn/goyo.vim'                               " Distraction free mode
" Plug 'junegunn/limelight.vim'                          " Distraction free mode, paired with Goyo
Plug 'junegunn/vim-journal'                            " Highlighting for bulleted lists
Plug 'kshenoy/vim-signature'                           " Display marks in gutter
Plug 'luochen1990/rainbow'                             " Rainbow parenthesis
" Plug 'chrisbra/Colorizer'                              " Colors hex codes
Plug 'vimwiki/vimwiki'                                 " Take notes and keep todo lists
" Plug 'zhaocai/GoldenView.Vim'                          " Auto resizes splits to the golden ratio for nice viewing
" Plug 'tpope/vim-afterimage'                            " Edit ICO, PNG, and GIF icons.
" Plug 'KabbAmine/vCoolor.vim'                           " Color picker <A-c>
Plug 'vim-airline/vim-airline'                         " Drop in vim statusline.
Plug 'haya14busa/incsearch.vim'                        " Incremental search hilighting while typing
" Plug 'haya14busa/incsearch-fuzzy.vim'                  " Incremental search hilighting while typing
Plug 'osyo-manga/vim-over'                             " Incremental find/replace hilighting
" }}}

" Text Editing utilities (moves text around) {{{
Plug 'justinmk/vim-sneak'                              " Highly contrivertial medium distance jump. sab to jump to next 'ab'
Plug 'AndrewRadev/sideways.vim'                        " :SidewaysLeft and :SidewaysRight to move function arguments && make argument objects with ia and aa
Plug 'AndrewRadev/splitjoin.vim'                       " gS and gJ to auto split and join blocks of code
" Plug 'ervandew/supertab'                               " Tab for autocomplete
Plug 'junegunn/vim-easy-align'                         " ga to start aligning.
Plug 'jiangmiao/auto-pairs'                            " Auto closes pairs. <M-b> to jump back if mistake close pair. <M-e> to fast wrap.
" Plug 'easymotion/vim-easymotion'                       " Easily jump to anywhere on screen
Plug 'kurkale6ka/vim-swap'                             " <Leader>x for autoswap a=1 to 1=a. <Leader>cx for prompt swap pivot
Plug 'mattn/emmet-vim', { 'for': 'html' }              " Emmet
Plug 'mjbrownie/swapit'                                " Use <C-a> and <C-x> to swap true/false etc.
Plug 'terryma/vim-multiple-cursors'                    " <C-n> to make new cursor next word under cursor.
" Plug 'thirtythreeforty/lessspace.vim'                  " Automatically remove trailing whitespace
Plug 'tmux-plugins/vim-tmux'
Plug 'tommcdo/vim-exchange'                            " Normal mode cx{motion} to mark then same to switch. Visual mode is \X
" Plug 'tpope/vim-abolish'                               " Working with variants of a word.
                                                       " :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{} --- to map iabbrev variants
                                                       " :%Subvert/facilit{y,ies}/building{,s}/g                                 --- to substitute variants
Plug 'tpope/vim-commentary'                            " gc to toggle comments
Plug 'tpope/vim-repeat'                                " Does some amazing magic to make a lot of plugins' mappings repeatable the . operator
Plug 'tpope/vim-sensible'                              " Sets a lot of default options to something reasonable
" Plug 'tpope/vim-sleuth'                                " Automatically sets the shiftwidth and expandtab based on this file and nearby similar files
Plug 'tpope/vim-surround'                              " ysiw( will surround the inner word with (). Same with cs and ds for change and delete
Plug 'tpope/vim-unimpaired'                            " Paired mappings for [<Space> cos col con etc. Check :h unimpaired.txt
" Plug 'tpope/vim-eunuch'                                " Many Unix helpers
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-visual-star-search'                  " * operator in visual mode
" }}}

" Organizers {{{
" Plug 'mbbill/undotree', { 'on': 'UndoTreeToggle' }     " <F9> to toggle undo tree, havent found this to be very intitive.
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " <F7> to open NerdTree for easy file tree browsing
" Plug 'majutsushi/tagbar', { 'on': 'TagBarToggle' }     " <F8> to toggle tagbar
" Plug 'ctrlpvim/ctrlp.vim'                              " Fuzzy finder, unknown if this is faster than vim-ctrlspace
Plug '/usr/local/opt/fzf'                                " fzf searcher. Should already be installed using homebrew
Plug 'junegunn/fzf.vim'                                  " fzf searcher. Should already be installed using homebrew
" }}}

" External utilities {{{
" Plug 'vim-latex/vim-latex', { 'for': 'Latex' }         " Huge plugin for editing latex
Plug 'junegunn/gv.vim'                                 " git commit browser :GV
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }             " :Dash to emulate K command in Dash (OSX only)
Plug 'rking/ag.vim', { 'on': 'Ag' }                    " :Ag to run silver searcher
Plug 'tpope/vim-fugitive'                              " :GStatus for git status :Gcommit for git commit etc
Plug 'christoomey/vim-conflicted'                      " :Conflicted to open better merger. dgu for get upstream, dgl for get local
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'katono/rogue.vim'                                " rogue2 vim port
" Plug 'uguu-org/vim-matrix-screensaver'

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

Plug 'dbeniamine/cheat.sh-vim'                         " Access to the great site cht.sh
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
