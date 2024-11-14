{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
    settings = {
      history = 10000;
      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
