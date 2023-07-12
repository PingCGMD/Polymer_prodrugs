#!/bin/bash

rm -rf BONDDISTRIBUTIONS
mkdir  BONDDISTRIBUTIONS

NBONDS=24

IBOND=0
while [ $IBOND -lt $NBONDS ]
    do
    echo $IBOND | gmx distance -f md_mapped.xtc -n bonds.ndx -s 1kda_mapped.tpr -oall BONDDISTRIBUTIONS/bond_$IBOND.xvg
    gmx analyze -f BONDDISTRIBUTIONS/bond_$IBOND.xvg -dist BONDDISTRIBUTIONS/distr_$IBOND.xvg -bw 0.01
    rm -rf \#*
    let IBOND=$IBOND+1
    done

exit
