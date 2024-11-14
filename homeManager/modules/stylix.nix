{ config, pkgs, ... }:

{
  stylix.enable = true;

  stylix.image = ../../wallpapers/sakura.png;
  stylix.polarity = "dark";

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DajaVu Sans";
    };

    monospace = {
     package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
     name = "Fira Code Nerd";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };


    sizes = {
      applications = 16;
      terminal = 16;
      desktop = 16;
      popups = 16;
    };
  };

 
  stylix.opacity.terminal = 0.35;

  stylix.cursor.name = "Bibata-Modern-Classic";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.size = 24;

}
