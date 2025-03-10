local wezterm = require("wezterm")
local keys = require("keys")
local launch_menu = require("launcher")
local mouse_bindings = require("mouse_bindings")
local config_module = require("options")
local theme_module = require("theme")

local config = wezterm.config_builder()

config.launch_menu = launch_menu
config.keys = keys
config.mouse_bindings = mouse_bindings

config = config_module.apply_to_config(config)
config = theme_module.apply_to_config(config)

return config
