{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    gnupg
    nix-fast-build
    nix-eval-jobs
    nix-output-monitor
  ];

  nix.gc = {
    automatic = true;
    dates = "03:15";
    randomizedDelaySec = "30min";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
  nix.settings.trusted-users = [ "root" "@wheel" ];
  nix.daemonCPUSchedPolicy = lib.mkDefault "batch";

  nix.settings.substituters =
    [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
