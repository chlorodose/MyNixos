{ config, lib, ... }: {
  options.services.mc.enable = lib.mkEnableOption "mc service";

  config = lib.mkIf config.services.mc.enable {
    services.minecraft-server = {
      enable = true;
      dataDir="/srv/minecraft";
      eula = true;
      declarative = true;
      openFirewall = true;
      serverProperties = {
        difficulty = 3;
        gamemode = 0;
        max-players = 32;
        motd = "NixOS Minecraft server!";
        online-mode = false;
      };
    };
  };
}
