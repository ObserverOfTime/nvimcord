local M = {}

---@return string
function M.get_url()
    local o = vim.system({
        'git', 'remote', 'get-url', 'origin'
    }, {text = true}):wait()
    if o.code ~= 0 then return '' end
    local pattern = [[\%([a-z+]\+://\)\?\%(\w\+@\)\?\(.\{-1,}\)[:/]\(.\{-1,}\)\%(.git\)\?\n]]
    return vim.fn.substitute(o.stdout, pattern, [[https://\1/\2]], '')
end

---@return string
function M.get_name()
    local cwd = vim.loop.cwd()
    local home = vim.loop.os_homedir()
    local git = vim.fs.find('.git', {
        type = 'directory',
        stop = home,
        upward = true
    })[1]
    if git then git = vim.fs.dirname(git) end
    return assert(vim.fs.basename(git or cwd or ''))
end

return M
