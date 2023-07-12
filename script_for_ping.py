#!/usr/bin/env python

file_to_process = open("volume.dat","r")
corrected_file = open("volume_corrected.dat","w")
lines = file_to_process.readlines()

for line in lines:

    if line == "\n":
        continue

    else:
        corrected_file.write(line)
