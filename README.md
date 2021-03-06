<!-- panvimdoc-ignore-start -->

<img src=".github/logo.png" alt="Logo" align="right" width="128"/>

<!-- panvimdoc-ignore-end -->

# nvimcord

A Discord Rich Presence plugin for Neovim written in Lua.

## Installation

### packer

```lua
use 'ObserverOfTime/nvimcord'
```

### plug

```vim
Plug 'ObserverOfTime/nvimcord'
```

### dein

```vim
call dein#add('ObserverOfTime/nvimcord')
```

## Configuration

```lua
-- NOTE: these are the defaults
require('nvimcord').setup {
    -- Start the RPC manually (boolean)
    autostart = false,
    -- Set the client ID (string)
    client_id = '954365489214291979',
    -- Set the log level (enum)
    log_level = vim.log.levels.INFO,
    -- Get the workspace name (function|string)
    workspace_name = function()
      return --[[cwd basename]]
    end,
    -- Get the workspace URL (function|string)
    workspace_url = function()
      return ''
    end
}
```

Options can also be configured using Vim variables.

This can be useful when using [exrc] or a project plugin.

```vim
let g:nvimcord#autostart = v:false
let g:nvimcord#client_id = '954365489214291979'
let g:nvimcord#log_level = 2
" NOTE: these can only be defined as strings
let g:nvimcord#workspace_name = ''
let g:nvimcord#workspace_url = ''
```

[exrc]: https://neovim.io/doc/user/starting.html#exrc

### Filetypes

```lua
local fts = require 'nvimcord.filetypes'

-- NOTE: the asset can also be an image URL

-- override options
fts.filetype['vim'].name = 'Vim Script'
fts.filetype['vim'].asset = 'neovim'

-- new filetype
fts.filetype['teal'] = {
    name = 'Teal',
    asset = 'lua'
}

-- new pattern
fts.pattern['^%.gitignore$'] = {
    name = 'git ignore',
    asset = 'git'
}

-- ignore filetype
fts.ignore.filetype['vim'] = true

-- ignore filename
fts.ignore.filename['init.vim'] = true
```

## Commands

#### :NvimcordUpdate

Start or update the rich presence.

#### :NvimcordStop

Stop the rich presence.

#### :NvimcordFiletypes

List the supported filetypes.

#### :NvimcordAssets

List the supported assets.

## TODO

* [x] Ignore by filename
* [ ] Cache filename patterns
* [ ] Detect workspace through git
* [ ] Warn when pipe doesn't exist
* [ ] Set idle status after some time

## Assets

The assets are available [here][disroot].

### Sources

- [file-icons/icons](https://github.com/file-icons/icons)
- [file-icons/DevOpicons](https://github.com/file-icons/DevOpicons)
- [file-icons/MFixx](https://github.com/file-icons/MFixx)
- [primer/octicons](https://github.com/primer/octicons)

### Palette

The icons use the basic colours from [file-icons/atom][colours].

<!-- panvimdoc-ignore-start -->

- ![#ac4142](https://dummyimage.com/12x12/ac4142&text=+ "#ac4142") red<br>
- ![#90a959](https://dummyimage.com/12x12/90a959&text=+ "#90a959") green<br>
- ![#f4bf75](https://dummyimage.com/12x12/f4bf75&text=+ "#f4bf75") yellow<br>
- ![#6a9fb5](https://dummyimage.com/12x12/6a9fb5&text=+ "#6a9fb5") blue<br>
- ![#8f5536](https://dummyimage.com/12x12/8f5536&text=+ "#8f5536") maroon<br>
- ![#aa759f](https://dummyimage.com/12x12/aa759f&text=+ "#aa759f") purple<br>
- ![#d28445](https://dummyimage.com/12x12/d28445&text=+ "#d28445") orange<br>
- ![#75b5aa](https://dummyimage.com/12x12/75b5aa&text=+ "#75b5aa") cyan<br>
- ![#ff00cc](https://dummyimage.com/12x12/ff00cc&text=+ "#ff00cc") pink<br>
- ![#7f7f7f](https://dummyimage.com/12x12/7f7f7f&text=+ "#7f7f7f") grey<br>

<!-- panvimdoc-ignore-end -->

[disroot]: https://cloud.disroot.org/s/3HCpppopkrcR6iK
[colours]: https://github.com/file-icons/atom/blob/master/styles/colours.less#L10-L19

## Alternatives

* [presence.nvim](https://github.com/andweeb/presence.nvim) (Lua)
* [discord.nvim](https://github.com/aurieh/discord.nvim) (Python)
  * [or my own fork](https://github.com/ObserverOfTime/discord.nvim)
* [vimsence](https://github.com/vimsence/vimsence) (Python)
* [vimdiscord](https://github.com/vbe0201/vimdiscord) (Python)
* [vimcord](https://github.com/Stoozy/vimcord) (Python)
* [nvimsence.rs](https://github.com/nickofolas/nvimsence.rs) (Rust)
* [vdrpc](https://github.com/pucka906/vdrpc) (C)
