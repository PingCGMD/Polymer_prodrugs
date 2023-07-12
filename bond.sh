#!/bin/bash

gmx distance -f md_mapped.xtc -oall bonds.xvg -select 'atomnr 1 2' 'atomnr 1 3' 'atomnr 2 3' 'atomnr 3 4' 'atomnr 4 5' 'atomnr 4 6' 'atomnr 5 6' 'atomnr 6 7' 'atomnr 7 8' 'atomnr 8 9' 'atomnr 9 10' 'atomnr 10 11' 'atomnr 11 12' 'atomnr 12 13' 'atomnr 13 14' 'atomnr 14 15' 'atomnr 15 16' 'atomnr 16 17' 'atomnr 17 18' 'atomnr 18 19' 'atomnr 18 20' 'atomnr 18 21' 'atomnr 21 22' 'atomnr 21 23'

