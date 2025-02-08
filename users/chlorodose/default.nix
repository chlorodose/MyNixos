{ config, lib, pkgs, ... }: {
  options.users.chlorodose.enable = lib.mkEnableOption "user chlorodose";
  config = {
    users.users.chlorodose = {
      isNormalUser = true;
      uid = 1000;
      useDefaultShell = false;
      shell = pkgs.zsh;
      extraGroups = lib.mkMerge [
        [ "wheel" ]
        (lib.mkIf config.networking.networkmanager.enable [ "networkmanager" ])
      ];
      hashedPassword =
        "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAaNOI0M0BjQyFvPZzhgZblw0bkTiWm7ATe28";
    };
    home-manager.users.chlorodose = import ./home.nix;
  };
}
