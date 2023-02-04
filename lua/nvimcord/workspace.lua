local M = {}

---@return string
function M.get_url()
    return ''
end

---@return string
function M.get_name()
    return vim.fn.fnamemodify(vim.loop.cwd(), ':t')
end

return M
