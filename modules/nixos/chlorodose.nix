{ config, lib, pkgs, ... }: {
  options.users.chlorodose.enable = lib.mkEnableOption "user chlorodose";
  config = lib.mkIf config.users.chlorodose.enable {
    users.users.chlorodose = {
      isNormalUser = true;
      uid = 1000;
      useDefaultShell = false;
      shell = pkgs.fish;
      initialHashedPassword =
        "$y$j9T$GQvgCF25j6Lbr5bqzVC.0/$91nrr2nAanoI0mobjQyFvPZzhgZblw0BKTiWm7ATe28";
    };
  };
}
