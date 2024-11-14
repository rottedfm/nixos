{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
    settings = {
      font = {
        family = "Fira Code";
        features = {
          liga = true;
        };
      };
    };
  };
}
