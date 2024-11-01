{ config, pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager.command = ''
      ./Scripts/login/target/release/login
    '';
  };
}
