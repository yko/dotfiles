" Gui-related
if has("gui_running")
    " No toolbar
    set guioptions-=T
    " Text tabs
    set guioptions-=e
    " Only console dialogs
    set guioptions+=c

    " No menubar
    set guioptions-=m

    " No scrollbars
"    set guioptions-=l
"    set guioptions-=L
"    set guioptions-=r
"    set guioptions-=R

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
