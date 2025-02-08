{
  description = "My configuration for nixos";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = { # 密码管理
      url = "github:yaxitech/ragenix/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
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
    nix-minecraft = { # 配置MC服务器
      url = "github:Infinidoge/nix-minecraft";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = { nixpkgs, home-manager, agenix, impermanence, nixvim, nix-minecraft, ... }: 
  let 
    lib = nixpkgs.lib.fold (overlay: lib: lib.extend (import overlay)) nixpkgs.lib (nixpkgs.lib.filesystem.listFilesRecursive ./lib);
  in {
    nixosConfigurations = let
      hmModules = [ nixvim.homeManagerModules.nixvim ]
        ++ (lib.filesystem.listFilesRecursive ./modules/home-manager);
      nixosModules = [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        impermanence.nixosModules.impermanence
        { home-manager.sharedModules = hmModules; }
        {
          imports = [ nix-minecraft.nixosModules.minecraft-servers ];
          nixpkgs.overlays = [ nix-minecraft.overlay ];
        }
      ] ++ (lib.filesystem.listFilesRecursive ./modules/nixos);
    in {
      cl-server = lib.nixosSystem {
        system = "x86_64-linux";
        modules = nixosModules ++ [ ./hosts/cl-server/host.nix ];
      };
      cl-laptop = lib.nixosSystem {
        system =  "x86_64-linux";
        modules = nixosModules ++ [ ./hosts/cl-laptop/host.nix ];
      };
    };
  };
}
