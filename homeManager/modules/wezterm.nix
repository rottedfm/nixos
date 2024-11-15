{ config, pkgs, ...}:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.unstable.wezterm;
    extraConfig = ''
      local wezterm = require 'wezterm'
      return {
        font = wezterm.font_with_fallback({
          { family = 'FiraCode Nerd Font Mono', weight = 'Regular' },
        }),
        font_size = 16.0,
      }
    '';
  };
}
