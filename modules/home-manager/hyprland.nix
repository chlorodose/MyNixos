{ config, lib, ... }: {
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";
  config = lib.mkIf config.modules.hyprland.enable {
    services.swaync.enable = true;
    programs.rofi.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false; # for UWSM
      xwayland.enable = false;
      settings = {
        "$mod" = "SUPER";
        "monitor" = ",preferred,auto,auto";
        "$appPrefix" = "uwsm app --";
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = ''rofi -show drun -run-command "uwsm app -- {cmd}"'';
        source = [ "${lib.getAsset "hyprland.conf"}" ];
      };
    };
  };
}
