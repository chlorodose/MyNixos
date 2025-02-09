{ config, lib, ... }: {
  options.modules.passwd.enable = lib.mkEnableOption "password service";
  config = {
    services.pass-secret-service.enable = true;
    programs.password-store.enable = true;
  };
}
