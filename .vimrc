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

Plugin 'rking/ag.vim' " seach in amny files # require the_silver_searcher
Plugin 'docunext/closetag.vim' " Auto close HTML tags
Plugin 'kien/ctrlp.vim' " quick open file
Plugin 'vim-scripts/dbext.vim' " quick run sql script
Plugin 'Raimondi/delimitMate' " auto close brackets, parenthesis,...
Plugin 'mattn/webapi-vim' " required by gist-vim
Plugin 'mattn/gist-vim' " quick upload code snippet on github
Plugin 'scrooloose/nerdcommenter' " quick comment
Plugin 'scrooloose/nerdtree' " folder tree
Plugin 'aklt/plantuml-syntax' " syntax for plant-uml
Plugin 'vim-scripts/SearchComplete' " tab completion of words inside of a search ('/')
Plugin 'ervandew/supertab' " auto-complete with tab key
Plugin 'scrooloose/syntastic' " check syntax of many file types
Plugin 'godlygeek/tabular' " tab tools
Plugin 'majutsushi/tagbar' " side bar list all tags with hierarchy scope structure
Plugin 'vim-scripts/taglist.vim' " list of tags for quick jump to definitions # require exuberant ctags utility - apt-get install exuberant-ctags
Plugin 'vim-scripts/vcscommand.vim' " source-control commands
Plugin 'pangloss/vim-javascript' " better javascript indentation
Plugin 'tpope/vim-rails' " rails syntax
Plugin 'tpope/vim-surround' " quick brackets
Plugin 'bronson/vim-trailing-whitespace' " mark / quick remove trailing spaces
Plugin 'bling/vim-bufferline' " list buffers in command bar

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"END Vundle

syntax on
filetype indent on
filetype plugin on

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

let g:dbext_default_profile_testing_wfh = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_wheaton'
let g:dbext_default_profile_sync_unity = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=sync_unity'
let g:dbext_default_profile_holy = 'type=PGSQL:user=postgres:passwd=postgres:host=172.16.9.54:port=6432:dbname=testing_holy_name_20140710'

"START powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
set noshowmode

" Use 256 colors
set t_Co=256
"END powerline
