{ lib, ... }: {
  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];
  users.mutableUsers = false;
  users.users.root.initialHashedPassword = lib.mkDefault
    "$y$j9T$iNRMnFbX3gUOEySDFlTlJ/$L7GCQgKKplsF3k4gBo6kG4fGJq6iVd.HX0iOfgWFSgD";
  age.identityPaths = [ "/mnt/etc/ssh/ssh_host_ed25519_key" ];
  services.openssh.enable = true;
  services.openssh.settings.DenyUsers = lib.mkDefault [ "*" ];
}