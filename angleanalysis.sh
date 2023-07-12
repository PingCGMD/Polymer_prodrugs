#!/bin/bash

rm -rf ANGLEDISTRIBUTIONS
mkdir  ANGLEDISTRIBUTIONS

NANGLES=31

IANGLE=0
while [ $IANGLE -lt $NANGLES ]
    do
    echo $IANGLE | gmx angle -f md_mapped.xtc -n angles.ndx -type angle -ov ANGLEDISTRIBUTIONS/angle_$IANGLE.xvg
    gmx analyze -f ANGLEDISTRIBUTIONS/angle_$IANGLE.xvg -dist ANGLEDISTRIBUTIONS/distr_$IANGLE.xvg -bw 1.0
    rm -rf \#*
    let IANGLE=$IANGLE+1
    done

exit
