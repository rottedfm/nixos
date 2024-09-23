{ config, pkgs, ...}:

{
  programs.wofi = {
    enable = true;
    package = pkgs.unstable.wofi;
  };
}
