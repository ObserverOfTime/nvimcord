local fts = require 'nvimcord.filetypes'
local Discord = require 'nvimcord.discord'
local workspace = require 'nvimcord.workspace'

---@class Config
---@field autostart? boolean
---@field client_id? string
---@field log_level? log_level_n
---@field workspace_name string|fun(): string
---@field workspace_url string|fun(): string
local config = {
    autostart = false,
    client_id = '954365489214291979',
    log_level = vim.log.levels.INFO,
    workspace_name = workspace.get_name,
    workspace_url = workspace.get_url,
}

local function update()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(bufnr, 'ft')
    local fname = vim.api.nvim_buf_get_name(bufnr)
    fname = vim.fn.fnamemodify(fname, ':t')

    local ftype = fts:get(ft, fname)
    if ftype == nil or ftype.name == '' then return end

    local ro = vim.api.nvim_buf_get_option(bufnr, 'ro')
    local ma = vim.api.nvim_buf_get_option(bufnr, 'ma')
    local action = (ro or not ma) and 'Reading ' or 'Editing '

    local state, buttons = nil, nil
    if Discord.config.workspace_name ~= '' then
        state = 'Working on '..Discord.config.workspace_name
    end
    if Discord.config.workspace_url ~= '' then
        buttons = {{
            label = 'Open project URL',
            url = Discord.config.workspace_url
        }}
    end

    Discord:set_activity {
        details = action..fname,
        state = state,
        timestamps = {
            start = Discord.start,
        },
        buttons = buttons,
        assets = {
            large_image = ftype.asset,
            large_text = ftype.name,
            small_image = 'neovim',
            small_text = Discord.version
        }
    }
end

local function start()
    if type(Discord.config.workspace_name) == 'function' then
        Discord.config.workspace_name = Discord.config.workspace_name()
    end
    if type(Discord.config.workspace_url) == 'function' then
        Discord.config.workspace_url = Discord.config.workspace_url()
    end

    Discord:connect(function(ok)
        if not ok then return end
        Discord:handshake(function(ok_)
            if ok_ then
                Discord.start = os.time()
                Discord.timer:start(0, 15e3, function()
                    vim.defer_fn(update, 0)
                end)
            end
        end)
    end)
end

local function stop()
    if Discord.authenticated then
        Discord.timer:stop()
        Discord:close()
    end
end

---@param opts? Config
local function setup(opts)
    Discord:init(vim.tbl_deep_extend('force', config, opts or {}))

    vim.api.nvim_create_augroup('nvimcord', {})
    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
            if Discord.config.autostart then start() end
        end,
        group = 'nvimcord',
        desc = 'NvimcordUpdate'
    })
    vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
            Discord.timer:stop()
        end,
        group = 'nvimcord',
        desc = 'NvimcordStop'
    })

    vim.api.nvim_add_user_command('NvimcordUpdate', function ()
        if Discord.authenticated then update() else start() end
    end, {})
    vim.api.nvim_add_user_command('NvimcordStop', function()
        stop()
    end, {})
    vim.api.nvim_add_user_command('NvimcordFiletypes', function()
        print(vim.inspect(fts:list()))
    end, {})
    vim.api.nvim_add_user_command('NvimcordAssets', function()
        print(vim.inspect(fts:assets()))
    end, {})
end

return {setup = setup}
