---@class Workspace
local workspace = {}

---@return string
function workspace.get_url()
    return ''
end

---@return string
function workspace.get_name()
    return vim.fn.fnamemodify(vim.loop.cwd(), ':t')
end

return workspace
