{
  imports = [

    # system
    ./locals.nix
    ./network.nix
    ./boot.nix
    ./pipewire.nix

    # ssh
    ./ssh.nix

    # zsh
    ./zsh.nix

    # vpn
    ./mullvad.nix

    ./xserver.nix
    
    # ollama
    ./ollama.nix

    # stylix
    ./stylix.nix
  ];
}
