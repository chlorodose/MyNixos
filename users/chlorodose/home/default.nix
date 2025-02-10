{ lib, ... }: {
  imports = lib.scanPath ./.;
  home.stateVersion = "25.05";
}