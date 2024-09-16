return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
  opts = function()
    local logo = [[
      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⡝⡙⢍⠫⡛⢟⠟⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣫⣾⣾⡷⣗⣮⡲⣅⣂⢢⢨⠨⠠⢈⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣵⡿⣟⡯⡟⢽⢹⢪⢪⢮⢪⢎⣗⣝⠨⠠⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⢟⣗⣏⢧⡳⢪⢪⢯⠪⣪⡺⣕⢧⣳⣳⡳⣕⡌⡜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣻⢮⢮⣳⢝⠮⡢⢇⠧⡳⣝⢮⡳⣕⢗⣟⣞⢮⡪⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡮⡯⠏⠋⠁⠄⡄⠠⠀⡀⠀⢀⠈⠈⠊⢕⢗⣯⡳⡽⣘⣿⣿⣿⣿⣿⣿⣯⡿⣿
	    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⢱⠕⠀⠐⠈⠀⡈⡝⡀⠠⠀⠌⠀⠀⠀⠄⠀⠙⡮⡫⡯⡲⣿⣿⣿⣿⣿⣷⣯⡯⣿
	    ⣿⣿⣿⣿⡿⣯⣟⡯⣿⡸⠁⠐⠈⠀⢠⠀⠈⣜⣄⢤⡨⡄⠀⠠⠀⠀⠀⢟⢜⢎⣺⣿⣿⣿⣿⣿⢿⣺⢯⢿
	    ⣿⣿⣯⣷⣿⣟⡮⣞⡵⡕⠀⠁⠀⠀⢬⣢⢮⡿⣾⣻⣽⣟⣦⡵⠀⠌⠈⠄⢝⠐⣼⣿⣿⣿⣿⡯⣻⡪⡯⣫
	    ⣿⢯⡿⣿⣯⡿⡮⣳⣝⣇⢐⡀⠀⠈⠠⣟⣿⣻⣯⢿⡾⣯⡷⡟⠀⠂⠀⠅⡂⢌⣺⡿⣿⣻⣟⣟⢞⢮⢯⡺
	    ⡯⣏⢯⢗⣗⢯⡻⣪⢞⢮⠢⠨⠠⠁⠄⠈⠙⠾⣯⣷⡿⠝⡋⠀⠐⠀⠀⠡⡐⣰⢯⣟⢞⢮⣺⡪⡯⣳⡳⡽
	    ⡯⡮⣫⡳⣳⢝⡮⣳⡫⡯⡳⣅⠅⡡⢁⡡⠦⠀⢀⠁⠐⠌⠌⠐⠀⢰⡼⡐⣸⡺⣝⡮⡯⣳⡳⣝⣞⡵⡯⣺
	    ⡏⣞⢜⢜⠸⡨⣫⢞⣽⡺⣝⢮⣳⠠⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠂⢱⠬⡀⣺⣺⣳⡽⣝⢮⣺⢵⣳⣿⣯⣗
	    ⡓⡧⡣⡢⡱⡘⣝⣗⣽⡯⡺⡕⡣⡣⠘⠀⠀⠀⠀⠀⠀⢀⠀⠠⠀⠀⢃⠄⣢⢻⣿⣝⢮⣳⣝⡷⣽⣿⣿⣗
	    ⣳⣻⣳⣷⣳⣕⣗⢵⣿⡟⡍⣮⡺⡌⠄⠀⠀⠀⠀⠀⠈⠀⠀⠀⢀⡴⣝⢥⡪⡺⡜⣷⣿⣷⣯⢫⢳⣟⡿⣟
	    ⣿⣿⣿⣿⣿⣿⣾⢽⡟⡜⡞⡮⣺⣽⣢⡀⠀⠀⠀⠄⠀⠀⠀⣔⡯⣞⢮⡳⣝⢎⢧⡣⡻⣿⡪⡘⡸⠸⡽⣗
	    ⣿⣿⣿⣿⣟⣿⡿⣽⢣⢮⢹⢪⢗⢿⡽⣗⣄⠠⠀⠀⠀⢠⣻⡽⣽⣺⡳⡻⡪⣫⢪⡪⡢⣻⡆⣷⠕⡕⣝⣯
	    ⣿⣿⣿⣿⣟⣾⣟⡯⡪⡮⡳⣝⢮⢧⢯⣪⢺⢔⠀⠐⠨⡩⡎⡾⣜⡦⣗⣵⡻⡮⡪⡮⣣⢚⡷⣽⢧⢯⡺⣷
	    ⣿⣿⣿⡯⡷⣿⣿⢃⢯⢺⣕⣗⡯⡿⣝⢾⡸⣸⠀⠐⠈⢧⢳⣝⢮⢯⣗⣗⡯⣯⡺⣝⢮⡢⣻⣿⡽⣕⢯⢏
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    local opts = {
      theme = "doom",
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            action = "Telescope find_files",
            desc = "find file",
            icon = "  ",
            key = "f",
          },
          {
						action = "Telescope oldfiles",
						desc = "recent files",
						icon = "  ",
						key = "r",
					},
          {
						action = "qa",
						desc = "quit",
						icon = "  ",
						key = "q",
					},
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    end

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
    end
    return opts
  end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
