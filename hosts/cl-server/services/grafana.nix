{ config, lib, ... }:
{
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
      domain = "grafana.local";
      root_url = "http://grafana.local/";
      serve_from_sub_path = true;
    };
  };
  services.nginx.enable = true;
  services.nginx.virtualHosts."grafana.local".locations."/" = {
    proxyPass = "http://${config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";
    proxyWebsockets = true;
    recommendedProxySettings = true;
  };
}
