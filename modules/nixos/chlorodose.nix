{ config, lib, pkgs, ... }: {
  options.users.chlorodose.enable = lib.mkEnableOption "user chlorodose";
  config = lib.mkIf config.users.chlorodose.enable {
    users.users.chlorodose = {
      isNormalUser = true;
      uid = 1000;
      useDefaultShell = false;
      shell = pkgs.fish;
      hashedPassword =
        "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAaNOI0M0BjQyFvPZzhgZblw0bkTiWm7ATe28";
    };
  };
}
