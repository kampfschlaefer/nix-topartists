{ }:

with import <nixpkgs> {};

let
  days = builtins.genList (x: (if x < 9 then "0" else "") + builtins.toString (x + 1)) 12;
  daysbuilds = map (x: import ./topartists.nix { inherit stdenv pkgs; day="2015-10-${x}"; }) days;

  #debugdays = builtins.toJSON days;
  debugdays = builtins.toJSON daysbuilds;

in stdenv.mkDerivation rec {
  name = "nixtopartists";

  src = ./scripts;

  buildInputs = [
    pkgs.python34
  ] ++ daysbuilds;

  #buildPhase = "python3 topartists.py ${daysbuild}/dailyplays.ldj";
  buildPhase = "echo \"${debugdays}\"";

  #installPhase = "
  #  mkdir $out
  #  cp topartists.ldj $out/
  #";

}
