# TODO
{ config, lib, ... }: {
  options.services.mediaserver.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.mediaserver.enable {
    services.jellyfin = {
      enable = true;
      dataDir = "/srv/jellyfin";
      cacheDir = "/srv/jellyfin/cache";
    };
    # services.jellyseerr = {
    #   enable = true;
    # };
    # services.nginx.enable = true;
    # services.nginx.locations."/gitea/" = {
    #   proxyPass = "http://${config.services.gitea.settings.server.HTTP_ADDR}:${toString config.services.gitea.settings.server.HTTP_PORT}";
    #   proxyWebsockets = true;
    #   recommendedProxySettings = true;
    # };
  };
}
