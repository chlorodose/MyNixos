{ config, pkgs, lib, ... }: {
  options.user.gpg = {
    myKeys = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.path;
    };
  };

  config = {
    programs.gpg = {
      enable = true;
      mutableKeys = false;
      mutableTrust = false;
      publicKeys = lib.map (x: {
        source = x;
        trust = 5;
      }) config.user.gpg.myKeys;
    };
    services.gpg-agent = {
      enable = lib.mkDefault false;
      enableExtraSocket = true;
      enableSshSupport = true;
      enableScDaemon = true;
      pinentryPackage = pkgs.pinentry-all;
    };
    home.packages = [ pkgs.pinentry-all ];
  };
}
