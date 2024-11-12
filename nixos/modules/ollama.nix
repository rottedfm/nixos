{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    package = pkgs.unstable.ollama;
  };
}
