{ ... }: {
  imports = [ ./network ];
  networking.hostName = "cl-server";
  users.chlorodose = {
    enable = true;
    #isAdmin = true;
  };
  services.desktop.enable = false;
  home-manager.users.chlorodose = { ... }: { imports = [ ./chlorodose.nix ]; };
  system.fs.swap.num = 1;
  system.cpu = "intel";
  system.stateVersion = "25.05";
  services.ddns.enable = true;
  services.ups.enable = true;
  services.postgres.enable = true;
  services.gitserver.enable = true;
  services.mc.enable = true;
  services.grafanas.enable = false;
  services.prometh.enable = true;
}
