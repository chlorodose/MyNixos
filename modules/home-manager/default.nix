{ ... }: {
  imports = [ ./ssh.nix ./gpg.nix ./fish.nix ./locale.nix ./neovim.nix ];
  programs.home-manager.enable = true;
}
