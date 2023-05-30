local fts = require 'nvimcord.filetypes'
local Discord = require 'nvimcord.discord'
local workspace = require 'nvimcord.workspace'

---@class Config
---@field autostart? boolean
---@field client_id? string
---@field large_file_icon? boolean
---@field log_level? integer
---@field workspace_name nil|string|fun(): string
---@field workspace_url nil|string|fun(): string
local config = {
    autostart = false,
    client_id = '954365489214291979',
    large_file_icon = true,
    log_level = vim.log.levels.INFO,
    workspace_name = workspace.get_name,
    workspace_url = workspace.get_url,
}

local function update()
    local bufnr = vim.api.nvim_get_current_buf()
    local fname = vim.fs.basename(
        vim.api.nvim_buf_get_name(bufnr)
    )

    local ftype = fts.get(vim.bo[bufnr].filetype, fname)
    if ftype == nil or ftype.name == '' then return end

    local readonly = vim.bo[bufnr].readonly
    readonly = readonly or not vim.bo[bufnr].modifiable
    local action = readonly and 'Reading ' or 'Editing '

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
    local assets = {}
    if Discord.config.large_file_icon then
        assets.large_image = ftype.asset
        assets.large_text = ftype.name
        assets.small_image = 'neovim'
        assets.small_text = Discord.version
    else
        assets.small_image = ftype.asset
        assets.small_text = ftype.name
        assets.large_image = 'neovim'
        assets.large_text = Discord.version
    end

    Discord:set_activity {
        details = action..fname,
        state = state,
        timestamps = {
            start = Discord.start,
        },
        buttons = buttons,
        assets = assets
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
                    vim.schedule(update)
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
    opts = opts or {}
    vim.validate {
        autostart = {opts.autostart, 'b', true},
        client_id = {opts.client_id, 's', true},
        large_file_icon = {opts.large_file_icon, 'b', true},
        log_level = {opts.log_level, 'n', true},
        workspace_name = {opts.workspace_name, {'s', 'f'}, true},
        workspace_url = {opts.workspace_url, {'s', 'f'}, true}
    }
    Discord:init(vim.tbl_deep_extend('force', config, opts))

    vim.api.nvim_create_augroup('nvimcord', {clear = true})
    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
            if Discord.config.autostart then start() end
        end,
        group = 'nvimcord',
        desc = 'NvimcordUpdate'
    })
    vim.api.nvim_create_autocmd('VimLeave', {
        callback = function() stop() end,
        group = 'nvimcord',
        desc = 'NvimcordStop'
    })

    vim.api.nvim_create_user_command('NvimcordUpdate', function ()
        if Discord.authenticated then update() else start() end
    end, {})
    vim.api.nvim_create_user_command('NvimcordStop', function()
        stop()
    end, {})
    vim.api.nvim_create_user_command('NvimcordFiletypes', function()
        vim.pretty_print(fts.list())
    end, {})
    vim.api.nvim_create_user_command('NvimcordAssets', function()
        vim.pretty_print(fts.assets())
    end, {})
end

return {setup = setup}
