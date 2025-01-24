{ lib, ... }: {
  networking.useNetworkd = true;
  networking.useDHCP = false;
  networking.nftables.enable = true;
  networking.firewall.enable = true;
  services.openssh.enable = lib.mkDefault true;
}
