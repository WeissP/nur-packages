{ stdenv, pkgs, lib, ... }:

let build = lib.rust.build {
      src = pkgs.fetchFromGitHub {
        owner = "WeissP";
        repo = "recentf";
        rev = "d1ef3a7693b98a750a9d4303b5efdb38cdc5a8c2";
        sha256 = "61EErggzGQ1a8pFPR6OxawTni1j2m9T6s2zKbppNDeI=";
      };
    };
in
build.recentf {}
