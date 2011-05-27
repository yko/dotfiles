" Recommended plugins:

" Allows to store plugins in separate directory. Install it and `git clone`
" everything other into ~/.vim/bundle 
" and get your updates just with `git pull`
" https://github.com/paulnicholson/vim-pathogen

" Perfect color scheme
" https://github.com/imathis/vim-colors-solarized

" Type less, use code snippets
" https://github.com/garbas/vim-snipmate

" Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive/

" Organize/Navigate projects of files in IDE-like way
" Ships with my minor modifications
" https://github.com/yko/project.tar.gz

" Enable pathogen
call pathogen#infect()

" Enable perlbrew
let $PATH=$HOME . "/perl5/perlbrew/bin:" . $PATH
let $PATH=$HOME . "/perl5/perlbrew/perls/perl-5.14.0/bin:" . $PATH

let g:multi_snips=1
set nocompatible
set filetype=on
set shiftround
set expandtab
set shiftwidth=4 ai
set showmatch
set softtabstop=4
set tabstop=4
set history=150         " keep 150 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set fileencodings=utf-8,cp1251,koi-8r,cp866
set fileformats=unix,dos
set nowrap
set ls=2
set ttyfast
" ru keyboard mapping
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" advansed statusline with char codes
set statusline=%F%m%r%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%03l,%03v]\ [%p%%] 
set modeline

" Show whitespaces
set list!
set listchars=trail:·,tab:>-

set iskeyword=@,48-57,_,192-255 " WTF?

filetype plugin indent on

" Color scheme
syn on
"colorscheme torte
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_underline=0
set t_Co=256
colorscheme solarized

set vb t_vb=

" Key Mappings
nmap <silent> <C-n> :tabnew<CR>
nmap <silent> <C-F4> :tabclose<CR>

    " Fugitive
    nmap <silent> <LocalLeader>gd :Gdiff<CR>
    nmap <silent> <LocalLeader>gs :Gstatus<CR>

    " project.tar.gz
    nmap <silent> <F12> <Plug>ToggleProject

    " Switch between foldmethods
    map <F4>  <esc>:call SWITCHFOLD()<cr>
    function! SWITCHFOLD()
        if &foldmethod=="syntax"
            set foldmethod=indent
            return
        endif
        set foldmethod=syntax
    endfunction

"" Filetypes

" Perl stuff
autocmd FileType perl match ErrorMsg '\%>80v.\+'
autocmd FileType perl set autowrite
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl setlocal equalprg=perltidy
autocmd FileType perl setlocal foldmethod=syntax
autocmd BufNewFile,BufRead *.p[lm] compiler perl

let perl_fold = 1
let perl_fold_blocks = 1
let perl_sync_dist = 400

let perl_nofold_packages = 1
let perl_include_pod = 1

let perl_extended_vars  = 1

"let mojo_disable_html  = 1
let mojo_highlight_data = 1

" project.tar.gz
let g:proj_window_width = 30
let g:proj_window_increment = 0
let g:proj_flags="gLimst"

" Nginx
au BufRead,BufNewFile /etc/nginx/*.conf set ft=nginx

" HTML stuff

let g:html_tag_case="lowercase"
let g:do_xhtml_mappings = "yes"

autocmd FileType html,xml,css,html.ep,html.epl setlocal sw=1
autocmd FileType xhtml,html set wrap

" JavaScript
au! BufRead,BufNewFile *.json setfiletype json
au! BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"au! BufRead,BufNewFile *.js set ft=javascript syntax=jquery
autocmd Filetype javascript setlocal equalprg=js_beautify.pl\ -s=4\ -

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Update timestamp in Changes file
" Experimental
function! UpdateChangeTimestamp()
    let pos = line('.').' | normal! '.virtcol('.').'|'
    0
    let s:Match = search('^\(\s*\d\+\.\)', 'p')
    if s:Match
        let newdate = strftime("%a %b %d %H:%M:%S %Y")
        exe 's/\(\s*\d\+\(\.\(\d\+_\d\+\|\d\+\)\)\?\s*\).*/\1' . newdate . '/'
    else
    endif
endfunction

augroup LastChange
    au!
    au BufWritePre Changes :call UpdateChangeTimestamp()
augroup END

" Gui-related

if has("gui_running")
    set guioptions-=T
    if has("gui_gtk2")
        set guifont=DejaVu\ Sans\ Mono\ 9
    elseif has("x11")
        set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    else
        set guifont=DejaVu\ Sans\ Mono:h9:cDEFAULT
    endif

    autocmd GUIEnter * set columns=225
    autocmd GUIEnter * set lines=78
    autocmd GUIEnter * winpos 0 0
endif

" Session management
" Experimental

function! s:CloseProject()
   let s:bc = bufname('\.vimprojects')
   if bufexists(s:bc)
       exec ':bunload ' . bufnr(s:bc)
   endif
endfunction 

autocmd VimLeavePre * call s:CloseProject()
autocmd VimLeavePre * mksession! ~/.mysession
autocmd SessionLoadPost call s:CloseProjects()

set sessionoptions=curdir,tabpages,winsize

if argc() == 0
  silent! source ~/.mysession
  call s:CloseProject()
endif

" Misc
let g:netrw_ftp_cmd="ftp -i"

" Personal data!
let g:github_user = "*********"
let g:github_token = "********"
