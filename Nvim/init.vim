filetype off
"###################
"# SET
"###################
set nocompatible
set rnu
set nu

set splitright
set splitbelow
 
set foldmethod=indent
set foldlevel=99
set encoding=utf-8 
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set tabstop=4
set shiftwidth=4
set linebreak

set conceallevel=0
set timeoutlen=700
set modeline

let mapleader = ","
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/seoul256.vim'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neco-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'Shougo/neosnippet'
Plug 'https://github.com/Shougo/neosnippet-snippets.git'
Plug 'https://github.com/weirongxu/plantuml-previewer.vim'
Plug 'https://github.com/tyru/open-browser.vim'
Plug 'vim-scripts/TagHighlight'

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'chesleytan/wordcount.vim'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'


"Plug 'vimwiki/vimwiki'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim' 
call plug#end()

filetype plugin indent on

set runtimepath+=.vim/UltiSnips~

"##########################
"SNIPPETS
"#########################



let g:neosnippet#snippets_directory='~/.config/nvim/mysnippets'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"




"#####################
"# REMAPPING
"#####################

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>l <C-W><C-L>

nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>
" Space folding
nnoremap <space> za 	

inoremap <C-t> <Esc>:TagbarToggle <CR>a
nnoremap <C-t> :TagbarToggle <CR>

nnoremap <leader>C :wa<CR>:e ~/.config/nvim/init.vim<CR>
nnoremap <leader>S :so ~/.config/nvim/init.vim <CR>
nnoremap <ESC> :nohl <ESC>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
vnoremap < <gv
vnoremap > >gv




"####################
"# PLUGIN CONFIG
"####################


" Easy Motion

let g:indent_guides_enable_on_vim_startup = 1


" lightline


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ ['wordcount', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': '%l(%L):%c',
      \   'wordcount' : '%{wordCount#WordCount()}'
      \ },
      \ }

autocmd BufNewFile,BufReadPost *.md set filetype=markdown


""" Markdown PH
autocmd BufNewFile,BufReadPost *.mdp set filetype=markdown
au BufEnter, BufNew *.mdp inoremap ,- \-
au BufEnter, BufNew *.mdp inoremap ,_
au BufEnter, BufNew *.mdp inoremap 



" Deoplete
let g:deoplete#enable_at_startup = 1


"###################
"# Python Relative
"###################

let python_highlight_all=1
syntax on

au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=160
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix



let g:SimpylFold_docstring_preview = 1

nnoremap <leader>a :g/    def/normal za<Enter>:nohl<Enter>



colorscheme nord

" Python

nnoremap <F5> :call Python_execution()<CR>
"nnoremap <F6> :! tmux send-key -t right ipython\ -i\ % C-m <CR><CR>

function! Python_shell()
		let pane_number = system('tmux list-pane | wc -l')
		if pane_number == 1
			:silent !tmux split-window -h -p 30 'ipython'
		endif
endfunction

function! Python_execution()
	let is_tmux = system('echo -n $TMUX')
	if !(is_tmux == "")
		:call Python_shell()
		:silent !tmux send-key -t right \%run\ % C-m
		:exe "normal \<C-L>"
	else
		:echo "ERREUR: NVIM DOIT ETRE EXECUTE DANS UNE SESSION TMUX"
	endif
endfunction

" PLantUML
au BufNewFile,BufRead *.uml set filetype=uml
autocmd FileType uml inoremap  <C-a> <Esc>mz?class<CR>wy$'z:nohl<CR>o<Esc>pa : 





" Latex
au BufRead *.tex unmap<F5>
au BufRead *.tex noremap <F5> <Esc>:w<CR>:!(pdflatex -quiet "%:t" > /dev/null 2>&1)<CR><CR>
" au BufRead *.tex setlocal spell spelllang=fr
au BufRead *.tex call deoplete#disable()
au BufRead *.tex set nospell
au BufRead *.tex set conceallevel=0
au BufRead *.tex inoremap ,, \\




" Terminal Escape
tnoremap <Esc> <C-\><C-n>



" comamnd
command Ddisable call deoplete#custom#option('auto_complete', v:false)
command Denable call deoplete#custom#option('auto_complete', v:true)


autocmd FileType python vnoremap # xi"""<CR>"""<ESC>P
autocmd FileType python nnoremap # ?"""<CR>ddNdd
autocmd FileType c vnoremap # xi/*<CR>i*/<ESC>P


nnoremap <C-t> :tag <C-R><C-W><CR>

nnoremap <leader>% :source /home/pierre/.config/nvim/init.vim<CR>
"" AutoStack
nnoremap <leader>s :ToggleStack<CR>
nnoremap <leader>si :IncStack 15<CR>
nnoremap <leader>sd :DecStack 15<CR>
