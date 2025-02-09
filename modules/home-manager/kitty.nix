{ config, lib, ... }:
{
  options.modules.kitty.enable = lib.mkEnableOption "kitty";
  config = lib.mkIf config.modules.kitty.enable {
    programs.kitty.enable = true;
    programs.kitty.themeFile = "Catppuccin-Mocha";
  };
}
