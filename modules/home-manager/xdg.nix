{ config, lib, ... }: {
  xdg = {
    enable = true;
    userDirs.enable = true;
    autostart.enable = true;
  };
}