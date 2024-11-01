{ config, pkgs, ...}:

{
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.lightdm.enable = false;
  };
}
