{
  lib,
  pkgs,
  stdenv,
  fetchFromGitHub,
  ...
}@args:

let
  repo = fetchFromGitHub ({
    owner = "zevlg";
    repo = "telega.el";
    rev = "v0.8.0";
    sha256 = "sha256-2hXXtBOv+2KN3IztrsvD05Ey/jMHmGM7YTum0exGdzo=";
  });
  tdlib =
    (import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/f76bef61369be38a10c7a1aa718782a60340d9ff.tar.gz";
    }) { }).tdlib;
in
stdenv.mkDerivation {
  pname = "telega-server";
  version = "1.8.0";

  src = repo + "/server";

  buildInputs = [ tdlib ];
  nativeBuildInputs = [ pkgs.pkg-config ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    install -m755 -Dt $out/bin ./telega-server
  '';
}
