{ stdenv, pkgs , ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "WeissP";
    repo = "recentf";
    rev = "d1ef3a7693b98a750a9d4303b5efdb38cdc5a8c2";
    sha256 = "61EErggzGQ1a8pFPR6OxawTni1j2m9T6s2zKbppNDeI=";
  };

  libsqlite3-sys = pkgs.rustBuilder.rustLib.makeOverride {
    name = "libsqlite3-sys";
    overrideAttrs = drv: {
      propagatedNativeBuildInputs = drv.propagatedNativeBuildInputs or [ ] ++ [ pkgs.sqlite ];
    };
  };
  overrides = pkgs.rustBuilder.overrides.all ++ [ libsqlite3-sys ];

  rustPkgs = pkgs.rustBuilder.makePackageSet {
    rustChannel = "nightly";
    packageOverrides = pkgs: overrides; 
    packageFun = import (src + "/Cargo.nix");
  };
in
rustPkgs.workspace.recentf {}

