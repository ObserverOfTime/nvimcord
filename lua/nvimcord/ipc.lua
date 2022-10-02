---@class uv_pipe_t
---@field is_closing fun(self: uv_pipe_t): boolean
---@field connect fun(self: uv_pipe_t, name: string): userdata
---@field shutdown fun(self: uv_pipe_t): userdata
---@field write fun(self: uv_pipe_t, data: string|buffer, callback: fun(err: string?)): userdata
---@field read_start fun(self: uv_pipe_t, callback: fun(err: string?, data: string?))
---@field close fun(self: uv_pipe_t)

---@class IPC
---@field pipe uv_pipe_t
local IPC = {}

if vim.fn.has('win32') == 0 then
    IPC.path = ('%s/discord-ipc-0'):format(
        vim.env.XDG_RUNTIME_DIR or vim.loop.os_tmpdir()
    )
else
    IPC.path = [[\\?\pipe\discord-ipc-0]]
end

function IPC:connect()
    if not self.pipe or self.pipe:is_closing() then
        self.pipe = vim.loop.new_pipe(false)
    end

    assert(self.pipe:connect(self.path))
end

function IPC:shutdown()
    assert(self.pipe:shutdown())
    if not self.pipe:is_closing() then
        self.pipe:close()
    end
end

---@param callback fun(ok: boolean, data: string?)
function IPC:read(callback)
    self.pipe:read_start(function(err, data)
        callback(not err, err or data)
    end)
end

---@param body string|buffer
---@param done fun(err: string?)
function IPC:write(body, done)
    self.pipe:write(body, done)
end

return IPC
