{ lib, ... }: {
  programs.nixvim = lib.mkMerge ([
    {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withRuby = false;
      impureRtp = false;
      wrapRc = true;
      nixpkgs.useGlobalPackages = true;
    }
  ] ++ (lib.map import (lib.scanPath ./.)));
}