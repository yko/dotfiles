" Enable perlbrew path
if has("gui_running") && filereadable($HOME . "/perl5/perlbrew/etc/bashrc")
  let $PATH=system("source " . $HOME . "/perl5/perlbrew/etc/bashrc; echo -n $PATH")
endif


