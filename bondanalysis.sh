#!/bin/bash

rm -rf BONDDISTRIBUTIONS
mkdir  BONDDISTRIBUTIONS

NBONDS=24

IBOND=0
while [ $IBOND -lt $NBONDS ]
    do
    echo $IBOND | gmx distance -f cg_md.xtc -n bonds.ndx -s cg_md.tpr -oall BONDDISTRIBUTIONS/bond_$IBOND.xvg
    gmx analyze -f BONDDISTRIBUTIONS/bond_$IBOND.xvg -dist BONDDISTRIBUTIONS/distr_$IBOND.xvg -bw 0.01
    rm -rf \#*
    let IBOND=$IBOND+1
    done

exit
