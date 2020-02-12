#!/bin/bash
#para N potencia de 2 desde 2^14 a 2^26
for ((N=16384;N<67108865;N=N*2))
do
	./sumaparalelaF $N
done
