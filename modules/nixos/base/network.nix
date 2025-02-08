{ lib, ... }: {
  networking.useNetworkd = true;
  networking.useDHCP = false;
  networking.nftables.enable = true;
  networking.firewall.enable = true;
  services.resolved = {
    enable = true;
    fallbackDns = [
      "1.1.1.1"
      "2606:4700:4700::1111"
      "223.5.5.5"
      "2400:3200::1"
    ];
  };
}
