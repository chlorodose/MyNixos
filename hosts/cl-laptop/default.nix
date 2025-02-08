{ lib, ... }: {
  imports = [
    (lib.getUser "chlorodose")
  ];
  networking.hostName = "cl-laptop";
  modules.desktop.enable = true;
  modules.hyprland.enable = true;
  modules.sddm.enable = true;
  system.stateVersion = "25.05";
}
