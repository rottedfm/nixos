{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # env
      env = [ "HYPRCURSOR_SIZE,24" ];

      # monitor settings
      monitor = ",highrr,auto,1";

      # general 
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "master";
      };

      # decoration
      decoration = {
        rounding = 5;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        inactive_opacity = 0.8;

        # blur
        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      # animations
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # master layout
      master = {
        new_status = "slave";
        no_gaps_when_only = 1;
      };

      # keybind
      "$mod" = "SUPER";

      bind = [
        "$mod, Q, exec, kitty"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, qutebrowser"
        "$mod, R, exec, wofi --show drun"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod SHIFT, h, resizeactive, -10 0"
        "$mod SHIFT, j, resizeactive, 0 10"
        "$mod SHIFT, k, resizeactive, 0 -10"
        "$mod SHIFT, l, resizeactive, 10 0"

        "$mod CTRL, h, swapwindow, l"
        "$mod CTRL, j, swapwindow, d"
        "$mod CTRL, k, swapwindow, u"
        "$mod CTRL, l, swapwindow, r"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]) 9));

      # move window shi
      binde = [
        "$mod CRTL, h, moveactive, -50 0"
        "$mod CRTL, j, moveactive, 0 50"
        "$mod CRTL, k, moveactive, 0 -50"
        "$mod CTRL, l, moveactive, 50 0"
      ];
    };
  };
}
