local M = {}

---@return string
function M.get_url()
    return ''
end

---@param path string?
---@return string
local function find_git_repo_dir(path)
    -- use current working directory if no path specified
    path = path or vim.loop.cwd()
    -- Ripped straight from :help vim.fs.parents()
    -- with some minor changes
    for dir in vim.fs.parents(path) do
        if vim.fn.isdirectory(dir .. "/.git") == 1 then
            return dir
        end
    end
    return ''
end

---@return string
function M.get_name()
    return vim.fs.basename(find_git_repo_dir() or vim.loop.cwd() or '')
end

return M
