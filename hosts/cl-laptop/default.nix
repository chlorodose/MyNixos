{ lib, ... }:
{
  imports = [
    (lib.getUser "chlorodose")
    ./hardware.nix
  ];
  networking.hostName = "cl-laptop";
  modules.desktop.enable = true;
  modules.hyprland.enable = true;
  modules.regreet.enable = true;
  system.stateVersion = "25.05";
}
