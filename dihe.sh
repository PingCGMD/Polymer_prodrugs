#!/bin/bash

gmx angle -f md_mapped.xtc -n angdih.ndx -od dihdist.xvg -ov dihedrals.xvg -type dihedral -all

