local M = {}

---@return string
function M.uuid()
    math.randomseed(os.clock() * 1e3)
    local tpl = 'XXXXXXXX-XXXX-4XXX-%xXXX-XXXXXXXXXXXX'
    ---@diagnostic disable-next-line: redundant-return-value
    return tpl:format(math.random(0x8, 0xb)):gsub('X', function(_)
        return ('%x'):format(math.random(0x0, 0xf))
    end)
end

M.struct = {}

---@param op integer
---@param body string
---@return string
function M.struct.pack(op, body)
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

---@param body string
---@return Struct
function M.struct.unpack(body)
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

M.json = {}

---@param data table
---@param done fun(...)
function M.json.encode(data, done)
    vim.schedule(function()
        done(vim.fn.json_encode(data))
    end)
end

---@param body string
---@param done fun(...)
function M.json.decode(body, done)
    vim.schedule(function()
        done(vim.fn.json_decode(body))
    end)
end

---@param msg string
---@param lvl log_level
---@param min integer
function M.log(msg, lvl, min)
    local level = vim.log.levels[lvl]
    if min <= level then
        if not package.loaded.notify then
            msg = '[nvimcord] '..msg
        end
        vim.schedule(function()
            vim.notify(msg, level, {
                title = 'nvimcord', icon = 'ﭮ'
            })
        end)
    end
end

return M
