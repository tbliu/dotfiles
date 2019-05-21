" ##### Configure plugins #####
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'typescript-vim'
"Plugin 'w0rp/ale'
Plugin 'vimwiki/vimwiki'
call vundle#end()

filetype plugin on
set updatetime=100

" ##### Basic setup ###### 
set number
colorscheme peachpuff
syntax on
let g:lightline = { 'colorscheme': 'seoul256', } 
set backspace=indent,eol,start
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set noerrorbells
set showmode
set vb  t_vb=
set showcmd
set showmode
set laststatus=2
set cindent
filetype plugin indent on
set statusline=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=Current:\ %-4l
set statusline+=Total:\ %-4L
set hlsearch incsearch

" ###### Mappings ###### 
map <C-o> :NERDTreeToggle<CR>
set complete-=i
let mapleader = "-"
let maplocalleader = "\\"
" Map alt+d in insert mode to delete line
inoremap ∂ <esc>ddi 
" Map alt+u in insert mode to undo
inoremap ¨ <esc>ui
" Map alt+r in insert mode to redo
inoremap ® <esc><c-R>i
" Map ctrl + u to select word and convert to upper case
inoremap <c-u> <esc>viwU<esc>i
nnoremap <c-u> <esc> viwU<esc>
" Open vimrc in another window; ev stands for edit vimrc; sv stands for source vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" localleader + " adds quotes to word
inoremap jk <esc>

" Remove syntax search highlighting
nnoremap <space><space> :noh<cr>
" 

" ##### Typo corrections ##### 
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev teh the
iabbrev hte the
iabbrev taht that
iabbrev htat that
" 

" Create comment shortcuts 
augroup comments
    autocmd!
    " Single line comments
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType go nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType java     nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType rust nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType m nnoremap <buffer> <localleader>c I%<esc>
    " block comments: s - start; e - end
    autocmd FileType java nnoremap <buffer> <localleader>s I/*<esc>
    autocmd FileType java nnoremap <buffer> <localleader>e A*/<esc>
    autocmd FileType python nnoremap <buffer> <localleader>s I"""<esc>
    autocmd FileType python nnoremap <buffer> <localleader>e A"""<esc>
    autocmd FileType rust nnoremap <buffer> <localleader>e I/*<esc>
    autocmd FileType rust nnoremap <buffer> <localleader>e A*/<esc>
    autocmd FileType c nnoremap <buffer> <localleader>e I/*<esc>
    autocmd FileType c nnoremap <buffer> <localleader>e A*/<esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>e I/*<esc>
    autocmd FileType cpp nnoremap <buffer> <localleader>e A*/<esc>
augroup END
" 

" ##### Begin file configurations #####

" html config 
augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" 

" vim config  
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" 

" latex config 
augroup filetype_latex
    autocmd!
    " put \begin{} \end{} tags tags around the current word
    map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
    map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
augroup END
" 

augroup filetype_java
    autocmd!
    " Insert ; at end of line
    nnoremap <C-T> <ESC>mqA;<ESC>`q
    inoremap <C-T> <ESC>mqA;<ESC>`qa
    inoremap {<CR>  {<CR>}<Esc>O
augroup END

augroup filetype_go
    autocmd!
    inoremap {<CR>  {<CR>}<Esc>O
augroup END

augroup filetype_c
    autocmd!
    inoremap {<CR>  {<CR>}<Esc>O
augroup END

augroup filetype_rust
    autocmd!
    inoremap {<CR>  {<CR>}<Esc>O
augroup END

augroup filetype
    au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim

