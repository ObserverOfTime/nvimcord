local fts = require 'nvimcord.filetypes'
local Discord = require 'nvimcord.discord'
local workspace = require 'nvimcord.workspace'

---@type nvimcord.Config
local config = {
    autostart = false,
    client_id = '954365489214291979',
    dynamic_workspace = false,
    large_file_icon = true,
    log_level = vim.log.levels.INFO,
    workspace_name = workspace.get_name,
    workspace_url = workspace.get_url,
}

---@type nil|fun(): string
local _ws_name_fun
---@type nil|fun(): string
local _ws_url_fun

local function update()
    local bufnr = vim.api.nvim_get_current_buf()
    local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))

    if vim.bo[bufnr].buftype ~= '' then return end
    local ftype = fts.get(vim.bo[bufnr].filetype, assert(fname))
    if ftype == nil or ftype.name == '' then return end

    local readonly = vim.bo[bufnr].readonly or not vim.bo[bufnr].modifiable
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
        if #ftype.name > 1 then
            assets.large_text = ftype.name
        else
            assets.large_text = ftype.name..'­'
        end
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
        _ws_name_fun = Discord.config.workspace_name --[[@as fun(): string]]
        Discord.config.workspace_name = Discord.config.workspace_name()
    end
    if type(Discord.config.workspace_url) == 'function' then
        _ws_url_fun = Discord.config.workspace_url --[[@as fun(): string]]
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

---@param opts? nvimcord.Config
local function setup(opts)
    if vim.version().minor < 10 then
        local log = require('nvimcord.util').log
        log('nvim v0.10 is required', 'ERROR', 0)
        return
    end

    opts = opts or {}
    vim.validate {
        autostart = {opts.autostart, 'boolean', true},
        client_id = {opts.client_id, 'string', true},
        dynamic_workspace = {opts.dynamic_workspace, 'boolean', true},
        large_file_icon = {opts.large_file_icon, 'boolean', true},
        log_level = {opts.log_level, 'number', true},
        workspace_name = {opts.workspace_name, {'string', 'function'}, true},
        workspace_url = {opts.workspace_url, {'string', 'function'}, true}
    }
    Discord:init(vim.tbl_deep_extend('force', config, opts))

    vim.api.nvim_create_augroup('nvimcord', {clear = true})
    vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
            if Discord.config.autostart then start() end
        end,
        group = 'nvimcord',
        desc = 'Start nvimcord'
    })
    vim.api.nvim_create_autocmd('VimLeave', {
        callback = function() stop() end,
        group = 'nvimcord',
        desc = 'Stop nvimcord'
    })

    if Discord.config.dynamic_workspace then
        vim.api.nvim_create_autocmd('DirChanged', {
            ---@param event nvimcord.AutocmdArgs
            callback = function(event)
                if _ws_name_fun then
                    Discord.config.workspace_name = _ws_name_fun()
                else
                    Discord.config.workspace_name = vim.fs.basename(event.file)
                end
                if _ws_url_fun then
                    Discord.config.workspace_url = _ws_url_fun()
                end
            end,
            group = 'nvimcord',
            desc = 'Update nvimcord workspace'
        })
    end

    vim.api.nvim_create_user_command('NvimcordUpdate', function()
        if Discord.authenticated then update() else start() end
    end, {desc = 'Update rich presence'})
    vim.api.nvim_create_user_command('NvimcordStop', function()
        stop()
    end, {desc = 'Stop rich presence'})
    vim.api.nvim_create_user_command('NvimcordFiletypes', function()
        vim.print(fts.list())
    end, {desc = 'List supported filetypes'})
    vim.api.nvim_create_user_command('NvimcordAssets', function()
        vim.print(fts.assets())
    end, {desc = 'List available assets'})
end

return {setup = setup}
