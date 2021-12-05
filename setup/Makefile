plug_vim="$(HOME)/.local/share/nvim/site/autoload/plug.vim"
dotfiles="$(HOME)/.dotfiles/setup"
export DOTFILES_ORG ?= onlyascii
export DOTFILES_PROJECT ?= dotfiles
export DOTFILES_BRANCH ?= master

define dotfiles_install
curl --retry 5 --fail --silent --retry-delay 1 \
	https://raw.githubusercontent.com/$(DOTFILES_ORG)/$(DOTFILES_PROJECT)/$(DOTFILES_BRANCH)/setup/install.sh | \
	bash -s "$(DOTFILES_ORG)" "$(DOTFILES_PROJECT)" "$(DOTFILES_BRANCH)"
endef

.PHONY : init
## Init dotfiles
init::
	@ $(dotfiles_install)

bundle:
	$(shell brew bundle --file $(dotfiles)/Brewfile)

link:
	$(shell mkdir -p ~/.config/{nvim,tmux})
	$(shell ln -nsf "$(dotfiles)/zshrc" ~/.zshrc)
	$(shell ln -nsf "$(dotfiles)/zshrc.functions" ~/.zshrc.functions)
	$(shell ln -nsf "$(dotfiles)/zshrc.gpg" ~/.zshrc.gpg)
	$(shell ln -nsf "$(dotfiles)/p10k.zsh" ~/.p10k.zsh)
	$(shell ln -nsf "$(dotfiles)/init.vim" ~/.config/nvim/init.vim)
	$(shell ln -nsf "$(dotfiles)/coc-settings.json" ~/.config/nvim/coc-settings.json)
	$(shell ln -nsf "$(dotfiles)/tmux.conf" ~/.config/tmux/tmux.conf)
	$(shell sh -c 'curl -fLo $(plug_vim) --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	nvim +PlugInstall +qa
	nvim +PlugUpdate +qa
	nvim +PlugUpgrade +qa
	nvim +GoInstallBinaries +qa
	rm -rf ~/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
	$(shell compaudit | xargs chmod g-w)
