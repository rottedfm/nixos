{ config, pkgs, outputs, inputs, lib, ... }:

{
  imports = [
    ./modules/default.nix
  ];
  
  home.username = "rotted";
  home.homeDirectory = "/home/rotted";

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];

    config.allowUnfree = true;
  };
  
  home.stateVersion = "24.05";

  home.packages = [
    # shell
    pkgs.unstable.glow
  ];

  programs.home-manager.enable = true;
}
