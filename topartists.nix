{ stdenv, pkgs, day }:

let
  daysbuild = import ./dailyplays.nix { inherit stdenv pkgs day; };

in stdenv.mkDerivation rec {
  name = "topartists-${day}";

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

