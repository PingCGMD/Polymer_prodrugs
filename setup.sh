#!/bin/bash

# Place the solute in a simulation box
gmx editconf -f gempi1kda_GMX.gro -bt cubic -d 1.4 -o gempi1_inbox.gro

# Prepare minimization in vacuum
gmx grompp -f em_vacuum.mdp -c gempi1_inbox.gro -p topol.top -o em_vacuum.tpr

# Make minimization in vacuum 
gmx mdrun -s em_vacuum.tpr -deffnm em_vacuum -v

# Fill the box with water
gmx solvate -cp em_vacuum.gro -cs spc216.gro -o gempi1_inslv.gro -p topol.top

# Prepare the minimization in the solvent
gmx grompp -f em_solvent.mdp -c gempi1_inslv.gro -p topol.top -o em_solvent.tpr

# Make minimzation in the solvent
gmx mdrun -s em_solvent.tpr -deffnm em_solvent -v

