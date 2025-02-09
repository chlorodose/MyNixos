{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  home.username = "chlorodose";
  user.gpg.myKeys = [ (lib.getAsset "chlorodose_public.asc") ];
  programs.ssh.authorizedKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF7rjnMuwq0bB/G4dXVSZHegO06qKm4BSBREUHml7Dp chlorodose <chlorodose@chlorodose.me>"
  ];
  programs.git = {
    userEmail = "chlorodose@chlorodose.me";
    userName = "chlorodose";
    signing.key = "942DF679F2B394D4";
  };
  services.gpg-agent.enable = osConfig.modules.desktop.enable;
  modules.hyprland.enable = osConfig.modules.hyprland.enable;
  modules.fcitx5.enable = osConfig.modules.desktop.enable;
  modules.kitty.enable = osConfig.modules.desktop.enable;
  modules.passwd.enable = osConfig.modules.desktop.enable;

  programs.starship = {
    enable = true;
    settings = {

    };
  };
  home.packages = with pkgs; [
    z-lua
  ];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_escape_delay_ms 500
    '';
    plugins = with pkgs.fishPlugins; [
      {

        name = "z";
        src = z.src;
      }
      {
        name = "sudope";
        src = plugin-sudope.src;
      }
      {
        name = "foreign-env";
        src = foreign-env.src;
      }
    ];
  };
  programs.nushell.enable = true;

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
    colorschemes.catppuccin.enable = true;
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd.enable = true;
      };
    };
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

  home.stateVersion = "25.05";
}
