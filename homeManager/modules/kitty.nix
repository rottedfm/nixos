{ config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 3;
      allow_bold_text = true;
      font_features = "+calt +liga +dlig";
    };
  };
}
