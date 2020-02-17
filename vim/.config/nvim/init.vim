set mouse=a

colo desert
hi clear SpellBad
hi SpellBad cterm=bold,underline ctermfg=red

function! ColumnStatus()
  if &tw == 0
    return "(" . col('.') . ")"
  else
    return "(" . col('.') . "/" . &tw . ")"
  endif
endfunction

set laststatus=2
set statusline=%f\ %y\ %r\ %m%=%{ColumnStatus()}\ \ %{wordcount().words}\ words\ \ (%{wordcount().chars}\ chars)\ %l/%L\ lines\ (%P)

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set hlsearch
set incsearch
set ignorecase
set smartcase

set list
set listchars=trail:#

noremap j gj
noremap k gk
nnoremap Q ma{gq}`a
inoremap jj <esc>
map <SPACE> za

nnoremap <CR> :noh<CR><CR>

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

if has('nvim')
  set inccommand=nosplit
endif
