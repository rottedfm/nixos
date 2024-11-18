{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      sync = "bash /home/rotted/.dotfiles/sync";
      shutdown = "shutdown now";
      ls = "${pkgs.eza}/bin/eza --icons -a --group-directories-first";
      tree = "${pkgs.eza}/bin/eza --color=auto --tree";
      count = "${pkgs.cloc}/bin/cloc .";
      cd = "z";
      rust = "nix develop ~/.dotfiles/rust/";
      python = "nix develop ~/.dotfiles/python";
    };

    initExtra = ''
      SPACESHIP_CHAR_SYMBOL=">"         # Replace the default ➜ symbol
      SPACESHIP_CHAR_SUFFIX=" "         # Add a space after the prompt character
      SPACESHIP_PROMPT_ADD_NEWLINE=false  # Keep everything on one line for simplicity
      SPACESHIP_DIR_PREFIX=""           # Remove directory prefix symbols
      SPACESHIP_USER_SHOW=always        # Show the username explicitly if needed
      SPACESHIP_HOST_SHOW=always        # Show hostname explicitly if needed
      SPACESHIP_EXIT_CODE_SYMBOL="!"    # Use ! for exit codes
      SPACESHIP_PROMPT_ORDER=(
        user          # Show the username
        host          # Show the hostname
        dir           # Current directory
        git           # Git status
        jobs          # Background jobs indicator
        exit_code     # Exit code of the last command
        char          # Prompt character
      )

    '';
    
    loginExtra = ''
      /home/rotted/Scripts/login/target/release/login
    '';

    # plugins
    antidote = {
      enable = true;
      plugins = [''
        zsh-users/zsh-autosuggestions
        zsh-users/zsh-syntax-highlighting
        jeffreytse/zsh-vi-mode
        spaceship-prompt/spaceship-prompt
      ''];
    };
  };
}
