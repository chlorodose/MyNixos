{ pkgs, osConfig, ... }: {
  qt = {
    enable = osConfig.modules.desktop.enable;
    platformTheme.name = "gtk3";
    style = {
      package = pkgs.lightly-qt;
      name = "Lightly";
    };
  };
  gtk = {
    enable = osConfig.modules.desktop.enable;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-mocha-mauve-standard+default";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    cursorTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}