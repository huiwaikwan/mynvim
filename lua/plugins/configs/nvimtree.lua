local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

-- globals must be set prior to requiring nvim-tree to function
local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
  folders = 1,
  files = 1,
  git = 1,
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },
  folder = {
    default = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
}

local default = {
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { "dashboard" },
  open_on_tab = false,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = false,
    update_cwd = false,
  },
  view = {
    side = "left",
    width = 25,
    hide_root_folder = true,
    preserve_window_proportions = true,
  },
  git = {
    enable = false,
    ignore = false,
  },
  actions = {
    open_file = {
      resize_window = false,
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
}

local M = {}

M.setup = function()
  nvimtree.setup(default)
end

return M
