{ ... }: {
  imports = [ ./ssh.nix ./gpg.nix ./fish.nix ./locale.nix ];
  programs.home-manager.enable = true;
}
