{ lib, ... }:
{
  imports = [
    (lib.getUser "chlorodose")
    ./hardware.nix
  ];
  networking.hostName = "cl-laptop";
  modules.desktop.enable = true;
  modules.hyprland.enable = true;
  modules.kde.enable = true;
  modules.sddm.enable = true;
  system.stateVersion = "25.05";
}
