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
        http_addr = "0.0.0.0";
        domain = "192.168.0.1";
        http_port = 3001;
        root_url = "http://192.168.0.1:3001/";
      };
    };
  };
}
