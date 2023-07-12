#!/bin/bash

# Restart production run
gmx mdrun -s md_prod.tpr -deffnm md_prod -v -cpi md_prod.cpt

