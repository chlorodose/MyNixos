{ pkgs, lib, osConfig, ... }: {
  home.username = "chlorodose";
  user.gpg.myKeys = [ (lib.getAsset "chlorodose_public.asc") ];
  programs.ssh.authorizedKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF7rjnMuwq0bB/G4dXVSZHegO06qKm4BSBREUHml7Dp chlorodose <chlorodose@chlorodose.me>"
  ];
  programs.git = {
    userEmail = "chlorodose@chlorodose.me";
    userName = "chlorodose";
    signing.key = "942DF679F2B394D4";
  };
  services.gpg-agent.enable = osConfig.modules.desktop.enable;
  modules.hyprland.enable = osConfig.modules.hyprland.enable;
  modules.fcitx5.enable = osConfig.modules.desktop.enable;
  modules.kitty.enable = osConfig.modules.desktop.enable;
  modules.passwd.enable = osConfig.modules.desktop.enable;
  programs.nix-index.enable = true;
  programs.vscode = {
    enable = osConfig.modules.desktop.enable;
    package = pkgs.vscodium;
  };
  programs.firefox.enable = osConfig.modules.desktop.enable;
}