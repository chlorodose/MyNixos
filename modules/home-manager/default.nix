{ ... }: {
  imports =
    [ ./ssh.nix ./gpg.nix ./fish.nix ./locale.nix ./neovim.nix ./extra.nix ];
  programs.home-manager.enable = true;
}
