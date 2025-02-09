{ config, lib, ... }: {
  services.resolved.enable = lib.mkForce false;
  services.unbound = {
    enable = true;
    localControlSocketPath = "/run/unbound/unbound.ctl";
    settings = {
      server = {
        statistics-interval = 10;
        extended-statistics = true;
        interface = [ "0.0.0.0" "::0" ];
        access-control = [ "0.0.0.0/0 allow_snoop" "::/0 allow_snoop" ];
        log-queries = true;
        prefetch = true;
        prefetch-key = true;
        local-zone = ''"local." static'';
        local-data = [
          ''"nextcloud.local. 600 IN A 192.168.0.1"''
          ''"grafana.local. 600 IN A 192.168.0.1"''
        ];
      };
    };
  };
  services.prometheus.exporters.unbound = {
    enable = true;
    unbound.host = "unix:///run/unbound/unbound.ctl";
    listenAddress = "127.0.0.80";
  };
}
