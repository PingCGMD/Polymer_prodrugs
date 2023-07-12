#!/bin/bash

gmx angle -f md_mapped.xtc -n angdih.ndx -od angdist.xvg -ov angles.xvg -type angle -all

