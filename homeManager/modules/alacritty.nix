{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
    settings = {
      font = {
        normal = {
          family = "Fira Code Nerd";
        };
      };
    };
  };
}
