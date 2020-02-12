#!/bin/bash
for ((N=1;N<13;N=N+1)) do
	export OMP_NUM_THREADS=$N
	./pmm-openmp 1500
	./pmm-openmp 150
done
