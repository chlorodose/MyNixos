{ pkgs, ... }: {
  users.chlorodose = true;
  home.stateVersion = "25.05";
  services.desktop.enable = true;
  programs.ssh.knownHosts = [
    "cl-server ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAUDoG1njuBcqcylds7HIrSUUeqxiyJUUI+pduTVUJYXzr"
  ];
  programs.git.userName = "chlorodose";
  programs.git.userEmail = "chlorodose@chlorodose.me";
  programs.git.signing.key = "942DF679F2B394D4";
  services.gpg-agent.enable = true;

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      mhutchie.git-graph
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      rust-lang.rust-analyzer
      usernamehw.errorlens
      pkief.material-icon-theme
    ];
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "/home/chlorodose/.nix-profile/bin/nixd";
      "editor.fontFamily" = "'SauceCodePro Nerd Font'";
      "nix.formatterPath" = "nixfmt";
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;
      "files.associations"= {
          "*.age" = "code-text-binary";
      };
    };
  };
}
