{
  imports = [

    # system
    ./locals.nix
    ./network.nix
    ./boot.nix
    ./pipewire.nix

    # ssh
    ./ssh.nix

    # login service
    ./login.nix

    # zsh
    ./zsh.nix


    ./xserver.nix
    
    # ollama
    ./ollama.nix
  ];
}
