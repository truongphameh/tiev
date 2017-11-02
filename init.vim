" BEFORE START
" Using neovim, should visit ':help nvim-from-vim'

" set nocompatible
" filetype off

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"START vim-plug session
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" VISUAL
" Status line for vim
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"START vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
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

Plug 'edkolev/tmuxline.vim' " tmuxline
let g:tmuxline_powerline_separators = 0

Plug 'skammer/vim-css-color' " preview css color while editing
"Plug 'nathanaelkane/vim-indent-guides' " show indent lines
Plug 'mhinz/vim-signify' " show VCS icon in VIM sign column
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'flazz/vim-colorschemes' " harvesting colorschemes on vim.org
Plug 'vim-scripts/ShowMarks' " show marks on the sign bar
" Configure ShowMarks highlights
highlight ShowMarksHLl cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLu cterm=bold ctermfg=yellow ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLo cterm=bold ctermfg=green ctermbg=12 gui=bold guifg=blue guibg=lightblue
highlight ShowMarksHLm cterm=bold ctermfg=178 ctermbg=12 gui=bold guifg=blue guibg=lightblue
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

" Colorscheme
" Plug 'nightsense/vrunchbang'
" Plug 'nightsense/office'

" TOOLS
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
nnoremap <leader>; :Buffers<CR>

"Plug 'vim-scripts/dbext.vim' " quick run sql script
"let g:dbext_default_profile_testing_wfh = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_wheaton'

"Plug 'mattn/gist-vim' " quick upload code snippet on github
Plug 'scrooloose/nerdcommenter' " quick comment
let g:NERDSpaceDelims = 1
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " folder tree
nmap <leader>tr :NERDTreeToggle<cr>

Plug 'vim-scripts/TaskList.vim' " list all TODO
Plug 'majutsushi/tagbar' " side bar list all tags with hierarchy scope structure
Plug 'vim-scripts/taglist.vim' " list of tags for quick jump to definitions # require exuberant ctags utility - apt-get install exuberant-ctags
"Plug 'vim-scripts/vcscommand.vim' " source-control commands
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-surround' " quick brackets
Plug 'bronson/vim-trailing-whitespace' " mark / quick remove trailing spaces

Plug 'benmills/vimux' " run commands in another tmux pane from vim
Plug 'pgr0ss/vimux-ruby-test' " run ruby test using vmux
let g:vimux_ruby_cmd_unit_test = "bundle exec rspec"
let g:vimux_ruby_cmd_all_tests = "bundle exec rspec"
let g:vimux_ruby_clear_console_on_run = 0
let g:vimux_ruby_file_relative_paths = 1
nmap <Leader>rl :VimuxRunLastCommand<CR>
nmap <Leader>rc :VimuxPromptCommand<CR>

Plug 'JarrodCTaylor/vim-shell-executor' " execute buffer in a split pane
Plug 'tpope/vim-unimpaired' " pairs of mapping
Plug 'jpalardy/vim-slime' " Grab some text and 'send' it to a GNU Screen / tmux / whimrepl session
let g:slime_target="tmux" " Configure vim-slime to send text to tmux

Plug 'vimoutliner/vimoutliner' " VimOutliner
Plug 'vim-scripts/vimoutliner-colorscheme-fix' " Fix color for vimoutliner

Plug 'wakatime/vim-wakatime' " WakaTime: log time developing
Plug 'tpope/vim-bundler' " support bundler commands and build ctags for gems

" Code Review Github PR
Plug 'junkblocker/patchreview-vim' " Review patch / diff
Plug '~/code/githubreview.vim' " Review Github PR in Vim
Plug 'Asheq/close-buffers.vim' " Quick close buffers

" AUTO-TEXT
Plug 'docunext/closetag.vim' " Auto close HTML tags
Plug 'Raimondi/delimitMate' " auto close brackets, parenthesis,...
Plug 'vim-scripts/SearchComplete' " tab completion of words inside of a search ('/')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete asynchronously for neovim
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0 " enable/disable autocomplete
"if has("gui_running")
"  inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
"else
"  inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
"endif

Plug 'ervandew/supertab' " auto-complete with tab key
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

Plug 'godlygeek/tabular' " tab tools
"Plug 'MarcWeber/vim-addon-mw-utils'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" SYNTAX
Plug 'aklt/plantuml-syntax', { 'for': ['pu', 'uml', 'plantuml'] } " syntax for plant-uml

Plug 'w0rp/ale' " asynchronous linter
let g:ale_linters = {
      \'javascript': ['eslint'],
      \'ruby': ['rubocop']
      \}
let g:ale_fixers = {
      \'javascript': ['eslint'],
      \'ruby': ['rubocop']
      \}
let g:ale_lint_on_text_changed = 'always' " always, normal, insert or never
let g:airline#extensions#ale#enabled = 1 " integrate with vim-airline

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " Markdown syntax highlighting, matching rules and mappings
let g:vim_markdown_folding_disabled = 1
Plug 'pangloss/vim-javascript' " better javascript indentation
let g:javascript_plugin_flow = 1

Plug 'elixir-lang/vim-elixir' | Plug 'avdgaag/vim-phoenix'

Plug 'tpope/vim-rails' " rails syntax
"Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' } " coffee-script syntax and supports
Plug 'kylef/apiblueprint.vim', { 'for': 'apib' } " syntax highlight and lint for API Blueprint (apiary.io)

" Plug 'fatih/vim-go' " Go development
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" au FileType go nmap <leader>r <Plug>(go-run)
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"Plug 'digitaltoad/vim-pug' " Pug (formerly Jade) template syntax highlighting and indentation
Plug 'vim-scripts/csv.vim', { 'for': 'csv' } " Show .csv file in vim
"Plug 'vim-scripts/Vim-R-plugin' " Plugin for R language
Plug 'mxw/vim-jsx' " Syntax highlight for JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

Plug 'leshill/vim-json' " Syntax highlight for JSON files

Plug 'jparise/vim-graphql' " Syntax for Graphql

" All of your Plugins must be added before the following line
call plug#end()            " required

" syntax on
" filetype indent on
" filetype plugin on
" filetype plugin indent on    " required

colorscheme minimalist
" colorscheme Monokai
" autocmd BufEnter * colorscheme Monokai
" autocmd BufEnter *.otl colorscheme votl_dark

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
" set laststatus=2
" set noshowmode

"" Use 256 colors
" set t_Co=256

set backspace=2 " make backspace work like most other apps

nmap ]l :lnext
nmap [l :lprev

nnoremap <Leader>s :update<CR>

nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72
