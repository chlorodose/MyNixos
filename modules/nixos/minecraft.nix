{ config, lib, pkgs, ... }: {
  options.services.mc.enable = lib.mkEnableOption "mc service";

  config = lib.mkIf config.services.mc.enable {
    services.minecraft-servers = {
      enable = true;
      eula = true;
      dataDir = "/srv/minecraft";
      servers.server = 
      let 
        modpack = pkgs.fetchPackwizModpack {
          url = "https://github.com/chlorodose/my-mc-server/raw/v1.0.0/pack.toml";
          packHash = "";
        };
      in {
        enable = true;
        autoStart = true;
        openFirewall = true;
        restart = "always";
        enableReload = true;
        package = pkgs.minecraftServers.fabric-1_18_2;
        jvmOpts = "-Xms2048M -Xmx8192M";
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
      };
    };
  };
}
