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
     package = pkgs.hackgen-nf-font;
     name = "Hack Gen Nerd";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 14;
      terminal = 14;
      desktop = 14;
      popups = 14;
    };
  };

  stylix.opacity.terminal = 0.55;

  stylix.cursor.name = "Bibata-Modern-Classic";
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.size = 24;

}
