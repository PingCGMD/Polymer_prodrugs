#!/bin/bash

# Prepare Berendsen equilibration
gmx grompp -f berendsen.mdp -c em_solvent.gro -p topol.top -o berendsen.tpr

# Make Berendsen equilibration
gmx mdrun -s berendsen.tpr -deffnm berendsen -v

# Prepare Nose-Hoover equilibration
gmx grompp -f nosehoover.mdp -c berendsen.gro -p topol.top -o nosehoover.tpr

# Make Nose-Hoover equilibration
gmx mdrun -s nosehoover.tpr -deffnm nosehoover -v

