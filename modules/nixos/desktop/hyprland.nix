{ config, lib, ... }:
{
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";
  config = lib.mkIf config.modules.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
    programs.uwsm.enable = true;
  };
}
