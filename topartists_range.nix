{ stdenv, pkgs, range }:

let
  startday = builtins.elemAt range 0;
  endday = builtins.elemAt range 1;
  days = builtins.genList (x: (if x + startday < 10 then "0" else "") + builtins.toString (x + startday)) (endday - startday + 1);
  daysbuilds = map (x: pkgs.callPackage ./dailyplays.nix { day="2015-10-${x}"; }) days;
  daysinputs = pkgs.lib.concatMapStrings(x: "${x}/dailyplays.ldj ") daysbuilds;

in stdenv.mkDerivation rec {
  name = "topartists-${builtins.toString startday}_${builtins.toString endday}";

  src = ./scripts;

  buildInputs = [
    pkgs.python34
  ] ++ daysbuilds;

  buildPhase = "
    python3 topartists.py ${daysinputs}
  ";

  installPhase = "
    mkdir $out
    cp topartists.ldj $out/
  ";
}