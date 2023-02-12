{ lib
, pkgs
, tdlib
, stdenv
, fetchFromGitHub
, ...
} @ args:

let
  repo = fetchFromGitHub ({
    owner = "zevlg";
    repo = "telega.el";
    rev = "v0.8.0";
    sha256 = "sha256-2hXXtBOv+2KN3IztrsvD05Ey/jMHmGM7YTum0exGdzo=";
  });
in
stdenv.mkDerivation rec {
  pname = "telega-server";
  version = "1.8.0";

  src = repo + "/server";

  buildInputs = [tdlib];
  nativeBuildInputs = [ pkgs.pkg-config ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    install -m755 -Dt $out/bin ./telega-server
  '';
}
