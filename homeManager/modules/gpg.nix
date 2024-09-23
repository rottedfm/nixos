{ config, pkgs, ...}:

{
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent.pinentryPackage = [ pkgs.pinetry-curses ];
}
