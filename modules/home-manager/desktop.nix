{ lib, config, ... }: {
  options.services.desktop.enable = lib.mkEnableOption "desktop";
  config = lib.mkIf config.services.desktop.enable {
    services.swaync.enable = true;
    programs.rofi.enable = true;
    services.pass-secret-service.enable = true;
    programs.password-store.enable = true;
    programs.kitty.enable = true;
    i18n.inputMethod.enabled = "fcitx5";
    wayland.windowManager.hyprland.enable = true;
  };
}
