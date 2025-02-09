{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.nextcloud = {
    enable = true;
    hostName = "nextcloud.local";
    home = "/srv/nextcloud";
    datadir = "/srv/nextcloud";
    config.dbtype = "sqlite";
    config.adminuser = "admin";
    config.adminpassFile = "${pkgs.writeText "adminpass" "076130"}";
  };
}
