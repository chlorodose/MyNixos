{
  description = "My configuration for nixos";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = { # 密码管理
      url = "github:ryantm/agenix/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    impermanence = { # 管理状态
      url = "github:nix-community/impermanence/master";
    };

    nixvim = { # 配置Neovim
      url = "github:nix-community/nixvim/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { nixpkgs, home-manager, agenix, impermanence, nixvim }:
    let
      inputModules = [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        impermanence.nixosModules.impermanence
        { home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ]; }
      ];
    in { };
}
