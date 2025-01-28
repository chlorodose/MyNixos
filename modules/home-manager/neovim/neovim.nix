{ ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = false;
    nixpkgs.useGlobalPackages = true;
    colorscheme = "catppuccin-mocha";
    impureRtp = false;
    wrapRc = true;
  };
}
