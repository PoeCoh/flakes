{
  description = "PoeCoh flake registry";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # flakes
    zig-flake.url = "git+http://git.poecoh.com/flakes/zig.git";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    zig-flake
  }: flake-utils.lib.eachDefaultSystem (system: {
    devShells.x86_64-linux = {
      zig = zig-flake.devShells.${system}.default;
    };
    packages.x86_64-linux = {
      zig = zig-flake.packages.${system}.default;
    };
  });
}
