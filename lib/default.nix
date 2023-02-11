{ pkgs }:

with pkgs.lib; {
  rust = rec {
    overrides = {
      libsqlite3-sys = pkgs.rustBuilder.rustLib.makeOverride {
        name = "libsqlite3-sys";
        overrideAttrs = drv: {
          propagatedNativeBuildInputs = drv.propagatedNativeBuildInputs or [ ] ++ [ pkgs.sqlite ];
        };
      };
      all = pkgs.rustBuilder.overrides.all ++ [ overrides.libsqlite3-sys ];
    };

    build =
      { src , channel ? "nightly",  packageOverrides ? overrides.all} :
      let
        rustPkgs = pkgs.rustBuilder.makePackageSet {
          rustChannel = "nightly";
          packageOverrides = pkgs: packageOverrides; 
          packageFun = import (src + "/Cargo.nix");
        };
      in
        rustPkgs.workspace;
  };
}
