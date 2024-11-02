{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync";
      shutdown = "shutdown now";
      cd = "z";
      rust = "nix develop ~/.dotfiles/rust/";
      python = "nix develop ~/.dotfiles/python";
    };

    initExtra = ''
      source /home/rotted/.dotfiles/p10k.zsh

      if ! pgrep -x "login" > /dev/null; then
          /home/rotted/Scripts/login/target/release/login &
      fi
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
