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

    " No right-hand scrollbars
    set guioptions-=r
    set guioptions-=R

    " No left-hand scrollbars
    set guioptions-=l
    set guioptions-=L

    " No bottom scrollbars
    set guioptions-=b
    set guioptions-=B

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
    " I need a fullscreen + 1 on Ubuntu. Not sure about others
    autocmd GUIEnter * set lines+=1
endif
