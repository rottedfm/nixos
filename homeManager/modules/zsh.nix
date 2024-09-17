{ config, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync.sh";
      shutdown = "shutdown now";
    };

    antidote = {
      enable = true;
      plugins =  [''
        zsh-users/zsh-syntax-highlighting
        zsh-users/zsh-autosuggestion
        zsh-users/zsh-history-substring-search

        sindresorhus/pure
      ''];
    };
  };
}
