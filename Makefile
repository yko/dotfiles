all: git vim perl 

perl:
	@echo "installing perl stuff..."
	$(call safeln,.module-starter,~/.module-starter)
	$(call safeln,.perltidyrc,~/.perltidyrc)
	$(call safeln,.perltidyrc,~/.perltidyrc)

vim: git-executable
	@echo "installing vim stuff..."
	$(call safeln,.vimrc,~/.vimrc)
	$(call safeln,.vim,~/.vim)
	@echo "initialize bundled submodules..."
	@git submodule update --init --recursive .vim
	@curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -s -o .vim/autoload/pathogen.vim

git: git-executable
	@echo "installing git stuff..."
	$(call safeln,.gitignore,~/.gitignore_global)
	@git config --global core.excludesfile ~/.gitignore_global

git-executable:
	@hash git 2>&- || { echo >&2 "git executable required but it's not installed"; exit 1; }

safeln =                                        \
	$(call saferm,$(2));                    \
	ln -s $(PWD)/$(1) $(2)

saferm =                                        \
	@if [ -L $(1) ]; then                   \
		rm $(1);                        \
	elif [ -e $(1) ]; then                  \
		mv $(1) $(addsuffix .bak,$(1)); \
	fi
