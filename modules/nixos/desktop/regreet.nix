{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.regreet.enable = lib.mkEnableOption "regreet";
  config = lib.mkIf config.modules.regreet.enable {
    services.greetd.enable = true;
    programs.regreet = {
      enable = true;
      theme = {
        package = pkgs.catppuccin-gtk;
        name = "catppuccin-mocha-mauve-standard+default";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };
      cursorTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };
    };
  };
}
