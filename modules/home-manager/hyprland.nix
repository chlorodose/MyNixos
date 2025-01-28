{ config, lib, ... }: {
  config = lib.mkIf config.wayland.windowManager.hyprland.enable {
    wayland.windowManager.hyprland = {
      systemd.enable = false; # for UWSM
      xwayland.enable = false;
      settings = {
        "$mod" = "SUPER";
        "monitor" = ",preferred,auto,auto";
        "$appPrefix" = "uwsm app --";
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = ''rofi -show drun -run-command "uwsm app -- {cmd}"'';
        source = [ "${../../public/hyprland.conf}" ];
      };
    };
  };
}
