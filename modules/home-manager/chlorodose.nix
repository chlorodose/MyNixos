{ lib, config, ... }: {
  home.username = "chlorodose";
  options.users.chlorodose =
    lib.mkEnableOption "user chlorodose option collection";
  config = lib.mkIf config.users.chlorodose {
    user.gpg.myKeys = ../../public/chlorodose_public.asc;
    programs.ssh.authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF7rjnMuwq0bB/G4dXVSZHegO06qKm4BSBREUHml7Dp chlorodose <chlorodose@chlorodose.me>"
    ];
    programs.ssh.knownHosts = {
      cl-server = {
        type = "ssh-ed25519";
        key =
          "AAAAC3NzaC1lZDI1NTE5AAAAUDoG1njuBcqcylds7HIrSUUeqxiyJUUI+pduTVUJYXzr";
      };
    };
  };
}
