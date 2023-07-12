#!/bin/bash

seq 0 2275 | gmx traj -f octanolnoh.gro -s octanolnoh.gro -oxt cg_octanol.gro -n mapping.ndx -com -ng 2276

