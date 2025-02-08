{ lib, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    channel.enable = false;
    daemonIOSchedClass = lib.mkDefault "best-effort";
    daemonCPUSchedPolicy = lib.mkDefault "other";
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
        "auto-allocate-uids"
        "cgroups"
        "configurable-impure-env"
      ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.sustech.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://nix-community.cachix.org"
      ]; 
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      auto-optimise-store = true;
      auto-allocate-uids = true;
      build-poll-interval = 1;
      build-users-group = "nixbld";
      connect-timeout = 5;
      download-attempts = 3;
      fallback = true;
      http-connections = 0;
      max-jobs = "auto";
      max-substitution-jobs = 64;
      preallocate-contents = true;
      require-drop-supplementary-groups = true;
      sandbox-fallback = false;
      stalled-download-timeout = 60;
      sync-before-registering = true;
      use-cgroups = true;
      use-xdg-base-directories = true;
    };
  };
}