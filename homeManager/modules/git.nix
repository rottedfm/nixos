{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userEmail = "rottedfm@proton.me";
    userName = "rottedfm";
  };
}
