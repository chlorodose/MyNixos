{ lib, config, pkgs, ... }: {
  options.modules.sddm.enable = lib.mkEnableOption "sddm";
  config = lib.mkIf config.modules.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
    environment.systemPackages =
      [ (pkgs.catppuccin-sddm.override { flavor = "mocha"; }) ];
    
    services.displayManager.defaultSession = "hyprland-uwsm";
    modules.desktop.enable = true;
  };
}