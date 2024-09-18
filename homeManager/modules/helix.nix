{ config, pkgs, outputs, ...}:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  programs.helix = {
    # Unstable
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
