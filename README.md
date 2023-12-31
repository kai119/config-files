# config-files

This repository contains configuration files that I use to set up various applications my development environment

## NeoVim Installation

To ensure NeoVim installs with the correct version, follow the instructions to install via the NeoVim PPA [here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## NeoVim configuration

the `vim` directory contains the configuration files needed to setup NeoVim as a development environment. Files included are:

- `init.vim` - the init file that is run when nvim opens, contains all plugins and their basic setup
- `coc-settings.json` - the settings for the COC autocompletion plugin

To configure NeoVim using these files, vim-plug needs to be installed. Installation instructions can be found [here](https://github.com/junegunn/vim-plug)

## COC Plugin Setup

COC is the code autocompletion plugin for NeoVim and it requires a bit of extra setup. Steps to setup are below:

- Install nodejs - `sudo apt install nodejs`
- Install npm - `sudo apt install npm`
- Install yarn - `sudo npm install -g yarn`
- Update node - `sudo npm install -g n && sudo n latest`
- `cd ~/.local/share/nvim/plugged`
- `yarn install && yarn build`
- Install language servers for the languages that you use (information can be found [here](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

## Tagbar Plugin Setup

Tagbar is a plugin that shows information on variables, functions, and imports with the current file. To set it up, exuberant-ctags needs to be installed by running the command `sudo apt install exuberant-ctags`

## Autopairs Setup

Nvim-Autopairs is a plugin that automatically closes brackets and quotation marks when they are opened. To use Autopairs, nvim needs to be installed using pip on a Python version of >3.10. To install nvim through pip, run `pip3 install neovim` (you don't have to uninstall the previous version of nvim)
