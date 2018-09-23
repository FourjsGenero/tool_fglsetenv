# fglsetenv
switch side effect free between genero versions


## Description

This tool is a tiny shell script used for switching between Genero versions.
It assumes a naming convention <basename><version>, so for example fglgws2.50, fglgws3.00 etc.
In contradiction to the "envcomp" utility provided with the Genero installation it tries to keep the environment clean by modifying it.

It cleans the environment from FGL prefixes.
It removes references to other directories with the same naming convention in the PATH and (DY)LD_LIBRARY_PATH.

It's intended to be used in shell aliases, and after switching the environment is prints the fglrun version and tests with a small program if fglcomp/fglrun is working.

If a directory in the same level has the scheme "gas"+the same version FGLASDIR is exported.

(Example: If there is a ~/fglgws3.00 and a ~/gas3.00 directory , FGLASDIR is set to gas3.00)

It calls also a custom script "myfglrelicense.sh" which may be used to re activate the license in the product when switching between versions

Just add the script to a directory contained in PATH


## Prerequisites

* Genero BDL 2.40+

## Usage

```
% alias fgl250="pushd `pwd`>/dev/null;cd ~/fglgws2.50;. `which fglsetenv`;popd>/dev/null"
% alias fgl300="pushd `pwd`>/dev/null;cd ~/fglgws3.00;. `which fglsetenv`;popd>/dev/null"
```
## myfglrelicense.sh sample
```
FGLWRT=fglWrt
if [[ $# -eq 1 && -x $1 ]]
then
  FGLWRT=$1
fi
$FGLWRT -L "TAB#XXXXXX" "1234FGKLDD"
$FGLWRT -m M9878678678
```

## fglsetenvGDC

fglsetenvGDC is thought to be used with a GDC as a 'door opener' for running Genero tools via the automatic SSH tunnel when running remotely.
Typical environment: GDC used from Windows or Mac and ssh login to the dev machine.
It exports the port forwarding environment and other tool related environment variables to the developer side where GDC is running.
