{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync";
      shutdown = "shutdown now";
      cd = "z";
      ttyper = "ttyper -l rust --sudden-death -w 20";
      rustdev = "nix develop ~/.dotfiles/rust/";
    };

    initExtra = ''
      source /home/rotted/.dotfiles/p10k.zsh
      bindkey '^[[B' history-substring-search-up
      bindkey '^[[D' history-substring-search-down
    '';

    # plugins
    antidote = {
      enable = true;
      plugins = [''
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-history-substring-search
        zsh-users/zsh-syntax-highlighting
        romkatv/powerlevel10k
      ''];
    };
  };
}
