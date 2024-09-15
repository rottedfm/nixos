{
  imports = [

    # system
    ./locals.nix
    ./network.nix    
    ./boot.nix

    # ssh
    ./ssh.nix

    # xwayland
    ./x11.nix
  ];
}
