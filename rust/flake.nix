{
  description = "!rust!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            openssl
            rustfmt
            rust-analyzer
            lldb_19
            bacon
            clippy
            rust-bin.beta.latest.default
          ];
          nativeBuildInputs = [
            autoreconfHook
            pkg-config
          ];
        };      
      }
    );
}
