{ config, lib, pkgs, ... }: {
  system.persistence.users = lib.mapAttrs (name: value: {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Desktop"
      ".password-store"
    ];
  }) (lib.filterAttrs (name: value: value.isNormalUser) config.users.users);
  programs.fish.enable = lib.any ({ value, ... }: value.shell == pkgs.fish)
    (lib.attrsToList config.users.users);
  programs.zsh.enable = lib.any ({ value, ... }: value.shell == pkgs.zsh)
    (lib.attrsToList config.users.users);
}
