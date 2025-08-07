{
  description = "PoeCoh flake registry";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig-flake.url = "git+ssh://git@git.poecoh.com/flakes/zig.git";
  };

  outputs = {
    self,
    nixpkgs,
    zig-flake
  }: {
    devShells.x86_64-linux = {
      zig = zig-flake.devShells.x86_64-linux.default;
    };
    packages.x86_64-linux = {
      zig = zig-flake.packages.x86_64-linux.default;
    };
  };
}
