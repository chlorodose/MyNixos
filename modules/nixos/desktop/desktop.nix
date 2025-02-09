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
    environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
    system.persistence.users = (
      lib.mapAttrs (name: value: {
        directories = [
          ".var"
          ".local/share/flatpak"
        ];
      }) config.home-manager.users
    );
  };
}
