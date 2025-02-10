{ config, lib, ... }:
{
  options.modules.kde.enable = lib.mkEnableOption "kde";
  config = lib.mkIf config.modules.kde.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
