{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake_utils.url = "github:numtide/flake-utils";

    zig-flake.url = "git+https://git.poecoh.com/flakes/zig";
  };

  outputs = { self, nixpkgs, flake-utils, zig-flake, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs =  nixpkgs.legacyPackages.${system};
      in {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = builtins.attrValues self.packages.${system};
          };
          inherit (zig-flake.devShells.${system}) zig;
        };
      }
    );
}
