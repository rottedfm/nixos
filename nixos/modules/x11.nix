{ config, pkgs, ...}:

{
  services.xserver = {
    enable = true;
    xkb.variant = "";
    xkb.layout = "us";
  };
}
