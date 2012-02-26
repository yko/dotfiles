" Perl stuff

" Enable perlbrew path
if has("gui_running") && filereadable($HOME . "/perl5/perlbrew/etc/bashrc")
  let $PATH=system("source " . $HOME . "/perl5/perlbrew/etc/bashrc; echo -n $PATH")
endif

autocmd FileType perl match ErrorMsg '\%>78v.\+'
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
