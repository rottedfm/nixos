{ config, pkgs, outputs, ...}:

{
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    defaultEditor = true;
    extraPackages = [
      pkgs.unstable.ltex-ls
      pkgs.unstable.marksman
    ];   
    languages = [{
      name = "markdown";
      language-servers = ["ltex-ls" "marksman"];
    }];
  };
}
