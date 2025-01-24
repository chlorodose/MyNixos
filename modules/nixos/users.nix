{ config, lib, pkgs, ... }: {
  system.persistence.users = (lib.mapAttrs (name: value: {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Desktop"
      ".password-store"
    ];
  }) config.home-manager.users);
  programs.fish.enable = lib.any ({ value, ... }: value.shell == pkgs.fish)
    (lib.attrsToList config.users.users);
  programs.zsh.enable = lib.any ({ value, ... }: value.shell == pkgs.zsh)
    (lib.attrsToList config.users.users);
}
