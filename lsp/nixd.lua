return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
      },
      formatting = {
        command = {"alejandra"},
      },
      options = {
        nixos = {
          expr = "let flake = builtins.getFlake(toString ./.); in flake.nixosConfigurations.skadi.options",
        },
        home_manager = {
          expr = "let flake = builtins.getFlake(toString ./.); in flake.homeConfigurations.skadi.options",
        },
      },
    },
  },
}
