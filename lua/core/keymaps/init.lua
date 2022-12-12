local M = {}

local apply_keymaps = require("core.keymaps.keymap-tools").apply_keymaps

-- Remap space as leader key
vim.g.mapleader = " "

local keymaps = {

  -----------------------------------------------------------------------------
  -- NORMAL MODE
  -----------------------------------------------------------------------------

  normal_mode = {
    ---------------------------------------------------------------------------
    -- Vim
    ---------------------------------------------------------------------------
    -- Better window movement
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Resize with arrows
    ["<C-Up>"] = ":resize -2 <CR>",
    ["<C-Down>"] = ":resize +2 <CR>",
    ["<C-Left>"] = ":vertical resize -2 <CR>",
    ["<C-Right>"] = ":vertical resize +2 <CR>",

    -- Tab management
    ["<CA-h>"] = ":tabprevious <CR>", -- gT
    ["<CA-l>"] = ":tabnext <CR>", -- gt
    ["<CA-t>"] = ":tabedit % <CR>", -- open current buffer in a new tab
    ["<CA-w>"] = ":tabclose <CR>",

    -- Move text up and down
    ["<A-j>"] = ":m .+1 <CR>==",
    ["<A-k>"] = ":m .-2 <CR>==",

    -- Toggle word-wrap
    ["<A-z>"] = ":set wrap! <CR>",

    -- Hide search highlighting
    ["<Leader>n"] = ":noh <CR>",

    -- Splits
    ["<Leader>v"] = ":vsplit <CR>",
    ["<Leader>h"] = ":split <CR>",
    ["<Leader>="] = "<C-w>=", -- resize all windows to equal size

    -- Saving and quitting
    ["<Leader>w"] = ":w <CR>",
    ["<Leader>W"] = ":wa <CR>",
    ["<Leader>c"] = ":clo <CR>",
    ["<Leader>C"] = ":qa <CR>",

    -- Formatting
    ["<Leader><S-f>"] = ":lua vim.lsp.buf.format({ async = true }) <CR>",

    -- Open a Quickfix window for the last search
    ["<Leader>/"] = ":execute 'vimgrep /'.@/.'/g %' <CR>:copen <CR>",

    -- Substitute shortcut
    ["<Leader>s"] = ":%s/",

    -- Split line (sister to [J]oin lines)
    ["S"] = "i<CR><Esc>k$",

    -- Reveal highlighting under cursor
    ["<F6>"] = [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") <CR>]],

    -- Useful folders
    ["<Leader><S-n>"] = ":NvimTreeOpen <CR> :cd ~/web-dev/notes/ <CR>",
    ["<Leader><S-s>"] = ":NvimTreeOpen <CR> :cd ~/.config/nvim/ <CR>",

    -- Quickfix list
    ["<Leader>q"] = ":copen <CR>",
    ["]q"] = ":cnext <CR>",
    ["[q"] = ":cprev <CR>",

    -- Centralised page motion
    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",

    -- Centralised searching
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",

    -- Prevent x from copying to a register
    ["x"] = '"_x',

    ---------------------------------------------------------------------------
    -- NvimTree
    ---------------------------------------------------------------------------
    ["<Leader>e"] = ":NvimTreeToggle <CR>",
    ["<Leader><S-e>"] = ":NvimTreeFocus <CR>",

    ---------------------------------------------------------------------------
    -- ZenMode
    ---------------------------------------------------------------------------
    ["<Leader>z"] = ":ZenMode <CR>",

    ---------------------------------------------------------------------------
    -- BufferLine
    ---------------------------------------------------------------------------
    ["<S-l>"] = ":BufferLineCycleNext <CR>",
    ["<S-h>"] = ":BufferLineCyclePrev <CR>",

    ---------------------------------------------------------------------------
    -- bbye
    ---------------------------------------------------------------------------
    ["<Leader>x"] = ":Bdelete <CR>",
    ["<Leader>X"] = ":bufdo :Bdelete <CR>",

    ---------------------------------------------------------------------------
    -- Telescope
    ---------------------------------------------------------------------------
    ["<Leader>fb"] = ":Telescope buffers <CR>",
    ["<Leader>fc"] = ":Telescope current_buffer_fuzzy_find <CR>",
    ["<Leader>fe"] = ":Telescope file_browser <CR>",
    ["<Leader>ff"] = ":Telescope find_files <CR>",
    ["<Leader>fs"] = ":Telescope grep_string <CR>",
    ["<Leader>fh"] = ":Telescope help_tags <CR>",
    ["<Leader>fg"] = ":Telescope live_grep <CR>",
    ["<Leader>fn"] = ":Telescope notify <CR>",
    ["<Leader>fr"] = ":Telescope oldfiles <CR>",
    ["<Leader>fp"] = ":Telescope projects <CR>",
    ["<Leader>fq"] = ":Telescope quickfix <CR>",

    ---------------------------------------------------------------------------
    -- Renamer
    ---------------------------------------------------------------------------
    ["<F2>"] = ":lua require('renamer').rename() <CR>",

    ---------------------------------------------------------------------------
    -- Trouble
    ---------------------------------------------------------------------------
    ["<Leader>T"] = ":TroubleToggle <CR>",

    ---------------------------------------------------------------------------
    -- Treesitter
    ---------------------------------------------------------------------------
    ["<F7>"] = ":TSHighlightCapturesUnderCursor <CR>",

    ---------------------------------------------------------------------------
    -- Toggleterm (see also Term Mode)
    ---------------------------------------------------------------------------
    ["<Leader>#"] = ":ToggleTerm direction=vertical <CR>",
    ["<Leader>t"] = ":ToggleTerm direction=float <CR>",
    ["<Leader>~"] = ":ToggleTermToggleAll <CR>",

    ---------------------------------------------------------------------------
    -- Wipeout
    ---------------------------------------------------------------------------
    ["<Leader>o"] = ":Wipeout <CR>",
    ["<Leader><S-o>"] = ":only <CR> :Wipeout <CR>",

    ---------------------------------------------------------------------------
    -- Illuminate
    ---------------------------------------------------------------------------
    ["<Leader>i"] = ":IlluminateToggle <CR>",
  },

  -----------------------------------------------------------------------------
  -- INSERT MODE
  -----------------------------------------------------------------------------

  insert_mode = {
    -- 'jk' for quitting insert mode
    ["jk"] = "<Esc>",

    -- Better window navigation in insert mode
    ["<C-h>"] = "<Esc><C-w>hi",
    ["<C-j>"] = "<Esc><C-w>ji",
    ["<C-k>"] = "<Esc><C-w>ki",
    ["<C-l>"] = "<Esc><C-w>li",
  },

  -----------------------------------------------------------------------------
  -- VISUAL MODE
  -----------------------------------------------------------------------------

  visual_mode = {
    ---------------------------------------------------------------------------
    -- Vim
    ---------------------------------------------------------------------------
    -- Stay in indent mode
    ["<"] = "<gv",
    [">"] = ">gv",

    -- Move text up and down
    ["<A-j>"] = ":m .+1 <CR>==",
    ["<A-k>"] = ":m .-2 <CR>==",
    --["p"] = '"_dP' -- what does this do?

    -- Substitute shortcut
    ["<Leader>s"] = ":s/",

    -- Space-paste without losing contents of paste register
    ["<Leader>p"] = '"_dP',
  },

  -----------------------------------------------------------------------------
  -- VISUAL BLOCK MODE
  -----------------------------------------------------------------------------

  visual_block_mode = {
    ---------------------------------------------------------------------------
    -- Vim
    ---------------------------------------------------------------------------
    ["J"] = ":move '>+1 <CR>gv-gv",
    ["K"] = ":move '<-2 <CR>gv-gv",
    ["<A-j>"] = ":move '>+1<CR>gv-gv",
    ["<A-k>"] = ":move '<-2<CR>gv-gv",

    -- Substitute shortcut
    ["<Leader>s"] = ":s/",

    -- Space-paste without losing contents of paste register
    ["<Leader>p"] = '"_dP',
  },

  -----------------------------------------------------------------------------
  -- TERM MODE
  -----------------------------------------------------------------------------

  term_mode = {
    ---------------------------------------------------------------------------
    -- Vim
    ---------------------------------------------------------------------------
    ["<Esc>"] = "<C-\\><C-n>",
    ["jk"] = "<C-\\><C-n>",
    ["<C-h>"] = [[<C-\><C-n><C-W>h]],
    ["<C-j>"] = [[<C-\><C-n><C-W>j]],
    ["<C-k>"] = [[<C-\><C-n><C-W>k]],
    ["<C-l>"] = [[<C-\><C-n><C-W>l]],

    ---------------------------------------------------------------------------
    -- Toggleterm (see also Normal Mode)
    ---------------------------------------------------------------------------
    ["<Leader>~"] = [[<C-\><C-n> :ToggleTermToggleAll <CR>]],
    ["<Leader>#"] = [[<C-\><C-n> :clo <CR>]],
    ["<Leader>c"] = [[<C-\><C-n> :clo <CR>]],
    ["<Leader>t"] = [[<C-\><C-n> :clo <CR>]],
  },
}

apply_keymaps(keymaps)

-------------------------------------------------------------------------------
-- Buffer Specific Keymaps
-------------------------------------------------------------------------------

-- GitSigns
local gitsigns_keymaps = {
  normal_mode = {
    -- ["]h"] = [[ "&diff ? ']c' : '<cmd>Gitsigns next_hunk <CR>'", { expr = true } ]],
    -- ["[h"] = [[ "&diff ? ']c' : '<cmd>Gitsigns prev_hunk <CR>'", { expr = true } ]],
    ["]g"] = ":Gitsigns next_hunk <CR>",
    ["[g"] = ":Gitsigns prev_hunk <CR>",
    ["<Leader>gs"] = ":Gitsigns stage_hunk <CR>",
    ["<Leader>GS"] = ":Gitsigns stage_buffer <CR>",
    ["<Leader>gr"] = ":Gitsigns reset_hunk <CR>",
    ["<Leader>GR"] = ":Gitsigns reset_buffer <CR>",
    ["<Leader>gu"] = ":Gitsigns undo_stage_hunk <CR>",
    ["<Leader>gp"] = ":Gitsigns preview_hunk <CR>",
    ["<Leader>GP"] = ":Gitsigns preview_hunk_inline <CR>",
    ["<Leader>gt"] = ":Gitsigns toggle_current_line_blame <CR>",
    ["<Leader>gd"] = ":Gitsigns diffthis <CR>",
  },
}

-- LSP
local lsp_keymaps = {
  normal_mode = {
    ["gD"] = ":lua vim.lsp.buf.declaration() <CR>",
    ["gd"] = ":lua vim.lsp.buf.definition() <CR>",
    ["K"] = ":lua vim.lsp.buf.hover() <CR>",
    ["gI"] = ":lua vim.lsp.buf.implementation() <CR>",
    ["gr"] = ":lua vim.lsp.buf.references() <CR>",
    ["<Leader>a"] = ":lua vim.lsp.buf.code_action() <CR>",
    ["[d"] = ":lua vim.diagnostic.goto_prev({ border = 'rounded' }) <CR>",
    ["]d"] = ":lua vim.diagnostic.goto_next({ border = 'rounded' }) <CR>",
    ["gl"] = ":lua vim.diagnostic.open_float() <CR>",
  },
}

-------------------------------------------------------------------------------
-- Exports
-------------------------------------------------------------------------------

M.gitsigns = function(bufnr)
  apply_keymaps(gitsigns_keymaps, bufnr)
end

M.lsp = function(bufnr)
  apply_keymaps(lsp_keymaps, bufnr)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

-------------------------------------------------------------------------------
-- Autocommand to auto-source this file on save
-------------------------------------------------------------------------------

vim.cmd([[
  augroup keymaps
    autocmd!
    autocmd BufWritePost *nvim/lua/core/keymaps/init.lua source <afile>
  augroup end
]])

return M
