{
  config,
  lib,
  pkgs,
  ...
}:
{
  system.persistence.users = (
    lib.mapAttrs (name: value: {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Public"
        "Templates"
        "Videos"
        "Desktop"
      ];
    }) config.home-manager.users
  );
}
