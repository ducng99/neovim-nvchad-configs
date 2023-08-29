local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "cssls", "eslint", "gopls", "svelte", "tsserver" }

local get_intelephense_license = function()
  local f = assert(io.open(os.getenv "HOME" .. "/intelephense/license.txt", "rb"))
  local content = f:read "*a"
  f:close()
  return string.gsub(content, "%s+", "")
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["lua_ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
        },
      },
    },
  },
}

lspconfig["intelephense"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    -- licenseKey = get_intelephense_license(),
  },
  settings = {
    intelephense = {
      associations = { "*.php", "*.inc" },
      environment = {
        phpVersion = "8.1.22",
        shortOpenTag = true,
      },
      diagnostics = {
        undefinedProperties = false,
      },
      format = {
        braces = "allman",
      },
      files = {
        exclude = {
          "**/.git/**",
          "**/.svn/**",
          "**/.hg/**",
          "**/CVS/**",
          "**/.DS_Store/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
          "**/.history/**",
          "**/vendor/**/vendor/**",
          "**/*-{oldlive,live}.php",
          "**/*-dev-current.php",
          "**/live_archive/**",
          "**/scripts/{not_used,old,originals}/**",
          "**/*.back",
        },
      },
      stubs = {
        "apache",
        "bcmath",
        "bz2",
        "calendar",
        "com_dotnet",
        "Core",
        "ctype",
        "curl",
        "date",
        "dba",
        "dom",
        "enchant",
        "exif",
        "FFI",
        "fileinfo",
        "filter",
        "fpm",
        "ftp",
        "gd",
        "gettext",
        "gmp",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "meta",
        "mysqli",
        "oci8",
        "odbc",
        "openssl",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_ibm",
        "pdo_mysql",
        "pdo_pgsql",
        "pdo_sqlite",
        "pgsql",
        "Phar",
        "posix",
        "pspell",
        "readline",
        "Reflection",
        "session",
        "shmop",
        "SimpleXML",
        "snmp",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "sqlite3",
        "standard",
        "superglobals",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tidy",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlrpc",
        "xmlwriter",
        "xsl",
        "Zend OPcache",
        "zip",
        "zlib",
        "ssh2",
        "random",
      },
    },
  },
}
