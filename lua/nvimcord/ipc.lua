---@class uv_pipe_t
---@field is_closing fun(): boolean
---@field connect fun(name: string): userdata
---@field shutdown fun(): userdata
---@field write fun(data: buffer): userdata
---@field read_start fun(callback: fun(err: nil|string, data: string|nil))
---@field close fun()

---@class IPC
---@field pipe uv_pipe_t
local IPC = {}

if vim.fn.has('win32') == 0 then
    local temp = vim.env.XDG_RUNTIME_DIR
              or vim.env.TMPDIR
              or vim.env.TMP
              or vim.env.TEMP
              or '/tmp'
    IPC.path = temp..'/discord-ipc-0'
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

---@param callback fun(ok: boolean, data: string)
function IPC:read(callback)
    self.pipe:read_start(function(err, data)
        callback(not err, err or data)
    end)
end

---@param body string
---@param done fun(...)
function IPC:write(body, done)
    self.pipe:write(body, done)
end

return IPC
