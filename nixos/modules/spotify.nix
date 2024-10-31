{ pkgs, config, ...}:

{
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        # move this out of git
        username = "hlsmhe1ofge667evjv816wwg6";
        password = ''k+ba9L"K%@cB.33'';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    spotify-tui
  ];
}
