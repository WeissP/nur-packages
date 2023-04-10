{
  description = "My personal NUR repository";

  # inputs = {
  #   cargo2nix.url = "github:cargo2nix/cargo2nix/release-0.11.0";
  #   flake-utils.follows = "cargo2nix/flake-utils";
  #   nixpkgs.follows = "cargo2nix/nixpkgs";
  # };

  outputs = { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-darwin"
        "aarch64-linux"
        "armv6l-linux"
        "armv7l-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      packages = forAllSystems (system:
        import ./default.nix {
          pkgs = import nixpkgs {
            inherit system;
            # overlays = [ cargo2nix.overlays.default ];
          };
        });
    };
}
