{ config, lib, pkgs, ... }: {
  options.services.mc.enable = lib.mkEnableOption "mc service";

  config = lib.mkIf config.services.mc.enable {
    services.minecraft-servers = {
      enable = true;
      eula = true;
      dataDir = "/srv/minecraft";
      servers.server = let
        modpack = pkgs.fetchPackwizModpack {
          url =
            "https://github.com/chlorodose/my-mc-server/raw/v1.1.1/pack.toml";
          packHash = "sha256-5h9een1y6dpbFt61nSl8yNNZAedMH3kaQOpt3FG+Pss=";
          manifestHash =
            "sha256:0bzg6slzdk6lblrh7lyyyrgymnkj3hpyl0n0dkdwf8mm0j1l87zz";
        };
        mcVersion = modpack.manifest.versions.minecraft;
        fabricVersion = modpack.manifest.versions.fabric;
        serverVersion =
          lib.replaceStrings [ "." ] [ "_" ] "fabric-${mcVersion}";
      in {
        enable = true;
        autoStart = true;
        openFirewall = true;
        restart = "always";
        enableReload = false;
        package = pkgs.fabricServers.${serverVersion}.override {
          loaderVersion = fabricVersion;
        };
        jvmOpts = "-Djava.net.useSystemProxies=true -Xms2048M -Xmx8192M";
        serverProperties = {
          difficulty = 3;
          gamemode = 0;
          max-players = 32;
          motd = "Chlorodose's Minecraft Server From Nixos";
          online-mode = false;
        };
        symlinks = {
          "mods" = "${modpack}/mods";
        };
        files = {
          "config/exporter.properties" = {
            value = { server-port = 8080; };
          };
        };
      };
    };
  };
}
