{ config, lib, ... }: {
  options.services.prometh.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.prometh.enable {
    services.prometheus = {
      enable = true;
      stateDir = "prometheus";
      listenAddress = "0.0.0.0";
      port = 8080;
      globalConfig.scrape_interval = "10s";
      exporters = {
        node = {
          enable = true;
          listenAddress = "127.0.0.80";
          port = 9000;
          enabledCollectors = [ "systemd" ];
          extraFlags = [
            "--collector.ethtool"
            "--collector.softirqs"
            "--collector.tcpstat"
          ];
        };
      };
      scrapeConfigs = [
        {
          job_name = "node";
          static_configs = [{
            targets = [
              "${config.services.prometheus.exporters.node.listenAddress}:${
                toString config.services.prometheus.exporters.node.port
              }"
            ];
          }];
        }
        {
          job_name = "minecraft-server";
          static_configs = [{ targets = [ "127.0.0.1:25585" ]; }];
        }
        {
          job_name = "unbound";
          static_configs = [{ targets = [ "127.0.0.80:9167" ]; }];
        }
      ];
    };
  };
}
