{ pkgs, config, ...}:

{
  programs.ncspot = {
    enable = true;
    package = pkgs.unstable.ncspot;
    settings = {
      use_nerdfont = true;
      shuffle = true;
      gabless = true;
    };
  };
}
