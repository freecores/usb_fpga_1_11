#!/bin/bash

# On my computer I use a sript named xilinx to preload the environment
# variables. The command "xilinx ise" starts the ISE for example.
# Therefore we check for the xilinx script first.
if `which xilinx > /dev/null`; then
    xilinx="xilinx"
else
    xilinx=""
fi    

for i in *.bit; do
    $xilinx promgen -w -p bin -u 0 $i
done    
