---@class util
local util = {}

---@return string
function util.uuid()
    math.randomseed(os.clock() * 1e3)
    local tpl = 'XXXXXXXX-XXXX-4XXX-%xXXX-XXXXXXXXXXXX'
    return tpl:format(math.random(8, 0xb)):gsub('X', function(_)
        return ('%x'):format(math.random(0, 0xf))
    end)[1]
end

util.struct = {}

---@param op integer
---@param body string
---@return string
function util.struct.pack(op, body)
    local bytes = {}
    local len = #body
    for _ = 1, 4 do
        table.insert(bytes, string.char(op % (2 ^ 8)))
        op = math.floor(op / (2 ^ 8))
    end
    for _ = 1, 4 do
        table.insert(bytes, string.char(len % (2 ^ 8)))
        len = math.floor(len / (2 ^ 8))
    end
    return table.concat(bytes, '')..body
end

---@class Struct
---@field op integer
---@field body string

---@param body string
---@return Struct
function util.struct.unpack(body)
    local byte
    local op = 0
    local iter = 1
    for j = 1, 4 do
        byte = body:sub(iter, iter):byte()
        op = op + byte * (2 ^ ((j - 1) * 8))
        iter = iter + 1
    end
    return {op = op, body = body:sub(iter + 4)}
end

util.json = {}

---@param data table
---@param done fun(...)
function util.json.encode(data, done)
    vim.schedule(function()
        done(vim.fn.json_encode(data))
    end)
end

---@param body string
---@param done fun(...)
function util.json.decode(body, done)
    vim.schedule(function()
        done(vim.fn.json_decode(body))
    end)
end

---@alias log_level string
--- |'DEBUG'
--- |'ERROR'
--- |'INFO'
--- |'TRACE'
--- |'WARN'

---@param msg string
---@param lvl log_level
---@param min integer
function util.log(msg, lvl, min)
    lvl = vim.log.levels[lvl]
    if min <= lvl then
        if not package.loaded.notify then
            msg = '[nvimcord] '..msg
        end
        vim.schedule(function()
            vim.notify(msg, lvl, {
                title = 'nvimcord', icon = 'ﭮ'
            })
        end)
    end
end

return util
