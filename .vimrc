" more vim, less vi
set nocompatible

" disable F*****G BELLS
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" appearance and indentation
set autoindent
set tabstop=4
set shiftwidth=4
set guifont=Consolas::h13
set number
set ruler
color wombat
syntax on
set backspace=2
set wrap
set linebreak

" hide all GUI chrome in gvim
set guioptions-=m
set guioptions-=T
set guioptions-=r

" highlight tabs and trailing spaces
set list listchars=tab:»·,trail:·
set list

" don't write backup files, version control is enough backup
set nobackup
set nowritebackup
set noswapfile

" auto cd to file directory
set autochdir

" always use spaces for Python and retab on save (disabled!)
" autocmd FileType python set expandtab
" autocmd BufWrite *.py retab

" highlight XAML as XML
au BufNewFile,BufRead *.xaml setfiletype xml

" replace without yanking replaced
vnoremap <leader>p "_dP

" ctrl , and ctrl . to resize vertical windows
noremap <F11> :vertical resize -5<cr>
noremap <F12> :vertical resize +5<cr>
