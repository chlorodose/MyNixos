{ config, ... }: {
  imports = [ ./wan.nix ./lan.nix ];
  # Age
  age.secrets.wg-private = {
    file = ../../secrets/wg-private.age;
    mode = "440";
    owner = "root";
    group = "systemd-network";
  };
  age.secrets.wg-ps-phone = {
    file = ../../secrets/wg-ps-phone.age;
    mode = "440";
    owner = "root";
    group = "systemd-network";
  };
  # Network
  networking = {
    nat = {
      enable = true;
      internalInterfaces = [ "lan" "wg" ];
      externalInterface = "wan";
    };

    firewall = {
      trustedInterfaces = [ "lan" "wg" ];
      pingLimit = "8/second burst 32 packets";
      extraForwardRules = ''
        iifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
        oifname { "wan" } tcp flags syn tcp option maxseg size set rt mtu
      '';
      rejectPackets = true;
      filterForward = true;
      allowedUDPPorts = [ 51820 ];
      interfaces.wan.allowedUDPPorts = [ 68 546 ];
      logReversePathDrops = true;
      logRefusedConnections = true;
    };

    wireguard.interfaces.wg = {
      ips = [ "192.168.1.1/24" ];
      listenPort = 51820;
      privateKeyFile = config.age.secrets.wg-private.path;
      peers = [{
        name = "phone";
        persistentKeepalive = 25;
        allowedIPs = [ "192.168.1.2/24" ];
        publicKey = "12+lveD6bhdlprqxP9lxLx0nHpOI575L0ORbBjpUIys=";
        presharedKeyFile = config.age.secrets.wg-ps-phone.path;
      }];
    };
  };
}
