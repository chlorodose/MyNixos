{ config, lib, ... }: {
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
}
