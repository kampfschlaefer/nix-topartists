{ day ? "2015-10-15" }:

with import <nixpkgs> {};

let
  daysbuild = callPackage ./dailyplays.nix { inherit day; };

in stdenv.mkDerivation rec {
  name = "nixtopartists-${day}";

  src = ./scripts;

  buildInputs = [
    daysbuild
    pkgs.python34
  ];

  buildPhase = "python3 topartists.py ${daysbuild}/dailyplays.ldj";

  installPhase = "
    mkdir $out
    cp topartists.ldj $out/
  ";

}
