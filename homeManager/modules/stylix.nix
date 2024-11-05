{ config, pkgs, ... }:

{
  stylix.enable = true;

  stylix.image = ../../wallpapers/sakura.png;
  stylix.polarity = "light";

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
     name = "FiraCode Nerd";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 14;
      terminal = 12;
      desktop = 12;
      popups = 12;
    };
  };

  stylix.cursor.name = "Bibata-Modern-Classic";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.size = 24;

}
