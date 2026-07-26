local M = {}

function M.is_node_installed()
    return vim.fn.executable("node") == 1
end

function M.is_python_installed()
    return vim.fn.executable("python3") == 1
end

function M.is_lua_installed()
    return vim.fn.executable("lua") == 1
end

return M
