{ pkgs, config, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    steam
    gamescope
    mangohud
    lutris
  ];

    # Environment variables to improve Wayland support in Steam
  environment.variables = {
    "STEAM_RUNTIME" = "0";           # Disables Steam’s bundled runtime, using system libraries instead
    "SDL_VIDEODRIVER" = "wayland";   # Set SDL to use Wayland
    "MANGOHUD" = "1";                # Enables MangoHud for system metrics display
  };

  # Optional: Add an alias for running Steam with Gamescope
  environment.shellAliases = {
    "steam-wayland" = "gamescope -f -e -- steam";
  };
}
