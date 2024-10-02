{
  description = "A flake for python and python-virtualenv";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = nixpkgs.lib.mkShell {
      buildInputs = [ nixpkgs.python3 nixpkgs.python3Packages.virtualenv, nixpkgs.git ];

      shellHook = ''
        export SHELL=$(which zsh)
        exec zsh
      '';
    };
  };
}
