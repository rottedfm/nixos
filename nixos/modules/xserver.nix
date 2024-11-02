{ config, pkgs, ...}:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.lightdm.enable = false;
  };
}
