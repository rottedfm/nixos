{ config, pkgs, ...}:

{
  programs.helix = {
    # Unstable
    package = pkgs.unstable.helix;
    defaultEditor = true;
    extraPackages = [
      pkgs.unstable.ltex-ls
      pkgs.unstable.marksman
    ];   
    language = [{
      name = "markdown";
      language-servers = ["ltex-ls", "marksman"];
    }];
  };
}
