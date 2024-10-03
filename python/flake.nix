{
  description = "A flake for python, python-virtualenv, git, and zsh";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # flake utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs =
            [ pkgs.python3 pkgs.python3Packages.virtualenv pkgs.git ];

          shellHook = ''
            export SHELL=$(which zsh)
            zsh
          '';
        };
      });
}
