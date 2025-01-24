{ ... }: {
  users.chlorodose.enable = true;
  home-manager.users.chlorodose = { ... }: { imports = [ ./chlorodose.nix ]; };
}
