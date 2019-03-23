#!/bin/sh

rm -f rp06.disk
bzcat 4.1_BSD*.tap.bz2 > 4.1_BSD_19810710-modified.tap

test -x simh/BIN/vax780 || (cd simh; make vax780)
PATH=$PWD/simh/BIN:$PATH
export PATH

expect -f install.tcl

zcat chaos-4.1.tar.gz > chaos-4.1.tar
(cd simtools/converters/tar2mt; make tar2mt)
