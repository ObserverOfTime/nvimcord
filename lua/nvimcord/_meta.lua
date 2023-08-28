---@meta

---@type uv
vim.uv = ...

---@class Config
---@field autostart? boolean
---@field client_id? string
---@field dynamic_workspace? boolean
---@field large_file_icon? boolean
---@field log_level? integer
---@field workspace_name? string|fun(): string
---@field workspace_url? string|fun(): string

---@class Struct
---@field op integer
---@field body string

---@class FT
---@field name string
---@field asset string

---@class Assets
---@field large_image string
---@field large_text string?
---@field small_image string?
---@field small_text string?

---@class Timestamps
---@field start number
---@field end number?

---@class Button
---@field label string
---@field url string

---@class Activity
---@field details string
---@field state string?
---@field timestamps Timestamps?
---@field buttons Button[]?
---@field assets Assets

---@class Discord
---@field config Config
---@field version string
---@field timer uv_timer_t
---@field nonce string
---@field pid integer
---@field start number?
---@field _last Activity?

---@alias log_level
--- |'DEBUG'
--- |'ERROR'
--- |'INFO'
--- |'TRACE'
--- |'WARN'

---@class AutocmdArgs
---@field buf integer
---@field event string
---@field file string
---@field match string
---@field id integer
---@field group? integer
