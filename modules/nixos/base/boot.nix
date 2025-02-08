{ lib, pkgs, ... }: {
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 32;
  };
  systemd.watchdog.runtimeTime = "30s";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.systemd.enable = true;
}