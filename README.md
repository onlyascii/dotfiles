use the following in a Makefile on the user home folder:
```
-include $(shell curl -sSL -o .dotfiles.sh "https://git.io/onlyascii-setup"; echo .dotfiles.sh)
```

## Todo

- [ ] Include the Brewfile initialisation
- [ ] Cleanup - link task could use an other name
- [ ] Initialise tmux plugins automatically
- [ ] Vim could use spell checking
- [ ] Use jump in zsh
