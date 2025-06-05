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
      require('leap').create_default_mappings()
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
      vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
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
  { 'andrewradev/switch.vim',
    vim.keymap.set("n", "<A-s>", "<cmd>Switch<CR>", { silent = true, desc = 'Switch True/False' })
  },
  --persistance
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  --terminal
  -- {'akinsho/toggleterm.nvim'},
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

      vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
    ]])
    end,
  }
}
