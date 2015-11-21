# nix-topartists

Nix implementation of https://github.com/miku/lpug-luigi, re-using the scripts from there.

It needs a working install of [Nix](https://nixos.org/nix) (not necessarily NixOS).

## What does it do?

The task is to generate various top-lists from some artificial data. As luigi is coming from spotify, the demo is creating a data-file that contains the played audio titles of a month. From this the played titles of one day should be extracted. And then a list containing the five most played artists for a day should be found. And the most played artists for a range of days.

All these steps can be implemented as small jobs with interdependencies and show-case a build-system or job-scheduler. So here I will show how to divide and schedule these jobs with [nix](https://nixos.org/nix).

## How does it do it?

### Sample data

`rawplays.nix` and `scripts/makesample.py` create the data file `plays.ldj`. The nix-expression is rather simple, just `scripts/` as the source and a build- and an install-phase. The arguments for this nix-expression are just the stdenv for the build environment and the pkgs to depend on python 3.4.

### Daily plays

To extract the played titles for one day, `dailyplays.nix` is running `scripts/dailyplays.py`. The nix expressions has an additional parameter, the date (as full 'YYYY-MM-DD'-string) is used on the name of the derivation and passed to the python scripts to extract the data.

This expression has an additional build-input: it depends both on python 3.4 and on the rawplays.nix.

With the date as parameter, this expression produces different output depending on the input and shows that the dependency tracking of nix works.

### Daily top artists

tbd.

### Top artists for a range of days

tbd.

### Results

tbd.

## Try for yourself

