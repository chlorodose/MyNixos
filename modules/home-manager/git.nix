{ ... }:
{
  config = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      signing.signByDefault = true;
    };
  };
}
