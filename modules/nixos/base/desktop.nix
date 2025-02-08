{ config, lib, pkgs, ... }: {
  options.services.desktop.enable = lib.mkEnableOption "desktop";
  config = lib.mkIf config.services.desktop.enable {
    networking.networkmanager.enable = true;
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
    services.openssh.enable = false;
    fonts.enableDefaultPackages = true;
    fonts.packages = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts-emoji
      nerd-fonts.symbols-only
      wqy_zenhei
      fira-code
    ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
    environment.systemPackages =
      [ (pkgs.catppuccin-sddm.override { flavor = "mocha"; }) ];
    services.displayManager.defaultSession = "hyprland-uwsm";
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
    programs.uwsm.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    security.rtkit.enable = true;
    security.polkit.enable = true;
    services.flatpak.enable = true;
  };
}
