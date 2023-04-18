# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { }, ... }:

rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  # recentf = pkgs.callPackage ./pkgs/recentf { lib = lib; };
  tdlib = pkgs.callPackage ./pkgs/tdlib { };
  telega-server = pkgs.callPackage ./pkgs/telega-server { tdlib = tdlib; };
  emacs-rime = pkgs.callPackage ./pkgs/emacs-rime {
    librime-mac = pkgs.callPackage ./pkgs/librime-mac { };
  };
  mpvScripts = {
    mpv-bookmarker = pkgs.callPackage ./pkgs/mpvScripts/mpv-bookmarker.nix { };
  };
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
