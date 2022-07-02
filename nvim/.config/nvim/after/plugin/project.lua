local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end
project.setup({

  -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
  detection_methods = { "pattern" },

  -- patterns used to detect root dir, when **"pattern"** is in detection_methods
  patterns = {
    ".git",
    "Makefile",
    "package.json",
    "venv",
    "Pipfile",
    "Pipfile.lock",
    "go.mod",
  },

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {
    "~/.cargo/*",
    "~/.rustup/*",
    "~/.virtualenvs/*",
    "~/.local/*",
    "~/.applications/*",
  },
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  return
end

telescope.load_extension("projects")
