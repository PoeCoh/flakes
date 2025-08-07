{
  description = "PoeCoh flake registry";

  outputs = { self }: {
    registry = {
      zig = {
        from = {
          type = "indirect";
          id = "zig";
        };
        to = {
          type = "git";
          url = "ssh://git@git.poecoh.com/flakes/zig.git";
        };
      }
    }
  }
}
