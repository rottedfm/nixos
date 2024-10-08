{
  description = "!rust!";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";

    # rust overlay
    rust-overlay.url = "github:oxalica/rust-overlay";

    # nixpkgs fetcher that includes the overlay as an input
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (import rust-overlay) ];
        };
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.rust-bin.nightly.latest.default
            pkgs.cargo
            pkgs.rustfmt
            pkgs.clippy
            pkgs.cargo-watch
            pkgs.cargo-expand
            pkgs.cargo-audit

            # C libs commonly required by Rust crates
            pkgs.openssl
            pkgs.pkg-config
            pkgs.cmake
            pkgs.gcc
            pkgs.binutils
            pkgs.autoconf
            pkgs.automake
            pkgs.gnumake
            pkgs.gmp
            pkgs.curl

            # helix 
            pkgs.rust-analyzer
            pkgs.vscode-extensions.vadimcn.vscode-lldb
          ];

          shellHook = ''
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            zsh
          '';

          OPENSSL_DIR = pkgs.openssl.dev;
          OPENSSL_LIB_DIR = "${pkgs.openssl.dev}/lib";
          OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";

          LIBCLANG_PATH = "${pkgs.libclang}/lib";

        };
      });
}
