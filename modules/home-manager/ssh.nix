{ config, lib, ... }:
{
  options.programs.ssh = {
    authorizedKeys = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
  };
  config = {
    home.file.".ssh/authorized_keys".text = lib.concatLines config.programs.ssh.authorizedKeys;
    programs.ssh.matchBlocks."github.com" = {
      user = "git";
      hostname = "github.com";
      port = 443;
    };
  };
}
