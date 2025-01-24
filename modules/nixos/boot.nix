{ lib, pkgs, ... }: {
  config = {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = lib.mkDefault 32;
    };
    systemd.watchdog.runtimeTime = "30s";
    boot.loader.efi.canTouchEfiVariables =
      ((builtins.getEnv "NIX_INSTALLING") != "");
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
  };
}
