#!/bin/bash

seq 0 22 | gmx traj -f md_solute.gro -s md_solute.gro -oxt md_mapped.gro -n mapping.ndx -com -ng 23
seq 0 22 | gmx traj -f md_solute.xtc -s md_solute.gro -oxt md_mapped.xtc -n mapping.ndx -com -ng 23

echo 22 | gmx trjconv -s gromos.tpr -f gromos.xtc -pbc whole -o whole.xtc 

seq 0 22 | gmx traj -f md_solute.xtc -s gromos.tpr -oxt MAPPED/mapped.xtc -n mapping.ndx -com -ng 23
