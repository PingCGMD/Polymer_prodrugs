#gmx convert-tpr -s cg_md.tpr -o cg_md_1.tpr -until 500000


#gmx mdrun -s cg_md_1.tpr  -v -deffnm cg_md_1

gmx mdrun -deffnm cg_md_1 -cpi cg_md_1.cpt -s cg_md_1.tpr -c cg_md_500ns.gro -noappend
