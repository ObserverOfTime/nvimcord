---@return string
local function uuid()
    math.randomseed(os.clock() * 1e3)
    local tpl = 'XXXXXXXX-XXXX-4XXX-%xXXX-XXXXXXXXXXXX'
    return tpl:format(math.random(8, 0xb)):gsub('X', function(_)
        return ('%x'):format(math.random(0, 0xf))
    end)
end

local struct = {}

---@param op integer
---@param body string
---@return string
function struct.pack(op, body)
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
function struct.unpack(body)
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

local json = {}

---@param data table
---@param done fun(...)
function json.encode(data, done)
    vim.schedule(function()
        done(vim.fn.json_encode(data))
    end)
end

---@param body string
---@param done fun(...)
function json.decode(body, done)
    vim.schedule(function()
        done(vim.fn.json_decode(body))
    end)
end

---@alias log_level_s string
--- |"'DEBUG'"
--- |"'ERROR'"
--- |"'INFO'"
--- |"'TRACE'"
--- |"'WARN'"

---@alias log_level_n integer
--- |"vim.log.levels.DEBUG"
--- |"vim.log.levels.ERROR"
--- |"vim.log.levels.INFO"
--- |"vim.log.levels.TRACE"
--- |"vim.log.levels.WARN"

---@param msg string
---@param lvl log_level_s
---@param min log_level_n
local function log(msg, lvl, min)
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

---@class util
local util = {
    json = json,
    log = log,
    struct = struct,
    uuid = uuid
}

return util
