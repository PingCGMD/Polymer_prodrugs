#!/bin/bash

gmx grompp -f minim.mdp -c cg_gemocta.gro -p cg_gemocta.top -o minim.tpr
gmx mdrun -v -deffnm minim

gmx grompp -f relax.mdp -c minim.gro -p cg_gemocta.top -o relax.tpr
gmx mdrun -v -deffnm relax

gmx grompp -f cg_md.mdp -c relax.gro -p cg_gemocta.top -o cg_md.tpr
gmx mdrun -v -deffnm cg_md

