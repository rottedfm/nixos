{ config, pkgs, ...}:

{
  # hostname
  networking.hostName = "fm"; 
  # network manager
  networking.networkmanager.enable = true;

  # spotify
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];
}
