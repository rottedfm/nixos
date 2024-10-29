{ config, pkgs, outputs, inputs, lib, ... }:

{
  imports = [ ./modules/default.nix ];

  home.username = "rotted";
  home.homeDirectory = "/home/rotted";

  nixpkgs = {
    overlays = [ outputs.overlays.unstable-packages ];

    config.allowUnfree = true;
  };

  home.stateVersion = "24.05";

  home.packages = [
    # shell
    pkgs.glow
    pkgs.cmatrix
    pkgs.ttyper
    pkgs.bottom
    pkgs.neofetch
    pkgs.unstable.alsa-utils
    pkgs.mdr
    pkgs.tenki
    pkgs.todo
    pkgs.pom
    pkgs.termdown

    # auth
    pkgs.pass
    pkgs.unstable.wofi-pass
    pkgs.pinentry-curses

    # msc
    pkgs.unstable.firefox
    pkgs.audacity
    
    # libreoffice
    pkgs.libreoffice-qt
    pkgs.hunspell

  ];

  programs.home-manager.enable = true;
}
