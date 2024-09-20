{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync";
      shutdown = "shutdown now";
      cd = "z";
    };

    initExtra = ''
      bindkey '^[[B' history-substring-search-up
      bindkey '^[[D' history-substring-search-down
    '';

    zplug = {
      enable = true; 
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "zsh-users/zsh-syntax-highlighting";}
      ];
    };
  };
}
