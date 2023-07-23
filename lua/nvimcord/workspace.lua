local M = {}

---@return string
function M.get_url()
    return ''
end

--@return string
local function find_git_repo_dir()
    -- Ripped straight from :help vim.fs.parents()
    for dir in vim.fs.parents(vim.loop.cwd()) do
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
