#!/bin/bash

rm -rf BONDDISTRIBUTIONS
mkdir  BONDDISTRIBUTIONS
rm -rf ANGLEDISTRIBUTIONS
mkdir  ANGLEDISTRIBUTIONS
rm -rf DIHEDRALDISTRIBUTIONS
mkdir  DIHEDRALDISTRIBUTIONS

NBONDS=24
NANGLES=31
NDIHEDRALS=31

IBOND=0
while [ $IBOND -lt $NBONDS ]
    do
    echo $IBOND | gmx distance -f md_mapped.xtc -n bonds.ndx -s 1kda_mapped.tpr -oall BONDDISTRIBUTIONS/bond_$IBOND.xvg
    gmx analyze -f BONDDISTRIBUTIONS/bond_$IBOND.xvg -dist BONDDISTRIBUTIONS/distr_$IBOND.xvg -bw 0.001
    rm -rf \#*
    let IBOND=$IBOND+1
    done

IANGLE=0
while [ $IANGLE -lt $NANGLES ]
    do
    echo $IANGLE | gmx angle -f md_mapped.xtc -n angles.ndx -type angle -ov ANGLEDISTRIBUTIONS/angle_$IANGLE.xvg
    gmx analyze -f ANGLEDISTRIBUTIONS/angle_$IANGLE.xvg -dist ANGLEDISTRIBUTIONS/distr_$IANGLE.xvg -bw 1.0
    rm -rf \#*
    let IANGLE=$IANGLE+1
    done

IDIHEDRAL=0
while [ $IDIHEDRAL -lt $NDIHEDRALS ]
    do
    echo $IDIHEDRAL | gmx angle -f md_mapped.xtc -n dihedrals.ndx -type dihedral -ov DIHEDRALDISTRIBUTIONS/dihedral_$IDIHEDRAL.xvg
    gmx analyze -f DIHEDRALDISTRIBUTIONS/dihedral_$IDIHEDRAL.xvg -dist DIHEDRALDISTRIBUTIONS/distr_$IDIHEDRAL.xvg -bw 1.0
    rm -rf \#*
    let IDIHEDRAL=$IDIHEDRAL+1
    done

exit
