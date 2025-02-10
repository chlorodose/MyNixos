{ pkgs, ... }: {
  qt = {
    enable = true;
    platformTheme = "gtk3";
    style = {
      package = pkgs.lightly-qt;
      name = "Lightly";
    };
  };
  gtk = {
    enable = true;
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