#!/bin/bash

gmx convert-tpr -s md_prod.tpr -o md_solute.tpr

gmx trjconv -f nosehoover.gro -s md_prod.tpr -o md_solute.gro -center -pbc cluster
gmx trjconv -f md_prod.xtc -s md_prod.tpr -o md_solute.xtc -center -pbc cluster

