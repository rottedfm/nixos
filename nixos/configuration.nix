{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # load modules
    ./modules/default.nix
    # hardware scan
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # load overlays
    overlays = [ outputs.overlays.unstable-packages ];

    config = { allowUnfree = true; };
  };

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # enable Flakes
      experimental-features = "nix-command flakes";
      # disable flake registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    # turn of channels
    channel.enable = false;

    # make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # stylix gtk error fix
  programs.dconf.enable = true;

  # user settings
  users.users.rotted = {
    isNormalUser = true;
    description = "rotted";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # auto login
  services.getty.autologinUser = "rotted";

  # look up
  system.stateVersion = "24.05";
}
