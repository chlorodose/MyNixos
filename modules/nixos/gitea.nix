{ config, lib, ... }: {
  options.services.gitserver.enable = lib.mkEnableOption "gitea service";

  config = lib.mkIf config.services.gitserver.enable {
    services.gitea = {
      enable = true;
      stateDir = "/srv/gitea";
      lfs.enable = true;
      appName = "Git Home Lab";
      database = {
        type = "postgres";
        socket = "/run/postgresql";
      };
      settings.service.DISABLE_REGISTRATION = false;
    };
  };
}
