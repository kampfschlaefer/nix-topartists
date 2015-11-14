{ }:

with import <nixpkgs> {};

let
  daysbuild = import ./dailyplays.nix { inherit stdenv; inherit pkgs; day = "2015-10-15"; };

in stdenv.mkDerivation rec {
  name = "nixtopartists";

  #src = ".";
  buildInputs = [
    daysbuild
  ];
  
}
