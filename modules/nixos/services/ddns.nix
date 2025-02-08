{ config, lib, ... }: {
  options.services.ddns.enable = lib.mkEnableOption "ddns service";

  config = lib.mkIf config.services.ddns.enable {
    age.secrets.ddns-cf = {
      file = lib.getSecret "ddns-cf";
      mode = "400";
      owner = "root";
    };
    services.ddclient = {
      enable = true;
      verbose = true;
      interval = "10min";
      ssl = true;
      usev4 = "ifv4, if=wan";
      usev6 = "ifv6, if=wan";
      protocol = "cloudflare";
      zone = "chlorodose.me";
      username = "token";
      passwordFile = config.age.secrets.ddns-cf.path;
      domains = [ "home-ppp.chlorodose.me" ];
    };
  };
}
