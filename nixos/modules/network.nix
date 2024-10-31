{ config, pkgs, ...}:

{
  # hostname
  networking.hostName = "fm"; 
  # network manager
  networking.networkmanager.enable = true;

}
