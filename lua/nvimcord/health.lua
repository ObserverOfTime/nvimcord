--- Run the healthcheck
local function check()
    local path = require('nvimcord.ipc').path
    if vim.fn.filewritable(path) == 1 then
        vim.health.ok('Discord socket found.')
    else
        vim.health.error('Discord socket not found!')
    end
    if vim.fn.executable('git') == 1 then
        vim.health.ok('git executable found.')
    else
        vim.health.warn('git executable not found!')
        vim.health.info('It is required for workspace detection.')
    end
end

return {check = check}
