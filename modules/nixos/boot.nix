{ lib, pkgs, ... }: {
  config = {
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = lib.mkDefault 32;
    };
    systemd.watchdog.runtimeTime = "30s";
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
