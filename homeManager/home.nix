{ config, pkgs, ... }:

{
  imports = [
    ./modules/default.nix
  ];
  
  home.username = "rotted";
  home.homeDirectory = "/home/rotted";

  home.stateVersion = "24.05";

  home.packages = [
    # shell
    pkgs.unstable.glow
  ];

  programs.home-manager.enable = true;
}
