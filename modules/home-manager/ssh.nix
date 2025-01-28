{ config, lib, ... }: {
  options.programs.ssh = {
    authorizedKeys = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
    knownHosts = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };
  config = {
    home.file.".ssh/authorized_keys".text =
      lib.concatLines config.programs.ssh.authorizedKeys;
    home.file.".ssh/known_hosts".text =
      lib.concatLines config.programs.ssh.knownHosts;
    programs.ssh.matchBlocks."github.com" = {
      user = "git";
      hostname = "github.com";
      port = 443;
    };
  };
}
