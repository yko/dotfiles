" Session management
" Experimental!

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
