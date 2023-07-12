#!/bin/bash

rm -rf DIHEDRALDISTRIBUTIONS
mkdir  DIHEDRALDISTRIBUTIONS

NDIHEDRALS=31

IDIHEDRAL=0
while [ $IDIHEDRAL -lt $NDIHEDRALS ]
    do
    echo $IDIHEDRAL | gmx angle -f md_mapped.xtc -n dihedrals.ndx -type dihedral -ov DIHEDRALDISTRIBUTIONS/dihedral_$IDIHEDRAL.xvg
    gmx analyze -f DIHEDRALDISTRIBUTIONS/dihedral_$IDIHEDRAL.xvg -dist DIHEDRALDISTRIBUTIONS/distr_$IDIHEDRAL.xvg -bw 1.0
    rm -rf \#*
    let IDIHEDRAL=$IDIHEDRAL+1
    done

exit
