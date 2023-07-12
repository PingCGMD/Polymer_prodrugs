#!/bin/bash

# Prepare production run
gmx grompp -f md_prod.mdp -c nosehoover.gro -p topol.top -o md_prod.tpr

# Make production run
gmx mdrun -s md_prod.tpr -deffnm md_prod -v

