if vim.fn.executable "nvr" > 0 then
  vim.fn.setenv("GIT_EDITOR", "nvr -cc vsplit --remote-wait +'set bufhidden=wipe'")
end

local gs_success, gitsigns = pcall(require, "gitsigns")
if not gs_success then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "░", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "▁", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "▔", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = {
      hl = "GitSignsChangeDelete",
      text = "▒",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
}

local wk_success, wk = pcall(require, "which-key")
if not wk_success then
  return
end

wk.register({
  g = {
    name = "+git",
    a = { gitsigns.stage_hunk, "Stage hunk" },
    u = { gitsigns.undo_stage_hunk, "Undo stage hunk" },
    r = { gitsigns.reset_hunk, "Reset hunk" },
    R = { gitsigns.reset_buffer, "Reset current buffer" },
    -- show chunk diff at current position
    d = { gitsigns.preview_hunk, "Hunk diff" },
    D = { gitsigns.diffthis, "Diff current file" },
    x = { gitsigns.toggle_deleted, "Toggle deleted" },
    -- show commit contains current position
    c = { "<cmd>lua require('xx.telescope').git_bcommits()<cr>", "Current buffer commits" },
    C = { "<cmd>lua require('xx.telescope').git_commits()<cr>", "All commits" },
    b = { "<cmd>lua require('xx.telescope').git_branches()<cr>", "Branches" },
    B = {
      function()
        gitsigns.blame_line { full = true }
      end,
      "Git blame for current hunk",
    },
    -- s = { "<cmd>lua require('xx.telescope').git_status()<cr>", "Status" },
    s = { "<cmd>Neogit<cr>", "Status" },
  },
  c = {
    name = "+change/command",
    b = { gitsigns.toggle_current_line_blame, "Toggle git blame for current line" },
  },
  ["<C-g>"] = { "<cmd>LazyGit<cr>", "Lazygit" },
}, { prefix = "<leader>" })

wk.register({
  ih = { "<cmd>Gitsigns select_hunk<cr>", "inner git hunk" },
}, { mode = "x" })

-- navigate chunks of current buffer
wk.register {
  ["[c"] = {
    function()
      if vim.o.diff then
        vim.cmd "normal! [c"
      else
        vim.cmd "Gitsigns prev_hunk"
      end
    end,
    "Go to previous git hunk",
  },
  ["]c"] = {
    function()
      if vim.o.diff then
        vim.cmd "normal! ]c"
      else
        vim.cmd "Gitsigns next_hunk"
      end
    end,
    "Go to next git hunk",
  },
}

local neogit_success, neogit = pcall(require, "neogit")
if not neogit_success then
  return
end
neogit.setup {
  disable_context_highlighting = true,
  signs = {
    section = { "", "" },
    item = { "", "" },
  },
  integrations = {
    diffview = true,
  },
}
