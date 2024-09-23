{ config, pkgs, ...}:

{
  stylix.enable = true;

  stylix.image = ../../wallpapers/sakura-wallpaper1.jpg;

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
      name = "Hack GenJyuu Nerd";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 12;
      terminal = 15;
      desktop = 10;
      popups = 10;
    };
  };

  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.package = pkgs.bibata-cursors;
}
