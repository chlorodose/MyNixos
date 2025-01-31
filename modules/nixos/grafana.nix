{ config, lib, ... }: {
  options.services.grafanas.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.grafanas.enable {
    services.grafana = {
      enable = true;
      dataDir = "/srv/grafana";
      settings.database = {
        user = "grafana";
        type = "postgres";
        host = "/run/postgresql";
      };
      settings.server = {
        http_addr = "127.0.0.81";
        http_port = 3001;
        domain = "192.168.0.1";
        root_url = "http://192.168.0.1/grafana/";
        serve_from_sub_path = true;
      };
    };
    services.nginx.enable = true;
    services.nginx.locations."/grafana/" = {
      proxyPass =
        "http://${config.services.grafana.settings.server.http_addr}:${
          toString config.services.grafana.settings.server.http_port
        }";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
