{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync.sh";
      shutdown = "shutdown now";
    };

    zplug = {
      enable = true; 
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-substring-search";}
        {name = "zsh-users/zsh-syntax-highlighting";}
      ];
    };
  };
}
