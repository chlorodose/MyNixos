{ pkgs, ... }: {
  home.packages = with pkgs; [
    btop
    iotop
    iftop
    strace
    ltrace
    lsof
    lm_sensors
    pciutils
    usbutils
    nmap
    socat
    fastfetch
    nixd
    nixfmt
    nix-tree
    brightnessctl
    playerctl
    ripgrep
    fd
    lazygit
  ];
}
