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

" VISUAL
Plugin 'bling/vim-airline' " status line for vim
"START vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 2

let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:bufferline_echo = 0
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':f'
"END vim airline

Plugin 'vim-airline/vim-airline-themes' " airline themes
Plugin 'edkolev/tmuxline.vim' " tmuxline
Plugin 'skammer/vim-css-color' " preview css color while editing
"Plugin 'nathanaelkane/vim-indent-guides' " show indent lines
Plugin 'bling/vim-bufferline' " list buffers in command bar
Plugin 'mhinz/vim-signify' " show VCS icon in VIM sign column
Plugin 'vim-scripts/guicolorscheme.vim'
Plugin 'flazz/vim-colorschemes' " harvesting colorschemes on vim.org
Plugin 'vim-scripts/ShowMarks' " show marks on the sign bar
" Configure ShowMarks highlights
highlight ShowMarksHLl cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLu cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLo cterm=bold ctermfg=green ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLm cterm=bold ctermfg=178 ctermbg=12 gui=bold guifg=blue guibg=lightblue
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

" TOOLS
Plugin 'rking/ag.vim' " search in many files # require the_silver_searcher
Plugin 'kien/ctrlp.vim' " quick open file
let g:ctrlp_working_path_mode = 'a' " Let CtrlP to use path mode to vim working directory as highest root

Plugin 'vim-scripts/dbext.vim' " quick run sql script
let g:dbext_default_profile_testing_wfh = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_wheaton'

Plugin 'mattn/gist-vim' " quick upload code snippet on github
Plugin 'scrooloose/nerdcommenter' " quick comment
Plugin 'scrooloose/nerdtree' " folder tree
nmap <leader>tr :NERDTreeToggle<cr>

Plugin 'majutsushi/tagbar' " side bar list all tags with hierarchy scope structure
Plugin 'vim-scripts/taglist.vim' " list of tags for quick jump to definitions # require exuberant ctags utility - apt-get install exuberant-ctags
"Plugin 'vim-scripts/vcscommand.vim' " source-control commands
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-surround' " quick brackets
Plugin 'bronson/vim-trailing-whitespace' " mark / quick remove trailing spaces
Plugin 'benmills/vimux' " run commands in another tmux pane from vim
Plugin 'JarrodCTaylor/vim-shell-executor' " execute buffer in a split pane
Plugin 'tpope/vim-unimpaired' " pairs of mapping
Plugin 'jpalardy/vim-slime' " Grab some text and 'send' it to a GNU Screen / tmux / whimrepl session
let g:slime_target="tmux" " Configure vim-slime to send text to tmux

Plugin 'vimoutliner/vimoutliner' " VimOutliner
Plugin 'vim-scripts/vimoutliner-colorscheme-fix' " Fix color for vimoutliner

" AUTO-TEXT
Plugin 'docunext/closetag.vim' " Auto close HTML tags
Plugin 'Raimondi/delimitMate' " auto close brackets, parenthesis,...
Plugin 'vim-scripts/SearchComplete' " tab completion of words inside of a search ('/')
Plugin 'Valloric/YouCompleteMe' " Auto-complete in INSERT mode
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

Plugin 'ervandew/supertab' " auto-complete with tab key
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

"Plugin 'godlygeek/tabular' " tab tools
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips' " Snippet engine
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plugin 'honza/vim-snippets'

" SYNTAX
Plugin 'aklt/plantuml-syntax' " syntax for plant-uml
Plugin 'scrooloose/syntastic' " check syntax of many file types
" Configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

Plugin 'plasticboy/vim-markdown' " Markdown syntax highlighting, matching rules and mappings
let g:vim_markdown_folding_disabled = 1
Plugin 'pangloss/vim-javascript' " better javascript indentation
Plugin 'tpope/vim-rails' " rails syntax
Plugin 'kchmck/vim-coffee-script' " coffee-script syntax and supports
Plugin 'kylef/apiblueprint.vim' " syntax highlight and lint for API Blueprint (apiary.io)
Plugin 'fatih/vim-go' " Go development
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
au FileType go nmap <leader>r <Plug>(go-run)
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

Plugin 'digitaltoad/vim-jade' " Jade template syntax highlighting and indentation
Plugin 'vim-scripts/csv.vim' " Show .csv file in vim
Plugin 'vim-scripts/Vim-R-plugin' " Plugin for R language
Plugin 'mxw/vim-jsx' " Syntax highlight for JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
filetype indent on
filetype plugin on
filetype plugin indent on    " required
"END Vundle

colorscheme Monokai
"autocmd BufEnter * colorscheme Monokai
"autocmd BufEnter *.otl colorscheme vo_dark

set number
set relativenumber
set autoindent
set smartindent
set pastetoggle=<F2>
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

"" Always show statusline
set laststatus=2
set noshowmode

"" Use 256 colors
set t_Co=256

set backspace=2 " make backspace work like most other apps

map ]l :lnext
map [l :lprev

noremap <Leader>s :update<CR>

" git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
