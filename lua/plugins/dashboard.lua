return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.startify')

    dashboard.section.header.val = {
     [[                                    ]],
     [[                                    ]],
     [[  ______        ___    ____  _   _  ]],
     [[ / ___\ \      / / \  |  _ \| \ | | ]],
     [[ \___ \\ \ /\ / / _ \ | |_) |  \| | ]],
     [[  ___) |\ V  V / ___ \|  _ <| |\  | ]],
     [[ |____/  \_/\_/_/   \_\_| \_\_| \_| ]],
     [[                                    ]],
     [[                                    ]],
    }
    alpha.setup(dashboard.opts)
  end,
}
