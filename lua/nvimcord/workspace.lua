local M = {}

---@return string
function M.get_url()
    return ''
end

---@return string
function M.get_name()
    return vim.fs.basename(vim.loop.cwd() or '')
end

return M
