local M = {}

local settings = {
  sections = {
    left = {
      "content",
      "⋯",
    },
    right = {
      " ",
      "number_of_folded_lines",
      ": ",
      "percentage",
      " ",
      function(config)
        return config.fill_char:rep(3)
      end,
    },
  },
  fill_char = " ",

  remove_fold_markers = false,

  -- Keep the indentation of the content of the fold string.
  keep_indentation = true,

  -- Possible values:
  -- "delete" : Delete all comment signs from the fold string.
  -- "spaces" : Replace all comment signs with equal number of spaces.
  -- false    : Do nothing with comment signs.
  process_comment_signs = false,

  -- Comment signs additional to the value of `&commentstring` option.
  comment_signs = {},

  -- List of patterns that will be removed from content foldtext section.
  stop_words = {
    "@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
  },

  add_close_pattern = true, -- true, 'last_line' or false

  matchup_patterns = {
    { "{", "}" },
    { "%(", ")" }, -- % to escape lua pattern char
    { "%[", "]" }, -- % to escape lua pattern char
  },

  ft_ignore = { "neorg" },
}

M.config = function()
  local status_ok, pretty_fold = pcall(require, "pretty-fold")
  if not status_ok then
    print("Failed to require pretty-fold")
  end

  pretty_fold.setup(settings)
end

return M