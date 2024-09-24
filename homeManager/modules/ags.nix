{ inputs, pkgs, config, ... }:

{
  imports = [ inputs.ags.homeManagerModule.default ];

  programs.ags = {
    enable = true;

    configDir = ../../ags;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };
}
