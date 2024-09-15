{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      rebuild = "bash /home/rotted/.dotfiles/rebuild.sh";
      shutdown = "shutdown now";
    };
  };
}
