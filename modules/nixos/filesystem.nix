{ config, lib, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "system" "persistence" ] [
      "environment"
      "persistence"
      "/mnt"
    ])
  ];
  options = {
    system.fs.swap = {
      num = lib.mkOption {
        type = lib.types.int;
        default = 0;
        description = "Number of swap devices";
      };
    };
    system.fs.root = {
      limit = lib.mkOption {
        type = lib.types.str;
        default = "4g";
        description = "Limit maxium size of root tmpfs";
      };
    };
  };
  config = {
    fileSystems."/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=${config.system.fs.root.limit}" ];
      neededForBoot = true;
    };
    fileSystems."/boot" = {
      label = "BOOT";
      fsType = "vfat";
      options = [
        "rw"
        "sync"
        "nosuid"
        "nodev"
        "noexec"
        "uid=0"
        "gid=0"
        "umask=077"
        "utf8"
        "errors=remount-ro"
      ];
      neededForBoot = false;
    };
    swapDevices = if config.system.fs.swap.num == 0 then
      [ ]
    else if config.system.fs.swap.num == 1 then [{
      label = "swap";
    }] else
      lib.genList (x: { label = "swap${builtins.toString x}"; })
      config.system.fs.swap.num;
    fileSystems."/nix" = {
      label = "nix";
      fsType = "ext4";
      options = [ "defaults" ];
      neededForBoot = true;
    };
    fileSystems."/mnt" = {
      label = "data";
      fsType = "bcachefs";
      neededForBoot = true;
    };
    system.persistence = {
      enable = true;
      hideMounts = true;
      files = [
        "/etc/machine-id"
        "/etc/ssh/ssh_host_ed25519_key"
        "/etc/ssh/ssh_host_ed25519_key.pub"
        "/etc/ssh/ssh_host_rsa_key"
        "/etc/ssh/ssh_host_rsa_key.pub"
      ];
      directories = [ "/var/lib/nixos" ];
    };
    systemd.extraConfig = "DefaultDeviceTimeoutSec = 3s";
  };
}
