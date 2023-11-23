local IPC = require 'nvimcord.ipc'
local u = require 'nvimcord.util'

---@enum nvimcord.OP
local OP = {AUTHENTICATE = 0, FRAME = 1, CLOSE = 2}

local m = {
    disconnected = 'Disconnected',
    closed_pipe = 'The pipe was closed',
    connecting = 'Connecting to pipe: %s',
    connect_err = 'Failed to connect to pipe: %s',
    read_err = 'Failed to read from pipe: %s',
    write_err = 'Failed to write to pipe: %s',
    read_ok = 'Read payload from pipe: %s',
    write_ok = 'Wrote payload to pipe: %s',
    discord_err = 'Received error: %s',
    opcode_err = 'Unexpected OP code: %d (%s)',
    nonce_err = 'Unexpected nonce: %s (expected %s)',
}

---@class nvimcord.Discord
local Discord = {}
setmetatable(Discord, {
    __gc = function() Discord:close() end
})

---@param config nvimcord.Config
function Discord:init(config)
    self.config = setmetatable({}, {
        ---@param t nvimcord.Config
        ---@param k string
        __index = function(t, k)
            if vim.fn.exists('g:nvimcord#'..k) == 0 then
                t[k] = config[k]
            else
                t[k] = vim.g['nvimcord#'..k]
            end
            return t[k]
        end
    })
    self.authenticated = false
    self.pid = assert(vim.uv.os_getpid())
    self.timer = assert(vim.uv.new_timer())
    self.version = ('v%s'):format(vim.version())
end

---@param lvl nvimcord.log_level
---@param msg string?
---@vararg string
function Discord:log(lvl, msg, ...)
    if msg == nil then return end
    u.log(msg:format(...), lvl, self.config.log_level)
end

---@param done fun(ok: boolean)
function Discord:connect(done)
    local ok = IPC:connect()
    if ok then
        self:log('INFO', m.connecting, IPC.path)
    else
        IPC.pipe = nil
        self:log('WARN', m.connect_err, IPC.path)
    end
    done(ok)
end

---@param done fun(ok: boolean)
---@param version? number
function Discord:handshake(done, version)
    if self.authenticated then
        return done(true)
    end
    self.nonce = vim.NIL
    local data = {
        v = version or 1,
        client_id = self.config.client_id
    }
    self:call(OP.AUTHENTICATE, data, function(ok)
        self.authenticated = ok
        done(ok)
    end)
end

---@param activity nvimcord.Activity
function Discord:set_activity(activity)
    if vim.deep_equal(activity, self._last) then return end
    self._last = activity
    self.nonce = u.uuid()
    local data = {
        cmd = 'SET_ACTIVITY',
        nonce = self.nonce,
        args = {
            pid = self.pid,
            activity = activity
        }
    }
    self:call(OP.FRAME, data, function() end)
end

function Discord:close()
    local ok, err = pcall(function()
        return IPC:shutdown()
    end)
    if ok then
        self:log('INFO', m.disconnected)
        self.authenticated = false
    else
        self:log('ERROR', err)
    end
end

---@param op nvimcord.OP
---@param data table
---@param done fun(ok: boolean)
function Discord:call(op, data, done)
    u.json.encode(data, function(encoded)
        IPC:read(function(ok, response)
            if not ok then
                self:log('ERROR', m.read_err, response)
                return done(false)
            end

            if not response then
                self:log('WARN', m.closed_pipe)
                return done(false)
            end

            local payload = u.struct.unpack(response)
            self:log('DEBUG', m.read_ok, payload.body)

            u.json.decode(payload.body, function(decoded)
                if payload.op ~= OP.FRAME then
                    self:log('ERROR', m.opcode_err,
                        decoded.code, decoded.message)
                    return done(false)
                end

                if decoded.nonce ~= self.nonce then
                    self:log('ERROR', m.nonce_err,
                        decoded.nonce, self.nonce)
                    return done(false)
                end

                return done(true)
            end)
        end)

        local payload = u.struct.pack(op, encoded)
        IPC:write(payload, function(err)
            if err then
                self:log('ERROR', m.write_err, err)
                return done(false)
            end

            self:log('DEBUG', m.write_ok, encoded)
        end)
    end)
end

return Discord
