-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- Se the kickstart.nvim README for more information

return {
  { 'xiyaowong/transparent.nvim' },
  -- lightspeed search
  {'ggandor/lightspeed.nvim'},
  --codeium AI
  { 'Exafunction/codeium.nvim',
    -- event = 'BufEnter',
    requires = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true }),
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true }),
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true }),
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
        })
    end
    -- config = function ()
    -- end
  },
  -- css color
  {'NvChad/nvim-colorizer.lua'},
  -- fugitive
  {'https://github.com/tpope/vim-fugitive'},
    --switch true/false
  {'andrewradev/switch.vim'},
  --persistance
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  --terminal
  {'akinsho/toggleterm.nvim'},
  -- undo tree
  {'mbbill/undotree',
    config = function ()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'ToggleUndoTree' })
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
    -- Swap
  -- {'mizlan/iswap.nvim'},
}
