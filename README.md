# NeoVim File Configuration

## Preview
![Preview](screenshots/2023-08-17_17-14.png)

## Requirement
- [Vim plug](https://github.com/junegunn/vim-plug)
- Fuzzy finder [fzf](https://github.com/junegunn/fzf)
- [Ripgrep ](https://github.com/BurntSushi/ripgrep)
- [Bat](https://github.com/sharkdp/bat)

## Installation
### Clone repos

```
git clone https://github.com/ngoc24794/vim-dotfiles.git ~/.config/nvim
```

### Installing plugins
You have to install NodeJS first. Then open neovim `nvim` and run `:PlugInstall` command. Find plugins in `configs\plugins.vim` file.

### Key mapping
Find key mapping in `configs\keymaps.vim` file.

### Coc install LSP
Run `:CocInstall <LSP-name>` command in neovim in order to install LSP.

For example, to install LSP for Javascript, run the following command:
```
:CocInstall coc-tsserver
```
### License
MIT
