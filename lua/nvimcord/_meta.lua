---@meta

---@class nvimcord.Config
---@field autostart? boolean
---@field client_id? string
---@field dynamic_workspace? boolean
---@field large_file_icon? boolean
---@field log_level? integer
---@field workspace_name? string|fun(): string
---@field workspace_url? string|fun(): string

---@class nvimcord.Struct
---@field op integer
---@field body string

---@class nvimcord.FileType
---@field name string
---@field asset string

---@class nvimcord.Activity.Assets
---@field large_image string
---@field large_text string?
---@field small_image string?
---@field small_text string?

---@class nvimcord.Activity.Timestamps
---@field start number
---@field end number?

---@class nvimcord.Activity.Button
---@field label string
---@field url string

---@class nvimcord.Activity
---@field details string
---@field state string?
---@field timestamps nvimcord.Activity.Timestamps?
---@field buttons nvimcord.Activity.Button[]?
---@field assets nvimcord.Activity.Assets

---@class nvimcord.Discord
---@field config nvimcord.Config
---@field authenticated? boolean
---@field version string
---@field timer uv.uv_timer_t
---@field nonce string|vim.NIL
---@field pid integer
---@field start number?
---@field _last nvimcord.Activity?

---@class nvimcord.AutocmdArgs
---@field buf integer
---@field event string
---@field file string
---@field match string
---@field id integer
---@field group? integer

---@alias nvimcord.log_level 'DEBUG'|'ERROR'|'INFO'|'TRACE'|'WARN'
