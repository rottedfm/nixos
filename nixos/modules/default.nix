{
  imports = [

    # system
    ./locals.nix
    ./network.nix    
    ./boot.nix
    ./pipewire.nix

    # ssh
    ./ssh.nix

    # xwayland
    ./x11.nix

    # zsh
    ./zsh.nix

  ];
}
