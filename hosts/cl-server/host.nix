{ ... }: {
  imports = [ ./network ];
  users.chlorodose = {
    enable = true;
    isAdmin = true;
  };
  services.desktop.enable = false;
  home-manager.users.chlorodose = { ... }: { imports = [ ./chlorodose.nix ]; };
  system.fs.swap.num = 1;
  system.cpu = "intel";
  system.stateVersion = "25.05";
}
