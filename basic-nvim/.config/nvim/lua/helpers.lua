local M = {}

function M.is_installed(bin)
    return vim.fn.executable(bin) == 1
end

local required_binaries = { "fzf", "rg", "fd", "git", "curl" }
local linux_extra_binaries = { "unzip", "wget", "gzip", "7z" }

local alternatives = {
    fd = { "fd", "fdfind" },
}

local function has_binary(bin)
    for _, name in ipairs(alternatives[bin] or { bin }) do
        if M.is_installed(name) then
            return true
        end
    end
    return false
end

local function get_required_binaries()
    local bins = vim.deepcopy(required_binaries)
    if vim.fn.has("linux") == 1 then
        vim.list_extend(bins, linux_extra_binaries)
    end
    return bins
end

function M.check_binaries()
    local missing = {}
    for _, bin in ipairs(get_required_binaries()) do
        if not has_binary(bin) then
            table.insert(missing, bin)
        end
    end
    return missing
end

return M
