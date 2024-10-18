{ config, pkgs, ...}:

{
  programs.zellij = {
    enableZshIntegration = true;
    package = pkgs.unstable.zellij;
    settings = {
      ui = {
        pane_frames = {
          rounded_corners = false;
          hide_session_name = true;
        };
      };
      mouse_mode = false;
    };
  };
}
