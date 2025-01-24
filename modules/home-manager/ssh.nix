{ config, lib, ... }: {
  options.programs.ssh = {
    authorizedKeys = lib.mkOption {
      default = [ ];
      type = lib.types.listOf lib.types.str;
    };
    knownHosts = lib.mkOption {
      default = { };
      type = lib.types.attrsOf {
        type = lib.types.enum [ "ssh-ed25519" "ssh-rsa" ];
        key = lib.types.str;
      };
    };
  };
  config = {
    home.file.".ssh/authorized_keys".text =
      lib.concatLines config.programs.ssh.authorizedKeys;
    home.file.".ssh/known_hosts".text = lib.concatLines
      (lib.mapAttrsToList (name: value: "${name} ${value.type} ${value.key}")
        config.programs.ssh.knownHosts);
  };
}
