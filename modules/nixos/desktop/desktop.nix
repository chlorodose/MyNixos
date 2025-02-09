{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.desktop.enable = lib.mkEnableOption "desktop";
  config = lib.mkIf config.modules.desktop.enable {
    networking.networkmanager.enable = true;
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
    fonts.packages = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts-emoji
      nerd-fonts.symbols-only
      wqy_zenhei
      fira-code
    ];
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    security.rtkit.enable = true;
    security.polkit.enable = true;
    services.flatpak.enable = true;
  };
}
