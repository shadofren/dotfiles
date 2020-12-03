
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'tell-k/vim-autopep8'
" Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/Colorizer'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
" Plug 'plasticboy/vim-markdown'
call plug#end()

" Some basics:
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber
  set clipboard+=unnamedplus

" Enable autocompletion:
  set wildmode=longest,list,full
" Disables automatic commenting on newline:
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
  map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

" Ensure files are read as what I want:
  autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

" Readmes autowrap text:
  autocmd BufRead,BufNewFile *.md set tw=79

" Vertically center document when entering insert mode
  autocmd InsertEnter * norm zz

" Use urlscan to choose and open a url:
  :noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
  :noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
  vnoremap <C-c> "+y
  map <C-p> "+P

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
  autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
  autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and lf configs with new material:
  autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Update binds when sxhkdrc is updated
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" golang
let g:go_test_show_name = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" tabsize
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" fuzzy find
nnoremap <leader>f :<C-u>FZF<CR>

" autopep8 for python code formatting
let g:autopep8_indent_size=2
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

" " run python file on save
" autocmd BufWritePost *.py exec '!python' shellescape(@%, 1)

" vim-terraform
let g:terraform_fmt_on_save=1

" git-gutter
" no color
highlight! link SignColumn LineNr

" autocmd on file
" Only do this part when compiled with support for autocommands
if has("autocmd")

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" vim-gitgutter
let g:gitgutter_map_keys = 0

" vim-wiki
let g:vimwiki_list = [{'path': '~/vimwiki/md/',
      \ 'syntax': 'markdown', 'ext': '.md'}]
