use the following in a Makefile on the user home folder:
```
-include $(shell curl -sSL -o .dotfiles "https://git.io/onlyascii-setup"; echo .dotfiles)
```
