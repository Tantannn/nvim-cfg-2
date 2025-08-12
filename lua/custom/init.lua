-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- Se the kickstart.nvim README for more information

return {
  { 'xiyaowong/transparent.nvim' },
  -- leap search
  {
    'ggandor/leap.nvim',
    config = function()
      local leap = require('leap')

      -- Don't call create_default_mappings() to avoid conflicts
      -- Instead, define only the mappings you want:
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gS', '<Plug>(leap-from-window)')
    end
  },
  -- git
  {
    'https://github.com/tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "g<cr>", "<cmd>vertical Git<cr>")
      vim.keymap.set("n", "g<space>", ":Git ")
    end,
  },
  { 'sodapopcan/vim-twiggy' },
  { 'junegunn/gv.vim' },
  { 'tpope/vim-rhubarb' },
  --switch true/false
  {
    'andrewradev/switch.vim',
    init = function()
      vim.g.switch_mapping = ''
      vim.g.switch_custom_definitions = {
        { 'true',   'false' },
        { 'yes',    'no' },
        { 'on',     'off' },
        { 'enable', 'disable' },
        { '0',      '1' },
      }
    end,
    config = function()
      vim.keymap.set("n", "<A-s>", "<cmd>Switch<CR>", { silent = true, desc = 'Switch True/False' })
    end,
  },
  --persistance
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },

  --terminal
  {
    -- amongst your other plugins
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    -- or
    { 'akinsho/toggleterm.nvim', version = "*", opts = { --[[ things you want to change go here]] } }
  },
  -- undo tree
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'ToggleUndoTree' })
      -- for windows
      vim.g.undotree_DiffCommand = "FC"
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" },   -- a table with mappings to use
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
        keys = "<Esc>",             -- keys used for escaping, if it is a funct
      })
    end,
  },
  -- multi line
  { 'mg979/vim-visual-multi' },
  -- close tag
  -- {'alvan/vim-closetag'},
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  -- Swap
  -- {'mizlan/iswap.nvim'},
  -- {'Hoffs/omnisharp-extended-lsp.nvim',
  --   config = function()
  --     require'lspconfig'.omnisharp.setup({
  --       handlers = {
  --         ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
  --         ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
  --         ["textDocument/references"] = require('omnisharp_extended').references_handler,
  --         ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
  --       },
  --     })
  --   end
  -- },
  -- open browser
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1                      -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
    config = true,                              -- default settings
    submodules = false,                         -- not needed, submodules are required only for tests
  },
  { "sindrets/diffview.nvim" },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
      vim.cmd([[
        augroup scrollbar_search_hide
        autocmd!
        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
        ]])
    end,
  },
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        -- Optionally disable cmp source if using virtual text only
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,

          -- These are the defaults

          -- Set to true if you never want completions to be shown automatically.
          manual = false,
          -- A mapping of filetype to true or false, to enable virtual text.
          filetypes = {},
          -- Whether to enable virtual text of not for filetypes not specifically listed above.
          default_filetype_enabled = true,
          -- How long to wait (in ms) before requesting completions after typing stops.
          idle_delay = 75,
          -- Priority of the virtual text. This usually ensures that the completions appear on top of
          -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
          -- desired.
          virtual_text_priority = 65535,
          -- Set to false to disable all key bindings for managing completions.
          map_keys = true,
          -- The key to press when hitting the accept keybinding but no completion is showing.
          -- Defaults to \t normally or <c-n> when a popup is showing.
          accept_fallback = nil,
          -- Key bindings for managing completions in virtual text mode.
          key_bindings = {
            -- Accept the current completion.
            accept = "<C-g>",
            -- Accept the next word.
            accept_word = false,
            -- Accept the next line.
            accept_line = false,
            -- Clear the virtual text.
            clear = false,
            -- Cycle to the next completion.
            next = "<M-]>",
            -- Cycle to the previous completion.
            prev = "<M-[>",
          }
        }
      })
    end
  },
  {
    "alex-popov-tech/store.nvim",
    dependencies = {
      "OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
    },
    cmd = "Store",
    keys = {
      { "<leader>st", "<cmd>Store<cr>", desc = "Open Plugin Store" },
    },
    opts = {
      -- optional configuration here
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true, -- This will auto-expand the tree to the file's directory
          },
        },
      })

      -- Optional keymap to open Neo-tree at current file's directory
      vim.keymap.set("n", "-", function()
        vim.cmd("Neotree toggle")
      end, { desc = "Toggle NeoTree" })
    end,
  },
  -- {
  --   "luukvbaal/statuscol.nvim", config = function()
  --     -- local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       -- configuration goes here, for example:
  --       -- relculright = true,
  --       -- segments = {
  --       --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --       --   {
  --       --     sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --       --   {
  --       --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       -- }
  --     })
  --   end,
  -- },
  --   {
  --   'AckslD/muren.nvim',
  --   config = true,
  -- }
}
