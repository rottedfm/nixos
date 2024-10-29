{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync";
      shutdown = "shutdown now";
      cd = "z";
      ttyper = "ttyper -l rust -w 20";
      rust = "nix develop ~/.dotfiles/rust/";
      python = "nix develop ~/.dotfiles/python";
      hyprland = "hyprland | clear";
    };

    initExtra = ''
      source /home/rotted/.dotfiles/p10k.zsh
    '';

    # plugins
    antidote = {
      enable = true;
      plugins = [''
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-syntax-highlighting
        jeffreytse/zsh-vi-mode
        romkatv/powerlevel10k
      ''];
    };
  };
}
