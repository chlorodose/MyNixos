{ config, lib, pkgs, ... }: {
  options.services.nCloud.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.nCloud.enable {
     services.nextcloud = {
      enable = true;
      hostName = "192.168.0.1";
      home = "/srv/nextcloud";
      datadir = "/srv/nextcloud";
      config.dbtype = "sqlite";
      config.adminuser = "admin";
      config.adminpassFile = "${pkgs.writeText "adminpass" "test123"}";
    };
    # services.nginx.enable = true;
    # services.nginx.locations."/nextcloud/" = {
    #   proxyPass = "http://${config.services.gitea.settings.server.HTTP_ADDR}:${
    #       toString config.services.gitea.settings.server.HTTP_PORT
    #     }";
    #   proxyWebsockets = true;
    #   recommendedProxySettings = true;
    # };
  };
}
