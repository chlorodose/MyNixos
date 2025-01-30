{ ... }: {
  networking.hostName = "cl-laptop";
  users.chlorodose.enable = true;
  services.desktop.enable = true;
  home-manager.users.chlorodose = { ... }: { imports = [ ./chlorodose.nix ]; };
  system.stateVersion = "25.05";
}
