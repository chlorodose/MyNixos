{ ... }: {
  config = {
    programs.git = {
      lfs.enable = true;
      signing.signByDefault = true;
    };
  };
}
