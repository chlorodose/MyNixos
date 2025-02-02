{ config, lib, ... }: {
  options.services.postgres.enable = lib.mkEnableOption "postgres service";

  config = lib.mkIf config.services.postgres.enable {
    services.postgresql = {
      enable = true;
      enableTCPIP = true;
      enableJIT = true;
      dataDir = "/srv/postgresql";
      authentication = lib.mkForce ''
        local all all peer
        host all all 192.168.0.0/24 password
      '';
      ensureUsers = [{
        name = "root";
        ensureClauses.superuser = true;
        ensureClauses.login = true;
      }];
    };
  };
}
