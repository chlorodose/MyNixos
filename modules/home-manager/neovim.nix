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
    colorschemes.catppuccin.enable = true;
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = { nixd.enable = true; };
    };
    plugins.hardtime.enable = true;
    plugins.noice.enable = true;
    plugins.blink-cmp.enable = true;
    plugins.which-key.enable = true;
    plugins.neo-tree.enable = true;
    plugins.snacks.enable = true;
    plugins.web-devicons.enable = true;
    opts = {
      termguicolors = true;
      signcolumn = "yes";
      colorcolumn = "80";
      softtabstop = 4;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      shiftwidth = 4;
      shiftround = true;
      number = true;
      relativenumber = true;
    };
  };
}
