{ lib, ... }:
{
  imports = [
    (lib.getUser "chlorodose")
    ./network
    ./services
    ./hardware.nix
  ];
  networking.hostName = "cl-server";
  services.openssh.settings.DenyUsers = null;
  system.stateVersion = "25.05";
}
