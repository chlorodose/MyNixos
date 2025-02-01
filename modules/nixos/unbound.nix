{ config, lib, ... }: {
  options.services.dnserver.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.dnserver.enable {
    services.resolved.enable = false;
    services.unbound = {
      enable = true;
      settings = {
        server = {
          statistics-interval = 10;
          extended-statistics = true;
          interface = ["0.0.0.0" "::0"];
          access-control = [
            "0.0.0.0/0 allow_snoop"
            "::/0 allow_snoop"
          ];
          log-queries = true;
          prefetch = true;
          prefetch-key = true;
          local-zone = "\"service.\" static";
          local-data = [
            "\"nextcloud.service. 600 IN A 192.168.0.1\""
          ];
        };
      };
    };
  };
}
