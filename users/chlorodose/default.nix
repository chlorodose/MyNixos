{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.users.chlorodose = {
    isNormalUser = true;
    uid = 1000;
    useDefaultShell = true;
    shell = pkgs.fish;
    extraGroups = lib.mkMerge [
      [ "wheel" ]
      (lib.mkIf config.networking.networkmanager.enable [ "networkmanager" ])
    ];
    hashedPassword = "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAaNOI0M0BjQyFvPZzhgZblw0bkTiWm7ATe28";
  };
  home-manager.users.chlorodose = import ./home;
  programs.fish.enable = true;
  environment.pathsToLink = [ "/share/fish" ];
  system.persistence.users.chlorodose = {
    directories = [
      ".local/share/fish" # Fish
      ".local/share/z" # z-lua
      ".local/share/password-store" # pass
      ".cache/nix-index" # nix-index
      # VSCodium
      ".vscode-oss"
      ".config/VSCodium"
    ];
  };
}
