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
      in
      {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.rust-bin.stable.latest.default
            pkgs.cargo
            pkgs.rustfmt
            pkgs.clippy
            pkgs.cargo-watch

            # C libs commonly required by Rust crates
            pkgs.openssl
            pkgs.pkgconfig
            pkgs.libssl
            pkgs.libiconv
            pkgs.zlib
            pkgs.libzstd
            pkgs.libsqlite3
            pkgs.libpq
            pkgs.libgit2
            pkgs.cmake
            pkgs.make
            pkgs.gcc
            pkgs.binutils
            pkgs.autoconf
            pkgs.automake
            pkgs.gnum4
            pkgs.libffi
            pkgs.libxml2
            pkgs.libtiff
            pkgs.libpng
            pkgs.libjpeg
            pkgs.gnumake
            pkgs.gmp
            pkgs.curl

            # helix 
            pkgs.rust-analyzer
            pkgs.vscode-extensions.vadimcn.vscode-lldb
          ];

        OPENSSL_DIR = pkgs.openssl.dev
        OPENSSL_LIB_DIR = "${pkgs.openssl.dev}/lib";          
        OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";

        LIBCLANG_PATH = "${pkgs.libclang}/lib";
        };
      };
    );
}
