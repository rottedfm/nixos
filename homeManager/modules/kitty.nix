{ config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      Lconfirm_os_window_close = 0;
    };
  };
}
