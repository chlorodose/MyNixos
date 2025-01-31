{ config, lib, ... }: {
  options.services.gitserver.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.gitserver.enable {
    services.gitea = {
      enable = true;
      stateDir = "/srv/gitea";
      lfs.enable = true;
      appName = "Git Home Lab";
      settings.server = {
        DISABLE_SSH = true;
        HTTP_ADDR = "127.0.0.81";
        DOMAIN = "192.168.0.1";
        ROOT_URL = "http://192.168.0.1";
      };
      database = {
        type = "postgres";
        socket = "/run/postgresql";
      };
      settings.service.DISABLE_REGISTRATION = false;
    };
    services.nginx.enable = true;
    services.nginx.locations."/gitea/" = {
      proxyPass = "http://${config.services.gitea.settings.server.HTTP_ADDR}:${toString config.services.gitea.settings.server.HTTP_PORT}";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
