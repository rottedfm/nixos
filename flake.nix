{
  description = "!dotfiles!";

  inputs = {
    # nixpkgs stable 
    nixpkgs.url = "nixpkgs/nixos-24.05";
    # nixpkgs unstable
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:danth/stylix";

    # Rust overlay
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    rust-overlay,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};

    # sudo nixos-rebuild switch --flake .#fm
    nixosConfigurations = {
      fm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.nix
          ({ pkgs, ...}: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
          })
        ];
      };
    }; 

    # home-manager switch --flake .#rotted@fm
    homeConfigurations = {
      "rotted@fm" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};      
        modules = [
          ./homeManager/home.nix
          stylix.homeManagerModules.stylix
        ];
      };
    };
  };
}
