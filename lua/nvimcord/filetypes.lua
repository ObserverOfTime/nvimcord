local M = {}

---@class FT
---@field name string
---@field asset string

---@param name string
---@param asset string
---@return FT
local function ft(name, asset)
    return {name = name, asset = asset}
end

---@type table<string, FT>
M.filetype = setmetatable({
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
    ['ass'] = ft('SubStation Alpha', 'text'),
    ['astro'] = ft('Astro', 'astro'),
    ['autohotkey'] = ft('AutoHotkey', 'autohotkey'),
    ['automake'] = ft('Automake', 'gnu'),
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
    ['chatito'] = ft('Chatito', 'chatito'),
    ['chicken'] = ft('Chicken', 'scheme'),
    ['clojure'] = ft('Clojure', 'clojure'),
    ['cmake'] = ft('CMake', 'cmake'),
    ['cobol'] = ft('COBOL', 'cobol'),
    ['coffee'] = ft('CofeeScript', 'coffeescript'),
    ['conf'] = ft('config', 'config'),
    ['config'] = ft('config', 'config'),
    ['confini'] = ft('config', 'config'),
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
    ['delphi'] = ft('Delphi', 'delphi'),
    ['diff'] = ft('diff', 'diff'),
    ['django'] = ft('Django', 'django'),
    ['docbk'] = ft('Docbook', 'docbook'),
    ['docbksgml'] = ft('Docbook SGML', 'docbook'),
    ['docbkxml'] = ft('Docbook XML', 'docbook'),
    ['dockerfile'] = ft('Docker', 'docker'),
    ['dogescript'] = ft('Dogescript', 'doge'),
    ['dosbatch'] = ft('batch', 'batch'),
    ['dosini'] = ft('INI', 'config'),
    ['dot'] = ft('DOT', 'graphviz'),
    ['dotnet'] = ft('.NET', 'dotnet'),
    ['dtd'] = ft('DTD', 'xml'),
    ['dune'] = ft('Dune', 'reason'),
    ['editorconfig'] = ft('EditorConfig', 'editorconfig'),
    ['elixir'] = ft('Elixir', 'elixir'),
    ['elm'] = ft('Elm', 'elm'),
    ['ember-script'] = ft('EmberScript', 'ember'),
    ['erlang'] = ft('Erlang', 'erlang'),
    ['eruby'] = ft('eRuby', 'rails'),
    ['fasm'] = ft('FASM', 'asm'),
    ['fish'] = ft('fish', 'shell'),
    ['fontforge_script'] = ft('FontForge', 'fontforge'),
    ['fortran'] = ft('Fortran', 'fortran'),
    ['fsharp'] = ft('F#', 'fsharp'),
    ['gdscript'] = ft('Godot script', 'godot'),
    ['gitattributes'] = ft('git attributes', 'git'),
    ['gitconfig'] = ft('git config', 'git'),
    ['gitignore'] = ft('git ignore', 'git'),
    ['glsl'] = ft('GLSL', 'opengl'),
    ['go'] = ft('Go', 'golang'),
    ['graphql'] = ft('GraphQL', 'graphql'),
    ['groovy'] = ft('Groovy', 'groovy'),
    ['gsl'] = ft('Godot shader', 'godot'),
    ['haml'] = ft('Haml', 'haml'),
    ['handlebars'] = ft('Handlebars', 'mustache'),
    ['haskell'] = ft('Haskell', 'haskell'),
    ['haxe'] = ft('Haxe', 'haxe'),
    ['hcl'] = ft('HCL', 'hcl'),
    ['html'] = ft('HTML', 'html'),
    ['html.mustache'] = ft('Mustache', 'mustache'),
    ['html.twig'] = ft('Twig', 'twig'),
    ['htmldjango'] = ft('Django', 'django'),
    ['httplog'] = ft('log', 'log'),
    ['hocon'] = ft('HOCON', 'config'),
    ['idl'] = ft('IDL', 'idl'),
    ['idris'] = ft('Idris', 'idris'),
    ['ipynb'] = ft('Jupyter Notebook', 'ipynb'),
    ['iss'] = ft('Inno Setup', 'inno'),
    ['j'] = ft('J', 'jlang'),
    ['java'] = ft('Java', 'java'),
    ['javascript'] = ft('JavaScript', 'javascript'),
    ['javascript.jsx'] = ft('JSX', 'jsx'),
    ['javascriptreact'] = ft('React', 'jsx'),
    ['jinja'] = ft('Jinja', 'jinja'),
    ['jinja.html'] = ft('Jinja', 'jinja'),
    ['jinja2'] = ft('Jinja', 'jinja'),
    ['jproperties'] = ft('properties', 'config'),
    ['jq'] = ft('jq', 'json'),
    ['json'] = ft('JSON', 'json'),
    ['json5'] = ft('JSON', 'json'),
    ['jsonc'] = ft('JSON', 'json'),
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
    ['logtalk'] = ft('Logtalk', 'logtalk'),
    ['lprolog'] = ft('lambda Prolog', 'prolog'),
    ['ls'] = ft('LiveScript', 'livescript'),
    ['lua'] = ft('Lua', 'lua'),
    ['make'] = ft('Make', 'gnu'),
    ['manifest'] = ft('Java manifest', 'manifest'),
    ['markdown'] = ft('Markdown', 'markdown'),
    ['matlab'] = ft('MATLAB', 'matlab'),
    ['meson'] = ft('Meson', 'meson'),
    ['mesonopt'] = ft('Meson', 'meson'),
    ['messages'] = ft('log', 'log'),
    ['mips'] = ft('MIPS', 'asm'),
    ['mma'] = ft('Mathematica', 'mathematica'),
    ['mustache'] = ft('Mustache', 'mustache'),
    ['mysql'] = ft('MySQL', 'sql'),
    ['nasm'] = ft('NASM', 'nasm'),
    ['nginx'] = ft('NGINX', 'nginx'),
    ['nim'] = ft('Nim', 'nim'),
    ['nix'] = ft('Nix', 'nix'),
    ['nsis'] = ft('NSIS', 'nsis'),
    ['objc'] = ft('Objective-C', 'objc'),
    ['ocaml'] = ft('OCaml', 'ocaml'),
    ['octave'] = ft('Octave', 'octave'),
    ['opencl'] = ft('OpenCL', 'opencl'),
    ['openvpn'] = ft('OpenVPN', 'openvpn'),
    ['pascal'] = ft('Pascal', 'pascal'),
    ['perl'] = ft('Perl', 'perl'),
    ['pgsql'] = ft('PostgreSQL', 'sql'),
    ['php'] = ft('PHP', 'php'),
    ['PKGBUILD'] = ft('PKGBUILD', 'archlinux'),
    ['pkl'] = ft('Pkl', 'pkl'),
    ['plaintex'] = ft('Plain TeX', 'tex'),
    ['plantuml'] = ft('PlantUML', 'graphviz'),
    ['plsql'] = ft('PL/SQL', 'sql'),
    ['pod'] = ft('Pod', 'pod'),
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
    ['racket'] = ft('Racket', 'racket'),
    ['raku'] = ft('Raku', 'raku'),
    ['reason'] = ft('Reason', 'reason'),
    ['redis'] = ft('Redis', 'redis'),
    ['requirements'] = ft('requirements', 'pypi'),
    ['rmd'] = ft('R Markdown', 'rmarkdown'),
    ['rnoweb'] = ft('Rnoweb', 'rmarkdown'),
    ['rst'] = ft('reStructuredText', 'rst'),
    ['rtf'] = ft('Rich Text Format', 'text'),
    ['ruby'] = ft('Ruby', 'ruby'),
    ['rust'] = ft('Rust', 'rust'),
    ['sass'] = ft('Sass', 'sass'),
    ['scala'] = ft('Scala', 'scala'),
    ['scheme'] = ft('Scheme', 'scheme'),
    ['scss'] = ft('SCSS', 'sass'),
    ['sed'] = ft('sed', 'shell'),
    ['sgml'] = ft('SGML', 'xml'),
    ['sh'] = ft('shell', 'shell'),
    ['smali'] = ft('smali', 'android'),
    ['solidity'] = ft('Solidity', 'solidity'),
    ['spec'] = ft('RPM spec', 'redhat'),
    ['sql'] = ft('SQL', 'sql'),
    ['sqloracle'] = ft('Oracle SQL', 'sql'),
    ['SRCINFO'] = ft('SRCINFO', 'archlinux'),
    ['ssa'] = ft('SubStation Alpha', 'text'),
    ['stylus'] = ft('Stylus', 'stylus'),
    ['subrip'] = ft('SubRip', 'text'),
    ['svelte'] = ft('Svelte', 'svelte'),
    ['svg'] = ft('SVG', 'svg'),
    ['swift'] = ft('Swift', 'swift'),
    ['syslog'] = ft('log', 'log'),
    ['systemverilog'] = ft('SystemVerilog', 'systemverilog'),
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
    ['velocity'] = ft('Velocity', 'velocity'),
    ['verilog'] = ft('Verilog', 'verilog'),
    ['vhdl'] = ft('VHDL', 'vhdl'),
    ['vim'] = ft('VimL', 'vim'),
    ['vue'] = ft('Vue.js', 'vue'),
    ['wast'] = ft('WebAssembly', 'wasm'),
    ['xhtml'] = ft('XHTML', 'xhtml'),
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
M.pattern = {
    ['^AndroidManifest%.xml$'] = ft('Android manifest', 'android'),
    ['^angular%.json$'] = ft('Angular config', 'angular'),
    ['^%.ansible%.cfg$'] = ft('Ansible config', 'ansible'),
    ['^app%.ya?ml$'] = ft('App Engine', 'google'),
    ['^%.?appveyor%.ya?ml$'] = ft('AppVeyor', 'appveyor'),
    ['^[Aa][Uu][Tt][Hh][Oo][Rr][Ss]'] = ft('authors', 'people'),
    ['^%.bowerrc$'] = ft('Bower', 'bower'),
    ['^Gemfile%.lock$'] = ft('Bundler lockfile', 'bundler'),
    ['^Gemfile$'] = ft('Bundler package', 'bundler'),
    ['^Caddyfile$'] = ft('Caddy', 'caddy'),
    ['^Cargo%.lock$'] = ft('Cargo lockfile', 'cargo'),
    ['^Cargo%.toml$'] = ft('Cargo package', 'cargo'),
    ['^chocolatey.+%.ps1$'] = ft('Chocolatey', 'chocolatey'),
    ['^circle%.ya?ml$'] = ft('CircleCI', 'circleci'),
    ['^cloud-build%.ya?ml$'] = ft('Cloud Build', 'google'),
    ['^CODE_OF_CONDUCT%.md$'] = ft('code of conduct', 'collab'),
    ['^CODE_OF_MERIT%.md$'] = ft('code of merit', 'collab'),
    ['^[Cc][Oo][Dd][Ee][Oo][Ww][Nn][Ee][Rr][Ss]'] = ft('code owners', 'people'),
    ['^codecov%.ya?ml$'] = ft('Codecov', 'codecov'),
    ['^composer%.json$'] = ft('Composer', 'composer'),
    ['^composer%.lock$'] = ft('Composer', 'composer'),
    ['^conanfile%.txt$'] = ft('Conan', 'conan'),
    ['^contribute%.json'] = ft('contribute.json', 'collab'),
    ['^CONTRIBUTING%.md'] = ft('contributor guidelines', 'collab'),
    ['^pubspec%.yaml$'] = ft('Dart pubspec', 'dart'),
    ['^pubspec%.lock$'] = ft('Dart pubspec', 'dart'),
    ['%.desktop$'] = ft('Desktop entry', 'freedesktop'),
    ['docker%-compose.*%.ya?ml$'] = ft('Docker Compose', 'docker'),
    ['^%.dockerignore$'] = ft('Docker ignore', 'docker'),
    ['^[Dd]oxyfile$'] = ft('Doxygen', 'doxygen'),
    ['^firebase%.json$'] = ft('Firebase', 'firebase'),
    ['^firestore%.rules$'] = ft('Firestore', 'firebase'),
    ['%.gemspec$'] = ft('Gem spec', 'rubygems'),
    ['^%.mailmap$'] = ft('git mailmap', 'git'),
    ['^FUNDING%.yml$'] = ft('GitHub funding', 'github'),
    ['^ISSUE_TEMPLATE%.md$'] = ft('GitHub template', 'github'),
    ['^PULL_REQUEST_TEMPLATE%.md$'] = ft('GitHub template', 'github'),
    ['^%.gitlab%-ci%.ya?ml$'] = ft('GitLab CI', 'gitlab'),
    ['%.gradle'] = ft('Gradle', 'gradle'),
    ['^[Gg]runtfile'] = ft('Grunt', 'grunt'),
    ['^[Gg]ulpfile'] = ft('gulp', 'gulp'),
    ['^app%.json$'] = ft('Heroku', 'heroku'),
    ['^Procfile$'] = ft('Heroku', 'heroku'),
    ['^humans%.txt'] = ft('humans.txt', 'people'),
    ['^_config%.toml$'] = ft('Jekyll config', 'jekyll'),
    ['^_config%.ya?ml$'] = ft('Jekyll config', 'jekyll'),
    ['^Jenkinsfile$'] = ft('Jenkins', 'jenkins'),
    ['^lerna%.json$'] = ft('Lerna', 'lerna'),
    ['^[Cc][Oo][Pp][Yy][Ii][Nn][Gg]'] = ft('license', 'license'),
    ['^[Ll][Ii][Cc][Ee][Nn][SCsc][Ee]'] = ft('license', 'license'),
    ['^pom%.xml$'] = ft('Maven', 'maven'),
    ['.*%.pom$'] = ft('Maven', 'maven'),
    ['^package%.json$'] = ft('Node.js package', 'node'),
    ['^%.npmignore$'] = ft('npm ignore', 'npm'),
    ['^package%-lock%.json$'] = ft('npm lockfile', 'npm'),
    ['^nuget%.config$'] = ft('NuGet config', 'nuget'),
    ['%.nuspec$'] = ft('NuGet manifest', 'nuget'),
    ['^openapi%.json$'] = ft('OpenAPI', 'openapi'),
    ['^openapi%.ya?ml$'] = ft('OpenAPI', 'openapi'),
    ['^Pipfile%.lock$'] = ft('Pipenv lockfile', 'pipenv'),
    ['^Pipfile$'] = ft('Pipenv package', 'pipenv'),
    ['^platformio%.ini$'] = ft('PlatformIO', 'platformio'),
    ['^%.pnpmfile%.cjs$'] = ft('pnpm hooks', 'pnpm'),
    ['^pnpm%-workspace%.ya?ml$'] = ft('pnpm workspace', 'pnpm'),
    ['^poetry%.lock$'] = ft('Poetry lockfile', 'pypi'),
    ['^pytest%.ini$'] = ft('pytest config', 'pytest'),
    ['^pyproject%.toml$'] = ft('Python project', 'pypi'),
    ['^Rakefile$'] = ft('Rake', 'rubygems'),
    ['^.readthedocs%.ya?ml$'] = ft('Read the Docs', 'rtfd'),
    ['^[Rr][Ee][Aa][Dd][Mm][Ee]'] = ft('README', 'readme'),
    ['^robots%.txt'] = ft('robots.txt', 'robots'),
    ['^rollup.*%.config'] = ft('Rollup', 'rollup'),
    ['^SECURITY%.md$'] = ft('security policy', 'security'),
    ['^security%.txt$'] = ft('security.txt', 'security'),
    ['^%setup%.cfg$'] = ft('setuptools config', 'pypi'),
    ['^spring%.cfg%.xml$'] = ft('Spring config', 'spring'),
    ['^%.SRCINFO$'] = ft('SRCINFO', 'archlinux'),
    ['^svelte%.config%.js$'] = ft('Svelte config', 'svelte'),
    ['^swagger%.ya?ml$'] = ft('Swagger', 'swagger'),
    ['^swagger%.json$'] = ft('Swagger', 'swagger'),
    ['%.tmLanguage%$'] = ft('TextMate syntax', 'textmate'),
    ['^%.travis%.ya?ml%$'] = ft('Travis CI', 'travis'),
    ['^Vagrantfile$'] = ft('Vagrant', 'vagrant'),
    ['^manifest%.json$'] = ft('Web App manifest', 'manifest'),
    ['^manifest%.webmanifest$'] = ft('Web App manifest', 'manifest'),
    ['^webpack.*%.config'] = ft('webpack', 'webpack'),
    ['^%.yarnignore$'] = ft('Yarn ignore', 'yarn'),
    ['^%yarn%.lock$'] = ft('Yarn lockfile', 'yarn'),
}

---@class ignore
M.ignore = setmetatable({}, {
    ---@param t ignore
    ---@param type string
    ---@param name string
    __call = function(t, type, name)
        return t.filename[name] or t.filetype[type]
    end
})

-- NOTE: only filetypes with an empty buftype should be included
---@type table<string, boolean>
M.ignore.filetype = {
    ['gitcommit'] = true,
    ['gitrebase'] = true,
    ['gitsendemail'] = true,
    ['mail'] = true,
    ['netrw'] = true,
    ['xxd'] = true,
    ['zip'] = true,
}

---@type table<string, boolean>
M.ignore.filename = {
    [''] = true,
    ['[Command Line]'] = true,
    ['Session.vim'] = true,
    ['.nvimrc'] = true,
    ['.nvim.lua'] = true,
    ['.exrc'] = true,
}

---@param val FT
---@return string
local function asset(val)
    return val.asset
end

---@return string[]
function M.list()
    return vim.tbl_keys(M.filetype)
end

---@return string[]
function M.assets()
    local fts = vim.tbl_flatten {
        vim.tbl_map(asset, vim.tbl_values(M.filetype)),
        vim.tbl_map(asset, vim.tbl_values(M.pattern))
    }
    table.insert(fts, 'neovim')
    table.insert(fts, 'unknown')
    table.sort(fts)
    return vim.fn.uniq(fts)
end

---@param filetype string
---@param filename string
---@return FT?
function M.get(filetype, filename)
    if M.ignore(filetype, filename) then
        return nil
    end
    for key, val in pairs(M.pattern) do
        if filename:match(key) then return val end
    end
    return M.filetype[filetype]
end

return M
