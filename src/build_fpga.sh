#!/bin/bash

apps="aes blowfish dfadd dfdiv dfmul dfsin gsm jpeg mips motion sha"

d=$(pwd)

for x in $apps
do
	cd ${x}_opencl_fpga
	time aoc --high-effort --fp-relaxed -v --report --board p385a_sch_ax115 mykernel.cl >${x}_fpga_build.log 2>&1 &
	cd $d
done

wait
