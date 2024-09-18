{ config, pkgs, outputs, ...}:

{

  programs.helix = {
    package = pkgs.helix;
    defaultEditor = true;
    extraPackages = [
      pkgs.ltex-ls
      pkgs.marksman
    ];   
    languages = [{
      name = "markdown";
      language-servers = ["ltex-ls" "marksman"];
    }];
  };
}
