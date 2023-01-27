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

-- Lazy.nvim download {{{

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- }}}

require("binds")
require("config")
require("autocommands")
require("lazy").setup("plugins")
