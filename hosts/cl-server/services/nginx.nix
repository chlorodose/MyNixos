{ config, lib, ... }: {
  services.nginx = {
    virtualHosts."192.168.0.1" = {
      default = true;
      listen = [
        {
          addr = "0.0.0.0";
          port = 80;
        }
        {
          addr = "[::]";
          port = 80;
        }
      ];
    };
  };
}
