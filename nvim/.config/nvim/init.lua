--[[ ==============================
    _       _ __    __
   (_)___  (_) /_  / /_  ______ _
  / / __ \/ / __/ / / / / / __ `/
 / / / / / / /__ / / /_/ / /_/ /
/_/_/ /_/_/\__(_)_/\__,_/\__,_/
=================================== ]]

-- Inspired by:
-- https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
-- https://www.youtube.com/c/ThePrimeagen
-- https://github.com/tjdevries/config_manager
-- https://github.com/craftzdog/dotfiles-public
-- https://github.com/sonph/dotfiles
-- https://github.com/LunarVim/nvim-basic-ide

-- Speed up {{{
-- vim.opt.shadafile = "NONE"
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
-- }}}

require("config")
require("binds")
require("plugins")
require("autocommands")
require("jc.lsp")
