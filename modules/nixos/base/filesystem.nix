{ config, lib, ... }:
{
  imports = [
    (lib.mkAliasOptionModule
      [ "system" "persistence" ]
      [
        "environment"
        "persistence"
        "/mnt"
      ]
    )
  ];
  config = {
    fileSystems."/" = {
      device = "none";
      fsType = "tmpfs";
      options = [
        "defaults"
        "size=8g"
      ];
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
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 100;
      writebackDevice = "/dev/disk/by-label/swap";
    };
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
    systemd.extraConfig = "DefaultDeviceTimeoutSec = 3s";
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
      directories = [
        "/var/lib/nixos"
        "/srv"
      ];
    };
  };
}
