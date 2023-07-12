#!/usr/bin/env python

nmols = 1138     # Number of molecules
atspermol = 9    # AA atoms per molecule
beadspermol = 2  # CG beads per molecule
firstbead = 4    # AA atoms in the first bead
atsperbead = 4   # AA atoms per CG bead
lastbead = 5     # AA atoms in the last bead

outname = "mapping.ndx"  # Output filename

with open(outname,'w') as NDX:
    for mol in range(nmols):
        for bead in range(beadspermol):

            # The number of atoms (nats) might depend on whether it's a first,
            # last, or middle bead. NDXs are 1-based
            if bead==0:
                nats = firstbead
                startat = 1
            elif bead==beadspermol-1:
                nats = lastbead
                startat = atspermol-lastbead+1
            else:
                nats = atsperbead
                startat = (bead-1)*atsperbead + firstbead + 1

            startat += mol*atspermol  
            ats = range(startat, startat + nats) 
            ats = " ".join(map(str, ats))
            NDX.write("[ mol%dbead%d ]\n%s\n" % (mol+1,bead+1, ats))

