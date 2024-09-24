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
  };
}
