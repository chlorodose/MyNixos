{ ... }: {
  users.chlorodose = true;
  home.stateVersion = "25.05";
  services.desktop.enable = false;
  programs.ssh.knownHosts = [
    "cl-server ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAUDoG1njuBcqcylds7HIrSUUeqxiyJUUI+pduTVUJYXzr"
  ];
}
