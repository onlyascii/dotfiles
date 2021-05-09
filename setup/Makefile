plug_vim="$(HOME)/.local/share/nvim/site/autoload/plug.vim"
dotfiles="$(HOME)/.dotfiles"
link:
	$(shell mkdir -p ~/.config/{nvim,tmux})
	$(shell ln -sf "$(dotfiles)/zshrc" ~/.zshrc)
	$(shell ln -sf "$(dotfiles)/init.vim" ~/.config/nvim/init.vim)
	$(shell ln -sf "$(dotfiles)/coc-settings.json" ~/.config/nvim/coc-settings.json)
	$(shell ln -sf "$(dotfiles)/tmux.conf" ~/.config/tmux/tmux.conf)
	$(shell sh -c 'curl -fLo $(plug_vim) --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	nvim +PlugInstall +qa
	nvim +PlugUpdate +qa
	nvim +PlugUpgrade +qa
	nvim +GoInstallBinaries +qa
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
