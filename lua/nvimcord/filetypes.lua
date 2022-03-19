---@class FT
---@field name string
---@field asset string

---@class filetypes
local filetypes = {}

---@param name string
---@param asset string
---@return FT
local function ft(name, asset)
    return {name = name, asset = asset}
end

---@type table<string, FT>
filetypes.filetype = setmetatable({
    ['actionscript'] = ft('ActionScript', 'actionscript'),
    ['ada'] = ft('Ada', 'ada'),
    ['ant'] = ft('Ant', 'ant'),
    ['antlr'] = ft('ANTLR', 'antlr'),
    ['apache'] = ft('Apache', 'apache'),
    ['applescript'] = ft('AppleScript', 'applescript'),
    ['arduino'] = ft('Arduino', 'arduino'),
    ['asciidoc'] = ft('AsciiDoc', 'asciidoc'),
    ['asm'] = ft('assembly', 'asm'),
    ['asp'] = ft('ASP.NET', 'dotnet'),
    ['aspvbs'] = ft('ASP.NET', 'dotnet'),
    ['awk'] = ft('AWK', 'shell'),
    ['bash'] = ft('Bash', 'shell'),
    ['bib'] = ft('BibTeX', 'bib'),
    ['blade'] = ft('Blade', 'laravel'),
    ['brainfuck'] = ft('Brainfuck', 'brainfuck'),
    ['bzl'] = ft('Bazel', 'bazel'),
    ['c'] = ft('C', 'clang'),
    ['cabal'] = ft('Cabal', 'cabal'),
    ['cabalconfig'] = ft('Cabal', 'cabal'),
    ['cabalproject'] = ft('Cabal', 'cabal'),
    ['cfg'] = ft('config', 'config'),
    ['chicken'] = ft('Chicken', 'scheme'),
    ['clojure'] = ft('Clojure', 'clojure'),
    ['cmake'] = ft('CMake', 'cmake'),
    ['coffee'] = ft('CofeeScript', 'coffeescript'),
    ['conf'] = ft('config', 'config'),
    ['config'] = ft('config', 'config'),
    ['cpp'] = ft('C++', 'cpp'),
    ['crystal'] = ft('Crystal', 'crystal'),
    ['cs'] = ft('C#', 'csharp'),
    ['cson'] = ft('CSON', 'json'),
    ['css'] = ft('CSS', 'css'),
    ['csv'] = ft('CSV', 'csv'),
    ['cython'] = ft('Cython', 'cython'),
    ['d'] = ft('D', 'dlang'),
    ['dart'] = ft('Dart', 'dart'),
    ['debchangelog'] = ft('Debian changelog', 'debian'),
    ['debcontrol'] = ft('Debian control', 'debian'),
    ['debcopyright'] = ft('Debian copyright', 'debian'),
    ['debsources'] = ft('Debian sources', 'debian'),
    ['delphi'] = ft('Delphi', 'pascal'),
    ['diff'] = ft('diff', 'diff'),
    ['django'] = ft('Django', 'django'),
    ['dockerfile'] = ft('Docker', 'docker'),
    ['dosbatch'] = ft('batch', 'batch'),
    ['dosini'] = ft('INI', 'config'),
    ['dot'] = ft('DOT', 'graphviz'),
    ['dotnet'] = ft('.NET', 'dotnet'),
    ['dtd'] = ft('DTD', 'xml'),
    ['elixir'] = ft('Elixir', 'elixir'),
    ['elm'] = ft('Elm', 'elm'),
    ['erlang'] = ft('Erlang', 'erlang'),
    ['eruby'] = ft('eRuby', 'rails'),
    ['fasm'] = ft('FASM', 'asm'),
    ['fish'] = ft('fish', 'shell'),
    ['fsharp'] = ft('F#', 'fsharp'),
    ['fontforge_script'] = ft('FontForge', 'fontforge'),
    ['gitattributes'] = ft('git attributes', 'git'),
    ['gitconfig'] = ft('git config', 'git'),
    ['gitignore'] = ft('git ignore', 'git'),
    ['glsl'] = ft('GLSL', 'opengl'),
    ['go'] = ft('Go', 'golang'),
    ['graphql'] = ft('GraphQL', 'graphql'),
    ['groovy'] = ft('Groovy', 'groovy'),
    ['haml'] = ft('Haml', 'haml'),
    ['haskell'] = ft('Haskell', 'haskell'),
    ['haxe'] = ft('Haxe', 'haxe'),
    ['html'] = ft('HTML', 'html'),
    ['html.mustache'] = ft('Mustache', 'mustache'),
    ['html.twig'] = ft('Twig', 'twig'),
    ['htmldjango'] = ft('Django', 'django'),
    ['httplog'] = ft('log', 'log'),
    ['idris'] = ft('Idris', 'idris'),
    ['ipynb'] = ft('Jupyter Notebook', 'ipynb'),
    ['iss'] = ft('Inno Setup', 'inno'),
    ['jade'] = ft('Pug', 'pug'),
    ['java'] = ft('Java', 'java'),
    ['javascript'] = ft('JavaScript', 'javascript'),
    ['javascript.jsx'] = ft('JSX', 'jsx'),
    ['javascriptreact'] = ft('React', 'jsx'),
    ['jinja'] = ft('Jinja', 'jinja'),
    ['jinja.html'] = ft('Jinja', 'jinja'),
    ['jinja2'] = ft('Jinja', 'jinja'),
    ['jproperties'] = ft('properties', 'config'),
    ['json'] = ft('JSON', 'json'),
    ['jsonc'] = ft('JSON', 'json'),
    ['json5'] = ft('JSON', 'json'),
    ['jsp'] = ft('JSP', 'java'),
    ['jsx'] = ft('JSX', 'jsx'),
    ['julia'] = ft('Julia', 'julia'),
    ['kconfig'] = ft('Kconfig', 'linux'),
    ['kotlin'] = ft('Kotlin', 'kotlin'),
    ['less'] = ft('Less', 'less'),
    ['liquid'] = ft('Liquid', 'liquid'),
    ['lisp'] = ft('Lisp', 'lisp'),
    ['livescript'] = ft('LiveScript', 'livescript'),
    ['llvm'] = ft('LLVM', 'llvm'),
    ['log'] = ft('log', 'log'),
    ['log4j'] = ft('log', 'log'),
    ['lprolog'] = ft('lambda Prolog', 'prolog'),
    ['ls'] = ft('LiveScript', 'livescript'),
    ['lua'] = ft('Lua', 'lua'),
    ['make'] = ft('Make', 'make'),
    ['manifest'] = ft('Java manifest', 'manifest'),
    ['markdown'] = ft('Markdown', 'markdown'),
    ['matlab'] = ft('MATLAB', 'matlab'),
    ['meson'] = ft('Meson', 'meson'),
    ['mesonopt'] = ft('Meson', 'meson'),
    ['messages'] = ft('log', 'log'),
    ['mips'] = ft('MIPS', 'asm'),
    ['mustache'] = ft('Mustache', 'mustache'),
    ['mysql'] = ft('MySQL', 'sql'),
    ['nasm'] = ft('NASM', 'asm'),
    ['nginx'] = ft('NGINX', 'nginx'),
    ['nim'] = ft('Nim', 'nim'),
    ['nix'] = ft('Nix', 'nix'),
    ['nsis'] = ft('NSIS', 'nsis'),
    ['objc'] = ft('Objective-C', 'objc'),
    ['ocaml'] = ft('OCaml', 'ocaml'),
    ['octave'] = ft('Octave', 'octave'),
    ['opencl'] = ft('OpenCL', 'opencl'),
    ['pascal'] = ft('Pascal', 'pascal'),
    ['perl'] = ft('Perl', 'perl'),
    ['pgsql'] = ft('PostgreSQL', 'sql'),
    ['php'] = ft('PHP', 'php'),
    ['PKGBUILD'] = ft('PKGBUILD', 'archlinux'),
    ['plaintex'] = ft('Plain TeX', 'tex'),
    ['plantuml'] = ft('PlantUML', 'graphviz'),
    ['plsql'] = ft('PL/SQL', 'sql'),
    ['pod'] = ft('Pod', 'perl'),
    ['postcss'] = ft('PostCSS', 'postcss'),
    ['postscr'] = ft('PostScript', 'postscript'),
    ['prolog'] = ft('Prolog', 'prolog'),
    ['ps1'] = ft('PowerShell', 'pwsh'),
    ['pug'] = ft('Pug', 'pug'),
    ['purescript'] = ft('PureScript', 'purescript'),
    ['pymanifest'] = ft('Python manifest', 'manifest'),
    ['pyrex'] = ft('Pyrex', 'cython'),
    ['python'] = ft('Python', 'python'),
    ['qbs'] = ft('Qbs', 'qt5'),
    ['qmake'] = ft('qmake', 'qt5'),
    ['qml'] = ft('QML', 'qt5'),
    ['r'] = ft('R', 'rlang'),
    ['racket'] = ft('Racket', 'scheme'),
    ['raku'] = ft('Raku', 'raku'),
    ['redis'] = ft('Redis', 'redis'),
    ['requirements'] = ft('requirements', 'pypi'),
    ['rmd'] = ft('R Markdown', 'rmarkdown'),
    ['rnoweb'] = ft('Rnoweb', 'rmarkdown'),
    ['rst'] = ft('reStructuredText', 'rst'),
    ['ruby'] = ft('Ruby', 'ruby'),
    ['rust'] = ft('Rust', 'rust'),
    ['sass'] = ft('Sass', 'sass'),
    ['scala'] = ft('Scala', 'scala'),
    ['scheme'] = ft('Scheme', 'scheme'),
    ['scss'] = ft('SCSS', 'sass'),
    ['sed'] = ft('sed', 'shell'),
    ['sh'] = ft('shell', 'shell'),
    ['spec'] = ft('RPM spec', 'redhat'),
    ['sql'] = ft('SQL', 'sql'),
    ['sqloracle'] = ft('Oracle SQL', 'sql'),
    ['stylus'] = ft('Stylus', 'stylus'),
    ['svelte'] = ft('Svelte', 'svelte'),
    ['svg'] = ft('SVG', 'svg'),
    ['swift'] = ft('Swift', 'swift'),
    ['syslog'] = ft('log', 'log'),
    ['systemverilog'] = ft('SystemVerilog', 'verilog'),
    ['tcl'] = ft('Tcl', 'tcl'),
    ['tex'] = ft('TeX', 'tex'),
    ['text'] = ft('text', 'text'),
    ['textile'] = ft('Textile', 'textile'),
    ['toml'] = ft('TOML', 'toml'),
    ['twig'] = ft('Twig', 'twig'),
    ['typescript'] = ft('TypeScript', 'typescript'),
    ['typescript.jsx'] = ft('TSX', 'jsx'),
    ['typescriptreact'] = ft('React', 'jsx'),
    ['vala'] = ft('Vala', 'vala'),
    ['vb'] = ft('Visual Basic', 'dotnet'),
    ['vbnet'] = ft('VB.NET', 'dotnet'),
    ['verilog'] = ft('Verilog', 'verilog'),
    ['vhdl'] = ft('VHDL', 'vhdl'),
    ['vim'] = ft('VimL', 'vim'),
    ['vue'] = ft('Vue.js', 'vue'),
    ['xml'] = ft('XML', 'xml'),
    ['xquery'] = ft('XQuery', 'xml'),
    ['xsd'] = ft('XSD', 'xml'),
    ['xslt'] = ft('XSLT', 'xml'),
    ['yacc'] = ft('Bison', 'bison'),
    ['yaml'] = ft('YAML', 'yaml'),
    ['zsh'] = ft('Zsh', 'shell'),
}, {
    ---@param k string
    ---@return FT
    __index = function(_, k)
        return ft(k, 'unknown')
    end
})

---@type table<string, FT>
filetypes.pattern = {
    ['^AndroidManifest%.xml$'] = ft('Android manifest', 'android'),
    ['^angular%.json$'] = ft('Angular config', 'angular'),
    ['^%.ansible%.cfg$'] = ft('Ansible config', 'ansible'),
    ['^%.?appveyor%.ya?ml$'] = ft('AppVeyor', 'appveyor'),
    ['^%.bowerrc$'] = ft('Bower', 'bower'),
    ['^Gemfile%.lock$'] = ft('Bundler lockfile', 'bundler'),
    ['^Gemfile$'] = ft('Bundler package', 'bundler'),
    ['^Cargo%.toml$'] = ft('Cargo', 'cargo'),
    ['^Cargo%.lock$'] = ft('Cargo', 'cargo'),
    ['^circle%.ya?ml$'] = ft('CircleCI', 'circleci'),
    ['^codecov%.ya?ml$'] = ft('Codecov', 'codecov'),
    ['^composer%.json$'] = ft('Composer', 'composer'),
    ['^composer%.lock$'] = ft('Composer', 'composer'),
    ['^conanfile%.txt$'] = ft('Conan', 'conan'),
    ['%.desktop$'] = ft('Desktop entry', 'freedesktop'),
    ['docker-compose.*%.ya?ml$'] = ft('Docker Compose', 'docker'),
    ['^%.dockerignore$'] = ft('Docker ignore', 'docker'),
    ['^[Dd]oxyfile$'] = ft('Doxygen', 'doxygen'),
    ['^%.editorconfig$'] = ft('EditorConfig', 'editorconfig'),
    ['^firebase%.json$'] = ft('Firebase', 'firebase'),
    ['^firestore%.rules$'] = ft('Firestore', 'firebase'),
    ['%.gemspec$'] = ft('Gem spec', 'rubygems'),
    ['^%.mailmap$'] = ft('git mailmap', 'git'),
    ['^FUNDING%.yml$'] = ft('GitHub funding', 'github'),
    ['^ISSUE_TEMPLATE%.md$'] = ft('GitHub template', 'github'),
    ['^PULL_REQUEST_TEMPLATE%.md$'] = ft('GitHub template', 'github'),
    ['^%.gitlab-ci%.ya?ml$'] = ft('GitLab CI', 'gitlab'),
    ['%.gradle'] = ft('Gradle', 'gradle'),
    ['^[Gg]runtfile'] = ft('Grunt', 'grunt'),
    ['^[Gg]ulpfile'] = ft('gulp', 'gulp'),
    ['^app%.json$'] = ft('Heroku', 'heroku'),
    ['^Procfile$'] = ft('Heroku', 'heroku'),
    ['^Jenkinsfile$'] = ft('Jenkins', 'jenkins'),
    ['[Cc][Oo][Pp][Yy][Ii][Nn][Gg]'] = ft('license', 'license'),
    ['[Ll][Ii][Cc][Ee][Nn][SCsc][Ee]'] = ft('license', 'license'),
    ['^pom%.xml$'] = ft('Maven', 'maven'),
    ['.*%.pom$'] = ft('Maven', 'maven'),
    ['^package%.json$'] = ft('Node.js package', 'node'),
    ['^%.npmignore$'] = ft('npm ignore', 'npm'),
    ['^package-lock%.json$'] = ft('npm lockfile', 'npm'),
    ['^nuget%.config$'] = ft('NuGet config', 'nuget'),
    ['%.nuspec$'] = ft('NuGet manifest', 'nuget'),
    ['^openapi%.json$'] = ft('OpenAPI', 'openapi'),
    ['^%poetry%.lock$'] = ft('Poetry lockfile', 'pypi'),
    ['^%pyproject%.toml$'] = ft('Python project', 'pypi'),
    ['^Rakefile$'] = ft('Rake', 'rubygems'),
    ['^.readthedocs%.ya?ml$'] = ft('Read the Docs', 'rtfd'),
    ['[Rr][Ee][Aa][Dd][Mm][Ee]'] = ft('README', 'readme'),
    ['^rollup.*%.config'] = ft('Rollup', 'rollup'),
    ['^%setup%.cfg$'] = ft('setuptools config', 'pypi'),
    ['^%.SRCINFO$'] = ft('SRCINFO', 'archlinux'),
    ['^svelte%.config%.js$'] = ft('Svelte config', 'svelte'),
    ['^swagger%.ya?ml$'] = ft('Swagger', 'openapi'),
    ['^%.travis%.ya?ml%$'] = ft('Travis CI', 'travis'),
    ['^Vagrantfile$'] = ft('Vagrant', 'vagrant'),
    ['^manifest%.json$'] = ft('Web App manifest', 'manifest'),
    ['^manifest%.webmanifest$'] = ft('Web App manifest', 'manifest'),
    ['^webpack.*%.config'] = ft('webpack', 'webpack'),
    ['^%.yarnignore$'] = ft('Yarn ignore', 'yarn'),
    ['^%yarn%.lock$'] = ft('Yarn lockfile', 'yarn'),
}

---@type table<string, boolean>
filetypes.ignore = setmetatable({
    [''] = true,
    ['fugitive'] = true,
    ['fugitiveblame'] = true,
    ['fzf'] = true,
    ['gitcommit'] = true,
    ['gitrebase'] = true,
    ['help'] = true,
    ['mail'] = true,
    ['man'] = true,
    ['netrw'] = true,
    ['null-ls-info'] = true,
    ['packer'] = true,
    ['qf'] = true,
    ['query'] = true,
    ['lspinfo'] = true,
    ['scratch'] = true,
    ['shada'] = true,
    ['snippet'] = true,
    ['snippets'] = true,
    ['tsplayground'] = true,
    ['undotree'] = true,
    ['unicode'] = true,
    ['viminfo'] = true,
    ['xxd'] = true,
}, {
    ---@param t table
    ---@param k string
    __call = function(t, k)
        t[k] = true
    end
})

---@param val FT
---@return string
local function _asset(val)
    return val.asset
end

---@return string[]
function filetypes:list()
    return vim.tbl_keys(self.filetype)
end

---@return string[]
function filetypes:assets()
    local fts = vim.tbl_flatten {
        vim.tbl_map(_asset, vim.tbl_values(self.filetype)),
        vim.tbl_map(_asset, vim.tbl_values(self.pattern))
    }
    table.sort(fts)
    return vim.fn.uniq(fts)
end

---@param filetype string
---@param filename string
---@return FT|nil
function filetypes:get(filetype, filename)
    if self.ignore[filetype] then return nil end
    if filename == '[Command Line]' then return nil end
    for key, val in pairs(self.pattern) do
        if filename:match(key) then return val end
    end
    return self.filetype[filetype]
end

return filetypes
