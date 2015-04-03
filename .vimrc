"START Vundle session
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'rking/ag.vim' " search in many files # require the_silver_searcher
Plugin 'docunext/closetag.vim' " Auto close HTML tags
Plugin 'kien/ctrlp.vim' " quick open file
Plugin 'vim-scripts/dbext.vim' " quick run sql script
Plugin 'Raimondi/delimitMate' " auto close brackets, parenthesis,...
Plugin 'mattn/gist-vim' " quick upload code snippet on github
Plugin 'scrooloose/nerdcommenter' " quick comment
Plugin 'scrooloose/nerdtree' " folder tree
Plugin 'aklt/plantuml-syntax' " syntax for plant-uml
Plugin 'vim-scripts/SearchComplete' " tab completion of words inside of a search ('/')
Plugin 'Valloric/YouCompleteMe' " Auto-complete in INSERT mode
Plugin 'ervandew/supertab' " auto-complete with tab key
Plugin 'scrooloose/syntastic' " check syntax of many file types
Plugin 'godlygeek/tabular' " tab tools
Plugin 'majutsushi/tagbar' " side bar list all tags with hierarchy scope structure
Plugin 'vim-scripts/taglist.vim' " list of tags for quick jump to definitions # require exuberant ctags utility - apt-get install exuberant-ctags
Plugin 'vim-scripts/vcscommand.vim' " source-control commands
Plugin 'pangloss/vim-javascript' " better javascript indentation
Plugin 'tpope/vim-rails' " rails syntax
Plugin 'kchmck/vim-coffee-script' " coffee-script syntax and supports
Plugin 'tpope/vim-surround' " quick brackets
Plugin 'bronson/vim-trailing-whitespace' " mark / quick remove trailing spaces
Plugin 'bling/vim-bufferline' " list buffers in command bar
Plugin 'benmills/vimux' " run commands in another tmux pane from vim
Plugin 'mhinz/vim-signify' " show VCS icon in VIM sign column
Plugin 'JarrodCTaylor/vim-shell-executor' " execute buffer in a split pane
Plugin 'tpope/vim-unimpaired' " pairs of mapping
Plugin 'vim-scripts/guicolorscheme.vim'
Plugin 'flazz/vim-colorschemes' " harvesting colorschemes on vim.org
Plugin 'vim-scripts/ShowMarks' " show marks on the sign bar
Plugin 'kylef/apiblueprint.vim' " syntax highlight and lint for API Blueprint (apiary.io)
Plugin 'fatih/vim-go' " Go development
Plugin 'digitaltoad/vim-jade' " Jade template syntax highlighting and indentation
Plugin 'vim-scripts/csv.vim' " Show .csv file in vim
Plugin 'vim-scripts/Vim-R-plugin' " Plugin for R language

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on    " required
"END Vundle

colorscheme Monokai

set number
set autoindent
set smartindent
" size of tabstop
set tabstop=2
set softtabstop=0

" size of an indent
set shiftwidth=2

" indent at beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" always show at least one line above/below the cursor
set scrolloff=1
" always show at least 5 character before/after the cursor
"set sidescrolloff=5

" Open split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Config database connections for dbext
let g:dbext_default_profile_testing_wfh = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_wheaton'
let g:dbext_default_profile_sync_unity = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=sync_unity'
let g:dbext_default_profile_holy = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_holy_name_20140710'
let g:dbext_default_profile_solvedup = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.90:port=6432:dbname=viettp_solvedup'

"START powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
set noshowmode

" Use 256 colors
set t_Co=256
"END powerline

" Let CtrlP to use path mode to vim working directory as highest root
let g:ctrlp_working_path_mode = 'a'

" Configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

" Configure ShowMarks highlights
highlight ShowMarksHLl cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLu cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLo cterm=bold ctermfg=green ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLm cterm=bold ctermfg=178 ctermbg=12 gui=bold guifg=blue guibg=lightblue
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

map ]l :lnext
map [l :lprev
