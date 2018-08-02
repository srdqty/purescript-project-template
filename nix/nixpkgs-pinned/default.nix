{ config ? {}
, overlays ? import ../overlays.nix {}
}:

let
  fetch-nixpkgs = import ./fetch-nixpkgs.nix;

  nixpkgs-args = if
    0 <= builtins.compareVersions builtins.nixVersion "1.12"
  then
    builtins.fromJSON (builtins.readFile ./nixpkgs-2.0.json)
  else
    builtins.fromJSON (builtins.readFile ./nixpkgs-1.11.json)
  ;

  nixpkgs = fetch-nixpkgs {
    inherit (nixpkgs-args) owner repo rev sha256;
  };

  pkgs = import nixpkgs { inherit config overlays; };
in
  pkgs
