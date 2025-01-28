{ lib, config, ... }: {
  options.users.chlorodose =
    lib.mkEnableOption "user chlorodose option collection";
  config = lib.mkIf config.users.chlorodose {
    home.username = "chlorodose";
    user.gpg.myKeys = [ ../../public/chlorodose_public.asc ];
    programs.ssh.authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF7rjnMuwq0bB/G4dXVSZHegO06qKm4BSBREUHml7Dp chlorodose <chlorodose@chlorodose.me>"
    ];
    programs.git = {
      userEmail = "chlorodose@chlorodose.me";
      userName = "chlorodose";
    };
  };
}
