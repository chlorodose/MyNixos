{ config, lib, pkgs, ... }: {
  system.persistence.users = (lib.mapAttrs (name: value: {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Desktop"
    ];
  }) config.home-manager.users);
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = lib.any ({ value, ... }: value.shell == pkgs.zsh)
    (lib.attrsToList config.users.users);
}
