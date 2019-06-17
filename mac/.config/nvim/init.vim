" BEFORE START
" Using neovim, should visit ':help nvim-from-vim'

" set nocompatible
" filetype off

" Use nvim as preferred editor
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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
Plug 'vim-scripts/guicolorscheme.vim' " consistent colors in different terminals
Plug 'flazz/vim-colorschemes' " harvesting colorschemes on vim.org
Plug 'felixhummel/setcolors.vim'

Plug 'tpope/vim-obsession' " Autosave session info to file, work with tmux-continuum
Plug 'itchyny/lightline.vim' " status line
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
function! LightlineObsession()
  if exists("*ObsessionStatus")
    return ObsessionStatus('●', '○')
  endif
  return ''
endfunction
" Plug 'albertomontesg/lightline-asyncrun' " Asyncrun indicator on lightline - rewritten below
function! Lightline_asyncrun_status()
  return g:asyncrun_status
endfunc
let g:lightline.component_expand = {
      \ 'asyncrun_status': 'Lightline_asyncrun_status',
      \ 'obsession': 'LightlineObsession',
      \ }
let g:lightline.active = {
      \ 'right': [
      \   ['percent', 'lineinfo'],
      \   ['fileformat', 'fileencoding', 'filetype'],
      \   ['asyncrun_status', 'obsession']
      \ ]
      \ }
augroup lightline#asyncrun
  autocmd!
  autocmd User AsyncRunStart call lightline#update()
  autocmd User AsyncRunStop call lightline#update()
augroup END

Plug 'edkolev/tmuxline.vim' " tmuxline
let g:tmuxline_powerline_separators = 0

"Plug 'nathanaelkane/vim-indent-guides' " show indent lines
Plug 'mhinz/vim-signify' " show VCS icon in VIM sign column
Plug 'kshenoy/vim-signature' " show marks on the sign bar

Plug 'machakann/vim-highlightedyank' " highlight the yank text

" TOOLS
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
nnoremap <leader>; :Buffers<CR>

" Plug 'henrik/vim-open-url' " Open URLs in the current line

"Plug 'vim-scripts/dbext.vim' " quick run sql script
"let g:dbext_default_profile_testing_wfh = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_wheaton'

"Plug 'mattn/gist-vim' " quick upload code snippet on github
Plug 'tpope/vim-commentary' " quick comment
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " folder tree
nmap <leader>tr :NERDTreeToggle<cr>

Plug 'vim-scripts/TaskList.vim' " list all TODO
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-rhubarb' " quick browse Github file with fugitive :Gbrowse
Plug 'tpope/vim-surround' " quick brackets
Plug 'tpope/vim-projectionist' " config projects
Plug 'jiangmiao/auto-pairs' " better insert brackets, parens, quotes in pair

Plug 'skywind3000/asyncrun.vim' " Run commands asynchronously using new APIs in Vim 8 and NeoVim
" let g:asyncrun_open = 8

Plug 'benmills/vimux' " run commands in another tmux pane from vim
nmap <Leader>rl :VimuxRunLastCommand<CR>
nmap <Leader>rc :VimuxPromptCommand<CR>
Plug 'janko-m/vim-test' " Run tests
let test#strategy='asyncrun'
let test#ruby#rspec#executable = 'bundle exec rspec'
" function! EchoStrategy(cmd)
"   echo 'vim-test: ' . a:cmd
" endfunction
" let g:test#custom_strategies = {'echo': function('EchoStrategy')}
nmap <Leader>ra :TestFile<CR>
nmap <Leader>rr :TestNearest<CR>

" Plug 'JarrodCTaylor/vim-shell-executor' " execute buffer in a split pane
Plug 'jpalardy/vim-slime' " Grab some text and 'send' it to a GNU Screen / tmux / whimrepl session
let g:slime_target="neovim" " Configure vim-slime to send text to tmux

Plug 'vimoutliner/vimoutliner' " VimOutliner
Plug 'vim-scripts/vimoutliner-colorscheme-fix' " Fix color for vimoutliner


" Plug 'wakatime/vim-wakatime' " WakaTime : log time developing (slow)

" Code Review Github PR
Plug 'junkblocker/patchreview-vim' " Review patch / diff
Plug '~/code/githubreview.vim' " Review Github PR in Vim
" Plug 'Asheq/close-buffers.vim' " Quick close buffers

Plug 'kyuhi/vim-emoji-complete' " Emoji auto-complete
Plug 'hauleth/pivotaltracker.vim' " PivotalTracker autocomplete

" AUTO-TEXT
Plug 'vim-scripts/SearchComplete' " tab completion of words inside of a search ('/')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete asynchronously for neovim
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0 " enable/disable autocomplete
"if has("gui_running")
"  inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
"else
"  inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
"endif

"Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'junegunn/vim-easy-align' " auto align parts of lines

Plug 'ervandew/supertab' " auto-complete with tab key
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

Plug 'rhysd/vim-grammarous' " Grammar check with LanguageTool

" SYNTAX
" Plug 'aklt/plantuml-syntax', { 'for': ['pu', 'uml', 'plantuml'] } " syntax for plant-uml
Plug 'asciidoc/vim-asciidoc' " syntax for asciidoc

Plug 'autozimu/LanguageClient-neovim', {'do': './install.sh', 'branch': 'next' } " Language Server Protocol client
" set hidden " Required for operations modifying multiple buffers like rename
let g:LanguageClient_serverCommands = {
      \'ruby': ['solargraph','stdio'],
      \'javascript': ['javascript-typescript-stdio']
      \}
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

Plug 'w0rp/ale' " asynchronous linter
let g:ale_linters = {
      \'javascript': ['eslint','flow','prettier'],
      \'ruby': ['rubocop','brakeman','rails_best_practices', 'eruby'],
      \'markdown': ['alex','prettier'],
      \'yaml': ['prettier']
      \}
let g:ale_fixers = {
      \'*': ['remove_trailing_lines','trim_whitespace'],
      \'javascript': ['eslint','prettier'],
      \'ruby': ['rubocop'],
      \'markdown': ['prettier']
      \}
let g:ale_lint_on_text_changed = 'always' " always, normal, insert or never
let g:ale_fix_on_save = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <Leader>ff :ALEFix<CR>

Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " better javascript indentation
let g:javascript_plugin_flow = 1

Plug 'galooshi/vim-import-js' " Fix imports in JS

" Plug 'elixir-lang/vim-elixir' | Plug 'avdgaag/vim-phoenix'

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
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " Syntax highlight for JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

Plug 'leshill/vim-json', { 'for': 'json' } " Syntax highlight for JSON files

Plug 'jparise/vim-graphql' " Syntax for Graphql

" All of your Plugins must be added before the following line
call plug#end()            " required

augroup autotest
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END

colorscheme hybrid
" colorscheme minimalist
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
set noshowmode " disable showing mode

"" Use 256 colors
" set t_Co=256

set backspace=2 " make backspace work like most other apps

set formatoptions+=j " format the joined lines using J in normal mode

set inccommand=nosplit " live-preview substitute command result
set autoread " autoload file changes

nmap ]l :lnext<CR>
nmap [l :lprev<CR>
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>

nnoremap <Leader>s :update<CR>
nnoremap <Leader>z :tabnew %<CR>

nnoremap cp :let @* = expand("%")<CR>
nnoremap cP :let @* = expand("%:p")<CR>

" Terminal Emulator configs
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>
tnoremap <C-w><Esc> <C-\><C-n>
" tnoremap <C-v><Esc> <Esc>
nnoremap <C-w>b :echo b:terminal_job_id<CR>
highlight! link TermCursorNC Cursor
highlight! TermCursor guibg=red guifg=white ctermbg=1 ctermfg=15

" git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile Thorfile set filetype=ruby
