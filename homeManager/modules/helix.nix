{ config, pkgs, outputs, ... }:

{
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    defaultEditor = true;
    extraPackages = [ pkgs.unstable.ltex-ls pkgs.unstable.marksman ];
    languages = {
      language = [
        {
          name = "markdown";
          language-servers = [ "marksman" "ltex-ls" ];
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];
    };

    settings = {
      editor = {
        line-number = "relative";
        mouse = false;
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.statusline = {
        left = [ "mode" "spinner" ];
        center = [ "file-name" ];
        right = [
          "diagnostics"
          "selections"
          "position"
          "file-encoding"
          "file-line-ending"
          "file-type"
        ];
        mode.normal = "ʕ •ᴥ•ʔ";
        mode.insert = "“φʕ•ᴥ•oʔ";
        mode.select = "ʕ￫ᴥ￩ʔ";

      };
    };
  };
}
