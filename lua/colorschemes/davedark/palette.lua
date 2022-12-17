local M = {}

M.c = {
  none = "none",
  disabled = nil,
  fg = "#9FAECA",
  bg = "#141A1F",
  nvim_tree_bg = "#151C21",
  term_bg = "#101519",
  pmenu_bg = "#0D1114", --off_black
  float_border = "#F0C36F",

  -- Test colors
  test_pink = "#FF00FF",
  test_yellow = "#FFFF00",
  test_green = "#00FF00",
  test_cyan = "#00FFFF",

  -- Greys
  black = "#000000",
  off_black = "#0D1114",
  grey = "#303030",
  dark_grey = "#19232D",
  rolling_stone = "#787A7B",
  silver = "#CCCCCC",
  white = "#FFFFFF",

  -- Bluegreys
  dark_blue_grey = "#20354B",
  blue_grey = "#2E4D6B",
  folder_grey = "#90a4ae",
  light_blue_grey = "#5974A5",

  -- Rainbow
  error_red = "#FF0000",
  red = "#ED5E6A",
  orange = "#E09956",
  yellow = "#F0C36F",
  green = "#95D16A",
  cyan = "#45C2D3",
  blue = "#54B0FC",
  purple = "#CC6BE9",
  pink = "#FF007C",

  -- Feline
  sky_blue = "#1292FB",
  dark_red = "#E72333",
  dark_orange = "#D27A27",
  dark_green = "#73C23B",
  dark_blue = "#3B4261",

  -- Bufferline
  tab_blue_grey = "#343E78",
  duplicate_selected_fg_blue = "#24ADFF",
  dark_error_red = "#762920",
  dark_warn_yellow = "#775C1C",
  dark_hint_green = "#515D2F",
  dark_info_blue = "#405453",
  dark_duplicate_fg = "#156799",

  -- Illuminate
  illuminate_read = "#11FF11",
  illuminate_write = "#FF1111",
  illuminate_text = "#FFFF11",

  -- Brackets / indents
  indent1 = "#ffd700",
  indent2 = "#da70d6",
  indent3 = "#87cefa",
  indent4 = "#fa8072",
  indent5 = "#7cf800",
  indent6 = "#ff8c00",
  indent7 = "#fff8dc",

  -- Neon colours
  neon_red = "#f8877f",
  neon_orange = "#ffad2a",
  neon_yellow = "#f8fc46",
  neon_green = "#77e68a",
  olive_green = "#00c87a",
  neon_blue = "#3cbefc",
  neon_violet = "#9d64e2",
  neon_pink = "#fb83b3",
  lilac = "#f447d1",

  -- Pastel colours
  pastel_green = "#a7e8c8",
  pastel_orange = "#f8b6a8",
  pastel_yellow = "#fdffb4",
  pastel_pink = "#f7c2d6",
  pastel_violet = "#c3bbec",
  pastel_blue = "#c3effc",
}

return M
