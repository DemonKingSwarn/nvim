vim.pack.add({
  { src = "https://github.com/phrmendes/todotxt.nvim" },
})

require("todotxt").setup({
  todotxt = vim.env.HOME .. "/dox/todo/todo.txt",
  donetxt = vim.env.HOME .. "/dox/todo/done.txt",
  ghost_text = {
    enable = true,
    mappings = {
      ["(A)"] = "now",      -- High priority tasks
      ["(B)"] = "next",     -- Medium priority tasks
      ["(C)"] = "today",    -- Lower priority tasks
      ["(D)"] = "tomorrow", -- Even lower priority
      ["(E)"] = "this week",
      ["(F)"] = "next week",
    },
    prefix = " ",          -- Text prefix
    highlight = "Comment", -- Highlight group
  }
})

vim.filetype.add({
  filename = {
    ["todo.txt"] = "todotxt",
    ["done.txt"] = "todotxt",
  },
})

vim.keymap.set("n", "<leader>tn", "<cmd>TodoTxt new<cr>", { desc = "New todo entry" })
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTxt<cr>", { desc = "Toggle todo.txt" })
vim.keymap.set("n", "<leader>td", "<cmd>DoneTxt<cr>", { desc = "Toggle done.txt" })
vim.keymap.set("n", "<leader>tg", "<cmd>TodoTxt ghost<cr>", { desc = "Toggle ghost text" })
vim.keymap.set("n", "<cr>", "<Plug>(TodoTxtToggleState)", { desc = "Toggle task state" })
vim.keymap.set("n", "<c-c>n", "<Plug>(TodoTxtCyclePriority)", { desc = "Cycle priority" })
vim.keymap.set("n", "<leader>tm", "<Plug>(TodoTxtMoveDone)", { desc = "Move done tasks" })
vim.keymap.set("n", "<leader>tss", "<Plug>(TodoTxtSortTasks)", { desc = "Sort tasks (default)" })
vim.keymap.set("n", "<leader>tsp", "<Plug>(TodoTxtSortByPriority)", { desc = "Sort by priority" })
vim.keymap.set("n", "<leader>tsc", "<Plug>(TodoTxtSortByContext)", { desc = "Sort by context" })
vim.keymap.set("n", "<leader>tsP", "<Plug>(TodoTxtSortByProject)", { desc = "Sort by project" })
vim.keymap.set("n", "<leader>tsd", "<Plug>(TodoTxtSortByDueDate)", { desc = "Sort by due date" })
